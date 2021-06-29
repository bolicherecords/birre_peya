require 'reception_sdk'

class Credentials
  class << self
    def instance(params)
      @params = params
      credentials = ReceptionSdk::Credentials.new
      credentials.client_id = secrets[:client_id]
      credentials.client_secret = secrets[:client_secret]
      credentials.environment = environment
      credentials
    end

    private

    def secrets
      @secrets ||= begin
        @params[0] == 'PROD' ? Rails.application.secrets.prod : Rails.application.secrets.dev
      end
    end

    def environment
      case secrets[:environment]
      when 'production'
        ReceptionSdk::Environments::PRODUCTION
      when 'stage'
        ReceptionSdk::Environments::STAGING
      else
        ReceptionSdk::Environments::DEVELOPMENT
      end
    end
  end
end
