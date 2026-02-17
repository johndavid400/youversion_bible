# Youversion Bible API - Ruby

A Ruby wrapper for the YouVersion Platform Bible API built using
**Excon**.

This gem provides a Ruby client for interacting with the following
YouVersion API resources:

-   Bibles
-   Highlights
-   Languages
-   Licenses
-   Organizations
-   Verse of the Day

------------------------------------------------------------------------

## Installation

Add this line to your application's Gemfile:

``` ruby
gem "youversion_bible"
```

Then execute:

``` bash
bundle install
```

------------------------------------------------------------------------

## Configuration

You must provide your **YouVersion Platform App Key**.

``` ruby
YouversionBible.configure do |config|
  config.app_key = ENV["YVP_APP_KEY"]
end
```

### Optional Configuration

``` ruby
YouversionBible.configure do |config|
  config.app_key  = ENV["YVP_APP_KEY"]
  config.base_url = "https://api-dev.youversion.com/v1"
end
```

## Usage

Create a client instance:

``` ruby
client = YouversionBible.client
```

------------------------------------------------------------------------

### Bibles

``` ruby
client.bibles(language_ranges: ["en"])
client.bible(100)
client.bible_index(100)

client.passage(
  bible_id: 100,
  passage_id: "JHN.3.16"
)

client.books(100)

client.book(
  bible_id: 100,
  book_id: "GEN"
)

client.chapters(
  bible_id: 100,
  book_id: "GEN"
)

client.chapter(
  bible_id: 100,
  book_id: "GEN",
  chapter_id: 1
)

client.verses(
  bible_id: 100,
  book_id: "GEN",
  chapter_id: 1
)

client.verse(
  bible_id: 100,
  book_id: "GEN",
  chapter_id: 1,
  verse_id: 1
)
```

------------------------------------------------------------------------

### Languages

``` ruby
client.languages
client.language("en")
```

------------------------------------------------------------------------

### Organizations

``` ruby
client.organizations
client.organization("organization_id")
client.organization_bibles("organization_id")
```

------------------------------------------------------------------------

### Verse of the Day

``` ruby
client.verse_of_the_day_calendar
client.verse_of_the_day(32)
```

------------------------------------------------------------------------

### Highlights

#### (Under Construction) Documentation limited and doesn't work with normal API key

``` ruby
client.highlights(
  bible_id: 100,
  passage_id: "JHN.3.16"
)

client.upsert_highlight(
  bible_id: 100,
  passage_id: "JHN.3.16",
  color: "44aa44"
)

client.clear_highlights(
  bible_id: 100,
  passage_id: "JHN.3.16"
)
```

------------------------------------------------------------------------

### Licenses

#### (Under Construction) Documentation limited and doesn't work with normal API key

``` ruby
client.licenses
```

------------------------------------------------------------------------

## Error Handling

All API errors raise a subclass of:

``` ruby
YouversionBible::ApiError
```

Examples:

``` ruby
YouversionBible::Unauthorized
YouversionBible::NotFound
YouversionBible::RateLimited
YouversionBible::ServerError
```

Handle them as needed:

``` ruby
begin
  client.bible(999999)
rescue YouversionBible::NotFound => e
  puts e.message
end
```

------------------------------------------------------------------------

## License

MIT
