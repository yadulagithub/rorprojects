# app/views/articles/index.json.jbuilder
json.array! @articles do |article|
  json.id article.id
  json.title article.title
  json.url article.url

  # partial for category
  json.category do
    json.partial! 'categories/category', category: article.category
  end

  json.created_at article.created_at
end