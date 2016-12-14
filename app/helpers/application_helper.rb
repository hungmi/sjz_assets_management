module ApplicationHelper
  def notice_message
    if flash.any?
      alerts = flash.map do |type, message|
        content_tag :div, class: "alert alert-#{type} mt-1 mb-1" do
          message
        end
      end
      alerts.join("\n").html_safe
    end
  end
end
