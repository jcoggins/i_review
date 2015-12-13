class NotesController < ApplicationController
before_action :set_book, only: [:create, :destroy]
  # POST /book.notes
  def create
    @note = @book.notes.new(note_params)
      if @note.save
         redirect_to @book, notice: 'Note successfully added!' 
      else
        redirect_to @book, alert: 'Unable to add note!' 
      end
  end
  # DELETE /book.notes/1
  def destroy
   @note = @book.notes.find(params[:id])
   @note.destroy
   redirect_to @book, notice: "Note deleted"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :note)
    end
end