class EventSearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :keyword, :string   # ❶
  attribute :page, :integer     # ❷

  def search      # ❸
    Event.search(
      keyword_for_search,
      where: { start_at: { gt: start_at } },
      page: page,
      per_page: 10
    )
  end

  def start_at    # ❹
    @start_at || Time.current
  end

  def start_at=(new_start_at)   # ❺
    @start_at = new_start_at.in_time_zone
  end

  private

  def keyword_for_search        # ❻
    keyword.presence || "*"
  end
end
