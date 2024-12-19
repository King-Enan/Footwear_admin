

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_management_project/model/product/product.dart';
class HomeController extends GetxController{

   FirebaseFirestore firestore= FirebaseFirestore.instance;
   late CollectionReference productcollection;

   TextEditingController productNameCtrl = TextEditingController();

   TextEditingController productDescription = TextEditingController();
   TextEditingController productImgCtrl = TextEditingController();
   TextEditingController productPriceCtrl = TextEditingController();

   String category = 'general';
   String brand = 'un branded';
   bool  offer = false;
  //list is created for fetching the product datas from databse to show on admin panel.
   List<Product> products = [];
   @override
  Future<void> onInit() async {
    productcollection = firestore.collection('products');
    await fetchProducts();

    // TODO: implement onInit
    super.onInit();
  }

  addProduct(){
    try {
      DocumentReference doc = productcollection.doc();
      Product product = Product(
            id: doc.id,
            name: productNameCtrl.text,
            category:category,
            description:productDescription.text ,
            price: double.tryParse(productPriceCtrl.text),
            brand: brand,
            image: productImgCtrl.text,
            offer: offer,

          );
      final productJson= product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product added successfully',colorText: Colors.indigoAccent);
      setValueDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(),colorText: Colors.greenAccent);
      print(e);
    }
}
  deleteProduct(String id) async {
    try {
      await productcollection.doc(id).delete();
      fetchProducts();
    } catch (e) {
      Get.snackbar('Error', e.toString(),colorText: Colors.red);
      print(e);
    }
   }
  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productcollection.get();
      final List<Product> retrieveProducts = productSnapshot.docs.map((doc)=>Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrieveProducts);
      Get.snackbar('Success', 'Product fetched successfully',colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(),colorText: Colors.red);
      print(e);
    } finally{
      update();
    }
   }
 setValueDefault(){
     productNameCtrl.clear();
     productPriceCtrl.clear();
     productImgCtrl.clear();
     productDescription.clear();
      category = 'general';
      brand = 'un branded';
      offer = false;
     update();
 }

 }