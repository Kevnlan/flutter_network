import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Demo',
      home: SearchPage(),
    ),
  );
}

class SearchPage extends StatelessWidget {
  Future<List<Customer>> _fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return dummyData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prospects List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return (snapshot.hasError)
                  ? Text("There was an error: ${snapshot.error}")
                  : ProspectList(prospects: snapshot.data);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class ProspectList extends HookWidget {
  final List<Customer> prospects;

  const ProspectList({Key key, this.prospects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchTerm = useState('');
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(hintText: 'Search...'),
            onChanged: (value) => searchTerm.value = value,
          ),
        ),
        ...prospects
            .where((prospect) =>
                searchTerm.value.isEmpty ||
                prospect.name.toLowerCase().contains(searchTerm.value))
            .map(
              (prospect) => ListTile(
                title: Text(prospect.name, style: TextStyle(fontSize: 18)),
                subtitle: Text(prospect.phone, style: TextStyle(fontSize: 16)),
                onTap: () => {},
              ),
            )
            .toList(),
      ],
    );
  }
}

final faker = Faker();
final dummyData = List.generate(
    100,
    (index) => Customer(
          firstname: faker.person.firstName(),
          lastname: faker.person.lastName(),
          phone: '+1${faker.randomGenerator.integer(999999999)}',
          email: faker.internet.email(),
        ));

@freezed
abstract class Customer implements _$Customer {
  const factory Customer({
    String firstname,
    String lastname,
    String phone,
    String email,
  }) = _Customer;

  const Customer._();

  String get name => '$firstname $lastname';
}