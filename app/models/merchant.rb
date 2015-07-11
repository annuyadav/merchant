require 'elasticsearch/model'

class Merchant < ActiveRecord::Base

  #---Model for elastic search------------------------------------
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  #---Constant ---------------------------------------------------
  STATUS = {0 => 'inactive', 1 => 'active'}
  GENDER = {-1 => 'other', 0 => 'male', 1 => 'female'}
  AVAILABILITY = {1 => 'now', 2 => 'morning', 3 => 'afternoon', 4 => 'evening', 5 => 'night',
                  6 => 'today', 7 => 'tomorrow', 8 => 'this week'}

  #---Associations -----------------------------------------------
  has_many :openings, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_and_belongs_to_many :specializations

  #---Validations ------------------------------------------------
  validates :name, :email, :price, presence: true
  validates :status, presence: true, inclusion: {in: STATUS.keys}
  validates :gender, presence: true, inclusion: {in: GENDER.keys}
  validates :avg_rating, :numericality => {:greater_than => 0, :less_than_or_equal_to => 5}

  #---Photofy fields----------------------------------------------
  photofy :profile_photo

  after_photofy :profile_photo, :photo, Proc.new { |img| img.resize_to_fill(150, 150) }

  #--- search indexes --------------------------------------------
  def as_indexed_json()
    as_json(
        only: [:name, :about, :price, :gender, :avg_rating, :session_time],
        methods: [:availabilities, :specializations_id],
        include: {specializations: {only: :name}}
    )
  end

  def photo_url
    _photo = self.photo_path
    if File.exist?(_photo)
      [ErosMerchants::Application.config.merchant_url_base, _photo.gsub(Rails.root.to_s, '')].join
    else
      [ErosMerchants::Application.config.merchant_url_base, "profile_pic_#{GENDER[gender] || 'other'}.png"].join('/')
    end
  end

  def specializations_id
    specializations.pluck(:id)
  end

  def availabilities
    _available = []
    _today_opening = openings.where('start_time > ? AND end_time < ?', Time.now.midnight, Time.now.end_of_day).first
    _tomorrow_opening = openings.where('start_time > ? AND end_time < ?', Time.now.midnight, Time.now.midnight+1.day).first
    if _today_opening
      _start_time = _today_opening.start_time.to_i
      _end_time = _today_opening.end_time.to_i

      _available << [6, 8]
      _available << 1 if _start_time.upto(_end_time).include?(Time.now.to_i)
      _available << 2 if _start_time.upto(_end_time).include?(Time.now.change(hour: 9).to_i)
      _available << 3 if _start_time.upto(_end_time).include?(Time.now.change(hour: 12).to_i)
      _available << 4 if _start_time.upto(_end_time).include?(Time.now.change(hour: 17).to_i)
      _available << 5 if _start_time.upto(_end_time).include?(Time.now.change(hour: 20).to_i)
    else
      _available << 8 if openings.where('start_time > ? AND end_time < ?', Time.now.midnight, Time.now.end_of_week).count > 0
    end
    _available << 7 if _tomorrow_opening
    _available.flatten
  end

  def availability_slots(date)
    _openings = openings.where('start_time > ? AND end_time < ?', date.midnight, date.end_of_day)
    range = []

    _openings.each do |opening|
      range << opening.start_time.slice_slots(opening.end_time, session_time)
    end
    range = range.flatten

    appointments.where('start_time > ? AND end_time < ?', date.midnight, date.end_of_day).each do |app|
      range.delete_if { |_ran| _ran[:start_time] < app.end_time and _ran[:end_time] > app.start_time }
    end
    range
  end
end
