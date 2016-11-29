class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy, :audit]


  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.where(user: current_user)
    if @accounts.count == 0
      redirect_to new_account_url
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @total_accounts = Account.where(user: current_user).count
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user = current_user

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def audit
    @instances = {}
    @reserved_instances = {}
    @audited_reserved_instances = {}
    Settings.regions.each do |region|
      @instances[region] = Rails.cache.fetch("/#{@account.id}/instances/#{region}", expires_in: 60.minutes){
        @account.get_instances(region)
      }.sort.to_h
      @reserved_instances[region] = Rails.cache.fetch("/#{@account.id}/reserved_instances/#{region}", expires_in: 60.minutes){
        @account.get_reserved_instances(region)
      }.sort.to_h
      @audited_reserved_instances[region] = @account.audit(@instances[region], @reserved_instances[region])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :access_key_id, :secret_access_key)
    end
end
