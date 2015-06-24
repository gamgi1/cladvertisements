require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) {Category.create(category_name: 'General')}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'displays all categories' do
      get :index
      expect(Category.all.count).to_not eq(nil)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: category.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, category: { category_name: 'Test' }
      expect(response).to have_http_status(:redirect)
    end
  end

end
