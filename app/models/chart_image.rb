class ChartImage

  include ActiveAttr::Model

  attribute :input
  attribute :width, default: 300


  def file
    @file ||= generate_chart
  end

  def size
    file.size
  end

  def file_path
    file.path
  end

  def close
    file.close
    infile.close
  end

  private

  def infile_path
    infile.path
  end

  def infile
    @infile ||= Tempfile.open(['infile', '.json']) do |out|
      out.write input 
      out
    end
  end

  def generate_chart
    temp_file = Tempfile.new(['bar_chart', '.png'])
    temp_file.binmode
    Rails.logger.info %x[phantomjs ./app/javascript/highcharts-convert.js -infile #{infile_path} -outfile #{temp_file.path} -width #{width} 2>&1]
    temp_file
  end


end
