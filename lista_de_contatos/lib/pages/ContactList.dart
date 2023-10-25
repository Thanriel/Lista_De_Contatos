// // ignore: file_names
// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:lista_de_contatos/class/contact.dart';

// class ContactList extends StatefulWidget {
//   const ContactList({super.key});

//   @override
//   _ContactList createState() => _ContactList();
// }

// class _ContactList extends State<ContactList> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController adressController = TextEditingController();
//   final TextEditingController cpfController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   // String nome;
//   // String endereco;
//   // String cpf;
//   // String email;
//   // String telefone;

//   List<Contact> cotactsList = [];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.amber,
//           title: const Text(
//             "Lista de contatos",
//             style: TextStyle(fontSize: 25, color: Colors.white),
//           ),
//           centerTitle: true),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       ElevatedButton(
//                           onPressed: () {
//                             openContactModal(context);
//                           },
//                           child: Text('Botão'))
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }

//   //<----------------- Functions ----------------->

//   void openContactModal(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Novo Contato'),
//             content: Row(
//               children: [
//                 Column(
//                   children: [
//                     Expanded(
//                         child: TextField(
//                       controller: nameController,
//                       decoration: InputDecoration(labelText: 'Nome'),
//                     ))
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Expanded(
//                         child: TextField(
//                       controller: adressController,
//                       decoration: InputDecoration(labelText: 'Endereço'),
//                     ))
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Expanded(
//                         child: TextField(
//                       controller: cpfController,
//                       decoration: InputDecoration(labelText: 'CPF'),
//                     ))
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Expanded(
//                         child: TextField(
//                       controller: emailController,
//                       decoration: InputDecoration(labelText: 'Email'),
//                     ))
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Expanded(
//                         child: TextField(
//                       controller: phoneController,
//                       decoration: InputDecoration(labelText: 'Telefone'),
//                     ))
//                   ],
//                 ),
//               ],
//             ),
//           );
//         });

//     Contact contact;
//     contact = Contact(
//         nome: nameController.text,
//         endereco: adressController.text,
//         cpf: cpfController.text,
//         email: emailController.text,
//         telefone: phoneController.text);

//     cotactsList.add(contact);
//   }
// }
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Contact {
  String name;
  String email;
  String cpf;
  String address;
  String phone;

  Contact({
    required this.name,
    required this.email,
    required this.cpf,
    required this.address,
    required this.phone,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactList(),
    );
  }
}

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: ListTile(
                    title: Text(
                      contacts[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Email: ${contacts[index].email}"),
                        Text("CPF: ${contacts[index].cpf}"),
                        Text("Endereço: ${contacts[index].address}"),
                        Text("Telefone: ${contacts[index].phone}"),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteContact(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showContactDialog(context);
                },
                child: Text('Adicionar Contato'),
              ),
              ElevatedButton(
                onPressed: () {
                  _deleteAllContacts();
                },
                child: Text('Excluir Todos'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _showContactDialog(BuildContext context) {
    Contact newContact =
        Contact(name: '', email: '', cpf: '', address: '', phone: '');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Contato'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  onChanged: (value) {
                    newContact.name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    newContact.email = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'CPF'),
                  onChanged: (value) {
                    newContact.cpf = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Endereço'),
                  onChanged: (value) {
                    newContact.address = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Telefone'),
                  onChanged: (value) {
                    newContact.phone = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                setState(() {
                  contacts.add(newContact);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  _deleteAllContacts() {
    setState(() {
      contacts.clear();
    });
  }
}
