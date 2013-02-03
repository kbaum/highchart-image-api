class ChartImagesController < ApplicationController
  def create
    send_file chart_image.file_path
    chart_image.close
  end

  private

  def chart_image
    @chart_image ||= ChartImage.new(input: params[:input], width: params[:width])
  end
  
end
