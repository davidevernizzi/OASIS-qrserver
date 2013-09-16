class BussolenoController < ApplicationController
    @form_fields = []
    @form_labels = {}

    before_filter :set_title

  def index
      @badges = Badge.all(:order=>'id DESC')
      @form_labels = {              #TODO: refactor this
          "first_name" => "Nome",
          "family_name" => "Cognome",
          "place" => "Luogo",
          "description" => "Descrizione",
      }
  end

  def show
      @badge = Badge.find(params[:id])
  end

  def new
      @badge = Badge.new
  end

  def create
     @badge = Badge.new
     @badge.name = params[:first_name] + " " + params[:family_name]
     @badge.description = params[:description]
     @badge.save

     @form_fields.each do |p|
        @detail = @badge.details.create()
        @detail.kind = p
        @detail.value = params[p]
        @detail.save
     end

     redirect_to :controller=>'bussoleno', :action=>'index'
  end

  def edit
      @badge = Badge.find(params[:id])
  end

  def editbussoleno
      @badge = Badge.find(params[:id])

      @badge.details.each do |d|
          d.value = params[d.kind]
          d.save
      end

      @badge.name = params[:first_name] + " " + params[:family_name]
      @badge.description = params[:description]
      @badge.save

     redirect_to :controller=>'bussoleno', :action=>'index'
  end

    private      
    def set_title
      @form_fields = ['first_name', 'family_name', 'place', 'description'] #TODO: use helper
      @form_labels = {
          "first_name" => "Nome",
          "family_name" => "Cognome",
          "place" => "Luogo",
          "description" => "Descrizione",
      }
    end
end
