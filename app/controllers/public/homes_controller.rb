class Public::HomesController < 
  
  def top
    @user_income = UserIncome.where(created_at: @month.in_time_zone.all_month)
    @user_expenditure = UserExpenditure.where(created_at: @month.in_time_zone.all_monthh) 
  end
end
