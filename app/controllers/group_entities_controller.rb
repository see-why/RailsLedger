class GroupEntitiesController < ApplicationController
  before_action :set_group_entity, only: %i[ show edit update destroy ]

  # POST /group_entities or /group_entities.json
  def create
    @group_entity = GroupEntity.new(group_entity_params)

    respond_to do |format|
      if @group_entity.save
        format.html { redirect_to group_entity_url(@group_entity), notice: "Group entity was successfully created." }
        format.json { render :show, status: :created, location: @group_entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_entities/1 or /group_entities/1.json
  def update
    respond_to do |format|
      if @group_entity.update(group_entity_params)
        format.html { redirect_to group_entity_url(@group_entity), notice: "Group entity was successfully updated." }
        format.json { render :show, status: :ok, location: @group_entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_entities/1 or /group_entities/1.json
  def destroy
    @group_entity.destroy

    respond_to do |format|
      format.html { redirect_to group_entities_url, notice: "Group entity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_entity
      @group_entity = GroupEntity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_entity_params
      params.require(:group_entity).permit(:entity_id, :group_id)
    end
end
