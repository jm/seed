require 'test/unit'

require 'rubygems'
require 'mocha'

module Seed
  class Plant
    # Mocking ftw!
  end
end

class SpecialTypesTest < Test::Unit::TestCase
  
  def test_addresses_load
    type_load("address")
  end
  
  def test_cities_load
    type_load("city")
  end
  
  def test_emails_load
    type_load("email")
  end
  
  def test_names_load
    type_load("name")
  end
  
  def test_passwords_load
    type_load("password")
  end
  
  def test_states_load
    type_load("state")
  end
  
  def test_usernames_load
    type_load("username")
  end
  
  def type_load(type)
    Seed::Plant.expects(:register_type).with(type).once
    
    load "lib/seed/special_types/#{type}.rb"
  end
  
  def test_addresses
    value = type_test("address")
    assert value =~ /^(\d+)/
  end
  
  def test_cities
    type_test("city")
  end
  
  def test_emails
    type_test("email")
  end
  
  def test_names
    type_test("name")
  end
  
  def test_passwords
    type_test("password")
  end
  
  def test_states
    type_test("state")
  end
  
  def test_usernames
    type_test("username")
  end
  
  def type_test(type)
    require 'lib/seed/plant'
    
    load "lib/seed/special_types/#{type}.rb"
    value = Seed::Plant.produce(type)
    
    # TODO: These are lame assertions
    assert value
    assert value.is_a?(String) 
    
    # Allow you to do more tests
    value
  end
end
