import 'package:flutter/material.dart';
import 'package:travel_app/main.dart';
import '../customShapeClipper.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        HomeTopPart(),
        HomeBottomPart,
      ],
    ));
  }
}

class HomeTopPart extends StatefulWidget {
  @override
  _HomeTopPartState createState() => _HomeTopPartState();
}

class _HomeTopPartState extends State<HomeTopPart> {
  var selectLocationIndex = 0;
  var isFlightSection = false;
  var isHotelSection = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor, secondColor],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 16.0),
                      PopupMenuButton(
                        onSelected: (index) {
                          print(index);
                          setState(() {
                            selectLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locations[selectLocationIndex],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            Icon(Icons.keyboard_arrow_down,
                                color: Colors.white),
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                              PopupMenuItem(
                                  child: Text(locations[0],
                                      style: dropDownLabelStyle),
                                  value: 0),
                              PopupMenuItem(
                                  child: Text(
                                    locations[1],
                                    style: dropDownLabelStyle,
                                  ),
                                  value: 1)
                            ],
                      ),
                      Spacer(),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
                Text(
                  'Where would \n you want to got ?',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(
                          text: locations[selectLocationIndex]),
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 14.0),
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: Icon(Icons.search, color: Colors.black),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: ChoicChip(
                          Icons.flight_takeoff, 'Fligths', isFlightSection),
                      onTap: () {
                        setState(() {
                          isFlightSection = true;
                          isHotelSection = false;
                        });
                      },
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      child: ChoicChip(Icons.hotel, 'Hotels', isHotelSection),
                      onTap: () {
                        setState(() {
                          isFlightSection = false;
                          isHotelSection = true;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoicChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  ChoicChip(this.icon, this.text, this.isSelected);
  @override
  _ChoicChipState createState() => _ChoicChipState();
}

class _ChoicChipState extends State<ChoicChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        decoration: widget.isSelected
            ? BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.all(Radius.circular(20.0)))
            : null,
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              size: 20.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(widget.text,
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
          ],
        ));
  }
}

const viewAllStyle = TextStyle(fontSize: 14.0, color: Colors.orange);
var HomeBottomPart = Column(children: <Widget>[
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // SizedBox(width: 16.0),
        Text('Currently Watch Items', style: TextStyle(color: Colors.black)),
        Spacer(),
        Text('View All', style: viewAllStyle),
      ],
    ),
  ),
  Container(
    height: 200,
    child: ListView(scrollDirection: Axis.horizontal, children: CityCards),
  )
]);
List<CityCard> CityCards = [
  CityCard('assets/1.jpg', 'new york', '12', '123', '500', '400'),
  CityCard('assets/2.jpg', 'new york', '12', '123', '500', '400'),
  CityCard('assets/3.jpg', 'new york', '12', '123', '500', '400'),
  CityCard('assets/4.jpg', 'new york', '12', '123', '500', '400'),
];

class CityCard extends StatelessWidget {
  final String ImagePath, cityName, monthYear, discount, oldPrice, newPrice;
  CityCard(this.ImagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Stack(
            children: <Widget>[
              Container(
                width: 160,
                height: 210,
                child: Image.asset(
                  ImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ));
  }
}
