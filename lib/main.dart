/***** https://flutter.dev/docs/cookbook/design/drawer ****/
/*
@author: Kevin Swan
Created on 1080 x 1920 flutter emulator
 */
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RU Family Weekend',
        theme: ThemeData(),
        home: MyHomePage(title: 'RU Family Weekend'),

        /******* ROUTE DEFINITIONS ******/
        routes: {
          //<String, WidgetBuilder>
          "FirstPage": (BuildContext context) => new First(),
          "SecondPage": (BuildContext context) => new Second(),
          "ThirdPage": (BuildContext context) => new Third(),
          "event1": (BuildContext context) => new Events1(),

          "/twitter": (_) => new WebviewScaffold(
                url: "https://twitter.com/RowanUniversity",
                appBar: new AppBar(
                  title: new Text("RU Twitter Page"),
                  backgroundColor: Color(0xFFFFCC00),
                ),
              ),
          "/facebook": (_) => new WebviewScaffold(
                url: "https://www.facebook.com/RowanUniversity",
                appBar: new AppBar(
                  title: new Text("RU Facebook Page"),
                  backgroundColor: Color(0xFFFFCC00),
                ),
              ),
          "/tickets": (_) => new WebviewScaffold(
                url: "https://secure.visualzen.com/vzfamilyweekend/rowan",
                appBar: new AppBar(
                  title: new Text("RU Ticket Page"),
                  backgroundColor: Color(0xFFFFCC00),
                ),
              ),

          "/parents": (_) => new WebviewScaffold(
                url: "https:/sites.rowan.edu/parentsfamily",
                appBar: new AppBar(
                  backgroundColor: Color(0xFFFFCC00),
                  title: new Text("RU Parents and Family"),
                ),
              ),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var headerText = new Text(
      '\n \n \n  \n \n RU Family Weekend \n \n Sept 28 - 30, 2018',
      style: TextStyle(
          fontSize: 14,
          color: Color(
            0xff57150B,
          )),
    );
    var rowan = AssetImage(
      'assets/torch_48.png',
    );
    image:
    Image(
      image: rowan,
    );

    var header = new DrawerHeader(
      child: headerText,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: rowan,
            alignment: Alignment(-0.85, -0.3),
          ),
          color: Color(
            0xffFFCC00,
          )),
    );

    /**** 1st Drawer Item ****/
    var item1Text = new Text('General Info');

    var item1Icon = new ImageIcon(AssetImage('assets/info.png'));

    var item1 = new ListTile(
        title: item1Text, leading: item1Icon, onTap: _onItem1OnTap);

    /**** 2nd Drawer Item ****/
    var item2Text = new Text('Schedule');

    var item2Icon = new ImageIcon(AssetImage('assets/schedule.png'));

    var item2 = new ListTile(
        title: item2Text, leading: item2Icon, onTap: _onItem2OnTap);

    /**** 3rd Drawer Item ****/

    var item3Text = new Text('Sponsors');

    var item3Icon = new ImageIcon(AssetImage('assets/sponsors.png'));

    var item3 = new ListTile(
        title: item3Text, leading: item3Icon, onTap: _onItem3OnTap);

    /**** 3rd Drawer Item ****/

    var item6Text = new Text('Tickets');

    var item6Icon = new ImageIcon(AssetImage('assets/tickets-30.png'));

    var item6 = new ListTile(
        title: item6Text, leading: item6Icon, onTap: _onItem6OnTap);

    var social = new Text(
      'RU on Social Media',
    );

    var soc = new ListTile(title: social);

    var item4Text = new Text('Facebook');

    var item4Icon = new ImageIcon(AssetImage('assets/fb.png'));

    var item4 = new ListTile(
        title: item4Text, leading: item4Icon, onTap: _onItem4OnTap);

    var item5Text = new Text('Twitter');

    var item5Icon = new ImageIcon(AssetImage('assets/twitter.png'));

    var item5 = new ListTile(
        title: item5Text, leading: item5Icon, onTap: _onItem5OnTap);
    var div = new Divider(thickness: 2.0);

    var children = [header, item1, item2, item3, item6, div, soc, item4, item5];

    var listView = new ListView(children: children);

    var drawer = new Drawer(child: listView);

    return new Scaffold(
        drawer: drawer,
        appBar: new AppBar(
          backgroundColor: Color(0xFFFFCC00),
          title: new Text(
            'RU Family Weekend',
            style: TextStyle(
                color: Color(
              0xff57150B,
            )),
          ),
        ),
        body: new Container(
            color: Color(0xFFFFCC00),
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  new Image.asset(
                    'assets/rufwpic.png',
                    width: 375,
                    height: 264,
                  ),
                  new Text(
                    '2018 Family Weekend',
                    style: TextStyle(
                        fontSize: 36,
                        color: Color(
                          0xff57150B,
                        )),
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    'General Info \n',
                    style: TextStyle(
                        fontSize: 36,
                        color: Color(
                          0xff57150B,
                        )),
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    'Click the Menu for Information, Schedule, and Tickets',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(
                          0xff57150B,
                        )),
                  ),
                ]))));
  }

  void _onItem1OnTap() {
    //  Navigator.of(context).pushNamed("FirstPage");
    Navigator.of(context).pushNamed("/parents");
  }

  void _onItem2OnTap() {
    Navigator.of(context).pushNamed("SecondPage");
  }


  void _onItem3OnTap() {
    Navigator.of(context).pushNamed("ThirdPage");
  }

  void _onItem4OnTap() {
    Navigator.of(context).pushNamed("/facebook");
  }

  void _onItem5OnTap() {
    Navigator.of(context).pushNamed("/twitter");
  }

  void _onItem6OnTap() {
    Navigator.of(context).pushNamed("/tickets");
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("First Page"), backgroundColor: Color(0xFFFFCC00)),
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.home, color: Colors.blue),
                iconSize: 70.0,
                onPressed: null,
              ),
              new Text("First Page")
            ]))));
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("RU Family Weekend 2018"),
            backgroundColor: Color(0xFFFFCC00)),
        body: new Container(
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              new RaisedButton(
                  color: Color(0xFFFFCC00),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Events1()));
                  },
                  child: Text(
                    '28TH',
                    style: TextStyle(),
                  )),
              new RaisedButton(
                  color: Color(0xFFFFCC00),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Events2()));
                  },
                  child: Text(
                    '29TH',
                    style: TextStyle(),
                  )),
              new RaisedButton(
                  color: Color(0xFFFFCC00),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Events3()));
                  },
                  child: Text(
                    '30TH',
                    style: TextStyle(),
                  )),
            ])));
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sponsorsList = [
      "Alumni Engagement",
      "Athletics",
      "Barnes & Noble",
      "Edelman Planetarium",
      "Gourmet Dining",
      "Harley E. Flack Student Mentoring Program",
      "History Department",
      "Office of Career Advancement",
      "Social Justice, Inclusion & Conflict Resolution",
      "Orientation & Student Leadership Programs",
      "Parent & Family Connections",
      "Rohrer College of Business",
      "Rowan University Art Gallery",
      "Rowan After Hours",
      "Chamberlain Student Center & Campus Activities",
      "Campus Recreation",
      "WGLS-FM Radio Station",
      "Museum of Anthropology at Rowan University",
      "Edelman Fossil Park",
      "College of Performing Arts",
      "Wellness Center",
      "Veterans Affairs",
      "Greek Life"
    ];

    return new Scaffold(
      appBar: new AppBar(
          title: new Text('2018 Family Weekend Sponsors'),
          backgroundColor: Color(0xFFFFCC00)),
      body: ListView.separated(
        itemCount: sponsorsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(sponsorsList[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

class Events1 extends StatelessWidget {
  Future<void> _detailsDialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Event Details'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Close')),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final events_fri = [
      "Registration and Welcome",
      "\$5 Friday at the Glassworks Eatery",
      "How to Create a Killer LinkedIn Profile That Will Get You Noticed",
      "Heather Ujiie: Dystopian Garden Paradise",
      "Rowan Division III Ice Hockey vs. Rutgers Camden",
      "Laser Pink Floyd: Dark Side of the Moon - Planetarium Show",
      "Rowan Division II Ice Hockey vs. Virginia Tech",
      "Laser Pink Floyd: Dark Side of the Moon - Planetarium Show",
      "Drive-in Movie",
      "Laser Pink Floyd: Dark Side of the Moon - Planetarium Show"
    ];

    final description_fri = [
      "Time: 4:00pm - 7:00pm \n Location: Atrium, Savitz Hall 2nd Floor \n Students or family members can pick up their reserved tickets or purchase tickets while supplies last.  We encourage guests to bring non-perishable food and toiletries donations for The Shop at Rowan" +
          "University (Students Helping Other Profs), serving Rowan University students faced with food insecurities.",
      "Time: 4:30pm - 7:30pm \n Location: Holly Pointe Commons \n Cost: \$5 - Adults, Children, Senior Citizens(Rowan students can use meal plans/special-priced meal.) \n " +
          "Enjoy a wide variety of selections in our newest all you can eat dining " +
          "facility including classic cuisine, pizza & pasta, soup & salad, traditional grill and more...",
      "Time: 4:00pm - 5:00pm \n Location: Office of Career Advancement, Savitz Hall 2nd Floor \n Cost: Free \n " +
          "Whether you are job or internship hunting, gathering leads, or networking in your career field, having a professional, eye-catching LinkedIn" +
          " profile is an excellent idea to make sure that you can be found by the right people at the right time.  come learn how to complete your LinkedIn " +
          "profile in a way that appeals to prospects that are quickly scanning to see if you have what they need.  ",
      "Time: 4:00pm - 7:00pm\n Location: Rowan University Art Gallery, 301 West High Street, Glassboro NJ\n Cost: Free\n Rowan University art " +
          "Gallery will be producing and presenting an interdisciplinary program that turns a lens on how fashion and textile design is translated " +
          "as a visual arts practice.  This program comes at a time when the arts and design sectors are blending creative principles and crossing over into the " +
          "multi-disciplinary practices.  Fashion design has crossed over into a platform where explorations into gender and cultural identity can reach a broader audience outside" +
          " the mainstream fashion and design sectors.  Artist Heather Ujiie's work speaks directly to issues that are currently relevant in our society: transgender, sexuality, environmental issues, science and technology.  ",
      "Time: 5:30pm - TBA\n Location: Hollydell Ice Arena, 600 Hollydell Drive, Sewell NJ\n Cost: \$5 - Adults, Free- Rowan Students(With ID) and children(Athletic passes included by the Athletic Department cannot be used for this event.)\n " +
          "Join Rowan's hockey club for its opening night for the 2018/19 season!",
      "Time: 7:00pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
          "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
      "Time: 8:15pm - TBA\n Location: Hollydell Ice Arena, 600 Hollydell Drive, Sewell NJ\n Cost: \$5 - Adults, Free- Rowan Students(With ID) and children(Athletic passes included by the Athletic Department cannot be used for this event.)\n " +
          "Join Rowan's hockey club for its opening night for the 2018/19 season!",
      "Time: 8:30pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
          "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
      "Time: 9:00pm - 1:00am\n Location: South Jersey Technology Park\n Cost: Free\n Enjoy a family friendly classic under the stars and go back to the days of drive-in movies.  No worries if you don't have a car, " +
          "a free shuttle will be provided from the Student Center Half-Circle starting at 8:30pm.  Enjoy free food and drinks while you watch.  ",
      "Time: 10:00pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
          "Show details and ticket purchases can be found at www.rowan.edu/planetarium",
    ];

    return new Scaffold(
      appBar: new AppBar(
          title: new Text('2018 Family Weekend Sponsors'),
          backgroundColor: Color(0xFFFFCC00)),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events1()));
                        },
                        child: Text(
                          '28TH',
                          style: TextStyle(),
                        )),
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events2()));
                        },
                        child: Text(
                          '29TH',
                          style: TextStyle(),
                        )),
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events3()));
                        },
                        child: Text(
                          '30TH',
                          style: TextStyle(),
                        )),
                  ]),
              Expanded(
                child: ListView.separated(
                  itemCount: events_fri.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(events_fri[index]),
                        onTap: () {
                          _detailsDialog(context, description_fri[index]);
                        });
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Events2 extends StatelessWidget {
  Future<void> _detailsDialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Event Details'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Close')),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    var events_sat = new List(26);
    events_sat[0] = "Registration and Welcome";
    events_sat[1] =
        "The SHOP (Students Helping Other Profs) Food Pantry Donations";
    events_sat[2] = "They Fought We Ride, Run, or Walk";
    events_sat[3] = "MARU (Museum of Anthropology at Rowan University) Tour";
    events_sat[4] = "WGLS-FM Radio Studio Tour";
    events_sat[5] = "Heather Ujii: Dystopian Garden Paradise";
    events_sat[6] = "Story Telling and Craft Time at Barnes and Noble";
    events_sat[7] = "Instrument Petting Zoo";
    events_sat[8] =
        "Ingredients for a Great Career: Exploring OCA Services and Resources";
    events_sat[9] = "Family Block Party/Vendor Fair";
    events_sat[10] = "Flu Shots";
    events_sat[11] = "Sweets in the Sukkah";
    events_sat[12] = "Hollybush Tour";
    events_sat[13] =
        "Rowan University Field Hockey vs. William Patterson University";
    events_sat[14] = "Profecy A Cappella Performance";
    events_sat[15] = "Liquid Nitrogen Ice Cream Demonstration";
    events_sat[16] = "Rowan Family Fossil Find";
    events_sat[17] = "Finance Lab Demonstration";
    events_sat[18] = "Black Holes - Planetarium Show";
    events_sat[19] = "Stars of the Pharaohs - Planetarium Show";
    events_sat[20] =
        "Rowan University Football vs. Christopher Newport University";
    events_sat[21] = "Rowan University Men's Soccer vs. Kean University";
    events_sat[22] = "Laser Queen - Planetarium Show";
    events_sat[23] = "Laser Queen - Planetarium Show";
    events_sat[24] = "End of Summer Bingo";
    events_sat[25] = "Laser Queen - Planetarium Show";

    var description_sat = new List(26);

