class JobsController < ApplicationController
    skip_before_action :verify_authenticity_token    

    # GET /jobs
    def index
        @jobs = Job.all
    end
    
    # GET /jobs/:id
    def show
        @job = Job.find(params[:id])
    end
    
    # POST /jobs
    def create
        @job = Job.new(job_params)
        if @job.save
            render json: @job 
        end
    end

    private

    def job_params
        params.require(:job).permit(:url, :job_title)
    end
end
