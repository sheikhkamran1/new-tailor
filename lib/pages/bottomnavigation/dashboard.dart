import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newtailor/pages/dashboarddetails/productdetails.dart';

import '../dashboarddetails/tailordetails.dart';

class DashboradScreen extends StatelessWidget {
  const DashboradScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(
                Icons.search_off_outlined,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 10),
            Badge(
                badgeColor: const Color(0xffc19a67),
                badgeContent: const Text(
                  "0",
                  style: TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.shopping_cart_outlined)),
            const SizedBox(width: 20),
          ],
          title: const Text(
            "Idris",
            style: TextStyle(color: Colors.brown),
          ),
        ),

        //--------------------appbar Ends---------------------//

        //--------------------body starts---------------------//
        body: Column(
          children: [
            //----------------------------Location-----------------------------------//

            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 169, 191, 1),
                    Colors.greenAccent,
                  ],
                ),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      horizontalTitleGap: -8,
                      leading: Icon(
                        Icons.place_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Deliver to ithari ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle:
                          Text("Nepal", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
            //----------------------------Location Ends-----------------------------------//

            const SizedBox(
              height: 2,
            ),

            //----------------------------Image-----------------------------------//
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 170,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "https://widethread.com/wp-content/uploads/2019/08/FB-Cover-min-1024x334.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff30404f),
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            //----------------------------Image ends-----------------------------------//

            //----------------------------Tailors Near you Text-----------------------------------//
            const ListTile(
              trailing: Text(
                "View All",
                style: TextStyle(color: Colors.green),
              ),
              title: Text(
                "Tailors Near You",
                textScaleFactor: 1.1,
              ),
            ),

            //----------------------------Tailors Near you Text Ends-----------------------------------//

            //----------------------------Tailors Near gridview-----------------------------------//
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(10, (index) {
                  return InkWell(
                    onTap: () {
                      Get.to(TailorDetails());
                    },
                    child: Card(
                      color: const Color(0xffF8F8F8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.network(
                              "https://i.pinimg.com/originals/9e/63/57/9e6357714801b7904279f5f5e684e1cf.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text("Bombay Style Showroom"),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Color(0xffffa41c),
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xffffa41c),
                                size: 15,
                              ),
                              Icon(
                                Icons.star_border,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            //----------------------------Tailors Near gridview-----------------------------------//

            //----------------------------Shop Materials-----------------------------------//
            const ListTile(
              trailing: Text(
                "View All",
                style: TextStyle(color: Colors.green),
              ),
              title: Text(
                "Shop Your Materials",
                textScaleFactor: 1.1,
              ),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(ProductDetailsPage());
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOYXtGacH4lWrNV8B8wruoGQE_kkSU5QrF2Q&usqp=CAU",
                                fit: BoxFit.cover,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Cherry",
                                textScaleFactor: 1.3,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pure Polyster raymond"),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffffa41c),
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffffa41c),
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "\$100",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
            //----------------------------Shop Materials Ends-----------------------------------//

            //----------------------------Shop Listview-----------------------------------//
          ],
        ),
        //--------------------body Ends---------------------//
      ),
    );
  }
}
