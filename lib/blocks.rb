
def render_around
  
  rendered_string = "[HEADER]"
  
  if block_given?
    rendered_string = "#{rendered_string}\n[#{yield}]"
  end
  
  rendered_string = "#{rendered_string}\n[FOOTER]"
  
end

