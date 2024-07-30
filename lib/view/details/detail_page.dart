import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/api_modal.dart';
import '../../provider/home_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false).comeApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ApiModal? apiModal = snapshot.data;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 30),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(30),
                            // image: DecorationImage(
                            //     image: NetworkImage(apiModal!.),
                            //     fit: BoxFit.cover)),
                          ),
                          child: CarouselSlider.builder(
                            itemCount: apiModal!
                                .products[homeProviderTrue.selectIndex]
                                .images
                                .length,
                            itemBuilder: (context, indexs, realIndex) =>
                                FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/image/loading_image.gif',
                                    placeholderScale: 2,
                                    image: apiModal
                                        .products[homeProviderTrue.selectIndex]
                                        .images[indexs]),
                            options: CarouselOptions(
                                viewportFraction: 0.99,
                                autoPlay: (apiModal
                                            .products[
                                                homeProviderTrue.selectIndex]
                                            .images
                                            .length >
                                        1)
                                    ? true
                                    : false),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 27),
                        child: Text(
                          apiModal.products[homeProviderTrue.selectIndex].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 27),
                        child: Text(
                          "\$${apiModal.products[homeProviderTrue.selectIndex].price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Row(
                          children: [
                            RatingBar(
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              onRatingChanged: (value) =>
                                  debugPrint(value.toString()),
                              initialRating: apiModal
                                  .products[homeProviderTrue.selectIndex]
                                  .rating,
                              maxRating: 5,
                            ),
                            Text(
                              "  ${apiModal.products[homeProviderTrue.selectIndex].rating}",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Product Available : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "${apiModal.products[homeProviderTrue.selectIndex].minimumOrderQuantity} ${apiModal.products[homeProviderTrue.selectIndex].availabilityStatus}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Warranty",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          apiModal.products[homeProviderTrue.selectIndex]
                              .warrantyInformation,
                          style: TextStyle(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 27),
                        child: Text(
                          apiModal.products[homeProviderTrue.selectIndex]
                              .description,
                          style: const TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all(
                            Size(200, 60),
                          ),
                          backgroundColor:
                              WidgetStateProperty.all(Colors.blue.shade100)),
                      onPressed: () {
                        if (!homeProviderFalse
                                .cartCheck(homeProviderTrue.selectIndex) ||
                            homeProviderTrue.cartDataStore.isEmpty) {
                          print('objectobjectobjectobject');
                          homeProviderFalse.cartAddingMethod(
                              title: apiModal
                                  .products[homeProviderTrue.selectIndex].title,
                              price: apiModal
                                  .products[homeProviderTrue.selectIndex].price,
                              id: apiModal
                                  .products[homeProviderTrue.selectIndex].id,
                              index: homeProviderTrue.selectIndex,
                              image: apiModal
                                  .products[homeProviderTrue.selectIndex]
                                  .images[0],
                              quantity: 1, minimumOrderQuantity: apiModal
                              .products[homeProviderTrue.selectIndex]
                              .minimumOrderQuantity);
                        }
                        Navigator.of(context).pushNamed('/cart');
                      },
                      child: const Text(
                        'Add To Cart',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
        },
      ),
    );
  }
}
