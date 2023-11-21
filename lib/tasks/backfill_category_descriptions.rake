namespace :db do
    desc 'Backfill existing categories with descriptions'
    task :backfill_category_descriptions => :environment do
      description = {
        "General" => "Explore a variety of topics.",
        "Technology" => "Stay up-to-date with the latest in tehcnology and innovation from araound the world.",
        "Travel" => "Embark on a journey of discovery with travel-related articles.",
        "Food" => "Indulge in a culinary adventure with mothwatering recipes.",
        "Arabic" => "Experience the Arab world through stories, articles and pictures of arab culture.",
        "Swahili" => "Go on a safari to the East African coast and experience it's history, language and cuisine."
      }
      
      Category.where(description: nil).each do |category|
        description = descriptions[category.name] 

        category.update!(description: description)
        puts "Description was backfilled to '#{category.name}'"
      end

      puts "Backfilling completed."
      
    end

end