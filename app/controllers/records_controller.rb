class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]

  # GET /records or /records.json
  def index
    @records = current_user.records
  end

  # GET /records/1 or /records/1.json
  def show; end

  # GET /records/new
  def new
    @record = Record.new
    @categories = current_user.groups
  end

  # GET /records/1/edit
  def edit; end

  # POST /records or /records.json
  # rubocop:disable Metrics/MethodLength
  def create
    @record = current_user.records.new(record_params)
    @group_ids = params[:record][:groups]
    if @group_ids.empty? || @group_ids == ['']
      redirect_to new_record_url, alert: 'Select a category or create one.'
    else
      respond_to do |format|
        if @record.save
          @group_ids.each do |id|
            next if id == ''

            @group = current_user.groups.find(id.to_i)
            @group_record = GroupRecord.new(record_id: @record.id, group_id: id)
            @group_record.save
            @group.group_records << @group_record
            @group.save
            @record.group_records << @group_record
          end
          @record.save
          format.html { redirect_to group_url(@group_ids.last), notice: 'Record was successfully created.' }
          format.json { render :show, status: :created, location: @record }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @record.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # PATCH/PUT /records/1 or /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to record_url(@record), notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = Record.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:name, :amount, :groups)
  end
end
