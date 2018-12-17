require 'spec_helper'
describe 'radarr' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to contain_class('radarr') }
        it { is_expected.to contain_class('radarr::config') }
        it { is_expected.to contain_class('radarr::install') }
        it { is_expected.to contain_class('radarr::service') }
      end
    end
  end
end
