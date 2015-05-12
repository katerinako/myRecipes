require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    
    def setup
        @chef= Chef.create(chefname: "bob", chefemail: "bob@example.com")
        @recipe = @chef.recipes.build(name: "chicken parm", summarize: "the best chicken parm ever" , description: "hit oil,onions,tomato sauce and cook for 20 minutes" )
    end
    
    test "Chef_id should be present" do
        @recipe.chef_id = nil
        assert_not @recipe.valid?
    end
    
    test "recipe should be valid" do
        assert @recipe.valid?
    end
    
    test "name should be present" do
        @recipe.name = ""
        assert_not @recipe.valid?
    end
    
    test "name length should not be too long" do
        @recipe.name="a"*101
        assert_not @recipe.valid?
    end
    
    test "name length should not be too short" do
        @recipe.name="aaaa"
        assert_not @recipe.valid?
    end
    
    test "summarize should be present" do
        @recipe.summarize = ""
        assert_not @recipe.valid?
    end
    
    test "summarize length should not be too long" do
        @recipe.summarize="a"*151
        assert_not @recipe.valid?
    end
    
    test "summarize length should not be too short" do
        @recipe.summarize="a"*9
        assert_not @recipe.valid?
    end
    
    test "description should be present" do
        @recipe.description = ""
        assert_not @recipe.valid?
    end
    
    test "description length should not be too long" do
        @recipe.description="a"*501
        assert_not @recipe.valid?
    end
    
    test "description length should not be too short" do
        @recipe.description="a"*19
        assert_not @recipe.valid?
    end
end