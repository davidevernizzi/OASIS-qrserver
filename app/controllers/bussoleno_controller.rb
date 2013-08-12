class BussolenoController < ApplicationController

  def index
  end

  def new
    @badge = Badge.new
  end

  def create
     fields = ['first_name', 'family_name', 'place'] #TODO: use helper
     @badge = Badge.new
     @badge.name = params[:first_name] + " " + params[:family_name]
     @badge.description = params[:description]
     @badge.save

     fields.each do |p|
        @detail = @badge.details.create()
        @detail.kind = p
        @detail.value = params[p]
        @detail.save
     end

     redirect_to_badges #FIXME
  end
end
