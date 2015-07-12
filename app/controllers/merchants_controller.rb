class MerchantsController < ApplicationController

  before_action :fetch_merchant, only: [:available_slots]

  def index

    if params[:merchant].present?
      _query_string = search_params[:search]

      _query = {filtered: {}}
      _query[:filtered][:query] = {
          queryString: {
              query: _query_string,
              fields: %w(name^3 about specializations.name^2)
          }
      } if _query_string.present?

      _query[:filtered][:filter] = {and: fetch_filters} if fetch_filters.present?

      search_attr = {query: _query}
      search_attr[:sort] = fetch_sorting_option if fetch_sorting_option

      @merchants = Merchant.search(search_attr).records
    else
      @merchants = Merchant.all
    end
  end

  def available_slots
    _date = params[:day] || Date.today
    _date = _date.to_date
    _slots = @merchant.availability_slots(_date).collect { |slot| slot[:start_time].strftime('%H:%M') }
    render :json => {slots: _slots, date: _date.strftime("%a, #{_date.day.ordinalize} %b")}
  end

  private

  def fetch_merchant
    @merchant = Merchant.where(id: params[:id]).first
  end

  def fetch_filters
    [get_range_filters, get_search_filters].flatten
  end

  def get_range_filters
    _filters = []
    search_params[:filters][:range_filters].delete_if { |key, value| value.blank? }.each do |filter, values|
      values = values.split(',').collect { |value| value.to_i }
      _filters << {
          range: {
              filter => {
                  gte: values.first,
                  lte: values.last
              }
          }
      }
    end
    _filters
  end

  def get_search_filters
    _filters = []
    search_params[:filters][:search_filters].each do |filter, values|
      _filters << {
          terms: {filter => values}
      }
    end if search_params[:filters][:search_filters]
    _filters
  end

  def fetch_sorting_option
    if search_params[:sorting]
      key, value = search_params[:sorting][:sort].split('-', 2)
      return {
          key => {
              order: value.to_i == 0 ? 'desc' : 'asc'
          }
      } if key and value
    end
  end

  def search_params
    params.require(:merchant).permit(:search,
                                     filters: [
                                         search_filters: [
                                             specializations_id: [],
                                             avg_rating: [],
                                             gender: [],
                                             availabilities: []
                                         ],
                                         range_filters: [:price, :session_time, :avg_rating]
                                     ],
                                     sorting: [:sort

                                     ])
  end

end
