def commit(message)
  git add: "."
  git commit: "-m '#{message}'"
end

git :init
commit "New Rails app"

gem_group :development do
  gem "pry-rails"
end

commit "Add pry-rails"

gem_group :test do
  gem "rspec-rails", "~> 3.0"
end

run "wget https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/5052887a0fb55b51cace616cd18577ad181614d4/.rspec"
run "mkdir spec"
run "wget --directory-prefix=spec https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/991cf986e0c2d8c4c878b715ad7cba4674b98bc1/rails_spec_helper.rb"
run "wget --directory-prefix=spec https://gist.github.com/iamvery/6c87c9e191d32603aa78/raw/7859ff7aad5c412e2755507d3d8fc442c67b7d4f/spec_helper.rb"

run "bundle binstubs rspec-core"

commit "Add and configure RSpec"

# Remove comments from Gemfile
run "sed -i '' '/^.*#/ d' Gemfile"
# Remove turbolinks
run "sed -i '' '/turbolinks/ d' Gemfile"
run "sed -i '' '/turbolinks/ d' app/assets/javascripts/application.js"
run %q{sed -i '' "s/, 'data-turbolinks-track' => true//" app/views/layouts/application.html.erb}

commit "Remove turbolinks"

# TODO Gemfile cleanup

run "bundle install"

commit "Bundle gems"

run "rm README.rdoc"
run "touch README.md"

commit "Use markdown readme"
