class FavoritesController < ApplicationController
  def index
  end
  def create
    current_user.favorites.create(post_id: params[:post_id])
    flash[:success] = "Le post a été ajouté au favori avec succès"
    redirect_to posts_path
  end
  def destroy
    current_user.favorites.find_by(id: params[:id]).destroy
    flash[:danger] = "Le post a été enlevé des favoris avec succès"
    redirect_to posts_path
  end
end
