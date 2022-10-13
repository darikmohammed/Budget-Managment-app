class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /entities or /entities.json
  def index
    @entities = Group.find(params[:group_id]).entities.order(created_at: :desc)
    @total_amount = 0.0
    @entities.each do |entity|
      @total_amount += entity.amount
    end
    @group = Group.find(params[:group_id])
  end

  # GET /entities/1 or /entities/1.json
  def show
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
  end

  # POST /entities or /entities.json
  def create
    @group = Group.find(params[:group_id])
    @expense = Entity.new(entity_params)
    @expense.user = current_user
    @expense.groups.push(@group)

    # @entity = @group.entities.create(entity_params)
    # @entity.user = current_user
    # @entity = Entity.new(entity_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_entities_path(params[:group_id]), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: "Entity was successfully updated." }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: "Entity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
end
