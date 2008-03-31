require 'active_record/fixtures'

module Seed
  class Planter
    # Seeds data from a file (given as a string filename) or
    # +:fixtures+.
    def self.loads_from(filename)
      @@loads_from = filename
    end
    
    # Adds a special attribute to the list
    def self.attribute(name, type)
      @@attributes ||= {}
      @@attributes[name.to_s] = type.to_s
    end

    def self.plant!(options = {})
      if defined?(@@loads_from)
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
      
        get_special_types
      
        @@attributes ||= {}
        @@attributes = get_attributes(model).merge(@@attributes)
      
        options[:limit].times do
          instance = model.new
        
          @@attributes.each do |name, type|
            puts "  setting `#{name}` to `#{Plant.produce(type)}`"
            instance.send("#{name}=", Plant.produce(type))
          end
        
          instance.save!
        end
      end
    end

    protected
      def self.load_from_file
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
      
      def self.load_from_fixtures
        puts "* Seeding #{get_model_class_name} from fixtures"
        Dir.glob(File.join(RAILS_ROOT, 'test', 'fixtures', "#{get_model_class_name.pluralize}.{yml,csv}")).each do |fixture_file|
          puts "  from #{fixture_file}"
          ::Fixtures.create_fixtures('test/fixtures', File.basename(fixture_file, '.*'))
        end
      end
      
      def self.get_special_types
        Dir.glob("#{File.dirname(__FILE__)}/special_types/**").each do |file|
          load file
        end
      end
      
      def self.get_attributes(model)
        attributes = {}
        
        model.columns.each do |column|
          attributes[column.name] = column.type.to_s 
        end
        
        attributes
      end
      
      def self.get_model_class
        get_model_class_name.constantize
      end
      
      def self.get_model_class_name
        name.to_s.gsub(/Seed$/, '').singularize
      end
      
      def self.load_from_csv(filename)
        puts "* Seeding #{get_model_class_name} from a CSV file"
        load_fixture_file(File.join('db', 'seeds'), filename)
      end
      
      def self.load_from_yml(filename)
        puts "* Seeding #{get_model_class_name} from a Yaml file"
        load_fixture_file(File.join('db', 'seeds'), filename)
      end
      
      def self.load_from_xml(filename)
        raise "HAHAHAHA!!!  OK, I'll do it soon seriously."
      end
      
      def self.load_fixture_file(dir, filename)
        Dir.glob(File.join(RAILS_ROOT, dir, filename)).each do |fixture_file|
          puts fixture_file
          Fixtures.create_fixtures(dir, File.basename(fixture_file, ".#{extension}"))
        end
      end
  end
end

# class ProductsSeed < Seed::Planter
#   attribute :name, :string
#   attribute :address, :address
#   attribute :email, :email
#   attribute :location, :string
# end
# 
# class PeopleSeed < Seed::Planter
#   loads_from "people.yml"
# end