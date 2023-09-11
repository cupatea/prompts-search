class Prompt < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  searchkick text_middle: [:body]
  include PgSearch::Model
  pg_search_scope :search_by_body,
                  against: :body,
                  using: {
                    tsearch: {
                      highlight: {
                        StartSel: '<b>',
                        StopSel: '</b>',
                        MaxWords: 123,
                        MinWords: 456,
                        ShortWord: 4,
                        HighlightAll: true,
                        MaxFragments: 3,
                        FragmentDelimiter: '&hellip;'
                      }
                    }
                  }
end
