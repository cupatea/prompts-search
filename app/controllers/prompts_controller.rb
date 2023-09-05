class PromptsController < ApplicationController
  def index; end

  def search
    @prompts = Prompt.search(permitted_params[:q], match: :text_middle).limit(5)

    render turbo_stream: turbo_stream.update(
      'prompts-results',
      partial: 'prompts/prompts',
      locals: { prompts: @prompts }
    )
  end

  private

  def permitted_params
    params.require(:prompt).permit(:q)
  end
end
