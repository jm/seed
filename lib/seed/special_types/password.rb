Seed::Plant.register_type("password") do
  possible = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  
  password = ""
  1.upto(rand(15)) {|i| password << possible[rand(possible.size-1)] }
  
  password
end