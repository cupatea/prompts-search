class Prompt < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  searchkick text_middle: [:body]
  include PgSearch::Model
  pg_search_scope :search_by_body,
                  against: :body,
                  using: {
                    tsearch: {
                    }
                  }
end
