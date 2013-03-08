class EventArchivePage < ArchivePage
  def child_path(child)
    date = child.event_datetime_start || Time.now
    if child.virtual?
      clean_path "#{ path }/#{ child.slug }"
    else
      clean_path "#{ path }/#{ date.strftime '%Y/%m/%d' }/#{ child.slug }"
    end
  end

  def find_by_path(path, live = true, clean = false)
    path = clean_path(path) if clean
    if path =~ %r{^#{ self.path }(\d{4})(?:/(\d{2})(?:/(\d{2}))?)?/?$}
      year, month, day = $1, $2, $3
      children.find_by_class_name(
        case
        when day
          'EventDayIndexPage'
        when month
          'EventMonthIndexPage'
        else
          'EventYearIndexPage'
        end
      )
    elsif path =~ %r{^#{ self.path }(fall|spring)/?$}
      children.find_by_class_name('EventSeasonIndexPage')
    else
      super
    end
  end
end
