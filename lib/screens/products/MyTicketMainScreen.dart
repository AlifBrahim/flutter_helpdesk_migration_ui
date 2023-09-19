import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/colors/Colors.dart';
import '/screens/products/MyTicketScreen.dart';
import '/screens/products/MyToCheckInScreen.dart';
import '/screens/products/tabCheckIn.dart';
import '/screens/products/tabCheckOut.dart';
import '/screens/products/tabSubmitForm.dart';
//import '/screens/products/tabSubmitJobDetails.dart';
import '/util/Util.dart';
import '/util/size_config.dart';
import '/widgets/Styles.dart';


class MyTicketMainScreen extends ConsumerStatefulWidget {


  @override
  _MyTicketMainScreenState createState() => _MyTicketMainScreenState();

}


class _MyTicketMainScreenState extends ConsumerState with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: DefaultTabController(

        length: 5,
        child: Scaffold(
          backgroundColor: isDarkMode(context)
          ? darkBackgroundColor
          : Theme.of(context).backgroundColor,
          appBar:  AppBar(
            backgroundColor: isDarkMode(context) ? darkGreyColor : Colors.white,
            title: Text(
              'My Tickets',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: Theme.of(context).textTheme.subtitle2?.fontWeight),
            ),
            leading: InkWell(
              child: Icon(
                Icons.keyboard_backspace,
                color: isDarkMode(context)
                    ? Colors.white70
                    : Colors.black.withOpacity(0.8),
                size: getProportionateScreenWidth(18),
              ),
              onTap: () {
                final CurvedNavigationBarState navState = getNavState();
                navState.setPage(0);
              },
            ),
            centerTitle: true,
            elevation: 2,
            shadowColor: Colors.black.withOpacity(0.4),
            bottom: TabBar(    
              controller: _controller,     
              isScrollable: true,
              indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Colors.greenAccent),
              tabs: [
                Tab(text: 'All '),
                Tab(text: 'Check In'),
                Tab(text: 'Check Out'),
                Tab(text: 'Submit Job Details'),   
                Tab(text: 'Submit Form'),
              ],
            ),
          ),
          
          body: TabBarView( 
            controller: _controller,  
            children: [
              MyTicketScreen(),
              CheckInTab(key: UniqueKey()),
              CheckOutTab(key: UniqueKey(),),
              //SubmitJobDetailsTab(),
              SubmitFormTab(),
              //MyCheckInScreen(),
              //Icon(Icons.flight, size: 350),
              //Icon(Icons.flight, size: 350)
            ]
          ),     

        ),         
      ),  
    );   
  }
}
