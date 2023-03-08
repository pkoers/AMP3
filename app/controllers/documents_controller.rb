class DocumentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    # @document = current_user.documents.new(document_params)
    @document = Document.new(document_params)

    if @document.save
      render json: {success: true}
      # redirect_to documents_path, notice: "Document was successfully created."
      # redirect_to @document, notice: 'Document was successfully uploaded.'
    else
      render json: {success: false, errors: @document.errors.full_messages}
      # render :new
    end
  end

  private

  def document_params
    # params.require(:document)
    params.require(:document).permit(:title, :description)
    # params.require(:document).permit(:document, :description).tap do |whitelisted|
    #  whitelisted[:title] = params[:document][:document].original_filename
    # end
    # params.require(:document).permit(:title, :description, :document).tap do |whitelisted|
    #  whitelisted[:title] = params[:document][:document].original_filename
    #  whitelisted[:document_data] = params[:document][:document].read
    # end
  end
end
