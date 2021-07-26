import 'package:contacts/src/controllers/contactsController.dart';
import 'package:contacts/src/pages/addContactPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsPage extends StatelessWidget {
  final contactController = Get.put(
    ContactsController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[300],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              contactController.contacts.isEmpty
                  ? Center(
                      child: Text(
                        'No Contact List',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.redAccent,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: contactController.contacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = contactController.contacts[index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            Card(
                              //color: Colors.red,

                              child: Container(
                                height: 130,
                                child: ListTile(
                                  onTap: () {},
                                  leading: Container(
                                    padding: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 2,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        item.imageurl,
                                      ),
                                    ),
                                  ),
                                  // title: Text('${item.phoneNumber}'),
                                  title: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '${item.fullName}',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          '${item.phoneNumber}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          '${item.email}',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.blue),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          '${item.address}',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.teal),
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Container(
                                    width: 120,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                              color: Colors.green,
                                              width: 2,
                                            ),
                                          ),
                                          child: IconButton(
                                            iconSize: 14,
                                            icon: Icon(Icons.edit),
                                            color: Colors.teal[500],
                                            onPressed: () {
                                              Get.to(
                                                AddContactPage(
                                                  id: item.id,
                                                  fullName: item.fullName,
                                                  phoneNumber: item.phoneNumber,
                                                  email: item.email,
                                                  address: item.address,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(1.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            border: Border.all(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                          ),
                                          child: IconButton(
                                              iconSize: 14,
                                              icon: Icon(Icons.delete),
                                              color: Colors.redAccent,
                                              onPressed: () {
                                                contactController.deleteContact(
                                                    id: item.id);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
            ],
          ),
        ),
      ),

// body: Obx(
//         () => Column(
//           children: [
//             contactController.contacts.isEmpty
//                 ? Text(
//                     'No Contact List',
//                   )
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     primary: false,
//                     itemCount: contactController.contacts.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final item = contactController.contacts[index];
//                       return Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: ListTile(
//                           leading: Image.asset(item.imageurl),
//                           // title: Text('${item.phoneNumber}'),
//                           title: Text('${item.fullName}'),

//                           subtitle: Text('${item.phoneNumber}'),
//                         ),
//                       );
//                     })
//           ],
//         ),
//       ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddContactPage());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal[400],
      ),
    );
  }
}
