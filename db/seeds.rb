# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

m1 = Merchant.create(name: 'Annu', email: 'annu@gmail.com', status: 1, about: 'Software engineer', gender: 1, price: 100, review_count: 5, avg_rating: 4.5, session_time: 40, profile_photo: File.open([Rails.root, 'public/merchant/annu.jpeg'].join('/')))
m2 = Merchant.create(name: 'Praveen', email: 'praveen@gmail.com', status: 1, about: 'Software engineer', gender: 0, price: 80, review_count: 9, avg_rating: 5, session_time: 50, profile_photo: File.open([Rails.root, 'public/merchant/praveen.jpeg'].join('/')))
m3 = Merchant.create(name: 'Sachin', email: 'sachin@gmail.com', status: 1, about: 'Engineer', gender: 0, price: 70, review_count: 7, avg_rating: 4, session_time: 20, profile_photo: File.open([Rails.root, 'public/merchant/sachin.jpeg'].join('/')))
m4 = Merchant.create(name: 'Rajeev', email: 'rajeev@gmail.com', status: 1, about: 'Software developer', gender: 0, price: 90, review_count: 4, avg_rating: 3.5, session_time: 40, profile_photo: File.open([Rails.root, 'public/merchant/rajeev.jpeg'].join('/')))
m5 = Merchant.create(name: 'Ram', email: 'ram@gmail.com', status: 1, about: 'Developer', gender: 0, price: 50, review_count: 3, avg_rating: 3, session_time: 30, profile_photo: File.open([Rails.root, 'public/merchant/ram.jpeg'].join('/')))
m6 = Merchant.create(name: 'Aakanksha', email: 'aakanksha@gmail.com', status: 1, about: 'Software Trainee', gender: 1, price: 30, review_count: 2, avg_rating: 2, session_time: 60, profile_photo: File.open([Rails.root, 'public/merchant/aakanksha.jpeg'].join('/')))
m7 = Merchant.create(name: 'Nitin', email: 'nitin@gmail.com', status: 1, about: 'Designer', gender: 0, price: 50, review_count: 6, avg_rating: 3.5, session_time: 20)
m8 = Merchant.create(name: 'Sonam', email: 'sonam@gmail.com', status: 1, about: 'Javascript developer', gender: 1, price: 20, review_count: 1, avg_rating: 2.5, session_time: 10, profile_photo: File.open([Rails.root, 'public/merchant/sonam.jpeg'].join('/')))
m9 = Merchant.create(name: 'Roma', email: 'roma@gmail.com', status: 1, about: 'Marketing', gender: 1, price: 10, review_count: 4, avg_rating: 3, session_time: 30, profile_photo: File.open([Rails.root, 'public/merchant/roma.jpeg'].join('/')))
m10 = Merchant.create(name: 'Nimi', email: 'nimi@gmail.com', status: 1, about: 'HR', gender: 1, price: 30, review_count: 3, avg_rating: 3, session_time: 50, profile_photo: File.open([Rails.root, 'public/merchant/nimi.jpeg'].join('/')))

s1 = Specialization.create(name: 'Message')
s2 = Specialization.create(name: 'Waxing')
s3 = Specialization.create(name: 'Hair cut')
s4 = Specialization.create(name: 'Yoga')


6.times do |i|
  _start_time = (Time.now+i.days).change(hour: 9, minute: 0)
  _end_time = (Time.now+i.days).change(hour: 17, minute: 30)
  m1.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

3.times do |i|
  i += 2
  _start_time = (Time.now+i.days).change(hour: 11, minute: 0)
  _end_time = (Time.now+i.days).change(hour: 17, minute: 30)
  m2.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

2.times do |i|
  i += 5
  _start_time = (Time.now+i.days).change(hour: 10, minute: 0)
  _end_time = (Time.now+i.days).change(hour: 14, minute: 30)
  m3.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

10.times do |i|
  _start_time = (Time.now+i.days).change(hour: 10, minute: 30)
  _end_time = (Time.now+i.days).change(hour: 20, minute: 30)
  m4.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

