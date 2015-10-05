require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have the title" do
      get 'index'
      page.should have_selector('title', :text => 'Tshtask')
    end
  end

end
