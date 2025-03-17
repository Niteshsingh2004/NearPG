import 'package:flutter/material.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});
  @override
  HotelsScreenState createState() => HotelsScreenState();
}

class HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hotels',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Abidjan 200 hotels",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.location_pin,
                color: Colors.blueAccent,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(2),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 10),
                child: Row(
                  children: [
                    Text("Amenities", style: TextStyle(fontSize: 15)),
                    Icon(Icons.arrow_drop_down),
                    SizedBox(width: 58),
                    Text("Filter By", style: TextStyle(fontSize: 15)),
                    Icon(Icons.arrow_drop_down),
                    SizedBox(width: 55),
                    Text("Sort By", style: TextStyle(fontSize: 15)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.blueAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, top: 8),
                child: Row(
                  children: [
                    Image.asset("assets/images/Hotel1.png"),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Heden golf",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Text("3.9"),
                              SizedBox(width: 20),
                              Text("Reviews(200)"),
                            ],
                          ),
                          Text("Set in landscapedmgardens overlooking ..."),
                          Row(
                            children: [
                              Text(
                                "25% off",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${"\$"}127",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  children: [
                    Image.asset("assets/images/Hotel2.png"),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Onomo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Text("4.3"),
                              SizedBox(width: 20),
                              Text("Reviews(150)"),
                            ],
                          ),
                          Text("The ONOMO HOtels chain established ..."),
                          Row(
                            children: [
                              Text(
                                "25% off",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${"\$"}120",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  children: [
                    Image.asset("assets/images/Hotel3.png"),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Adagio",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Text("3.9"),
                              SizedBox(width: 20),
                              Text("Reviews(200)"),
                            ],
                          ),
                          Text("Adagio City Aparthotels is a joit venture ..."),
                          Row(
                            children: [
                              Text(
                                "15% off",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${"\$"}100",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  children: [
                    Image.asset("assets/images/Hotel1.png"),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sofitel",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Text("4.5"),
                              SizedBox(width: 20),
                              Text("Reviews(20)"),
                            ],
                          ),
                          Text("This understated hotel is 5 km from both ..."),
                          Row(
                            children: [
                              Text(
                                "25% off",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${"\$"}127",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  children: [
                    Image.asset("assets/images/Hotel2.png"),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Onomo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Text("4.3"),
                              SizedBox(width: 20),
                              Text("Reviews(150)"),
                            ],
                          ),
                          Text("The ONOMO HOtels chain established ..."),
                          Row(
                            children: [
                              Text(
                                "25% off",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${"\$"}120",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  children: [
                    Image.asset("assets/images/Hotel3.png"),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Adagio",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Text("3.9"),
                              SizedBox(width: 20),
                              Text("Reviews(200)"),
                            ],
                          ),
                          Text("Adagio City Aparthotels is a joit venture ..."),
                          Row(
                            children: [
                              Text(
                                "15% off",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "${"\$"}100",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.greenAccent],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
