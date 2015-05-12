require 'test_helper'

class ChefTest < ActiveSupport::TestCase
    
    def setup
        @chef=Chef.new(chefname: "John", chefemail: "john@example.com")
    end
    
    test "Chef should be valid" do
        assert @chef.valid?
    end
    
    test "chefname should be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end
    
    test "chefname should not be too long" do
        @chef.chefname = "a" * 41
        assert_not @chef.valid?
    end
    
    test "chefname should not be too short" do
        @chef.chefname = "aa"
        assert_not @chef.valid?
    end
    
    test "email should be present" do
        @chef.chefemail = " "
        assert_not @chef.valid?
    end
    
    test "email length should be within bounds" do
        @chef.chefemail= "a" * 100 + "@example.com"
        assert_not @chef.valid?
    end
    
    test "email address should be unique" do
        dup_chef = @chef.dup
        dup_chef.chefemail=@chef.chefemail.upcase
        @chef.save
        assert_not dup_chef.valid?
    end
    
    test "email validation should accept valid addresses" do
        valid_addresses= %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@eafg.cm]
        valid_addresses.each do |va|
            @chef.chefemail=va 
            assert @chef.valid?, '#{va.inspect} should be valid'
        end
    end
    
    test "email validation should reject invalid addresses" do
        invalid_addresses= %w[user@example,com user_at_eee.org user.name@example. foo@eee+aa.com]
        invalid_addresses.each do |ia|
            @chef.chefemail=ia
            assert_not @chef.valid?, '#{ia.inspect} should be invalid'
        end
    end
    
end