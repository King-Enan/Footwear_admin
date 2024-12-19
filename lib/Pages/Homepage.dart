import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:shop_management_project/Pages/add_product_page.dart';
import 'package:shop_management_project/controller/home_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(


        appBar: AppBar(
          title: Center(child: Text("Shop Admin")),
        ),
        body:
        ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.products[index].name ?? ' '),
                subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                trailing: IconButton(
                    onPressed: () {
                     ctrl.deleteProduct(ctrl.products[index].id ?? '');

                    }, icon: Icon(Icons.delete)),

              );
            }),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddProductPage());
          },
          child: Icon(Icons.add),
        ),


      );
    });
  }
}
