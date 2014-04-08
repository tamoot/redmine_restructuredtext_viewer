require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'repositories_controller_hook'
end

Redmine::Plugin.register :redmine_restructuredtext_viewer do
  name 'Redmine reStructuredText Viewer plugin'
  author 'Masahiro TAMURA'
  description 'Preview reStructuredText in repository.'
  version '0.0.1'
  url 'https://github.com/tamoot/redmine_restructuredtext_viewer'
  author_url 'https://github.com/tamoot'
end

# Local Variables:
# mode: ruby
# indent-tabs-mode: t
# tab-width: 3
# ruby-indent-level: 3
# End:
# vim: ts=3
