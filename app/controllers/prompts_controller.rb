class PromptsController < ApplicationController
  def index

  end

  def search
    @prompts =
      Prompt.search(permitted_params[:q], match: :text_middle)
            .records
            .records
  end

  private

  def permitted_params
    params.permit(:q)
  end
end
