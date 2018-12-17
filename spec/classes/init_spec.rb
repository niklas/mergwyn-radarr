require 'spec_helper'
describe 'radarr' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:pre_condition) { 'include archive' }

      context 'with default values for all parameters' do
	it { is_expected.to contain_class('radarr') }
      end
    end
  end
end
