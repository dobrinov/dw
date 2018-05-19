class JobsController < ApplicationController
  def index
    @jobs = Job.active.order(approved_at: :desc)
  end

  def show
    @job = Job.find params[:id]
  end

  def new
    @job =
      if params[:job].present?
        Job.new job_params
      else
        Job.new
      end
  end

  def create
    @job = Job.new job_params.merge(sent_for_review_at: Time.current)

    if @job.save
      redirect_to jobs_path, notice: "Your job post has been sent to approval. You will be notified at #{@job.company_contact_email} when it is approved."
    else
      render :new
    end
  end

  def preview
    @job = Job.new job_params

    if @job.valid?
      render :preview
    else
      render :new
    end
  end

  private

  def job_params
    job_params =
      params.require(:job).permit :title,
                                  :reward_amount,
                                  :reward_currency,
                                  :reward_rules,
                                  :required_skills,
                                  :remote_allowed,
                                  :remote_timezone,
                                  :remote_timezone_offset,
                                  :office_location,
                                  :details,
                                  :call_to_action_url,
                                  :call_to_action_email,
                                  :company_name,
                                  :company_website,
                                  :company_contact_email

    job_params[:required_skills] = job_params[:required_skills].split(',').map(&:strip)

    job_params
  end
end
