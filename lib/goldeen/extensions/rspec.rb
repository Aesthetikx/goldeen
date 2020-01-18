if defined? RSpec
  require 'goldeen/extensions/rspec/dsl'
  require 'goldeen/namers/rspec_namer'
  require 'goldeen/namers/directory_namer'

  RSpec.configure do |c|
    c.include Goldeen::RSpec::DSL
    c.add_setting :approvals_path, :default => 'spec/fixtures/approvals/'
    c.add_setting :approvals_namer_class, :default => Goldeen::Namers::DirectoryNamer
    c.add_setting :diff_on_approval_failure, :default => false
    c.add_setting :approvals_default_format, :default => nil
  end
end
