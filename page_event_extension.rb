
class PageEventExtension < Radiant::Extension
  version "0.4"
  description "Allows you to add event dates to your pages that can be viewed on a site-wide calendar"
  url "http://github.com/mghaught/radiant-page-event/tree/master"
  
  def activate
    EventArchivePage
    EventMonthIndexPage
    EventSeasonIndexPage
		Page.send :include, PageEvent::PageExtensions
		Page.send :include, PageEventTags
    admin.page.edit.add :parts_bottom, "edit_page_event", :before => 'edit_layout_and_type'
    admin.tabs.add "Events", "/admin/page_events", :after => "Pages", :visibility => [:all]
  end
  
end
