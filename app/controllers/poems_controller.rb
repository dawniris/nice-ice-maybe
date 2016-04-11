class PoemsController < ApplicationController
  def generate
    @poem = Poem.new
  end

  def create
  end

  def new
  end
end