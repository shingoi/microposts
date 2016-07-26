class LikesController < ApplicationController
    
    def like
        @micropost = Micropost.find(params[:micropost_id])
        like = current_user.likes.build(micropost_id: @micropost.id)
        like.save
    end
    
    def unlike
        @micropost = Micropost.find(params[:micropost_id])
        like = current_user.likes.find_by(micropost_id: @micropost.id)
        like.destroy
    end

end
