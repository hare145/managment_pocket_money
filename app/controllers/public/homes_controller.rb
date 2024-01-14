class Public::HomesController < ApplicationController
  
  def top
    @month = params[:month] ? Date.parse(params[:month]) : Date.today 
    @user_income = UserIncome.where(created_at: @month.in_time_zone.all_month)
    @user_expenditure = UserExpenditure.where(created_at: @month.in_time_zone.all_month) 
  end
end
