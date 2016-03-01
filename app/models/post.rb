class Post < ActiveRecord::Base
    belongs_to :user
    #validates_presence_of :title, :content
    #validates_length_of :title, maximum: 30

    enum status: [:draft, :published, :deleted]

    validates :title, presence: true,
                      length: { maximum: 30 }

    validates :content, presence: true

    scope :recent, -> {
      order(:created_at => :desc)
    }

    # scope :draft, -> {
    #   where(status: 1)
    # }
    #
    # scope :published, -> {
    #   where(status: 0)
    # }

    scope :on_date, lambda { |date = Date.today|
      where(publication_date: date)
    }

    scope :by_title, lambda { |title|
      where("title LIKE ?", "%#{title}%")
    }

end
