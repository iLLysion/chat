class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @new_room = Room.new
  end

   def show
    @room = Room.with_associations.find_by!(name: params[:name])
    @messages = MessageDecorator.decorate_collection(@room.messages)
    @new_message = current_user&.messages&.build(room: @room)
  end

  def create
    @new_room = Room.new(user: current_user)
    @new_room.broadcast_append_to :rooms if @new_room.save
  end
end
