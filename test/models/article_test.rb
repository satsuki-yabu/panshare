require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  def setup #インスタンス作成
    @article = Article.new(title: "title", text: "text")
  end
  # test "the truth" do
  #   assert true
  # end
end
