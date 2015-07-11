class WelcomeController < ApplicationController

  def index
    if request.post?
      _query_string = search_params[:search]

      _query = {filtered: {}}
      _query[:filtered][:query] = {
          queryString: {
              query: _query_string,
              fields: %w(name^3 about specializations.name^2)
          }
      } if _query_string.present?

      _query[:filtered][:filter] = {and: fetch_filters} if fetch_filters.present?

      @merchants = Merchant.search(query: _query, sort: fetch_sorting_option).records
    else
      @merchants = Merchant.all
    end
  end

  private

  def fetch_filters
    _query_filters = []

    search_params[:filters][:range_filters].delete_if { |key, value| value.blank? }.each do |filter, values|
      values = values.split(',').collect { |value| value.to_i }
      _query_filters << {
          range: {
              filter => {
                  gte: values.first,
                  lte: values.last
              }
          }
      }
    end

    search_params[:filters][:search_filters].each do |filter, values|
      _query_filters << {
          terms: {filter => values}
      }
    end if search_params[:filters][:search_filters]
    _query_filters
  end

  def fetch_sorting_option
    _sort_option = []
    search_params[:sorting].each do |key, value|
      _sort_option << {
          key => {
              order: value.to_i == 0 ? 'desc' : 'asc'
          }
      }
    end if search_params[:sorting]
    _sort_option
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
                                         range_filters: [:price, :session_time]
                                     ],
                                     sorting: [:price, :session_time, :avg_rating])
  end
end
