class PdfGenerator
  class << self
    def generate_star_pdf(star)
      template = '<h1>Hello There! {{star}}</h1>'
      formatted = Liquid::Template.parse(template).render!('star' => star)
      WickedPdf.new.pdf_from_string(formatted)
    end
  end
end