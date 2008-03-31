module Seed
  class Plant    
    def self.produce(type)
      if ["string", "decimal", "float", "boolean", "integer", "date", "time", "datetime", "text", "binary"].include?(type)
        value = send(type)
      elsif @@types.has_key?(type)
        value = @@types[type].call
      else
        raise "You don't have a special handler for [#{type}]."
      end
    end
    
    def self.register_type(type, &behavior)
      @@types ||= {}
      
      @@types[type] = behavior
    end
    
    private
      def self.string
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit." * (rand(3) + 1)
      end
      
      def self.boolean
        Integer(rand * 1000) % 2 == 0
      end
      
      def self.decimal
        Integer(rand * 8000)
      end
      
      def self.integer
        Integer(rand * 8000)
      end
      
      def self.float
        Float(rand * 100000)
      end
      
      def self.date
        Date.parse("#{rand(11) + 1}/#{rand(28) + 1}/#{rand(150) + 1900}")
      end
      
      def self.datetime
        DateTime.parse("#{rand(11) + 1}/#{rand(28) + 1}/#{rand(150) + 1900} #{rand(23)}:#{rand(59)}:#{rand(59)}")
      end
      
      def self.time
        Time.local(rand(150) + 1900, rand(11) + 1, rand(28) + 1, rand(23), rand(59), rand(59))
      end
      
      def self.text
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vivamus vitae risus vitae lorem iaculis placerat. Aliquam sit amet felis. Etiam congue. Donec risus risus, pretium ac, tincidunt eu, tempor eu, quam. Morbi blandit mollis magna. Suspendisse eu tortor. Donec vitae felis nec ligula blandit rhoncus.\n\n" * (rand(6) + 1)
      end
      
      # TODO: Er, whut?
      def self.binary
        ""
      end
  end
end