//Populate array with sat events descriptions
    description_sat[0] =
        "Time: 9:00am - 12:30pm\n Location: The Registration Tent, Athletic Alumni Patio, Between the End Zone and John Green Team House\n Cost: Free\n " +
            "Students or family members can pick up their reserved tickets or purchase tickets while supplies last.  ";
    description_sat[1] =
        "Time: 9:00am - 12:30pm\n Location: The Registration Tent, Athletic Alumni Patio, Between the End Zone and John Green Team House\n Cost: Free\n " +
            "The SHOP is Rowans's on-campus food pantry and resource center available to students in need.  We encourage guests to bring non-perishable food items, toiletries and hygiene product donations to show your" +
            " support for our student community.  ";
    description_sat[2] =
        "ime: 9:30am - 12:00pm\n Location: Near the Registration Tent, Athletic Alumni Patio, Between the End Zone and John Green Team House\n Cost: Free, but a \$15 minimum or more donation is suggested, but not required to participate\n " +
            "Tune up your bicycle or lace up your running/walking shoes and participate in our veterans event!  A fun bike/run/walk that serves as a fundraiser for our veterans' initiatives.  the course follows the perimeter of our campus.  ";
    description_sat[3] =
        "Time: 10:00am - 4:00pm\n Location: Robinson Hall, Room 205\n Cost: Free\n " +
            "Explore Rowan's very own anthropology museum!  The museum's mission is to promote discovery, learning and an appreciation of human origins and cultures, with collections including archaeological artifacts, human osteological and megafauna remains " +
            "and even an extensive human evolution series inaugurated in 2017 by Dr. Jane Hill and Rowan's Museum Studies students.  Dr. Maria A. Rosado will be on hand to discuss the collections and answer any questions you may have.  ";
    description_sat[4] =
        "Time: 10:00am - 1:00pm\n Location: Bozorth Hall\n Cost: Free\n Explore Rowan's very own radio station headquarters!  WGLS-FM is regional radio service with a potential audience of almost 1.2 million people and has won over 245 national and " +
            "regional awards since 1993.  The broadcast covers South Jersey, parts of Philadelphia and Delaware.  WGLS-FM is licensed to the Rowan University Board of Trustees and is a non-profit organization.  Twenty-four hours a day a staff of independent volunteers " +
            "broadcast a variety of musical, cultural, educational, entertaining and informative programs of interest to the Rowan University and surrounding communities.  ";
    description_sat[5] =
        "Time: 10:00am - 7:00pm\n Location: Rowan University Art Gallery, 301 West High Street, Glassboro NJ\n Cost: Free\n Rowan University art " +
            "Gallery will be producing and presenting an interdisciplinary program that turns a lens on how fashion and textile design is translated " +
            "as a visual arts practice.  This program comes at a time when the arts and design sectors are blending creative principles and crossing over into the " +
            "multi-disciplinary practices.  Fashion design has crossed over into a platform where explorations into gender and cultural identity can reach a broader audience outside" +
            " the mainstream fashion and design sectors.  Artist Heather Ujiie's work speaks directly to issues that are currently relevant in our society: transgender, sexuality, environmental issues, science and technology.";
    description_sat[6] =
        "Time: 10:30am - 12:00pm\n Location: Barnes and Noble, 201 Rowan Boulevard\n Cost: Free\n Barnes and Noble will feature new topical books of interest for students, as well as family PROF related crafts for the whole family to enjoy and take home.  ";
    description_sat[7] =
        "Time: 10:00am - 12:00pm\n Location: Room 105, Harold Wilson Music Building\n Cost: Free\n Come expand your mind doing something relaxing, upbeat and productive.  What is it you say?  Music!  Try instruments, listen " +
            "to informal performances, ask questions about music, and learn about how you can be involved in music even as a non-music major.  if you love music, this is the place for you.  ";
    description_sat[8] =
        "Time: 10:30am - 2:00pm\n Location: Room 107, Harold Wilson Music Building\n Cost: Free\n " +
            "Join us to learn about Rowan University's Career Advancement center, alumni and community networks and the many ways for students to make lasting, valuable career connections.  Take an interactive tour and talk with students who have participated in" +
            " career development opportunities, internships, externships, job shadowing and more with the professional world.  ";
    description_sat[9] =
        "Time: 11:00am - 2:30pm\n Location: Near the Picnic Tent, Athletic Alumni Patio, Between the End Zone and John Green Team House\n Cost: \$20 - Adults, \$17 - Children under 12 for pre-event registration (Day of ticket prices are \$25 for adults and \$20 for children under 12) " +
            "Rowan Students can use meal plans/special-priced meal.\n" +
            "Enjoy good food, music, family activities and good old fashion fun the Rowan way!  Festivities include balloon animals, caricaturist artists, crafts, face painting, local vendors, stilt walking entertainers, family photos, Gourmet Dining sponsored contests and more!  The Rowan " +
            "Family Tailgate menu will feature a variety of salads, sides, grilled entrees and assorted desserts.  (Vegan, vegetarian and gluten-free options are available)";
    description_sat[10] =
        "Time: 11:00am - 2:30pm\n Location: Block Party Vendor Fair\n Cost: Free\n Please stop by for your free flu shot, with proof of insurance card!";
    description_sat[11] =
        "Time: 11:00am - 1:00pm\n Location: Sukkah Hut\n Cost: Free\n " +
            "Drop by and grab a sweet in the traditional Sukkah Hut (which commemorates the Jewish harvest festival).  Special activities will be available for children.  ";
    description_sat[12] =
        "Time: 12:00pm - 2:00pm\n Location: The Hollybush Mansion at Rowan University\n Cost: Free\n " +
            "Join members of the Rowan History Department for an interactive tour of the Hollybush Mansion!  Hollybush has a long and varied history, first as the home of the prominent Whitney family of Glassboro in the mid-1800's, the site of a US and Russia Cold War Summit in 1967 " +
            "and later as a part of Rowan University.  ";
    description_sat[13] =
        "Time: 12::00pm - TBA\n Location: Richard Wacker Stadium\n Cost: Free\n ";
    description_sat[14] =
        "Time: 1:00pm - 1:15pm\n Location: Block Party Vendor Fair\n Cost: Free\n " +
            "Check out Rowan's oldest all-male a cappella group who have competed in the International Championship of Collegiate A Cappella, performed in multiple states, and even released a music video!  These proud Rowan Profs pride themselves on promoting the enjoyment of contemporary " +
            "a cappella music and building life-long relationships with other musicians.  ";
    description_sat[15] =
        "Time: 1:00pm - 2:00pm\n Location: Room 107, Engineering Hall\n Cost: Free\n " +
            "Explore the science behind making homade ice cream using liquid nitrogen!  Engineering and chemistry can be used in everyday life, such as making delicious desserts.  feel free to add some " +
            "toppings to your ice cream and enjoy a quick presentation about the club, as well as interesting statistics about women in engineering.  ";
    description_sat[16] =
        "Time: 2:00pm - 4:00\n Location: Edelman Fossil Park\n Cost: \$7 - Adults, \$5 - Children\n " +
            "Edelman Fossil Park invites Rowan University families for a fossil find event! Few other topics in science can compete with the wide appeal of fossils and their ability to engage the imagination.  This special Family Fossil Find, provides an unparalleled opportunity to do just that, bringing" +
            " the ancient past to life for hundreds of amateur explorers, young an old.  On site with us you will have the chance to interact with Rowan University scientists who will recount the tales of Cretaceous New Jersey and teach guests to excavate and identify their own marine fossils in Rowan's four-acre quarry.  " +
            "Nearly every participant will leave with a 65-million-year-old fossil that they dug with their own hands.  All will make an intimate connection with Earth's deep past.  \n ***A courtesy shuttle will escort registered guests to and from the park.***\n Ticket purchases can be made at www.rowan.edu/fossils";
    description_sat[17] =
        "Time: 2:30pm - 4:00pm\n Location: Finance Lab, Business Hall 107\n Cost: Free\n " +
            "The Bloomberg terminal enables financial professionals to access the Bloomberg Professional service through which users can monitor and analyze real-time financial market data movements.  It also provides news, price quotes, and messaging across its proprietary network, and news and analytics for over 174+ countries and 360+ exchanges.  ";
    description_sat[18] =
        "Time: 4:00pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
            "Show details and ticket purchases can be found at www.rowan.edu/planetarium";
    description_sat[19] =
        "Time: 5:30pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
            "Show details and ticket purchases can be found at www.rowan.edu/planetarium";
    description_sat[20] =
        "Time: 6:00pm - TBA\n Location: Richard Wacker Stadium\n Cost: \$8 - General Admission, \$5 - Visiting College Students with ID/Senior Citizens/Children ages 12 and under, Free - Rowan Students with ID, and Faculty and Staff with Athletic Pass\n " +
            "Beer garden entrance is included with ticket if over 21.  ";
    description_sat[21] =
        "Time: 7:00pm - TBA\n Location: Soccer Fields\n Cost: \$5 - General Admission, \$3 - Visiting College Students with ID/Senior Citizens/Children ages 12 and under, Free - Rowan Students with ID, and Faculty and Staff with Athletic Pass\n ";
    description_sat[22] =
        "Time: 7:00pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
            "Show details and ticket purchases can be found at www.rowan.edu/planetarium";
    description_sat[23] =
        "Time: 8:30pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
            "Show details and ticket purchases can be found at www.rowan.edu/planetarium";
    description_sat[24] =
        "Time: 9:00pm - 1:00am\n Location: Chamberlain Student Center Pit\n Cost: Free\n " +
            "Bingo begins at 10:00pm- Say goodbye to summer and ease into the new school year with a night of prizes, giveaways, and more with everyone's favorite RAH game: BINGO!  Bring in a non-perishable food item to donate to The Shop for an extra bingo board.";
    description_sat[25] =
        "Time: 10:00pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
            "Show details and ticket purchases can be found at www.rowan.edu/planetarium";

    return new Scaffold(
      appBar: new AppBar(
          title: new Text('2018 Family Weekend Sponsors'),
          backgroundColor: Color(0xFFFFCC00)),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events1()));
                        },
                        child: Text(
                          '28TH',
                          style: TextStyle(),
                        )),
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events2()));
                        },
                        child: Text(
                          '29TH',
                          style: TextStyle(),
                        )),
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events3()));
                        },
                        child: Text(
                          '30TH',
                          style: TextStyle(),
                        )),
                  ]),
              Expanded(
                child: ListView.separated(
                  itemCount: events_sat.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(events_sat[index]),
                        onTap: () {
                          _detailsDialog(context, description_sat[index]);
                        });
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Events3 extends StatelessWidget {
  Future<void> _detailsDialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Event Details'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Close')),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    var events_sun = new List(6);

