require "uri"
require "net/http"
require "json"

class Author 
    def initialize(api_key, base_url)
        @api_key = api_key
        @base_url = base_url

        @headers = {
            key: @api_key,
            lang: "ruby"
        }
    end

    def list()
        url = "#{@base_url}/authors"
        url = URI::parse(url)

        # url = url.to_s
        res = Net::HTTP.get_response(url, @headers)
        body = res.body
        return JSON.parse(body)
    end

    def retrieve(uuid_or_slug)
        url = "#{@base_url}/authors/#{uuid_or_slug}"
        url = URI::parse(url)

        # TODO tags = false, author = false

        res = Net::HTTP.get_response(url, @headers)
        body = res.body
        return JSON.parse(body)
    end
end