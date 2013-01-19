ActionController::Routing::Routes.draw do |map|
  map.with_options(:controller => 'page_events', :action => "index") do |e|
    e.events  'admin/page_events/:year/:month', :requirements => { :year => /\d+/, :month => /\d+/ }
    e.events  'admin/page_events/:year',        :requirements => { :year => /\d+/ }
  end
  map.connect 'admin/page_events/:action', :controller => 'page_events'
end
