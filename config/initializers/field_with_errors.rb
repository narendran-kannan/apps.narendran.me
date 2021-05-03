ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if %w[input].include?(Nokogiri::HTML::DocumentFragment.parse(html_tag).children[0].name)
    "<div class=\"error\">#{html_tag}</div><div class='invalid-feedback' style='display:block'>#{instance.error_message[0]}</div>".html_safe
  else
    html_tag.html_safe
  end
end
