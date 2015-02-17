def commit(message)
  git add: "."
  git commit: "-m '#{message}'"
end

def download_file(url, directory = ".")
  run "wget --directory-prefix=#{directory} #{url}"
end

git :init
commit "New Rails app"

gem_group :development, :test do
  gem "dotenv"
  gem "pry-rails"
end
commit "Add dotenv and pry-rails"

gem_group :test do
  gem "capybara"
  gem "launchy"
  gem "rspec-rails", "~> 3.0"
  gem "turnip"
end

download_file "https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/.rspec"
run "mkdir spec"
download_file "https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/rails_spec_helper.rb", "spec"
download_file "https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/spec_helper.rb", "spec"
download_file "https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/turnip_helper.rb", "spec"

run "bundle binstubs rspec-core"
commit "Add and configure RSpec with Turnip"

run "sed -i '' '/^.*#/ d' Gemfile"
commit "Remove Gemfile comments"

# TODO Gemfile cleanup
# TODO Ruby version in gemfile?
# TODO database_cleaner?

run "bundle install"
commit "Bundle gems"

download_file "https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/bootstrap", "bin"
run "chmod +x bin/bootstrap"
commit "Add bootstrap script"

run "rm README.rdoc"
download_file "https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/README.md"
run %Q{sed -i '' "s/\\[APP NAME\\]/#{app_path.titleize}/" README.md}
commit "Use markdown readme"
