import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:patient_sevak/components/profilePhoto.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            buildSliverAppBar(),
            buildSliverList(),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white10,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: <Widget>[
            buildProfileImage(),
            buildDoctorNameAndBranch(),
          ],
        ),
      ),
      actions: buildActions(),
    );
  }

  List<Widget> buildActions() {
    return <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert),
        color: Colors.black,
      )
    ];
  }

  Center buildProfileImage() {
    return Center(
      child: ProfilePhoto(
        image: Image.network(
          "https://img.pngio.com/doctor-png-clipart-png-all-doctor-who-th-doctor-png-597_867.png",
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  Column buildDoctorNameAndBranch() {
    return Column(
      children: <Widget>[
        Text(
          "Dr Manoj Varshney ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Viralogist",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          buildInfoCards(),
          SizedBox(height: 10),
          buildBottomCard([
            buildCardItem(
              "About Doctor",
              buildCardItemText(
                  "Dr. Manoj Varshney is a top specialist at Nayati Medicity at Mathura. "
                  "He was achieved several awards and recognition for is contribution and service in his own field."
                  "He is available for private consultation. "),
            ),
            SizedBox(height: 30),
            buildCardItem(
              "Working time",
              buildCardItemText("Mon - Sat (08:30 AM - 09:00 PM)"),
            ),
            SizedBox(height: 30),
            buildCardItem(
              "Communication",
              buildCommunicationList(),
            ),
            SizedBox(height: 50),
            buildBottomButton()
          ]),
        ],
      ),
    );
  }

  Widget buildInfoCards() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildInfoCard(
            Icon(Icons.people, color: Colors.blue),
            Colors.blue.withOpacity(0.1),
            "1000+",
            "Patients",
          ),
          buildInfoCard(
            Icon(Icons.bookmark, color: Colors.pink.withOpacity(0.3)),
            Colors.pink.withOpacity(0.1),
            "10 Yrs",
            "Experience",
          ),
          buildInfoCard(
            Icon(Icons.star_border, color: Colors.orange.withOpacity(0.6)),
            Colors.orange.withOpacity(0.1),
            "4.5",
            "Ratings",
          ),
        ],
      ),
    );
  }

  Column buildCommunicationList() {
    return Column(
      children: <Widget>[
        buildCommunicationItem(
          "Messaging",
          "Chat me up, share photos",
          Icon(Icons.message, color: Colors.pink[300]),
          Colors.green.withOpacity(0.1),
        ),
        SizedBox(height: 10),
        buildCommunicationItem(
          "Audio Call",
          "Call your doctor directly",
          Icon(Icons.phone, color: Colors.blue),
          Colors.grey.withOpacity(0.1),
        ),
        SizedBox(height: 10),
        buildCommunicationItem(
          "Video Call",
          "See you doctor live",
          Icon(Icons.video_call, color: Colors.orange),
          Colors.orange.withOpacity(0.1),
        )
      ],
    );
  }

  Row buildCommunicationItem(
    String title,
    String subTitle,
    Icon icon,
    Color color,
  ) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ColoredBox(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.4),
                fontSize: 15,
              ),
            ),
          ],
        )
      ],
    );
  }

  Column buildCardItem(String title, Widget child) {
    return Column(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
        SizedBox(height: 10),
        Align(alignment: Alignment.topLeft, child: child),
      ],
    );
  }

  Text buildCardItemText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(1),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Card buildBottomCard(List<Widget> list) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: list,
        ),
      ),
    );
  }

  Widget buildInfoCard(
    Icon icon,
    Color color,
    String primaryText,
    String secondaryText,
  ) {
    return SizedBox(
      width: 120,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            buildInfoCardTopIcon(icon, color),
            SizedBox(height: 15),
            Text(
              primaryText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              secondaryText,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  ClipRRect buildInfoCardTopIcon(Icon icon, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      child: ColoredBox(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox buildBottomButton() {
  return SizedBox(
    width: double.infinity,
    // ignore: deprecated_member_use
    child: RaisedButton(
      color: Colors.cyanAccent[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Text(
          "Book Appointment",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
