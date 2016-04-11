class PoemsController < ApplicationController
  def generate
    @poem = Poem.new
  end

  def create
  end

  def new
    @poem = Poem.generate_random
  end

end