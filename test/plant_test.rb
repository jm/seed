require 'test/unit'
require 'lib/seed/plant'

class PlantTest < Test::Unit::TestCase
  def test_production
    assert Seed::Plant.produce("string").is_a?(String)
  end
  
  def test_built_in_types
    [String, Integer, Integer, Float, Date, Time, DateTime].each do |klass|
      assert Seed::Plant.produce(klass.to_s.downcase).is_a?(klass)
    end
    
    # Oddball types
    [["text", String], ["decimal", Integer], ["binary", String]].each do |type, klass|
      assert Seed::Plant.produce(type).is_a?(klass)
    end
    
    # Stupid boolean
    assert (Seed::Plant.produce("boolean").class == TrueClass || Seed::Plant.produce("boolean").class == FalseClass)
  end
  
  def test_special_type
    load 'lib/seed/special_types/address.rb'
    
    value Seed::Plant.produce("address")
    assert value.is_a?(String)
    assert value =~ /^(\d+)/
  end
end
