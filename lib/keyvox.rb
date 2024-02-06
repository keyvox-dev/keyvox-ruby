require_relative "article"

class KeyVox
    # param [String] api_key
    attr_reader :api_key

    # param [String] api_key
    attr_reader :base_url

    def initialize(api_key, params = {})
        @api_key = api_key
        @base_url = params[:base_url] || "https://kevvox.dev/api"

        @articles = Article.new(@api_key, @base_url)
    end

    def articles
        @articles
    end
end