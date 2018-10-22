require 'spec_helper'
describe 'radarr' do
  context 'with default values for all parameters' do
    it { should contain_class('radarr') }
  end
end
