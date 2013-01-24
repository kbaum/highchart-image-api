require 'spec_helper'


describe ChartImagesController do

  it 'creates a chart png' do
    post :create, input: File.read("#{Rails.root}/spec/fixtures/input.json"), width: 300
    response.should be_success
    response.content_type.should == 'image/png'
  end



end



