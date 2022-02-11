class GroupRecordsController < ApplicationController
  before_action :set_group_record, only: %i[show edit update destroy]

  # POST /group_entities or /group_entities.json
  def create
    @group_record = GroupRecord.new(group_record_params)

    respond_to do |format|
      if @group_record.save
        format.html { redirect_to group_record_url(@group_record), notice: 'Group record was successfully created.' }
        format.json { render :show, status: :created, location: @group_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_entities/1 or /group_entities/1.json
  def update
    respond_to do |format|
      if @group_record.update(group_record_params)
        format.html { redirect_to group_record_url(@group_record), notice: 'Group record was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_entities/1 or /group_entities/1.json
  def destroy
    @group_record.destroy

    respond_to do |format|
      format.html { redirect_to group_entities_url, notice: 'Group record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group_record
    @group_record = GroupRecord.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_record_params
    params.require(:group_record).permit(:record_id, :group_id)
  end
end
