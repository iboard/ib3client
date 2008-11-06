require 'test_helper'

class AdministratorsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:administrators)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_administrator
    assert_difference('Administrator.count') do
      post :create, :administrator => { }
    end

    assert_redirected_to administrator_path(assigns(:administrator))
  end

  def test_should_show_administrator
    get :show, :id => administrators(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => administrators(:one).id
    assert_response :success
  end

  def test_should_update_administrator
    put :update, :id => administrators(:one).id, :administrator => { }
    assert_redirected_to administrator_path(assigns(:administrator))
  end

  def test_should_destroy_administrator
    assert_difference('Administrator.count', -1) do
      delete :destroy, :id => administrators(:one).id
    end

    assert_redirected_to administrators_path
  end
end
