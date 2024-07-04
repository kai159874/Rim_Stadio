class Public::DisksController < ApplicationController
  before_action :ensure_disk, only: [:show, :edit, :update, :destroy]
  
  def new
    @disk = Disk.new
  end
  
  def create
    @disk = current_user.disks.new(disk_params)
    if @disk.save
      redirect_to disk_path(@disk), notice: "ディスクを作りました！"
    else
      render :new
    end
  end

  def show
  end

  def index
    @disks = Disk.all
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def ensure_disk
    @disk = Disk.find(params[:id])
  end
  
  def disk_params
    params.require(:disk).permit(:title, :introduction, :jacket_image, :file)
  end
  
end
