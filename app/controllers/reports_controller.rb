class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    puts(params)
  end

  def report_by_dates
    rates_date = Operation.all.map { |r| [r.odate.to_s, r.amount] }
    @date = rates_date.map { |e| e[0]}
    @amount = rates_date.map { |e| e[1]}
    puts(params)
  end
end
