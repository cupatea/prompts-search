class PromptsController < ApplicationController
  def index; end

  def search
    @prompts = Prompt.search_by_body(permitted_params[:q])
                     .limit(5)

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
