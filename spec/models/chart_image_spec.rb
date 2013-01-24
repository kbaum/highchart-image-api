require 'spec_helper'

describe ChartImage do

  subject do 
    ChartImage.new(input: File.read("#{Rails.root}/spec/fixtures/input.json"))
  end

  its(:file){ should be_present }

  its(:size){ should be > 0 }

end
