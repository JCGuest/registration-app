class User < ApplicationRecord
    has_many :addresses
    belongs_to :team
    accepts_nested_attributes_for :addresses

    def addresses_attributes=(addresses_attributes)
        addresses_attributes.each do |i, address_attributes|
            self.addresses.build(address_attributes)
        end
    end

    # def team_name=(name)
    #     self.team = Team.find_by(name: name)
    # end

    def team_attributes=(team_attributes)
        self.team = Team.where(:name => team_attributes[:name]).first_or_create do |t|
            t.hometown = team_attributes[:hometown]
        end
    end

end
