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
  end

  private

  def infile_path
    Tempfile.open(['infile', '.json']) do |out|
      out.write input 
      out.path
    end
  end

  def generate_chart
    file = Tempfile.new(['bar_chart', '.png'])
    file.binmode
    system "phantomjs ./app/javascript/highcharts-convert.js -infile #{infile_path} -outfile #{file.path} -width #{width}"
    file
  end


end
