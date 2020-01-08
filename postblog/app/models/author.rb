class Author < ApplicationRecord
  # May have a post or may not have a post 
  # so took the rule out for has_many : posts
  has_many :posts
end
