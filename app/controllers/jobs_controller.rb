class JobsController < ApplicationController
    before_action :find_job, only:[:show, :edit, :update, :destroy]

    def index
        @jobs = Job.all.order("created at desk")
    end

    def show 
    end 

    def new 
        @job = Job.new
    end

    def create
        @job = Job.new(jobs_params)
        if @job.save
            redirect_to @job
        else 
            render "New"
        end
    end 

    def edit
    end 

    def update
        if @job.update(jobs_params)
			redirect_to @job
		else
			render "Edit"
        end
    end

    def destroy 
        @job.destroy
        redirect_to root_path
    end

    private 

    def jobs_params
        params.require(:job).premit(:title, :description, :company, :url)
    end

    def find_jobs
        @job = Job.findparams([:id])
    end
end
