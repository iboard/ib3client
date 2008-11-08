class AdministratorsController < ApplicationController
  
  layout 'application'
  
  before_filter :authenticate
  
  # GET /administrators
  # GET /administrators.xml
  def index
    @administrators = Administrator.find(
      :all,:include => :user, :include => :children, :order => :parent_id,
      :conditions => ['parent_id = ? or parent_id = 0', nil] )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @administrators }
    end
  end
  

  # GET /administrators/1
  # GET /administrators/1.xml
  def show
    @administrator = Administrator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @administrator }
    end
  end

  # GET /administrators/1/servers
  # GET /administrators/1/servers.xml
  def servers
    @administrator = Administrator.find(params[:id])
    @servers = @administrator.servers
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @servers }
    end
  end
  
  # GET /administrators/1/accounts
  # GET /administrators/1/accounts.xml
  def accounts
    @administrator = Administrator.find(params[:id])
    @accounts = @administrator.accounts
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @accounts }
    end
  end  

  # GET /administrators/new
  # GET /administrators/new.xml
  def new
    @administrator = Administrator.new
    @administrator.parent = Administrator.find(params[:parent_id]) unless not params[:parent_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @administrator }
    end
  end

  # GET /administrators/1/edit
  def edit
    @administrator = Administrator.find(params[:id])
  end

  # POST /administrators
  # POST /administrators.xml
  def create
    @administrator = Administrator.new(params[:administrator])

    respond_to do |format|
      if @administrator.save
        flash[:notice] = 'Administrator was successfully created.'
        format.html { redirect_to(@administrator) }
        format.xml  { render :xml => @administrator, :status => :created, :location => @administrator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @administrator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /administrators/1
  # PUT /administrators/1.xml
  def update
    @administrator = Administrator.find(params[:id])

    respond_to do |format|
      if @administrator.update_attributes(params[:administrator])
        flash[:notice] = 'Administrator was successfully updated.'
        format.html { redirect_to(@administrator) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @administrator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.xml
  def destroy
    @administrator = Administrator.find(params[:id])
    @administrator.destroy

    respond_to do |format|
      format.html { redirect_to(administrators_url) }
      format.xml  { head :ok }
    end
  end
end
