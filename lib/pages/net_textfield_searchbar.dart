import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:premimum4/api/user_api.dart';


class NetworkTypeAheadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child:
      Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text('Items',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.blue),),

                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.settings,size: 25,),
                ),
              )

            ],
          ),

          Container(
            height: 80,
            width:470,
              child:TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search Username',
                ),
              )
          ),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    child: Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: Container(
                    child: Text('See All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.red),),
                  ),
                ),
              ],
            ),
          ),


          Expanded(
            child: GridView.count(crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              children: List.generate(9, (index) {
                return Padding(padding: EdgeInsets.all(2),

                  child:Stack(
                    children: [
                      Container(
                        height: 350,
                        color: Colors.lime,
                        child: Image.asset('jj',
                          fit: BoxFit.cover,),
                      ),
                      Positioned(
                        top: 265,
                        right: 70,
                        child: IconButton(onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>DataPassFinal(nameList[index], priceList[index] , contactList[index])));
                        },
                            icon: Icon(
                              Icons.shopping_cart_outlined, color: Colors.black,size: 40,)),
                      ),
                      Positioned(
                        top: 280,
                        left: 5.0,
                        child: Text('ADD Cart', style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),),
                      ),
                    ],),




                );
              }
              ),
            ),
          ),









          //youtube
          Container(
            padding: EdgeInsets.all(16),
            child: TypeAheadField<User?>(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search Username',
                ),
              ),
              suggestionsCallback: UserApi.getUserSuggestions,
              itemBuilder: (context, User? suggestion) {
                final user = suggestion!;

                return ListTile(
                  title: Text(user.name),
                );
              },
              noItemsFoundBuilder: (context) => Container(
                height: 100,
                child: Center(
                  child: Text(
                    'No Users Found.',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              onSuggestionSelected: (User? suggestion) {
                final user = suggestion!;

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text('Selected user: ${user.name}'),
                  ));
              },
            ),
          ),
        ],
      ),
    ),
  );
}