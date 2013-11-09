class BussolenoController < ApplicationController
    @form_labels = {}
    @form_types = {}
    @search_fields = []

    before_filter :set_title
    helper_method :get_field_type

    def index
        conditions = Badge.search_conditions(@search_fields, params)
        @badges = Badge.all(
            :conditions => conditions,
            :order => 'id DESC',
            :joins => 'JOIN details ON badges.id = details.badge_id',
            :group => 'badges.id'
        )
    end

    def show
        @badge = Badge.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render :json => @badge.to_json(:include => [:details, :presences, :operations]) }
        end
    end

    def print
        @badge = Badge.find(params[:id])
    end

    def print_small
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

        @form_labels.each do |field,label|
            @badge.add_detail(field, params[field])
        end
    
        #
        #uploaded_io = params[:foo]
        #File.open(Rails.root.join(uploaded_io.original_filename), 'w') do |file|
        #      file.write(uploaded_io.read)
        #end

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
        @form_labels = {
            "first_name" => "Nome",
            "family_name" => "Cognome",
            "authorization_number" => "Numero di autorizzazione",
            "concession_number" => "Numero di concessione",
            "vara_concession_date" => "Vara rilasciato il",
            "vara_renew_date" => "Vara rinnovato il",
            "place_number" => "Numero posteggio",
            "place_owner" => "Titolare posteggio (S/N)",
            "place" => "Luogo",
#            "picture" => "Fotografia",
            "buy_date" => "Subentro per acquisto il",
            "rent_date" => "Subentro per affitto il",
            "description" => "Descrizione",
        }

        @search_fields = [
            'first_name',
            'family_name',
            'authorization_number'
        ]
        @form_types = {
            'description' => 'text_area',
#            'picture' => 'file',
            'vara_concession_date' => 'date',
            'place_owner' => 'choice',
        }
    end
end
