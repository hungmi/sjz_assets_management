module ApplicationHelper
  def loader(message=nil)
    capture do
      content_tag :div, id: "ajax-appetizer" do
        concat content_tag :h2, message if message.present?
        concat image_tag "loader#{rand(1..2)}.gif", class: "img-fluid", style: "max-width: 300px;"
      end
    end
  end

  # 取消 turbolinks 緩存，建議用在有 js 套件的頁面
  def no_cache
    content_for :custom_head do
      content_tag :meta, "", name: "turbolinks-cache-control", content: "no-cache"
    end
  end

  def ajax_edit(obj)
    "data-toggle=modal" +
    " data-target=#edit#{obj.class.model_name}" +
    " data-model-id=#{obj.id}" +
    " data-url=#{send("edit_#{obj.class.model_name.singular}_path", obj)}".html_safe
  end
end