//populate array with events_sun
    events_sun[0] = "A Service of Many Faiths";
    events_sun[1] = "Black Jack Walk";
    events_sun[2] = "Sweet and Savory Brunch at the Glassworks Eatery";
    events_sun[3] = "Hollybush Tour";
    events_sun[4] = "Family Show - Planetarium Show";
    events_sun[5] = "Stars of the Pharaohs - Planetarium Show";

    var description_sun = new List(6);
    //Populate array with sun events descriptions
    description_sun[0] =
        "Time: 9:00am - TBA\n Location: Chamberlain Student Center Pit\n Cost: Free\n " +
            "An all-faiths service where family members can explore and celebrate what they believe together as one community committed to supporting different faiths and religions.  ";
    description_sun[1] =
        "Time: 11:00am - TBA\n Location: Student Recreation Center\n Cost: Free\n " +
            "Enjoy a 1.2-mile walk around campus, collect tokens/giveaways at  stations along the way.  Return to the Rec Center where you'll be dealt one blackjack hand for a chance to win raffles and prizes.  No start time - come anytime between 11:00am until 12:45pm";
    description_sun[2] =
        "Time: 11:00am - 2:00pm\n Location: Holly Pointe Commons\n Cost: \$10 - Adults, \$7 - Children under 12 (Rowan Students can use meal plans)\n " +
            "Kick off your Sunday in style by joining us for our classic brunch, featuring all your favorite breakfast items, Chef action stations and more.  ";
    description_sun[3] =
        "Time: 12:00pm - 2:00pm\n Location: The Hollybush Mansion at Rowan University\n Cost: Free\n " +
            "Join members of the Rowan History Department for an interactive tour of the Hollybush Mansion!  Hollybush has a long and varied history, first as the home of the prominent Whitney family of Glassboro in the mid-1800's, the site of a US and Russia Cold War Summit in 1967 " +
            "and later as a part of Rowan University.  ";
    description_sun[4] =
        "Time: 2:00 - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$2 - Adults, Children and Senior Citizens (under 16 and over 60), and Rowan Students (with ID)\n " +
            "The Family Show series is reccomended for visitors with children 5-10 years old.  The show runs about a half hour, does not include a live presentation and costs only \$2 per person!\n Show details and ticket purchases can be found at www.rowan.edu/planetarium";
    description_sun[5] =
        "Time: 3:00pm - TBA\n Location: Edelman Planetarium, Science Hall\n Cost: \$5 - Adults, \$3 - Children and Senior Citizens (Under 16 and over 60), \$3 - Rowan Students (With ID)\n " +
            "Show details and ticket purchases can be found at www.rowan.edu/planetarium";

    return new Scaffold(
      appBar: new AppBar(
          title: new Text('2018 Family Weekend Sponsors'),
          backgroundColor: Color(0xFFFFCC00)),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events1()));
                        },
                        child: Text(
                          '28TH',
                          style: TextStyle(),
                        )),
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events2()));
                        },
                        child: Text(
                          '29TH',
                          style: TextStyle(),
                        )),
                    new RaisedButton(
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Events3()));
                        },
                        child: Text(
                          '30TH',
                          style: TextStyle(),
                        )),
                  ]),
              Expanded(
                child: ListView.separated(
                  itemCount: events_sun.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(events_sun[index]),
                        onTap: () {
                          _detailsDialog(context, description_sun[index]);
                        });
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
