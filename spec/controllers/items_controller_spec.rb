require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  before(:each) do
    @category = Category.create!(category_name: 'Pet')
  end

  let(:item){FactoryGirl.create(:item, category: @category)}

  describe "GET #index" do
    it "returns http success" do
      get :index, category_id: @category.id
      expect(response).to have_http_status(:success)
    end
    it "returns count of items" do
      item_count = 5
      item_count.times {|i| Item.create!(name_of_item: "C#{i}W", price: 100.99, contact: "Person #{i}", category_id: @category.id)}
      get :index, category_id: @category.id
      expect(Item.all.count).to eq(item_count)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, category_id: @category.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates an item" do
      post :create, category_id: @category.id, item: {name_of_item: 'Dog', price: 3.33, contact: 'Best Friend'}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, category_id: @category.id, id: item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates an item" do
      put :update, category_id: @category.id, id: item.id, item: {name_of_item: 'Pig', price: 22.22, contact: 'Babe'}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, category_id: @category.id, id: item.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "deletes an item" do
      delete :destroy, category_id: @category.id, id: item.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
