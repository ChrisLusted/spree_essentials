require 'test_helper'

class PageTest < Test::Unit::TestCase

  def setup
    Page.destroy_all
  end
  
  subject { Page.new }
  
  should validate_presence_of(:title)
  should validate_presence_of(:path)
  #should validate_uniqueness_of(:path)
  should have_many(:contents)
  should have_many(:images)
  
  should "return true if root" do
    page = Factory.create(:page, :path => "/")
    assert page.root?
  end
  
  should "return false unless root" do
    page = Factory.create(:page, :path => "/another")
    assert page.root?
  end
    
end