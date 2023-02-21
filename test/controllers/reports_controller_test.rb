require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reports_index_url
    assert_response :success
  end

  test "should get report_by_category" do
    get reports_report_by_category_url
    assert_response :success
  end

  test "should get report_by_dates" do
    get reports_report_by_dates_url
    assert_response :success
  end
end

require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  let(:category) { FactoryBot.create(:category) }
  let(:operation) { FactoryBot.create(:operation, category: category) }

  describe 'GET #report_by_category' do
    it 'assigns the requested categories' do
      get :report_by_category
      expect(assigns(:categories)).not_to be_nil
    end

    it 'renders the report_by_category template' do
      get :report_by_category
      expect(response).to render_template :report_by_category
    end
  end

  describe 'GET #report_by_dates' do
    it 'assigns the requested operations' do
      get :report_by_dates
      expect(assigns(:operations)).not_to be_nil
    end

    it 'renders the report_by_dates template' do
      get :report_by_dates
      expect(response).to render_template :report_by_dates
    end
  end
end
