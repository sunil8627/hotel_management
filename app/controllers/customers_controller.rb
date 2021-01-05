class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :check_out]
  before_action :get_rooms, only:[:new, :edit, :create]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show

  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.check_in_at = Time.now

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_out
   @customer.update_attribute("check_out_at", Time.now)
   @customer.room.update_attribute("is_occupied", false)
   @customer.room = nil

   redirect_to customers_url, notice: 'Customer was successfully checked out from room.'
  end  

  def search
    @name = params["name"]
    @matching_customers = Customer.where("name like ?", "%#{@name}%") unless @name.blank?
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def get_rooms
      @available_rooms = Room.where(is_occupied: false)  
    end  

    def update_check_in_and_mark_room_occupied
      selected_room = Room.find params["customer"]["room_id"]
      selected_room.update_attribute("is_occupied", true)  
    end  

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :age, :ID_card_no, :room_id, :check_in_at, :check_out_at)
    end
end
