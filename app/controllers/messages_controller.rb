class MessagesController < ApplicationController
    before_action :require_user
    def create    
        puts "*"*30 
        message = current_user.messages.build(message_params)
        if message.save
            redirect_to root_path
        end
    end
    private
    def message_params
      params.require(:message).permit(:body)
    end

    def message_render(message)
      render(partial: 'message', locals: {message: message})
    end
  end