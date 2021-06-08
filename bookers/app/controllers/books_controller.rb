class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      flash[:failed] = "Book wasn't updated"
      render :index
    end

  end

  def create
    book = Book.new(book_params)
    if  book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      flash[:failed] = "Book wasn't created."
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    if  book.destroy
      flash[:success] = "Book was successfully destroyed."
      redirect_to books_path
    else
      flash[:failed] ="Book wasn't destroied"
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
