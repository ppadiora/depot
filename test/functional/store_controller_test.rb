require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    # este test comprueba que la página index se encuentra y nos da una respuesta positiva :success.
    # ahora añadimos nuevo; que además la respuesta nos confirme que existe una plantilla, 
    # la info de los productos y un precio.
    assert_select '#columns #side a' , :minimum => 4 # menú de la izquierda debe tener 4 = home, questions, news, contact
	assert_select '#main .entry', 4 # numero de productos en la lista
	assert_select 'h3' , 'Programming Ruby 1.9'
		# assert_select '.price' , /\$[,\d]+\.\d\d/ -> 
    # quito el simbolo del dollar para que no me de problemas en el index de store/index.html 
    # en la parte number_to_currency :unit => "€" 
    assert_select '.price' , /[,\d]+\.\d\d/
  end

end
