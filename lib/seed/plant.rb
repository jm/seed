module Seed
  class Plant 
    BUILT_IN_TYPES = ["string", "decimal", "float", "boolean", "integer", "date", "time", "datetime", "text", "binary"] 
    
    # Produces seed data for the given type, either from internal generators, a proc, or 
    # a special type handler.
    def self.produce(type)
      if BUILT_IN_TYPES.include?(type)
        value = send(type)
      elsif @@types.has_key?(type)
        value = @@types[type].call
      else
        raise "You don't have a special handler for [#{type}]."
      end
    end
    
    # Registers a new special type handler
    def self.register_type(type, &behavior)
      @@types ||= {}
      
      @@types[type] = behavior
    end
    
    private
      # Generates random "lorem ipsum" string data (shoter than text).
      def self.string
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit." * (rand(3) + 1)
      end
      
      # Generates a true or false result.
      def self.boolean
        Integer(rand * 1000) % 2 == 0
      end
      
      # Generates a number for seeding.
      def self.decimal
        Integer(rand * 8000)
      end
      
      # Generates an integer for seeding.
      def self.integer
        Integer(rand * 8000)
      end
      
      # Generates a float number for seeding.
      def self.float
        Float(rand * 100000)
      end
      
      # Generates a date with no time for seeding.
      def self.date
        Date.parse("#{rand(11) + 1}/#{rand(28) + 1}/#{rand(150) + 1900}")
      end
      
      # Generates a date/time value for seeding.
      def self.datetime
        DateTime.parse("#{rand(11) + 1}/#{rand(28) + 1}/#{rand(150) + 1900} #{rand(23)}:#{rand(59)}:#{rand(59)}")
      end
      
      # Generates a time/no date value for seeding.
      def self.time
        Time.local(rand(150) + 1900, rand(11) + 1, rand(28) + 1, rand(23), rand(59), rand(59))
      end
      
      # Generates longer string 'lorem ipsum' data.
      def self.text
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vivamus vitae risus vitae lorem iaculis placerat. Aliquam sit amet felis. Etiam congue. Donec risus risus, pretium ac, tincidunt eu, tempor eu, quam. Morbi blandit mollis magna. Suspendisse eu tortor. Donec vitae felis nec ligula blandit rhoncus.\n\n" * (rand(6) + 1)
      end
      
      # TODO: Er, whut?
      def self.binary
        ""
      end
  end
end