class Badge < ActiveRecord::Base
    attr_accessible :description, :name

    has_many :details
    has_many :presences

    @form_labels = {}
    @search_fields = []

    def add_detail (kind, value)
        @detail = self.details.create()
        @detail.kind = kind
        @detail.value = value
        @detail.save
    end

    def self.add_search_condition(params, field)
        if params[field] != '' and params[field] != nil
            return "details.kind='#{field}' AND details.value LIKE '%#{params[field]}%'"
        else
            return nil
        end

    end

    def self.search_conditions(search_fields, params)
        conditions = Array.new

        search_fields.each do |field|
            conditions << add_search_condition(params, field)
        end
        #conditions << add_search_condition(params, :family_name)

        search_condition = conditions.compact().join(' OR ')
    end

end
