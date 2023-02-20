class ReportsController < ApplicationController
  def index
  end


  # def report_by_category
  #   puts(params)
  #   @categories = Category.all
  #   @report_by_category = {}
  #   @categories.each do |category|
  #     @report_by_category[category.name] = category.operations.sum(:amount)
  #   end
  # end

  # def category_reports_data
  #   report_by_category = Expense.joins(:category).group('categories.name').sum(:amount)
  #   labels = report_by_category.keys
  #   data = report_by_category.values

  #   render json: { labels: labels, data: data }
  # end

  def report_by_category
    rates_category = Category.all.map { |category| [category.name, category.operations.sum(:amount)] }
    @name = rates_category.map { |e| e[0]}
    @expenses = rates_category.map { |e| e[1]}
    puts(params)
  end
  
  
#   def report_by_dates
#     rates_date = Operation.all.map { |r| [r.odate.to_s, r.amount] }
#     @date = rates_date.map { |e| e[0]}
#     @amount = rates_date.map { |e| e[1]}
#     puts(params)
#   end
# end

def report_by_dates
  if params[:start_date].present? && params[:end_date].present?
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])
    rates_date = Operation.where(odate: start_date..end_date).map { |r| [r.odate.to_s, r.amount] }
  else
    rates_date = Operation.all.map { |r| [r.odate.to_s, r.amount] }
  end
  @date = rates_date.map { |e| e[0]}
  @amount = rates_date.map { |e| e[1]}
end
end
