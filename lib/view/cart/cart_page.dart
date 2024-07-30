import 'package:ecommerce_application_api/modal/api_modal.dart';
import 'package:ecommerce_application_api/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {
        //   Navigator.of(context).pop();
        // },icon: Icon(Icons.arrow_back,size: 30,),),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
            ),
            ...List.generate(
              homeProviderTrue.cartDataStore.length,
              (index) => Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Card(
                      color: Colors.blue.shade50,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/image/loading_image.gif',
                        placeholderScale: 10,
                        image: homeProviderTrue.cartDataStore[index]['image'],
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Column(
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          homeProviderTrue.cartDataStore[index]['title'],textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${homeProviderTrue.cartDataStore[index]['price']}/Quantity :${homeProviderTrue.cartDataStore[index]['quantity']}",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Card(
                    child: IconButton(onPressed: () {
                    homeProviderFalse.addAndRemove(0,index);
                    }, icon: Icon(Icons.add)),
                  ),Card(
                    child: IconButton(onPressed: () {
                    homeProviderFalse.addAndRemove(10,index);
                    }, icon: Icon(Icons.delete_outline)),
                  ),Card(
                    child: IconButton(onPressed: () {
                    homeProviderFalse.addAndRemove(1,index);
                    }, icon: Icon(Icons.remove)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.blue.shade100,
        child: Center(child: Text("Total Bill Pay : "+homeProviderTrue.total.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
        ),)),
      ),
    );
  }
}
