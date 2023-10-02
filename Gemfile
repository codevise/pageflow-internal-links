source 'https://rubygems.org'

gemspec

if ENV['PAGEFLOW_DEPENDENCIES'] == 'experimental'
  git 'https://github.com/codevise/pageflow', branch: 'edge', glob: '**/*.gemspec' do
    gem 'pageflow'
    gem 'pageflow-support'
  end
else
  # Speed up dependency resolution
  gem 'rails', '~> 5.2.0'
end
