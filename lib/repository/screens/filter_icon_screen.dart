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
    'Fun thimgs to do': false,
    'Reservation Policy': false,
    'Meals Transport': false,
    'Facilities': false,
    'Room Accessibility': false,
  };

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          filterOptions[value] = !filterOptions[value]!;
        });
      },
      itemBuilder: (BuildContext context) {
        return filterOptions.keys.map((String option) {
          return PopupMenuItem<String>(
            value: option,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(option),
                if (filterOptions[option]!)
                  Icon(Icons.check, color: Colors.blue),
              ],
            ),
          );
        }).toList();
      },
      icon: Icon(Icons.filter_list_alt),
    );
  }
}
