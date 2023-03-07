class EntriesController < ApplicationController
  def index
    @entries = Entry.all #current_user.entries
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

  private

  def entry_params
    params.require(:entry).permit(:first_name, :last_name, :email, :user_id)
  end
end
