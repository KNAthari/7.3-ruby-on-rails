namespace :db do
    desc "Add ten random article"
    task add_random_articles: :environment do
        category_ids = Category.pluck(:id)

        10.times do
            title ="Article Title #{rand(1000)}"
            body = "This is the content of article #{rand(1000)}"

            random_category_id = category_ids.sample
            article = Article.create(title: title, body: body, category_id: random_category_id)
            puts "Article '#{title} added to category '#{article.category.name}'"
        end
        puts "Random artcles added successfully"
    end
end