import 'package:flutter/material.dart';

class FilterIcon extends StatefulWidget {
  const FilterIcon({super.key});
  @override
  FilterIconState createState() => FilterIconState();
}

class FilterIconState extends State<FilterIcon> {
  Map<String, bool> filterOptions = {
    'Air conditioned rooms': false,
    'Price - Low to high': false,
    'Price - High to low': false,
    'Review & Rating': false,
    'Distance from down town': false,
    'Fun things to do': false,
    'Reservation Policy': false,
    'Meals Transport': false,
    'Facilities': false,
    'Room Accessibility': false,
  };

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      onSelected: (String value) {
        setState(() {
          filterOptions[value] = !filterOptions[value]!;
        });
      },
      color: Colors.white,
      itemBuilder: (BuildContext context) {
        return [
          ...filterOptions.keys.map((String option) {
            return PopupMenuItem<String>(
              value: option,
              child: SizedBox(
                width: 300,
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      option,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        color:
                            filterOptions[option]! ? Colors.black : Colors.grey,
                      ),
                    ),
                    if (filterOptions[option]!)
                      Icon(Icons.check, color: Colors.green, size: 40),
                  ],
                ),
              ),
            );
          }),
          PopupMenuItem<String>(
            enabled: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Close',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 4,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Apply',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      icon: Icon(Icons.filter_list_alt),
      padding: EdgeInsets.zero,
      onCanceled: () {},
      tooltip: 'Filter options',
    );
  }
}
