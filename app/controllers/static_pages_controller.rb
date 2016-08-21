class StaticPagesController < ApplicationController
  def home
    unless family_signed_in?
      redirect_to new_family_registration_path
    end
  end
  
end
