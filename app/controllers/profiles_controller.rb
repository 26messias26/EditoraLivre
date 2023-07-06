class ProfilesController < ApplicationController
    before_action :authenticate_user!

    before_action :update_resource_params, only: [:update]

    def show
        @user = current_user
      end
    
      def edit
        @user = current_user
      end

      def update
        @user = current_user
        if @user.update_with_password(update_resource_params)
          bypass_sign_in(@user) if update_resource_params[:password].present?
          redirect_to profile_path, notice: "Perfil atualizado com sucesso."
        else
          redirect_to profile_path, notice: "Erro ao atualizar."
        end
      end
    
      def destroy
        @user = current_user
        @user.destroy
        redirect_to root_path, notice: "Conta excluída com sucesso."
      end

      def logout
        sign_out(current_user)
        redirect_to root_path, notice: "Você saiu da sua conta."
      end
    
      private

      def confirmation_enabled?
        devise_mapping.confirmable?
      end
      helper_method :confirmation_enabled?

      def update_resource_params
        params.require(:user).permit(:nome, :email, :password, :password_confirmation, :current_password)
      end

end