20.times do |i|
  _start_time = (Time.now+i.days).change(hour: 9, minute: 40)
  _end_time = (Time.now+i.days).change(hour: 19, minute: 20)
  m5.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

60.times do |i|
  _start_time = (Time.now+i.days).change(hour: 7, minute: 0)
  _end_time = (Time.now+i.days).change(hour: 20, minute: 50)
  m6.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

25.times do |i|
  i+=7
  _start_time = (Time.now+i.days).change(hour: 11, minute: 0)
  _end_time = (Time.now+i.days).change(hour: 21, minute: 30)
  m7.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

30.times do |i|
  _start_time = (Time.now+i.days).change(hour: 8, minute: 0)
  _end_time = (Time.now+i.days).change(hour: 20, minute: 0)
  m8.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

11.times do |i|
  i += 10
  _start_time = (Time.now+i.days).change(hour: 7, minute: 0)
  _end_time = (Time.now+i.days).change(hour: 15, minute: 00)
  m9.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

33.times do |i|
  i += 4
  _start_time = (Time.now+i.days).change(hour: 12, minute: 0)
  _end_time = (Time.now+i.days).change(hour: 22, minute: 50)
  m10.openings << Opening.create(start_time: _start_time, end_time: _end_time, status: 1)
end

m1.specializations << [s1, s4]
m2.specializations << s1
m3.specializations << s3
m4.specializations << s2
m5.specializations << s4
m6.specializations << s2
m7.specializations << s3
m8.specializations << [s1, s2]
m9.specializations << [s3, s4, s1, s2]
m10.specializations << s1

m1.appointments.create(start_time: (Time.now+1.days).change(hour: 9, minute: 0), end_time: (Time.now+1.days).change(hour: 9, minute: 40))
m1.appointments.create(start_time: (Time.now+3.days).change(hour: 9, minute: 40), end_time: (Time.now+3.days).change(hour: 10, minute: 20))

m2.appointments.create(start_time: (Time.now+3.days).change(hour: 11, minute: 50), end_time: (Time.now+3.days).change(hour: 12, minute: 40))
m3.appointments.create(start_time: (Time.now+6.days).change(hour: 11, minute: 00), end_time: (Time.now+6.days).change(hour: 11, minute: 20))

m4.appointments.create(start_time: (Time.now+1.days).change(hour: 12, minute: 30), end_time: (Time.now+1.days).change(hour: 13, minute: 10))
m4.appointments.create(start_time: (Time.now+3.days).change(hour: 13, minute: 50), end_time: (Time.now+3.days).change(hour: 14, minute: 30))

m5.appointments.create(start_time: (Time.now+10.days).change(hour: 13, minute: 40), end_time: (Time.now+10.days).change(hour: 14, minute: 10))
m6.appointments.create(start_time: (Time.now+5.days).change(hour: 10, minute: 00), end_time: (Time.now+5.days).change(hour: 11, minute: 00))

m6.appointments.create(start_time: (Time.now+7.days).change(hour: 9, minute: 0), end_time: (Time.now+7.days).change(hour: 10, minute: 00))
m7.appointments.create(start_time: (Time.now+8.days).change(hour: 13, minute: 20), end_time: (Time.now+8.days).change(hour: 13, minute: 40))

m8.appointments.create(start_time: (Time.now+10.days).change(hour: 9, minute: 50), end_time: (Time.now+10.days).change(hour: 10, minute: 00))
m9.appointments.create(start_time: (Time.now+15.days).change(hour: 9, minute: 30), end_time: (Time.now+15.days).change(hour: 10, minute: 00))

m9.appointments.create(start_time: (Time.now+20.days).change(hour: 14, minute: 00), end_time: (Time.now+20.days).change(hour: 14, minute: 30))
m10.appointments.create(start_time: (Time.now+9.days).change(hour: 12, minute: 50), end_time: (Time.now+9.days).change(hour: 13, minute: 40))
