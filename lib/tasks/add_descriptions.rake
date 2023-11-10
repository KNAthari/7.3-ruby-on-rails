namespace :db do
    desc "Fill description in category."
    task add_description: :environment do
        category_description = ["tech desc", "travel desc", "food desc", "fashion desc"]

        category_description.each do |desc|
            Category.find_or_create_by(description: desc)
            puts "Category '#{desc}' added."
        end
        puts "Categories desc added successfully"
    end
end