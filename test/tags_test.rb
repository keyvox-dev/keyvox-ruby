require "test/unit"
require "pp"
require "keyvox"
require 'dotenv/load'

class TagsTest < Test::Unit::TestCase

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
        tags = @@kv.tags.list()
        pp(tags)
        #assert_true(tags.has_key?("data"))
    end

    def test_retrieve
        id = ENV["TAG_ID"]
        tag = @@kv.tags.retrieve(id)

        assert_true(tag.has_key?("data"))
    end
end