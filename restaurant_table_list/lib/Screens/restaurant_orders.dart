import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'restaurant_orders',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table View Example'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildTable([
            ['TABLE 1', 'Seats : 3', 'Exec A'],
            ['Sachin', '100246', '00 : 45'],
            ['', '', ''],
            ['', '', ''],
            ['', '', ''],
          ]), // 1st and 2nd rows as a table with three columns
          buildTableWithIcon([
            ['In Progress', 'Served'],
            [
              'Spl Chick Biryani\nVeg Raita', // Added Veg Raita and removed others
              'Starter A x2\nSoup chicken x3\nMojito x1', // Added Starter A x2, Soup chicken x3, Mojito x1
            ],
          ]), // 3rd and 4th rows as a table with two columns
          buildTable3([
            ['2 items', '3 items'],
            ['', ''],
            ['', ''],
            ['', ''],
            ['', ''],
            ['Avg Table Rev ₹2,150', '₹1,280'],
          ]), // 1st to 3rd rows as a table with two columns
        ],
      ),
    );
  }

  Widget buildTable(List<List<String>> rows) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: rows.asMap().entries.map((entry) {
        int rowIndex = entry.key;
        List<String> row = entry.value;
        return TableRow(
          decoration: BoxDecoration(
            border: Border(
              top: rowIndex == 0 ? BorderSide() : BorderSide.none,
              bottom: (rowIndex != 2 && rowIndex != 3)
                  ? BorderSide()
                  : BorderSide.none,
              left: BorderSide(),
              right: BorderSide(),
            ),
          ),
          children: row.asMap().entries.map((cellEntry) {
            int cellIndex = cellEntry.key;
            String cell = cellEntry.value;
            return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border(
                  left: rowIndex > 0 && cellIndex > 0
                      ? BorderSide.none
                      : BorderSide(),
                  right: rowIndex > 0 && cellIndex < 2
                      ? BorderSide.none
                      : BorderSide(),
                ),
              ),
              child: Text(cell),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget buildTableWithIcon(List<List<String>> rows) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
      },
      border: TableBorder.all(), // Add border around the table
      children: rows.asMap().entries.map((entry) {
        int rowIndex = entry.key;
        List<String> row = entry.value;
        return TableRow(
          children: row.asMap().entries.map((cellEntry) {
            int cellIndex = cellEntry.key;
            String cell = cellEntry.value;
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: cellIndex == 0 && rowIndex == 1
                  ? Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(cell),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 12, // Size of the circle
                            backgroundColor: Colors.black,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Handle the add button press
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(cell),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget buildTable3(List<List<String>> rows) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1), // Adjusted for different widths
        1: FlexColumnWidth(1),
      },
      border: TableBorder(
        top: BorderSide(), // Add top border
        left: BorderSide(), // Add left border
        right: BorderSide(), // Add right border
        bottom: BorderSide(), // Add bottom border for all rows
        horizontalInside: BorderSide.none, // Remove horizontal inside borders
        verticalInside: BorderSide.none, // Remove vertical inside borders
      ),
      children: rows.asMap().entries.map((entry) {
        int rowIndex = entry.key;
        List<String> row = entry.value;
        return TableRow(
          decoration: BoxDecoration(
            border: rowIndex == 0 || rowIndex == rows.length - 1
                ? Border(
                    bottom:
                        BorderSide(), // Add bottom border for row 1 and row 6
                    top: rowIndex == rows.length - 1
                        ? BorderSide()
                        : BorderSide.none, // Add top border for row 6
                  )
                : null, // No bottom border for other rows
          ),
          children: row.asMap().entries.map((cellEntry) {
            int cellIndex = cellEntry.key;
            String cell = cellEntry.value;
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: rowIndex == rows.length - 1 && cellIndex < 2
                  ? Row(
                      children: [
                        Icon(Icons.currency_rupee, size: 16),
                        SizedBox(width: 4),
                        Text(cell),
                      ],
                    )
                  : Text(cell),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
