class ReportDefinitionsController < ApplicationController
  # GET /report_definitions
  # GET /report_definitions.json
  def index
    @report_definitions = ReportDefinition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_definitions }
    end
  end

  # GET /report_definitions/1
  # GET /report_definitions/1.json
  def show
    @report_definition = ReportDefinition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_definition }
    end
  end

  # GET /report_definitions/new
  # GET /report_definitions/new.json
  def new
    @report_definition = ReportDefinition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report_definition }
    end
  end

  # GET /report_definitions/1/edit
  def edit
    @report_definition = ReportDefinition.find(params[:id])
  end

  # POST /report_definitions
  # POST /report_definitions.json
  def create
    @report_definition = ReportDefinition.new(params[:report_definition])

    respond_to do |format|
      if @report_definition.save
        format.html { redirect_to @report_definition, notice: 'Report definition was successfully created.' }
        format.json { render json: @report_definition, status: :created, location: @report_definition }
      else
        format.html { render action: "new" }
        format.json { render json: @report_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /report_definitions/1
  # PUT /report_definitions/1.json
  def update
    @report_definition = ReportDefinition.find(params[:id])

    respond_to do |format|
      if @report_definition.update_attributes(params[:report_definition])
        format.html { redirect_to @report_definition, notice: 'Report definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_definitions/1
  # DELETE /report_definitions/1.json
  def destroy
    @report_definition = ReportDefinition.find(params[:id])
    @report_definition.destroy

    respond_to do |format|
      format.html { redirect_to report_definitions_url }
      format.json { head :no_content }
    end
  end
end
