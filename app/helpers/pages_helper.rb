module PagesHelper

  def last_import_ago
    ((Time.current - Tweet.last.created_at.to_time) / 60).round(0)
  end
end
