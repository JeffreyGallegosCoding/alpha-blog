class ArticlesController < ApplicationController
  #This performs the method before it does anything else
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #Allows rails to find the article needed by its id

  end

  #This code grabs all of your articles in the database for the table on the index page
  def index
    # Paginate will still grab all articles but display them a specific amount per page
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  #This code is for you to create a new article before the create instance action(only for first time you load page)
  def new
    @article = Article.new
  end

  def edit
    #Allows rails to find the article needed by its id

  end

  #You need this with code in order to actually create your article
  def create
    #This code just renders the article info onto the page as an example
    # render plain: params[:article]

    #Need to include so it will be whitelisted
    @article = Article.new(article_params)
    @article.user = current_user
    #Then you save the article
    if @article.save

      #This is your flash notice for successful article creation(using the ruby flash helper)
      flash[:notice] = "Article was created successfully!"

      #Then you redirect the user to the show page which is the article path(referenced in rails routes in console)
      #And the article variable is referencing to the newly created article's id or show page(/articles/id)
      #you can also use (redirect_to @article) for a shorted line of code
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully!"
      redirect_to article_path(@article)
    else
      #Renders the edit page with the list of errors
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:notice] = "Article was deleted successfully!"
  end

#Any methods put in here are only for this controller: it helps clean up repeatable code
  #Privates don't need an end. Only add methods that are only for the specific controller
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end


end