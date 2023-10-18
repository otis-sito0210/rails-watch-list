class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
    raise ActionController::RoutingError.new('Not Found') unless @list
  end

  def create
    @list = List.find(params[:list_id])

    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

    def destroy
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to list_path(@list)
    end


  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
