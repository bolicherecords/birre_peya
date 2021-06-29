require 'reception_sdk'

class Api
  def initialize(params)
    @api = ReceptionSdk::ApiClient.new(Credentials.instance(params))
  end

  def heart_beat
    Rails.logger.info("PedidosYa Heart Beat: #{restaurants}")
    restaurants.each do |restaurant|
      @api.event.heart_beat(restaurant.id)
    end
  end

  private

  def restaurants
    @restaurants ||= begin
      options = ReceptionSdk::PaginationOptions.create.with_limit(50)
      new_restaurants = @api.restaurant.get_all(options)
      restaurants = new_restaurants
      while new_restaurants.count.positive?
        new_restaurants = @api.restaurant.get_all(options.next)
        restaurants += new_restaurants
      end
      restaurants
    end
  end
end
