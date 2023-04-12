import 'package:flutter/material.dart';
import 'package:formente/Providers/user.dart';
import 'package:formente/Screens/Home/about_us.dart';
import 'package:provider/provider.dart';
class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(userProvider.userModel.name),
              accountEmail: Text(userProvider.userModel.email)
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutUs()));

            },
            child: ListTile(
              leading: const Icon(
                Icons.info_outline_rounded
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,color:Colors.grey[900]),
              title: const Text("About Us"),
            ),
          ),
          GestureDetector(
            onTap:()async{
              await userProvider.signOut();
            },
            child: ListTile(
              leading: const Icon(
                  Icons.person_outlined
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded,color:Colors.grey[900]),
              title: const Text("Sign Out"),
            ),
          ),
        ],
      ),
    );
  }
}
