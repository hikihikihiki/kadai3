class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
  def show
  	@book = Book.find(params[:id])
  	@book1 = Book.new
  	@user = User.find(@book.user.id)
  end

  def index
  	@book = Book.new
  	@books = Book.all
  	@user = current_user
  end

  def create
  	@book = Book.new(book_params)
	@books = Book.all
	@book.user_id = current_user.id
	@user = current_user
		if @book.save
			redirect_to book_path(@book), notice: "Book was successfully created"
		else
			render :index
		end
	end
	def destroy
	@book = Book.find(params[:id])
	@book.destroy
		redirect_to books_path
	end
	def update
	book = Book.find(params[:id])
	@book = Book.find(params[:id])
	    if @book.update(book_params)
			redirect_to book_path(@book), notice: "Book was successfully updated"
		else
			render :edit
		end
    end

  def edit
  	@book = Book.find(params[:id])
  end
  def new
    @post = Post.new
  end
private
    def book_params
		params.require(:book).permit(:title, :body, :profile_image)
	end
	def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
	end

end
