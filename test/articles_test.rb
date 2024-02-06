require "test/unit"
require "pp"
require "keyvox"
require 'dotenv/load'

class ArticlesTest < Test::Unit::TestCase

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
        articles = @@kv.articles.list()
        pp(articles)
        #assert_true(articles.has_key?("data"))
    end

    def test_retrieve
        omit()
        id = ENV["ARTICLE_ID"]
        article = @@kv.articles.retrieve(id)
        # pp(article)
        assert_true(article.has_key?("data"))
    end
end