namespace :db do
    desc 'Backfill existing categories with descriptions'
    task :backfill_category_descriptions => :environment do
      
      Category.where(description: nil).each do |category|
        category.update(description: "This is the #{category.name} category") 
        puts "Description was backfilled to #{category.name}"
      end
      
    end

end