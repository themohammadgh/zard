class SubjectsController < ApplicationController


  layout 'admin'
  def index
    @subjects = Subject.all.order(:position => "ASC")
    #@page_title = "All Areas" 
  end
    def show
      @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name => "Default")
    @subject_count = Subject.count + 1
  end
  def create
    @subject = Subject.new(subject_params)
    if @subject.save 
      flash[:notice] = "subject created successfully!"
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params) 
      flash[:notice] = "subject updated successfully!"
      redirect_to(subjects_path(@subject))
    else
      @subject_count = Subject.count + 1
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "subject '#{@subject.name}' deleted successfully!"
    redirect_to(subjects_path)
  end


  private 
  def subject_params
  params.require(:subject).permit(:name, :position, :visible)
  end
end
