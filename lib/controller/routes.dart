import 'package:flutter/material.dart';

import '../view/cart/cart_page.dart';
import '../view/details/detail_page.dart';
import '../view/home/home_page.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes={
    "/":(context)=>const HomePage(),
    "/detail":(context)=>const DetailPage(),
    "/cart":(context)=>const CartPage(),
  };
}