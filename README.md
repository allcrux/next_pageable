# NextPageable

A minimalstic ActiveRecord concern for basic paging support of ActiveRecord relations avoiding extra count queries where not needed.

This gem is the perfect companion for [turbo-scroll](https://github.com/allcrux/turbo-scroll).

[![Ruby](https://github.com/allcrux/next-pageable/actions/workflows/main.yml/badge.svg)](https://github.com/allcrux/next-pageable/actions/workflows/main.yml)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add next-pageable

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install next-pageable

## Usage

To make your ActiveRecord relations pageable, inlude NextPageable on the models that you want to enrich.

```
class Article < ActiveRecord::Base
  include NextPageable
  ...
end
```

Alternatively, you can include NextPageable directly on your ApplicationRecord if you want it to be available to all
of your models

```
class ApplicationRecord < ActiveRecord::Base
    include NextPageable
  ...
end
```

For models that are enriched one extra class method `page` becomes available.
It can be chained onto existing scope methods but should be the last method in the chain.

```
page = Article.all.page(0) # returns the 1st page for all articles
page = Article.in_stock.page(3) # returns the 4th page for articles currently in stock
```

Default pagesize is 15 but it can be passed as an extra parameter

```
page = Article.all.page(1, pagesize: 50) # returns the 2nd page for all articles with a pagesize of 50
```

You can directly iterate over the records on the page object:

```
page.each do |article|
  puts article
end
```

A page object also knows if there is a next page available and what the page value is

```
page.next_page? # true
page.next_page_index # 4
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/allcrux/next-pageable.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/next-pageable/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NextPageable project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/next-pageable/blob/main/CODE_OF_CONDUCT.md).
