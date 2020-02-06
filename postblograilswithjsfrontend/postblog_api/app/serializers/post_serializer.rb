class PostSerializer < ActiveModel::Serializer
  has_many :comments
  has_one :author
  attributes :id, :title, :body, :author
 
  # def author
  #   instance_options[:without_serializer] ? object.author : AuthorSerializer.new(object.author, without_serializer: true)
  # end
end
