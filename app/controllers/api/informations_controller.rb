module Api
  class InformationsController < ApplicationController
    def get_all
      @informations = Information.all
      render :json => 
        @informations.each do |information|
            {
                :id => information.id.to_s,
                :title => information.title,
                :created_at => information.created_at,
                :content => information.content,
                :information_type => information.information_type,
                :image =>  information.image
            }
        end
    end

    def jiuyexinxi
      @informations = Information.where(:information_type => "就业信息").all
      render :json => 
        @informations.each do |information|
            {
                :id => information.id.to_s,
                :title => information.title,
                :content => information.content,
                :information_type => information.information_type,
                :image => information.image 
            }
        end
    end

    def gongyougushi
      @informations = Information.where(:information_type => "工友故事").all
      render :json => 
        @informations.each do |information|
            {
                :id => information.id.to_s,
                :title => information.title,
                :content => information.content,
                :information_type => information.information_type,
                :image => information.image 
            }
        end    
    end

    def jinengpeixun
      @informations = Information.where(:information_type => "技能培训").all
      render :json => 
        @informations.each do |information|
            {
                :id => information.id.to_s,
                :title => information.title,
                :content => information.content,
                :information_type => information.information_type,
                :image => information.image 
            }
        end
    end

    def anquanxinxi
      @informations = Information.where(:information_type => "安全信息").all
      render :json => 
        @informations.each do |information|
            {
                :id => information.id.to_s,
                :title => information.title,
                :content => information.content,
                :information_type => information.information_type,
                :image => information.image 
            }
        end
    end
  end
end