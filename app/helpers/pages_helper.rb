module PagesHelper

  def breadcrumbs(page)
    s = []
    page.ancestors.each do |p|
      s << content_tag(link_to p.name, page_path(p))
    end
    raw(s.join(' '))
  end

end
