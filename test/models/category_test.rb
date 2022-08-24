require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Category shoud be valid" do
    @category = Category.new(name: "Sports")
    assert @category.valid?
  end

  test "Category name should be present" do
    @category = Category.new(name: "")
    assert_not @category.valid?
  end

  test "Category name should be unique" do
    @category = Category.new(name: "Sports")
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "Category name should not be too long" do
    @category = Category.new(name: "a" * 26)
    assert_not @category.valid?
  end

  test "Category name should not be too short" do
    @category = Category.new(name: "aa")
    assert_not @category.valid?
  end


end