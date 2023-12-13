class ZipGenerator
  require 'zip'

  class << self
    def generate_stars_zip(stars)
      ::Zip::OutputStream.write_buffer do |stream|
        stars.each_with_index do |star, index|
          place = index+1
          file = PdfGenerator.generate_star_pdf({ star:, place: })
          stream.put_next_entry "#{star}.pdf"
          stream.print file
        end
      end
    end
  end
end