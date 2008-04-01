require 'active_record/fixtures'

module Seed
  class Planter
    # Seeds data from a file (given as a string +filename+) or
    # +:fixtures+.
    def self.loads_from(filename)
      @@attributes = nil
      @@loads_from = filename
    end
    
    # Adds a special attribute to the model's seed data.  The +name+ parameter
    # indicates which column should of +type+.
    def self.attribute(name, type)
      @@loads_from = nil
      @@attributes ||= {}
      
      if type.is_a?(Symbol)
        type = type.to_s
      end
      
      @@attributes[name.to_s] = type
    end

    # Method to trigger seed data generation.  
    #
    # ==== Options
    # :limit: Sets a limit on how many seed records to generate
    #
    def self.plant!(options = {})
      # TODO: This method looks fat to me.
      if @@loads_from
        if @@loads_from.is_a?(String)
          # If we're given a string, use it as a filename...
          load_from_file
        else
          # otherwise, load from fixtures...
          load_from_fixtures
        end
      else
        options = {
          :limit => 25
        }.merge(options)
        
        model = get_model_class
        puts "* Seeding #{model}"
      
        model.delete_all
        
        get_special_types
      
        @@attributes ||= {}
        @@attributes = get_attributes(model).merge(@@attributes)
      
        options[:limit].to_i.times do
          instance = model.new
        
          @@attributes.each do |name, type|
            next if name == 'id'
            
            value = nil
            if type.is_a?(String)
              value = Plant.produce(type)
            elsif type.is_a?(Proc)
              value = type.call
            else
              raise "Invalid type!  Not sure what happened..."
            end
            
            puts "  setting `#{name}` to `#{value}`"
            instance.send("#{name}=", value)
          end
          
          instance.save!
        end
      end
    end

    protected
      # Loads seed data from a file
      def self.load_from_file
        # Does the file exist?
        raise "Seed file [#{@@loads_from}] not found!" unless File.exists?(File.join(RAILS_ROOT, 'db', 'seeds', @@loads_from))
        
        # Use file extension to determine content
        if @@loads_from =~ /(.*).csv$/
          load_from_csv(@@loads_from)
        elsif @@loads_from =~ /(.*).xml$/
          load_from_xml(@@loads_from)
        elsif @@loads_from =~ /(.*).yml$/
          load_from_yml(@@loads_from)
        else
          raise "Can't figure out the file type of the data import."
        end
      end
      
      # Loads the fixture file from disk and passes it to +create_fixtures+.
      def self.load_from_fixtures
        puts "* Seeding #{get_model_class_name} from fixtures"
        Dir.glob(File.join(RAILS_ROOT, 'test', 'fixtures', "#{get_model_class_name.pluralize}.{yml,csv}")).each do |fixture_file|
          puts "  from #{fixture_file}"
          ::Fixtures.create_fixtures('test/fixtures', File.basename(fixture_file, '.*'))
        end
      end
      
      # Gets the special types available to your seed classes.
      def self.get_special_types
        Dir.glob("#{File.dirname(__FILE__)}/special_types/**").each do |file|
          load file
        end
      end
      
      # Gets the attributes of the given +model+ class.
      def self.get_attributes(model)
        attributes = {}
        
        model.columns.each do |column|
          attributes[column.name] = column.type.to_s 
        end
        
        attributes
      end
      
      # Gets the constant model class of the class name found
      # by get_model_class_name.
      def self.get_model_class
        get_model_class_name.constantize
      end
      
      # Uses the name of the seed class to determine the model's class
      # name.
      def self.get_model_class_name
        name.to_s.gsub(/Seed$/, '').singularize
      end
      
      # Load seed data from a CSV file using the fixtures mechanism.
      def self.load_from_csv(filename)
        puts "* Seeding #{get_model_class_name} from a CSV file"
        load_fixture_file(File.join('db', 'seeds'), filename)
      end
    
      # Load seed data from a Yaml file using the fixtures mechanism.
      def self.load_from_yml(filename)
        puts "* Seeding #{get_model_class_name} from a Yaml file"
        load_fixture_file(File.join('db', 'seeds'), filename)
      end
      
      # Load seed data from XML (not yet implemented).
      def self.load_from_xml(filename)
        raise "HAHAHAHA!!!  OK, I'll do it soon seriously."
      end
      
      # Loads an arbitrary fixture file.
      def self.load_fixture_file(dir, filename)
        Dir.glob(File.join(RAILS_ROOT, dir, filename)).each do |fixture_file|
          puts "  from #{fixture_file}"
          ::Fixtures.create_fixtures(dir, File.basename(fixture_file, ".*"))
        end
      end
  end
end