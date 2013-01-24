class ChartImagesController < ApplicationController
  def create
    send_file ChartImage.new(input: params[:input], width: params[:width]).file_path
  end
end
