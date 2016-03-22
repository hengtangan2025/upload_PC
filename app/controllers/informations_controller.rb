class InformationsController < ApplicationController
     def index
         @Informations = Information.all
     end

     def new
         @Information = Information.new
     end

     def create
         information = Information.create(information_params)
         if information.save
            redirect_to "/informations"
        end
     end

     def show
         @information = Information.find(params[:id])
     end

     private

         def information_params
             params.require(:information).permit(:title, :information_type, :content, :image_url)
         end
end