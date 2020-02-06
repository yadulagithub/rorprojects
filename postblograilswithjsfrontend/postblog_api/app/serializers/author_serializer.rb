class AuthorSerializer < ActiveModel::Serializer
  has_many :posts
  attributes :id, :name

end
