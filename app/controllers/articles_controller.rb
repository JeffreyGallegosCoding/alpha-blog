class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  #This code grabs all of your articles in the database for the table on the index page
  def index
    @articles = Article.all
  end

  #This code is for you to create a new article before the create instance action(only for first time you load page)
  def new
    @article = Article.new
  end

  #You need this with code in order to actually create your article
  def create
    #This code just renders the article info onto the page as an example
    # render plain: params[:article]

    #Need to include it this way otherwise it will be whitelisted
    @article = Article.new(params.require(:article).permit(:title, :description))
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



end