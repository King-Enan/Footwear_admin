import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_management_project/Widgets/dropdown.dart';
import 'package:shop_management_project/controller/home_controller.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(

        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add Product',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigoAccent,
                  ),
                ),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text('Product Name'),
                    hintText: 'Enter Your Product Name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productDescription,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text('Product Description '),
                    hintText: 'Enter Your Product Description',
                  ),
                  maxLines: 4,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text('Image URL'),
                    hintText: 'Enter Your Image URl',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text('Product Price'),
                    hintText: 'Enter Your Product Price',
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                        child: dropdown(
                          items: ['sandle', 'boots', 'shoe' 'Sneakers'],
                          selectditem:  ctrl.category,
                          onselected: (selectedValue) {
                            ctrl.category = selectedValue ?? 'general';
                            ctrl.update();
                          },
                        )),
                    Flexible(
                        child: dropdown(
                          items: ['Puma', 'Adidas', 'Nike','Bata','Lotto'],
                          selectditem: ctrl.brand,
                          onselected: (selectedValue) {
                            ctrl.brand = selectedValue ?? 'Nonbranded';
                            ctrl.update();
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                Text('Offer Product?'),
                dropdown(
                  items: ['True', 'False'],
                  selectditem: ctrl.offer.toString(),
                  onselected: (selectedValue) {
                    ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                    ctrl.update();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  foregroundColor: Colors.white,
                ), onPressed: () {
                  ctrl.addProduct();
                }, child: Text('Add Product'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
