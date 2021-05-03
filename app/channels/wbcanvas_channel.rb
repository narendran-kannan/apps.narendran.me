class WbcanvasChannel < ApplicationCable::Channel

  def initialize(connection, identifier, params = nil)
    debugger
    super
  end

  def subscribed
    stream_from("wbcanvas_#{params[:name]}")
  end

  def receive(data)
    ActionCable.server.broadcast("wbcanvas_#{params[:name]}", data)
  end

  def speak(data)
    ActionCable.server.broadcast("wbcanvas_#{params[:name]}", data)
  end
end
