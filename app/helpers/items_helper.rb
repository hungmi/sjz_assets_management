module ItemsHelper
  def company_people_options
     return Department.all.collect { |d| [d.name, d.employees.collect { |e| [ e.name, e.id ] }] }
  end

  def responsive_img(item)
    browser.device.mobile? ? item.image.thumb.url : item.image.small.url
  end
end