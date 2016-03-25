class InformationsController < ApplicationController
     def index
         @Informations = Information.all
     end

     def new
         @Information = Information.new
     end

     def create
        require 'fileutils'
        tmp = params[:information][:image]
        file = Rails.root.join("app","assets","images", tmp.original_filename)
        FileUtils.cp tmp.path, file
        information = Information.create(information_params)
        information.image = tmp.original_filename

        if information.save
            redirect_to "/informations"
        end
     end

     def show
         @information = Information.find(params[:id])
     end

     def upload

     end

     private

         def information_params
             params.require(:information).permit(:title, :information_type, :content, :image)
         end
end