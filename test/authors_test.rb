require "test/unit"
require "pp"
require "keyvox"
require 'dotenv/load'

class AuthorsTest < Test::Unit::TestCase

    @@kv = nil

    def setup
        @@kv = KeyVox.new(
            ENV["API_KEY"],
            {
                base_url: ENV["BASE_URL"]
            }
        )
    end

    def test_list
        omit()
        authors = @@kv.authors.list()
        pp(authors)
        #assert_true(tags.has_key?("data"))
    end

    def test_retrieve
        id = ENV["AUTHOR_ID"]
        author = @@kv.authors.retrieve(id)
        pp(author)
    end
end