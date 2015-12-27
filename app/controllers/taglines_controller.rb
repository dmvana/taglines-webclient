class TaglinesController < ApplicationController
  def index
    @taglines = Tagline.all  
  end

  def show
    @tagline = Tagline.find_by(id: params[:id])
  end

  def new
  end
  
  def create
     @tagline = Tagline.create(
         first_name: params[:first_name],
         last_name: params[:last_name],
         bs: params[:bs]
       )
     redirect_to "/taglines/#{@tagline.id}"
  end

  def edit
    @tagline = Unirest.get("http://localhost:3000/taglines/#{params[:id]}.json").body
  end

  def update
    @tagline = Unirest.patch(
      "http://localhost:3000/taglines/#{params['id']}.json",
      headers: { "Accept" => "application/json" }, 
      parameters: {
        first_name: params[:first_name],
        last_name: params[:last_name],
        bs: params[:bs]
      }
    ).body
    redirect_to "/taglines/#{@tagline['id']}"
  end

  def destroy
    @tagline = Tagline.find_by(id: params[:id])
    @tagline.destroy
    redirect_to "/taglines"
  end
end
