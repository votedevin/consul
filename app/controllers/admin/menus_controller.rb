module Admin
  class MenusController < BaseController
    load_and_authorize_resource

    def index
      @menus = @menus.order(:sort_index).group_by(&:menu_type)
    end

    def create
      @menu = Menu.new(menu_params)

      if @menu.save
        redirect_to admin_menus_path
      else
        render :new
      end
    end

    def update
      if @menu.update(menu_params)
        redirect_to admin_menus_path
      else
        render :edit
      end
    end

    def destroy
      @menu.destroy
      redirect_to admin_menus_path, notice: 'Menu item deleted'
    end

    private

    def menu_params
      params.require(:menu).permit(:title, :url, :sort_index, :menu_type)
    end
  end
end
