import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application_api/modal/api_modal.dart';
import 'package:ecommerce_application_api/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false).comeApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ApiModal? apiModal = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 6/7,),
              itemCount: apiModal!.products.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            // image: DecorationImage(
                            //   image: NetworkImage(apiModal.products[index].images[0])
                            // ),
                          ),
                          child: CarouselSlider.builder(itemCount: apiModal.products[index].images.length, itemBuilder: (context, indexs, realIndex) => FadeInImage.assetNetwork(placeholder: 'assets/image/loading_image.gif',placeholderScale: 30, image: apiModal.products[index].images[indexs]), options: CarouselOptions(viewportFraction: 0.99,autoPlay: (apiModal.products[index].images.length>1)?true:false),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(height: 50,width: 160,child: Text(apiModal.products[index].title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text("\$"+apiModal.products[index].price.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),),
                          ),
                          Spacer(),
                          const Icon(Icons.favorite_border,size: 20,),
                          const SizedBox(width: 10,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.error != null) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue.shade300,
              ),
            );
          }
        },
      ),
    );
  }
}
