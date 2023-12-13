class PdfGenerator

  STAR_PDF_TEMPLATE = <<-HTML
  <div style="text-align: center; border: 3px solid goldenrod; height: 100%">
    <p style="font-size: 4rem">PDF # {{place}}</h1>
    <br>
    <p style="font-size: 2rem">The award goes to</p>
    <br>
    <p style="font-size: 2rem">{{star}}</p>
  </div>
HTML
  class << self
    def generate_star_pdf(params)
      params.to_h => { star:, place: }
      formatted = Liquid::Template.parse(STAR_PDF_TEMPLATE).render!('star' => star, 'place' => place)
      WickedPdf.new.pdf_from_string(formatted)
    end
  end
end