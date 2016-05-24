class PlacetagsController < ApplicationController
  def create
    if current_place.nil?
      return render text: 'nope', status: :unprocessable_entity
    end
    
    tag_to_be = Tagword.find(params[:tagword_id])
    
    if !tag_to_be.nil?
      @placetag = current_place.tag(tag_to_be)
    else
      return render text: 'nope', status: :unprocessable_entity
    end
    if @placetag.valid?
      redirect_to place_path(current_place)
    else
      render text: 'Oops', status: :unprocessable_entity
    end
  end

  def destroy
    #@placetag = Placetag_find_by_id(params[:id])
    #@placetag.destroy
    tag_begone = Tagword.find(params[:tagword_id])
    current_place.untag(tag_begone)
    render text: 'Deleted!'
  end

  private
    def placetag_params
      params.require(:placetag).permit(:tagword_id)
    end
end
