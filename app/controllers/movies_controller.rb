class MoviesController < ApplicationController
before_filter :login_required, :except => [:show]
  # GET /movies
  # GET /movies.xml
  def index
	@movies = current_user.movies.paginate(:page => params[:page], :per_page => 12)
	@movie = Movie.new
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movies }
	  
	end
  end
  
  # GET /movies/1
  # GET /movies/1.xml
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.xml
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.xml
  def create
    @movie = Movie.new(params[:movie])
	@movie.user = current_user
	
	@peli = params[:movie][:title]
	@peli_y_anio = @peli.split(' (')
	@anio = @peli_y_anio.last.chomp!(')').to_i if @peli_y_anio.last.include? ")"

	@id_peli = YayImdbs.search_for_imdb_id(@peli, @anio)
	@info_peli = YayImdbs.scrap_movie_info(@id_peli)
	
	@movie.rating = @info_peli[:rating]
	@movie.year = @info_peli[:year]
	@movie.small_image = @info_peli[:large_image]	
	@movie.title = @peli_y_anio.first.titleize
	@movie.link_imdb = "http://www.imdb.com/title/tt#{@info_peli[:imdb_id]}"
	
	peli_gsub = @peli.gsub(" ", "%20")
	doc = Hpricot(open("http://www.google.com/search?q=site:cuevana.tv/peliculas%20#{peli_gsub}" ))
	links = doc/"//a[@class=l]"
	@movie.cuevana = links[0].attributes['href'] if not links.empty?
	
    respond_to do |format|
      if @movie.save
        format.html { redirect_to(movies_path, :notice => 'Movie was successfully added.') }
        format.xml  { render :xml => @movie, :status => :created, :location => @movie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /movies/1
  # PUT /movies/1.xml
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to(@movie, :notice => 'Movie was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end
  
def sort
@movies = Movie.all
@movies.each do |movie|
movie.position = params['movie'].index(movie.id.to_s) + 1
movie.save
end
render :nothing => true
end
  
  
  # DELETE /movies/1
  # DELETE /movies/1.xml
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to(movies_url, :notice => 'Movie was marked as seen.') }
      format.xml  { head :ok }
    end
  end
end
