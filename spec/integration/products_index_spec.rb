require 'spec_helper'

describe "Products#index" do
  before(:each) do
    visit products_path
  end
  
  it "should list products" do
    page.should have_content("All Products")
  end    
end