class MembersController < ApplicationController
  def index
    @members = Member.all
  end
  
  def create
    @member = Member.new(member_params)
    @member.save
	
	@members = Member.all
    redirect_to "/members/"
  end
  
  def edit
    @member = Member.find(params[:id])
	@id = params[:id]
	respond_to do |format|
      format.js
    end
  end 
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to "/members/"
    else
      render 'edit'
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to "/members/"
  end
  
  
 private
    def member_params
      params.require(:member).permit(:name, :serial_no)
    end
end
