class Tagline
  attr_accessor :first_name, :last_name, :bs

  def initialize(input_options)
    @id = input_options ["id"]
    @first_name = input_options["first_name"]
    @last_name = input_options["last_name"]
    @bs= input_options["bs"]
  end

  def full_name
    "#{last_name}, {first_name}"
  end

  def destroy
    Unirest.delete("#{ENV['API_BASE_URL']}taglines/#{id}.json")
  end

  def self.all 
    tagline_options_hashes = Unirest.get("http://localhost:3000/api.v1/taglines.json").body
    taglines = []
    tagline_option_hashes.each do |tagline_option_hash|
      taglines << Tagline.new(tagline_option_hash)
    end
    taglines
  end

  def self.find_by(input_options)
    id = input_options[:id]
    tagline_options_hash = Unirest.get("http://localhost:3000/taglines/{params[:id]}.json").body
    @tagline = Tagline.new(tagline_options_hash)
  end

  def self.create(input_options)
    tagline_options_hash = Unirest.post(
       "http://localhost:3000/taglines.json",
       headers: { "Accept" => "application/json"}, 
       parameters: input_options
     ).body
  end 
end