class Spree::BlogConfiguration < Spree::Preferences::Configuration

  preference :disqus_shortname,  :string, :default => ''
  preference :use_markdown, :boolean, :default => true

end
