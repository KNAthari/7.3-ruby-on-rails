namespace :db do
    desc 'Backfill existing categories with descriptions'
    task :backfill_category_descriptions => :environment do
      description = {
        "Fashion" => "Explore the latest trends in fashion",
        "Technology" => "Stay up-to-date with the latest in tehcnology and innovation from araound the world.",
        "Travel" => "Embark on a journey of discovery with travel-related articles.",
        "Food" => "Indulge in a culinary adventure with mothwatering recipes.",
      }
      
      Category.where(description: nil).each do |category|
        description = description[category.name] 

        category.update!(description: description)
        puts "Description was backfilled to '#{category.name}'"
      end

      puts "Backfilling completed."
      
    end

end