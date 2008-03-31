Seed::Plant.register_type("email") do
  start = ('a'..'z').to_a
  
  # Shamelessly ripped from Ryan Davis's babel gem
  ending = %w(Smith Johnson Williams Jones Brown Davis Miller Wilson Moore Taylor Anderson Thomas Jackson White
      Harris Martin Thompson Garcia Martinez Robinson Clark Rodriguez Lewis Lee Walker Hall Allen Young Hernandez King 
      Wright Lopez Hill Scott Green Adams Baker Gonzalez Nelson Carter Mitchell Perez Roberts Turner Phillips Campbell 
      Parker Evans Edwards Collins Stewart Sanchez Morris Rogers Reed Cook Morgan Bell Murphy Bailey Rivera Cooper 
      Richardson Cox Howard Ward Torres Peterson Gray Ramirez James Watson Brooks Kelly Sanders Price Bennett Wood
      Barnes Ross Henderson Coleman Jenkins Perry Powell Long Patterson Hughes Flores Washington Butler Simmons Foster 
      Gonzales Bryant Alexander Russell Griffin Diaz Hayes Myers Ford Hamilton Graham Sullivan Wallace Woods Cole West 
      Jordan Owens Reynolds Fisher Ellis Harrison Gibson Mcdonald Cruz Marshall Ortiz Gomez Murray Freeman Wells Webb 
      Simpson Stevens Tucker Porter Hunter Hicks Crawford Henry Boyd Mason Morales Kennedy Warren Dixon Ramos Reyes 
      Burns Gordon Shaw Holmes Rice Robertson Hunt Black Daniels Palmer Mills Nichols Grant Knight Ferguson Rose Stone 
      Hawkins Dunn Perkins Hudson Spencer Gardner Stephens Payne Pierce Berry Matthews Arnold Wagner Willis Ray Watkins 
      Olson Carroll Duncan Snyder Hart Cunningham Bradley Lane Andrews Ruiz Harper Fox Riley Armstrong Carpenter Weaver 
      Greene Lawrence Elliott Chavez Sims Austin Peters Kelley Franklin Lawson Fields Gutierrez Ryan Schmidt Carr Vasquez
      Castillo Wheeler Chapman Oliver Montgomery Richards Williamson Johnston Banks Meyer Bishop Mccoy Howell Alvarez
      Morrison Hansen Fernandez Garza Harvey Little Burton Stanley Nguyen George Jacobs Reid Kim Fuller Lynch Dean
      Gilbert Garrett Romero Welch Larson Frazier Burke Hanson Day Mendoza Moreno Bowman Medina Fowler Brewer Hoffman
      Carlson Silva Pearson Holland Douglas Fleming Jensen Vargas Byrd Davidson Hopkins May Terry Herrera Wade
      Soto Walters Curtis Neal Caldwell Lowe Jennings Barnett Graves Jimenez Horton Shelton Barrett Obrien Castro
      Sutton Gregory Mckinney Lucas Miles Craig Rodriquez Chambers Holt Lambert Fletcher Watts Bates Hale
      Rhodes Pena Beck Newman Haynes Mcdaniel Mendez Bush Vaughn Parks Dawson Santiago Norris Hardy Love Steele
      Curry Powers Schultz Barker Guzman Page Munoz Ball Keller Chandler Weber Leonard Walsh Lyons Ramsey
      Wolfe Schneider Mullins Benson Sharp Bowen Daniel Barber Cummings Hines Baldwin Griffith Valdez Hubbard
      Salazar Reeves Warner Stevenson Burgess Santos Tate Cross Garner Mann Mack Moss Thornton Dennis Mcgee
      Farmer Delgado Aguilar Vega Glover Manning Cohen Harmon Rodgers Robbins Newton Todd Blair Higgins Ingram
      Reese Cannon Strickland Townsend Potter Goodwin Walton Rowe Hampton Ortega Patton Swanson Joseph Francis
      Goodman Maldonado Yates Becker Erickson Hodges Rios Conner Adkins Webster Norman Malone Hammond Flowers 
      Cobb Moody Quinn Blake Maxwell Pope Floyd Osborne Paul Mccarthy Guerrero Lindsey Estrada Sandoval )

  # Borrowed from the interwebs
  domain = %w( Adult Aeroplane Air Aircraft Carrier Airforce Airport Album Alphabet Apple Arm Army Baby Baby 
      Backpack Balloon Banana Bank Barbecue Bathroom Bathtub Bed Bed Bee Bible Bible Bird Bomb Book Boss Bottle Bowl
      Box Boy Brain Bridge Butterfly Button Cappuccino Car Car-race Carpet Carrot Cave Chair Chess Board Chief Child 
      Chisel Chocolates Church Church Circle Circus Circus Clock Clown Coffee Coffee-shop Comet Compact Disc Compass 
      Computer Crystal Cup Cycle Data Base Desk Diamond Dress Drill Drink Drum Dung Ears Earth Egg Electricity Elephant 
      Eraser Explosive Eyes Family Fan Feather Festival Film Finger Fire Floodlight Flower Foot Fork Freeway Fruit Fungus 
      Game Garden Gas Gate Gemstone Girl Gloves God Grapes Guitar Hammer Hat Hieroglyph Highway Horoscope Horse Hose Ice Ice-cream 
      Insect Jet fighter Junk Kaleidoscope Kitchen Knife Leather jacket Leg Library Liquid Magnet Man Map Maze Meat Meteor Microscope 
      Milk Milkshake Mist Money Monster Mosquito Mouth Nail Navy Necklace Needle Onion PaintBrush Pants Parachute 
      Passport Pebble Pendulum Pepper Perfume Pillow Plane Planet Pocket Post-office Potato Printer Prison Pyramid Radar 
      Rainbow Record Restaurant Rifle Ring Robot Rock Rocket Roof Room Rope Saddle Salt Sandpaper Sandwich Satellite School 
      Sex Ship Shoes Shop Shower Signature Skeleton Slave Snail Software Solid Space Shuttle Spectrum Sphere Spice Spiral 
      Spoon Sports-car Spot Light Square Staircase Star Stomach Sun Sunglasses Surveyor Swimming Pool Sword Table Tapestry 
      Teeth Telescope Television Tennis racquet Thermometer Tiger Toilet Tongue Torch Torpedo Train Treadmill Triangle 
      Tunnel Typewriter Umbrella Vacuum Vampire Videotape Vulture Water Weapon Web Wheelchair Window Woman Worm X-ray )
  
  tld = %w( com net org ca eu us se mobi )
  "#{start[rand(start.length - 1)]}#{ending[rand(ending.length - 1)].downcase}@#{domain[rand(domain.length - 1)].downcase}.#{tld[rand(7)]}"  
end