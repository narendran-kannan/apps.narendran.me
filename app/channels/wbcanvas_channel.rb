class WbcanvasChannel < ApplicationCable::Channel
  def subscribed
    stream_from("wbcanvas_#{params[:name]}")
  end

  def receive(data)
    ActionCable.server.broadcast("wbcanvas_#{params[:name]}", data)
  end
end
