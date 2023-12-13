class HomeController < ApplicationController
  def index
  end

  def search
    begin
      stars = Github.instance.get_stars_contributors params[:repo]
      render partial: "home/stars_list", locals: { stars: stars }
    rescue Exception => e
      render partial: "home/stars_error", locals: { message: e.message }
    end
  end

  def get_pdf
    pdf = PdfGenerator.generate_star_pdf(params)
    respond_to do |format|
      format.pdf { send_data(pdf, filename: "#{params[:star]}.pdf", type: 'application/pdf') }
    end
  end

  def get_zip
    zip = ZipGenerator.generate_stars_zip(params[:stars])
    zip.rewind
    respond_to do |format|
      format.zip { send_data(zip.read, filename: "all.zip", type: 'application/zip') }
    end
  end

  private

  def user_params
    params.permit!#(:repo, :star, :stars, :place)
  end

end
