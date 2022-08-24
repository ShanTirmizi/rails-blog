require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @category = Category.create(name: "Technology")
    @category2 = Category.create(name: "Entertainment")
  end

  test "should get index" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name

    assert_response :success
  end
end
