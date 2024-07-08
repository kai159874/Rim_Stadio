class Public::DisksController < ApplicationController
  before_action :ensure_disk, only: [:show, :edit, :update, :destroy]

  def new
    @disk = Disk.new
  end

  def create
    @disk = current_user.disks.new(disk_params)
    accepted_format = [".mp3"]
    # if !accepted_format.include? File.extname(@disk.file)
      if @disk.save
        redirect_to disk_path(@disk), notice: "ディスク投稿完了"
      else
        render :new, alert: "保存に失敗しました。"
      end
    # else
    #   render :new, alert: "拡張子はmp3のみとなります。"
    # end
    # フォーマットチェックのやり方わからない
    
  end

  def show
  end

  def index
    @disks = Disk.all
  end

  def edit
  end

  def update
    if @disk.update(disk_params)
      redirect_to disk_path(@disk), notice: "編集しました。"
    else
      render :edit
    end
  end

  def destroy
    if @disk.destroy
      redirect_to disks_path, notice: "削除しました。"
    else
      render :show
    end
  end

  private

  def ensure_disk
    @disk = Disk.find(params[:id])
  end

  def disk_params
    params.require(:disk).permit(:title, :introduction, :jacket_image, :file, :on_public)
  end

  def format_check
    accepted_format = [".mp3"]
    if !accepted_format.include? File.extname(@disk.file)
      render :new, alert: "mp3以外の拡張子は対応していません。"
    end
  end

end
