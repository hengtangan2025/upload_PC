class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :content, :type => String
  field :image_url, :type => String
end
