import 'package:flutter/material.dart';

import '../../utility/chip.dart';

class TailorDetails extends StatelessWidget {
  const TailorDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            //--------------------------------------------image--------------------------------------//
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 350,
                child: Image.network(
                  "https://i.pinimg.com/originals/9e/63/57/9e6357714801b7904279f5f5e684e1cf.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //--------------------------------------------image end--------------------------------------//

            //--------------------------------------------name to --------------------------------------//

            Padding(
              padding: const EdgeInsets.only(top: 230),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //------------------------profile pic----------------------------//
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Bombay Style\nTailors",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                "Hulaktole-7,Dhankuta",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined))
                      ],
                    ),
                  ),
                  //------------------------ Rating  and reviews----------------------------//
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffffa41c),
                                    size: 25,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffffa41c),
                                    size: 25,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    size: 25,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    size: 25,
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.ac_unit,
                                    color: Colors.black87,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Rate this Tailor",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "35.4K",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                "Reviews",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //------------------------ elevated botton  and description----------------------------//
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/dashboard");
                                },
                                child: const Text('Order Now'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ListTile(
                        title: Text(
                          "Description",
                        ),
                        subtitle: Text(
                            "Our Services: All Your Tailoring Needs. From complete alterations to the final touches: Your garments are in the best hands at Peters Tailor Shop.Alteration By Fay is a Tailor Shop where we do Dry Cleaning, Embroidery Services and also many other best services are available here at."),
                      ),
                    ],
                  ),
                  //------------------------ elevated botton  and description ends---------------------------//

                  //------------------------ Chip---------------------------//
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CustomChip(
                        title: "Free Delivery",
                        icon: Icons.directions_bike,
                      ),
                      CustomChip(
                        title: "Emergency Stitch",
                        icon: Icons.fast_forward,
                      ),
                    ],
                  ),
                  //------------------------ Chip---------------------------//

                  const Divider(),
                  ListTile(
                    trailing: Text(
                      "Services",
                      style: TextStyle(color: Colors.green),
                    ),
                    title: Text(
                      "Stitch Rates",
                      // textScaleFactor: 1.3,
                    ),
                    subtitle: Text("Find suitable cost for stitch"),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  ListTile(
                                    trailing: Image.network(
                                      "https://images.tailorstore.com/YToyOntzOjU6IndpZHRoIjtzOjQ6IjEwMDAiO3M6NjoiaGVpZ2h0IjtzOjA6IiI7fQ%3D%3D/images/cms/tailor-store-major-mobile-lines-2021.jpg",
                                    ),
                                    // leading: Icon(Icons.ac_unit_rounded),
                                    title: Text("Shirt"),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Special services in stay home"),
                                        Text(
                                          "\$200",
                                          textScaleFactor: 1.4,
                                        ),
                                        Row(
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    side: BorderSide(
                                                        color: Colors.green),
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: Color(0xffffa41c),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: Color(0xffffa41c),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: Color(0xffffa41c),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: Colors.black12,
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: Colors.black12,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            MaterialButton(
                                              textColor: Colors.green,
                                              onPressed: () {},
                                              child: Text("Order Now"),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
