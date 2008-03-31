Seed::Plant.register_type("name") do
  # Pieces shamelessly ripped from Ryan Davis's babel gem
  first = %w(Jacob Michael Joshua Matthew Ethan Andrew Daniel William Joseph Christopher Anthony Ryan Nicholas 
      David Alexander Tyler James John Dylan Nathan Jonathan Brandon Samuel Christian Benjamin Zachary Logan Jose Noah 
      Justin Elijah Gabriel Caleb Kevin Austin Robert Thomas Connor Evan Aidan Jack Luke Jordan Angel Isaiah Isaac Jason 
      Jackson Hunter Cameron Gavin Mason Aaron Juan Kyle Charles Luis Adam Brian Aiden Eric Jayden Alex Bryan Sean Owen 
      Lucas Nathaniel Ian Jesus Carlos Adrian Diego Julian Cole Ashton Steven Jeremiah Timothy Chase Devin Seth 
      Jaden Colin Cody Landon Carter Hayden Xavier Wyatt Dominic Richard Antonio Jesse Blake Sebastian Miguel Jake Alejandro Patrick
      Emily Emma Madison Olivia Hannah Abigail Isabella Ashley Samantha Elizabeth Alexis Sarah Grace 
      Alyssa Sophia Lauren Brianna Kayla Natalie Anna Jessica Taylor Chloe Hailey Ava Jasmine Sydney Victoria Ella
      Mia Morgan Julia Kaitlyn Rachel Katherine Megan Alexandra Jennifer Destiny Allison Savannah Haley Mackenzie Brooke 
      Maria Nicole Makayla Trinity Kylie Kaylee Paige Lily Faith Zoe Stephanie Jenna Andrea Riley Katelyn Angelina Kimberly 
      Madeline Mary Leah Lillian Michelle Amanda Sara Sofia Jordan Alexa Rebecca Gabrielle Caroline Vanessa Gabriella Avery 
      Marissa Ariana Audrey Jada Autumn Evelyn Jocelyn Maya Arianna Isabel Amber Malanie Diana Danielle Siera Leslie Aaliyah 
      Erin Amelia Molly Claire Bailey Melissa)
      
  last = %w(Smith Johnson Williams Jones Brown Davis Miller Wilson Moore Taylor Anderson Thomas Jackson White
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
      
  "#{first[rand(first.length - 1)]} #{last[rand(last.length - 1)]}"
end