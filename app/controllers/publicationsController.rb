class PublicationsController < ApplicationController
    def create
      @publication = current_user.publications.build(publication_params)
      if @publication.save
        redirect_to root_path, notice: "Publicação criada com sucesso."
      else
        render "home/index"
      end
    end
  
    private
  
    def publication_params
      params.require(:publication).permit(:titulo, :descricao, :link)
    end
  end
  