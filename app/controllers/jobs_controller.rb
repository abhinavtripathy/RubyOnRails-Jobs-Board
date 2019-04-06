class JobsController < ApplicationController
    def index
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
    end

    def destroy 
    end

    private 

    def jobs_params
        params.require(:job).premit(:title, :description, :company, :url)
    end

    def find_jobs
        @job = Job.findparams([:id])
    end
end
