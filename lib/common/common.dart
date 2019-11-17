library tobyfast.globals;
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../api/models/allProductsModel.dart';
// import '../api/fetchDataBloc.dart';
// import '../api/models/categoryModels.dart';
class AppTheme {
  static const int _primaryColorBase = 0xFF465D50;
  static const MaterialColor primaryColor = MaterialColor(
    _primaryColorBase,
    <int, Color>{
       50: Color(0xFFa2aea7),
      100: Color(0xFF909d96),
      200: Color(0xFF7d8d84),
      300: Color(0xFF6a7d72),
      400: Color(0xFF586d61),
      500: Color(_primaryColorBase),
      600: Color(0xFF3f5348),
      700: Color(0xFF384a40),
      800: Color(0xFF314138),
      900: Color(0xFF2a3730),
    },
  );
}

class AppConfig {
  BuildContext _context;
  double _height;
  double _width;
  double _heightPadding;
  double _widthPadding;

  AppConfig(this._context) {
    MediaQueryData _queryData = MediaQuery.of(_context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding =
    _height - ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
      _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double returnHeight(double v) {
   return _height * v;
  }

  double returnWidth(double v) {
    return _width * v;
  }

  double returnHeightPadding(double v) {
    return _heightPadding * v;
  }

 double returnWidthPadding(double v) {
   return _widthPadding * v;
 }
}

// //Contains Details of all categories
// class CategoriesInfo{
//   static List<Categories> categories = List();

//   static int getIndexByID(int id){
//     for(int x=0 ; x < categories.length ; ++x){
//       if(categories[x].id == id){
//         return x;
//       }
//     }
//   }
// }

// //Contains all Details of all products and used for fetching products
// class ProductInfo{
//   static List<AllProducts> products = List();
//   static int totalPages = 2;

//   static Future<void> initializeAllProducts() async {
//     await getAllProductsBloc(1);
//   }

//   static int getIndexByID(int id){
//     for(int x=0 ; x < products.length ; ++x){
//       if(products[x].id == id){
//         return x;
//       }
//     }
//   }
// }

// class SetPreferences {
//   static SharedPreferences prefs;

//   static Future<void> setPrefs() async {
//     prefs = await SharedPreferences.getInstance();
//   }
// }

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final double size;

  StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color, this.size});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star,
        size: size,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: size,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: size,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}


class StrikeThroughWidget extends StatelessWidget {
  final Widget _child;

  StrikeThroughWidget({Key key, @required Widget child})
      : this._child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _child,
      padding: EdgeInsets.symmetric(horizontal: 8), // this line is optional to make strikethrough effect outside a text
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/strike.png'), fit: BoxFit.fitWidth),
      ),
    );
  }
}

class Validations{
  String validateName(String name) {
    if (name.isEmpty) return 'Name is required.';
    final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(name))
      return 'Please enter only alphabetical characters.';
    return null;
  }

    String validateEmail(String email) {
    if (email.isEmpty) return 'Email is required.';
    final RegExp nameExp = new RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
    if (!nameExp.hasMatch(email)) return 'Invalid email address';
    return null;
  }

  String validatePassword(String pass) {
    if (pass.isEmpty) return 'Please choose a password.';
    return null;
  }

  String validatetype(String type) {
    if (type.isEmpty) return 'Please select an option.';
    return null;
  }

  String validateEmpty(String type) {
    if (type.isEmpty) return 'Please add value to the field.';
    return null;
  }

  // String validateCPass(String cpass) {
  //   if(cpass.isEmpty) return 'Please enter the same password';
  //   if(cpass != )
  // }

}
String buttonCurrentValue = "Place Order & Check Out";
List<String> buttonTextValue = ["Place Order & Check Out", "Proceed to Pay"];

List<String> usStates = [
    "Alaska",
    "Alabama",
    "Arkansas",
    "American Samoa",
    "Arizona",
    "California",
    "Colorado",
    "Connecticut",
    "District of Columbia",
    "Delaware",
    "Florida",
    "Georgia",
    "Guam",
    "Hawaii",
    "Iowa",
    "Idaho",
    "Illinois",
    "Indiana",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Massachusetts",
    "Maryland",
    "Maine",
    "Michigan",
    "Minnesota",
    "Missouri",
    "Mississippi",
    "Montana",
    "North Carolina",
    "North Dakota",
    "Nebraska",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "Nevada",
    "New York",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Puerto Rico",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Virginia",
    "Virgin Islands",
    "Vermont",
    "Washington",
    "Wisconsin",
    "West Virginia",
    "Wyoming"
  ];

  class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppConfig appConfig;
  final PreferredSizeWidget bottom;
  const CustomAppBar({Key key, this.appConfig, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Leading
            Container(
              width: appConfig.returnWidth(20),
              child: Padding(
                padding: EdgeInsets.only(left: appConfig.returnWidthPadding(2.5)),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            //Title
            Container(
              width: appConfig.returnWidth(60),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: appConfig.returnWidthPadding(2.5)),
                child: Text(
                  "Payment Method",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            //Trailing
            Container(
              width: appConfig.returnWidth(20),
              child: Padding(
                padding: EdgeInsets.only(right: appConfig.returnWidthPadding(2.5)),
                child: Text(
                  "Edit",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),      
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}