class OwnerdashboardController < ApplicationController
  def upcoming_booking
    @user=User.find_by(id:session[:user_id])
    @user_detail=@user.user_detail
    @spaces=@user.spaces
    
  end
  def view_details
    
    br_id=params[:booked_id]
    @br=BookingRecord.find_by(id:br_id)
    @space=Space.find_by(id:@br.space_id)
    @address=@space.space_address
    @image=SpaceImage.find_by(id:@br.space_id)
    @time=SpaceAvailabilityTiming.find_by(id:@br.space_id)
    @day=SpaceAvailableDay.find_by(id:@br.space_id)
    @member=User.find_by(id:@br.user_id)
    @member_details=@member.user_detail
    @user_detail=@member.user_detail
    
  end
  def booking_records
    @user=User.find_by(id:session[:user_id])
    @user_detail=@user.user_detail
    @spaces=@user.spaces
  end
  def no_space
  end
end
