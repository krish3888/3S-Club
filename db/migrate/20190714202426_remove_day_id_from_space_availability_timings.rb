class RemoveDayIdFromSpaceAvailabilityTimings < ActiveRecord::Migration[5.2]
  def change
    remove_column :space_availability_timings, :day_id, :integer
  end
end