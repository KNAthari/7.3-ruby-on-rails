namespace :db do
    desc 'Backfill existing categories with descriptions'
    task :categories => :environment do
      
      Category.all.each do |category|
        category.update(description: "This is the #{category}") 
      end
    end
end