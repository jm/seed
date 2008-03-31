namespace :db do
  desc "Seed your database with data"
  task :seed => :environment do
    Dir.glob("#{RAILS_ROOT}/db/seeds/*.rb").each do |file|
      require file
      
      seed_class = (file.gsub(/^#{RAILS_ROOT}\/db\/seeds\/(.*).rb/, '\1')).classify.constantize
      seed_class.plant!
    end
  end
end
