class ReportsController < ApplicationController
  def index
  end



  # def report_by_category
  #   rates_category = Category.all.map { |category| [category.name, category.operations.sum(:amount)] }
  #   @name = rates_category.map { |e| e[0]}
  #   @expenses = rates_category.map { |e| e[1]}
  #   puts(params)
  # end
  def report_by_category
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @categories = Category.includes(:operations).where(operations: {odate: @start_date..@end_date}).references(:operations)
  end
  

# def report_by_dates
#   if params[:start_date].present? && params[:end_date].present?
#     start_date = Date.parse(params[:start_date])
#     end_date = Date.parse(params[:end_date])
#     rates_date = Operation.where(odate: start_date..end_date).map { |r| [r.odate.to_s, r.amount] }
#   else
#     rates_date = Operation.all.map { |r| [r.odate.to_s, r.amount] }
#   end
#   @date = rates_date.map { |e| e[0]}
#   @amount = rates_date.map { |e| e[1]}
# end

def report_by_dates
  if params[:start_date].present? && params[:end_date].present?
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    @operations = Operation.where(odate: start_date..end_date)
  else
    @operations = Operation.all
  end
end
end
