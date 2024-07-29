
import 'package:provider/provider.dart';

class ApiModal{
  late int total,skip,limit;
  late List<Products> products;
  ApiModal({required this.total,required this.skip,required this.limit,required this.products});
  factory ApiModal.fromJson(Map m1)
  {
    return ApiModal(total: m1['total'], skip: m1['skip'], limit: m1['limit'], products: (m1['products'] as List).map((e) => Products.fromJson(e),).toList());
  }
}

class Products
{
  late int id,stock,weight,minimumOrderQuantity;
  late String title,description,category,sku,warrantyInformation,shippingInformation,availabilityStatus,returnPolicy,thumbnail;
  String? brand;
  late List tags,images;
  late dynamic price,discountPercentage,rating;
  late Meta meta;
  late List<Reviews> reviews;

  Products(
      {required this.id,
      required this.stock,
      required this.weight,
      required this.title,
      required this.description,
      required this.category,
      this.brand,
      required this.sku,
      required this.warrantyInformation,
      required this.shippingInformation,
      required this.availabilityStatus,
      required this.returnPolicy,
      required this.minimumOrderQuantity,
      required this.images,
      required this.thumbnail,
      required this.tags,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      required this.meta,
      required this.reviews});
  factory Products.fromJson(Map m1)
  {
    return Products(id: m1['id'], stock: m1['stock'], weight: m1['weight'], title: m1['title'], description: m1['description'], category: m1['category'], sku: m1['sku'], warrantyInformation: m1['warrantyInformation'], shippingInformation: m1['shippingInformation'], availabilityStatus: m1['availabilityStatus'], returnPolicy: m1['returnPolicy'], minimumOrderQuantity: m1['minimumOrderQuantity'], images: m1['images'], thumbnail: m1['thumbnail'], tags: m1['tags'], price: m1['price'], discountPercentage: m1['discountPercentage'], rating: m1['rating'], meta: Meta.fromJson(m1['meta']), reviews: (m1['reviews'] as List).map((e) => Reviews.fromJson(e),).toList());
  }
}

class Meta
{
  late String createdAt,updatedAt,barcode,qrCode;

  Meta({required this.createdAt,required this.updatedAt,required this.barcode,required this.qrCode});
  factory Meta.fromJson(Map m1)
  {
    return Meta(createdAt: m1['createdAt'], updatedAt: m1['updatedAt'], barcode: m1['barcode'], qrCode: m1['qrCode']);
  }
}

class Reviews
{
  late dynamic rating;
  late String comment,date,reviewerName,reviewerEmail;

  Reviews(
      {required this.rating,
        required this.comment,
        required this.date,
        required this.reviewerName,
        required this.reviewerEmail
      });
  factory Reviews.fromJson(Map m1)
  {
    return Reviews(rating: m1['rating'], comment: m1['comment'], date: m1['date'], reviewerName: m1['reviewerName'], reviewerEmail: m1['reviewerEmail']);
  }
}