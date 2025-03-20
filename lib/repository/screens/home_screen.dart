import 'package:demo/domain/constants/elevatedbuttons.dart';
import 'package:demo/repository/screens/filter_icon_screen.dart';
import 'package:demo/repository/screens/hotels_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController budgetController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController seaterController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  Color button1color = Colors.blue;
  Color button2color = Colors.white;

  String location = "";

  int _selectedIndex = 0;
  var selectedOption = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectBudget(String budget) {
    setState(() {
      budgetController.text = budget;
    });
  }

  void _selectGender(String gender) {
    setState(() {
      genderController.text = gender;
    });
  }

  void _selectBed(String persons) {
    setState(() {
      seaterController.text = persons;
    });
  }

  void _changeColor(int number) {
    setState(() {
      if (number == 1) {
        button1color = Colors.blue;
        button2color = Colors.white;
      } else {
        button1color = Colors.white;
        button2color = Colors.blue;
      }
    });
  }

  getCurrentLocation(context) async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Location permission denied')));
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enable location from settings')),
        );
      }
      return;
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );
      setState(() {
        location =
            'Latitude: ${currentPosition.latitude}, Longitude: ${currentPosition.longitude}';
        locationController.text = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text("Find PG"),
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(padding: EdgeInsets.only(right: 10), child: FilterIcon()),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () => _changeColor(1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button1color,
                        minimumSize: Size(180, 50),
                      ),
                      child: Text(
                        "Rooms",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () => _changeColor(2),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button2color,
                        minimumSize: Size(180, 50),
                      ),
                      child: Text(
                        "PG",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () async {
                  await getCurrentLocation(context);
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: "Enter your current location",
                      prefixIcon: Icon(Icons.location_pin),
                    ),
                  ),
                ),
              ),
            ),
     
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: budgetController,
                decoration: InputDecoration(
                  hintText: "Enter your budget",
                  prefixIcon: Icon(Icons.money_off),
                  suffixIcon: PopupMenuButton<String>(
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    onSelected: _selectBudget,
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            value: "Rs 200 - Rs 500",
                            child: Text("Rs 200 - Rs 500"),
                          ),
                          PopupMenuItem(
                            value: "Rs 600 - Rs 1000",
                            child: Text("Rs 600 - Rs 1000"),
                          ),
                          PopupMenuItem(
                            value: "Rs 1100 - Rs 1500",
                            child: Text("Rs 1100 - Rs 1500"),
                          ),
                          PopupMenuItem(
                            value: "Rs 1600 - Rs 2000",
                            child: Text("Rs 1600 - Rs 2000"),
                          ),
                          PopupMenuItem(
                            value: "Above Rs 2000",
                            child: Text("Above Rs 2000"),
                          ),
                        ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: genderController,
                decoration: InputDecoration(
                  hintText: "Enter your Gender",
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: PopupMenuButton<String>(
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    onSelected: _selectGender,
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(value: "Male", child: Text("Male")),
                          PopupMenuItem(value: "Female", child: Text("Female")),
                          PopupMenuItem(value: "Others", child: Text("Others")),
                        ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: seaterController,
                decoration: InputDecoration(
                  hintText: "Enter No. of Persons",
                  prefixIcon: Icon(Icons.bed_outlined),
                  suffixIcon: PopupMenuButton<String>(
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    onSelected: _selectBed,
                    itemBuilder:
                        (context) => [
                          PopupMenuItem(
                            value: "Single Seater",
                            child: Text("Single Seater"),
                          ),
                          PopupMenuItem(
                            value: "Double Seater",
                            child: Text("Double Seater"),
                          ),
                          PopupMenuItem(
                            value: "Triple Seater",
                            child: Text("Triple Seater"),
                          ),
                        ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<int>(
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                Text("Fan"),
                SizedBox(width: 70),
                Radio<int>(
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                Text("Air Conditioned"),
              ],
            ),
          
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomEvatedButton(label: "Search", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HotelsScreen()));
              }),
            ),
            // Rooms section
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15, top: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Rooms", style: TextStyle(fontSize: 15)),
                      ),
                      TextButton(onPressed: () {}, child: Text("View All")),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset("assets/images/Rectangle 3.png"),
                        SizedBox(width: 10),
                        Image.asset("assets/images/Rectangle 3.1.png"),
                        SizedBox(width: 10),
                        Image.asset("assets/images/Rectangle 3.2.png"),
                        SizedBox(width: 10),
                        Image.asset("assets/images/Rectangle 3.png"),
                        SizedBox(width: 10),
                        Image.asset("assets/images/Rectangle 3.2.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15, right: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Hotels", style: TextStyle(fontSize: 15)),
                      ),
                      TextButton(onPressed: () {}, child: Text("View All")),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset("assets/images/Hotel1.png"),
                        SizedBox(width: 10),
                        Image.asset("assets/images/Hotel2.png"),
                        SizedBox(width: 10),
                        Image.asset("assets/images/Hotel3.png"),
                        SizedBox(width: 10),
                        Image.asset("assets/images/Hotel1.png"),
                        SizedBox(width: 10),
                        Image.asset("assets/images/Hotel3.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3F5EFB), Color(0xFFFC466B)],
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color.fromARGB(255, 135, 194, 67),
          unselectedItemColor: Colors.white60,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.room_service_outlined),
              label: "Rooms",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_crash_outlined),
              label: "Car Booking",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental_outlined),
              label: "Car Washing",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "My Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
