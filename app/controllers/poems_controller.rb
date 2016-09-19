class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :destroy]
  def generate
    @poem = Poem.new
    @quote = Quote.grab_random.quote_text
  end

  def create
    @poem = Poem.new(poem_params)

    respond_to do |format|
      if @poem.save
        format.html { redirect_to poem_path(@poem) }
      end
    end
  end

  def new
    @poem = Poem.generate_random
    @image_url = Image.grab_random
  end

  def show
  end

  private

  def set_poem
    @poem = Poem.find(params[:id])
  end

  def poem_params
    params.require(:poem).permit(:name, :data)
  end

end