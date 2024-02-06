require "uri"
require "net/http"
require "json"

class Article 
    def initialize(api_key, base_url)
        @api_key = api_key
        @base_url = base_url

        @headers = {
            key: @api_key,
            lang: "ruby"
        }
    end

    def list(page = 1, limit: 3)
        
        url = "#{@base_url}/articles"
        url = URI::parse(url)

        query = {}
        query["page"] = page
        query["limit"] = limit

        url.query = URI.encode_www_form(query)
        # url = url.to_s

        res = Net::HTTP.get_response(url, @headers)
        body = res.body
        return JSON.parse(body)
    end

    def retrieve(uuid_or_slug)
        url = "#{@base_url}/articles/#{uuid_or_slug}"
        url = URI::parse(url)

        # TODO tags = false, author = false

        res = Net::HTTP.get_response(url, @headers)
        body = res.body
        return JSON.parse(body)
    end
end