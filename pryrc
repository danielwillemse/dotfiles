Pry.config.theme = "railscasts"

Pry.config.prompt = [
  # Regular prompt.
  proc do |obj, nest_level, _|
    "#{RUBY_VERSION}p#{RUBY_PATCHLEVEL} (#{Pry.view_clip(obj)})> "
  end,
  # Wait prompt
  proc do |obj, nest_level, _|
    "#{RUBY_VERSION}p#{RUBY_PATCHLEVEL} (#{Pry.view_clip(obj)})* "
  end
]

# vim: set ft=ruby:
