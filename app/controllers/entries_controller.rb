class EntriesController < ApplicationController

  def index
    # @entries = Entry.all
    @entries = Entry.where(user_id: current_user.id)
  end

  def show
    @entry = Entry.find(params[:id])
    head :ok
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    # @entry = current_user.entries.build(entry_params)

    if @entry.save
      redirect_to entries_path, notice: "Entry created successfully!"
    else
      render :new
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    if @entry.user_id == current_user.id
      @entry.destroy
      redirect_to entries_path, notice: "Entry deleted successfully!"
    else
      redirect_to entries_path, alert: "You do not have permission to delete this entry."
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:first_name, :last_name, :email, :user_id)
  end
end
