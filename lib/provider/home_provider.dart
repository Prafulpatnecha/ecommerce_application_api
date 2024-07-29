import 'package:ecommerce_application_api/controller/api_helper.dart';
import 'package:ecommerce_application_api/modal/api_modal.dart';
import 'package:flutter/material.dart';
class HomeProvider extends ChangeNotifier
{
  ApiHelper apiHelper=ApiHelper();
  late ApiModal apiModal;
  Future<ApiModal> comeApi()
  async {
    final list=await apiHelper.apiCalling();
    apiModal=ApiModal.fromJson(list);
    notifyListeners();
    return apiModal;
  }
  HomeProvider()
  {
    comeApi();
  }
}