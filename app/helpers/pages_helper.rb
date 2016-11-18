module PagesHelper

  def last_import_ago
    if Tweet.count > 0
      ((Time.current - Tweet.last.updated_at.to_time) / 60).round(0)
    else
      'a few'
    end
  end
end
