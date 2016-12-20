module ApplicationHelper
  def loader(message=nil)
    capture do
      content_tag :div, id: "ajax-appetizer" do
        concat content_tag :h2, message if message.present?
        concat image_tag "loader#{rand(1..2)}.gif", class: "img-fluid", style: "max-width: 300px;"
      end
    end
  end
end
