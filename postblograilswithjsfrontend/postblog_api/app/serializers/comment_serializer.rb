class CommentSerializer < ActiveModel::Serializer
  has_one :post
  attributes :id, :body, :post
  
  # def post
  #   instance_options[:without_serializer] ? object.post : PostSerializer.new(object.post, without_serializer: true)
  # end
end
