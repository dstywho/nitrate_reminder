class ReportDefinitionTestPlansController < ApplicationController
  # GET /report_definition_test_plans
  # GET /report_definition_test_plans.json
  def index
    @report_definition_test_plans = ReportDefinitionTestPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_definition_test_plans }
    end
  end

  # GET /report_definition_test_plans/1
  # GET /report_definition_test_plans/1.json
  def show
    @report_definition_test_plan = ReportDefinitionTestPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_definition_test_plan }
    end
  end

  # GET /report_definition_test_plans/new
  # GET /report_definition_test_plans/new.json
  def new
    @report_definition_test_plan = ReportDefinitionTestPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report_definition_test_plan }
    end
  end

  # GET /report_definition_test_plans/1/edit
  def edit
    @report_definition_test_plan = ReportDefinitionTestPlan.find(params[:id])
  end

  # POST /report_definition_test_plans
  # POST /report_definition_test_plans.json
  def create
    @report_definition_test_plan = ReportDefinitionTestPlan.new(params[:report_definition_test_plan])

    respond_to do |format|
      if @report_definition_test_plan.save
        format.html { redirect_to @report_definition_test_plan, notice: 'Report definition test plan was successfully created.' }
        format.json { render json: @report_definition_test_plan, status: :created, location: @report_definition_test_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @report_definition_test_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /report_definition_test_plans/1
  # PUT /report_definition_test_plans/1.json
  def update
    @report_definition_test_plan = ReportDefinitionTestPlan.find(params[:id])

    respond_to do |format|
      if @report_definition_test_plan.update_attributes(params[:report_definition_test_plan])
        format.html { redirect_to @report_definition_test_plan, notice: 'Report definition test plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report_definition_test_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_definition_test_plans/1
  # DELETE /report_definition_test_plans/1.json
  def destroy
    @report_definition_test_plan = ReportDefinitionTestPlan.find(params[:id])
    @report_definition_test_plan.destroy

    respond_to do |format|
      format.html { redirect_to report_definition_test_plans_url }
      format.json { head :no_content }
    end
  end
end
