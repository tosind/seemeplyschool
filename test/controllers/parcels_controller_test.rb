require 'test_helper'

class ParcelsControllerTest < ActionController::TestCase
  setup do
    @parcel = parcels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parcels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parcel" do
    assert_difference('Parcel.count') do
      post :create, parcel: { address: @parcel.address, build_name: @parcel.build_name, city_id: @parcel.city_id, geometry: @parcel.geometry, zipcode: @parcel.zipcode }
    end

    assert_redirected_to parcel_path(assigns(:parcel))
  end

  test "should show parcel" do
    get :show, id: @parcel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parcel
    assert_response :success
  end

  test "should update parcel" do
    patch :update, id: @parcel, parcel: { address: @parcel.address, build_name: @parcel.build_name, city_id: @parcel.city_id, geometry: @parcel.geometry, zipcode: @parcel.zipcode }
    assert_redirected_to parcel_path(assigns(:parcel))
  end

  test "should destroy parcel" do
    assert_difference('Parcel.count', -1) do
      delete :destroy, id: @parcel
    end

    assert_redirected_to parcels_path
  end
end
