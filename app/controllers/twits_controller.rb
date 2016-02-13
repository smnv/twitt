class TwitsController < ApplicationController
  before_action :set_twit, only: [:show, :edit, :update, :destroy]

  # Полный список наших твитов
  def index
    @twits = Twit.all
  end

  # Каждый твит
  def show
  end

  # Для созданиния нового твита
  def new
    @twit = Twit.new
  end

  # Для редактирования существущего твита
  def edit
  end

  # Создает новый твит
  def create
    @twit = Twit.new(twit_params)

    respond_to do |format|
      if @twit.save
        format.html { redirect_to @twit, notice: 'Twit was successfully created.' }
        format.json { render :show, status: :created, location: @twit }
      else
        format.html { render :new }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # Обновляет данные существующего твита
  def update
    respond_to do |format|
      if @twit.update(twit_params)
        format.html { redirect_to @twit, notice: 'Twit was successfully updated.' }
        format.json { render :show, status: :ok, location: @twit }
      else
        format.html { render :edit }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # Удаляет существующий твит
  def destroy
    @twit.destroy
    respond_to do |format|
      format.html { redirect_to twits_url, notice: 'Twit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Устанавливает твит
    def set_twit
      @twit = Twit.find(params[:id])
    end

    # 
    def twit_params
      params.require(:twit).permit(:title, :content)
    end
end
