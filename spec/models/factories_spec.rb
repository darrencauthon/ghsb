require 'spec_helper'

describe 'Factories' do

  FactoryGirl.factories.each do |factory|
    describe factory.name.to_s.titleize do
      it 'generates properly' do
        FactoryGirl.create_list factory.name, 3
      end
    end
  end

end
