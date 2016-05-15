module Admin
  class AdminController < ApplicationController
    before_action :authenticate_user!
    layout 'admin'
    
    def index
      @orders = Order.all.order(created_at: :asc)
    end
  end
end
