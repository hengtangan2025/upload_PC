class Information
   include Mongoid::Document
   include Mongoid::Timestamps

   field :title, :type => String
   field :content, :type => String
   field :information_type, :type => String
   field :image_url, :type => String
   belongs_to :user
end
   