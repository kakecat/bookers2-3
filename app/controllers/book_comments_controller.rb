class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    book_comment = current_user.book_comments.new(book_comment_params)
    book_comment.book_id = book.id
    book_comment.save
    redirect_to request.referer
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referer
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
