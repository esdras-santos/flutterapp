import 'package:mobx/mobx.dart';

part 'phone_store.g.dart';

class PhoneStore = _PhoneStore with _$PhoneStore;

abstract class _PhoneStore with Store{

  @observable
  bool buttonEnabled = false;

  @action  
  void changePhone(value){
    print(value);

    buttonEnabled = Validator.phone(value);
  }
  
}


//Esse validador foi feito pelo autor do
//app e segue as recomendações da UIT, 
//futuramente pode precisar de manutenção
class Validator{
  static bool phone(String value){
    bool _validDDD = false;
    if(value.length >= 2){
      List<String> dddS = [];
      int ddd;
      int start = 0;
      int end = 2;
      if(value[0] == '0'){
        start = 1;
        end = 3;
      }
      for(int i=start;i<end;i++){
        dddS.add(value[i]);
      }
      ddd = int.parse(dddS.join());
      if(ddd >= 11 && ddd <= 99){
        _validDDD = true;
      }
      if(_validDDD == true && ((value.length - end) == 9 ||  (value.length - end) == 8)){
        return true;
      }
      else{
        return false;
      }
    }
    else{
      return false;
    }  
  }
}
