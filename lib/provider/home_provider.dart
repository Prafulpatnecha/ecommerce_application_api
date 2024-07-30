
import 'package:ecommerce_application_api/controller/api_helper.dart';
import 'package:ecommerce_application_api/modal/api_modal.dart';
import 'package:flutter/material.dart';
class HomeProvider extends ChangeNotifier
{
  double total=0.0;
  ApiHelper apiHelper=ApiHelper();
  late ApiModal apiModal;
  List cartDataStore=[];
  Future<ApiModal> comeApi()
  async {
    final list=await apiHelper.apiCalling();
    apiModal=ApiModal.fromJson(list);
    notifyListeners();
    return apiModal;
  }
  int selectIndex=0;
  void selectProduct(int index)
  {
    selectIndex=index;
    notifyListeners();
  }
  // bool cartCheck()
  // {
  //   bool check=false;
  //       for(int i=0; i<cartDataStore.length;i++)
  //         {
  //           if(cartDataStore[i]!=selectIndex)
  //             {
  //               check=true;
  //             }
  //         }
  //   notifyListeners();
  //       return check;
  // }
  // void cartAddingMethod(int index)
  // {
  //   cartDataStore.add(index);
  //   print(cartDataStore.length);
  //   notifyListeners();
  // }
  bool cartCheck(int index)
  {
    bool check=false;
        for(int i=0; i<cartDataStore.length;i++)
          {
                if(cartDataStore[i]['index']==index)
                  {
                    check=true;
                  }
                else{
                  print('never');
                }
          }
    notifyListeners();
        return check;
  }
  void cartAddingMethod({required int id,required String title,required String image,required dynamic price,required int index,required int quantity})
  {
    cartDataStore.add({'id': id,'title': title,'price': price,'index':index,'image':image,'quantity':quantity});
    totalMethod();
    notifyListeners();
  }
  void totalMethod()
  {
    total=0;
    double addingTotal=0;
    double totalAdding=0;
    for(int i=0; i< cartDataStore.length;i++)
    {
      addingTotal=cartDataStore[i]['price']*cartDataStore[i]['quantity'];
      totalAdding=totalAdding+addingTotal;
    }
    total=totalAdding;
    print(total);
    notifyListeners();
  }
  void addAndRemove(int boolValue,int index)
  {
    if(boolValue==0)
      {
        cartDataStore[index]['quantity']++;
        totalMethod();
      }
    else if(boolValue==10)
      {
        cartDataStore.removeAt(index);
        totalMethod();
      }
    else if(boolValue==1){
      if(cartDataStore[index]['quantity']>1)
        {
          cartDataStore[index]['quantity']--;
          totalMethod();
        }
    }
    notifyListeners();
  }
  HomeProvider()
  {
    comeApi();
  }
}
// 3155.95