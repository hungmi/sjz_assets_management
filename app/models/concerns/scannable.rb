module Scannable
  extend ActiveSupport::Concern

  included do 
    before_create :generate_qr_code
  end

  require 'barby/barcode/qr_code'
  require 'barby/outputter/png_outputter'
  include Rails.application.routes.url_helpers

  def generate_qr_code
    qr_code = Barby::PngOutputter.new(send("#{self.model_name.singular}_url", self.token))
    qr_code.margin = 0
    self.qr_code = qr_code.to_png
  end
end