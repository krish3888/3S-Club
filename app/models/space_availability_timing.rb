class SpaceAvailabilityTiming < ApplicationRecord
    belongs_to:day
    belongs_to:space

     def self.se(a_data,b_data,c_data)
        
         if a_data && b_data && c_data
            where(["day_id= ? AND start_time<= ? AND end_time>= ? ",a_data,b_data,c_data]).pluck(:space_id)

        else
            all
        end
    end  

    validates :start_time, time: true,allow_blank: true
    validates :start_time, time: true,allow_blank: true
end
