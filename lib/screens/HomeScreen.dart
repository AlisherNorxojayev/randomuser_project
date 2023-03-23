import 'package:flutter/material.dart';
import 'package:randomuser_project/services/randomuser.dart';
import 'package:randomuser_project/widgets/UserWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: [IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));}, icon: Icon(Icons.refresh))],
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          // List user = snapshot.data!;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          snapshot.data![index]["picture"]["medium"]),
                    ),
                    title: Text(snapshot.data![index]["name"]["first"]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  UserWidget(user: snapshot.data![index]))));
                    },
                  );
                }),
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.grey, indent: 70),
                itemCount: snapshot.data!.length);
          }
          return Text("Has Error");
        },
      ),
    );
  }
}
