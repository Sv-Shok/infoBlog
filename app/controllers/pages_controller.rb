class PagesController < ApplicationController
  def about
    @heading = 'Page about us'
    @text = 'Some text'
  end
end