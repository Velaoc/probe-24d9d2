class GuestbookController < ApplicationController
  def index
    @entries = GuestbookEntry.newest_first.limit(100)
    @entry = GuestbookEntry.new
  end

  def create
    @entry = GuestbookEntry.new(guestbook_entry_params)
    @entries = GuestbookEntry.newest_first.limit(100)

    if @entry.save
      redirect_to root_path, notice: "Signed. Thanks for stopping by."
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def guestbook_entry_params
    params.expect(guestbook_entry: [ :name, :message ])
  end
end
