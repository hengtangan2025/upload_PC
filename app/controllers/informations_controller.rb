class InformationsController < ApplicationController
     def index
         @informations = Information.all        
     end

     def new
         @Information = Information.new
     end

     def create
        require 'fileutils'
        tmp = params[:information][:image]
        file = Rails.root.join("app","assets","images", tmp.original_filename)
        FileUtils.cp tmp.path, file

        file_path = Rails.root + "app/assets/images" + tmp.original_filename

        img = MiniMagick::Image.new(file_path)
        img.contrast
        img.resize "400x400"     
        information = Information.create(information_params)
        information.image = tmp.original_filename

        if information.save
            redirect_to "/informations"
        end
     end

     def uploadfile
        image_name = params[:image_name]
        image_params = params[:file1]
        file = Rails.root.join("app","assets","images", image_name)
        File.open("app/assets/images/P60412-112059.jpg", "w") { |f| file.write(image_params) }   

        file_path = Rails.root + "app/assets/images" + image_name
        img = MiniMagick::Image.new(file_path)
        img.contrast
        img.resize "400x400"    
     end

     def create_from_app
        information = Information.create(:title => params[:title], :content => params[:content], 
            :information_type => params[:information_type], :image => params[:image])

        if information.save
            render :json => {
                :id => information.id.to_s,
                :title => information.title,
                :created_at => information.created_at,
                :content => information.content,
                :information_type => information.information_type,
                :image =>  information.image
            }
        end
     end

     def show
         information = Information.find(params[:id])

         render :json => {
                :id => information.id.to_s,
                :title => information.title,
                :created_at => information.created_at,
                :content => information.content,
                :information_type => information.information_type,
                :image =>  information.image
         }
     end

     def jiuyexinxi
        @informations = Information.where(:information_type => "就业信息").all
     end

     def gongyougushi
        @informations = Information.where(:information_type => "工友故事").all
     end

     def jinengpeixun
        @informations = Information.where(:information_type => "技能培训").all
     end

     def anquanxinxi
        @informations = Information.where(:information_type => "安全信息").all
     end

     private

         def information_params
             params.require(:information).permit(:title, :information_type, :content, :image)
         end
end