import 'package:flutter/material.dart';
import 'package:new_app/dummy_data.dart';
import 'package:new_app/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Homepage', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AuthPage()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/think.png', height: 325,),
          Row(mainAxisAlignment:MainAxisAlignment.center, children: [ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[50],
              foregroundColor: Colors.blue[170],
              elevation: 2,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const Calculator()));
            },
            child: const Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold)),
          ),SizedBox(width: 15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[50],
                  foregroundColor: Colors.blue[170],
                  elevation: 2,
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const UserData())),
                child: const Text('Our Team', style: TextStyle(fontWeight: FontWeight.bold)))],)
        ],
      )),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _form = GlobalKey<FormState>();
  var firstNumber;
  var secondNumber;
  double result = 0.0;

  void _add() {
    final isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();
      setState(() {
        result = double.parse(firstNumber) + double.parse(secondNumber);
      });
    }
  }

  void _subtract() {
    final isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();
      setState(() {
        result = double.parse(firstNumber) - double.parse(secondNumber);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold) ,),
      ),
      body: SingleChildScrollView(
        child: Center(child:Form(
          key: _form,
          child: SizedBox(
            height: 900,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/math.png', height: 265,),
                Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Nominal 1',
                          hintText: 'Masukkan nominal'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan nominal angka';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        firstNumber = value;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Nominal 2',
                          hintText: 'Masukkan nominal'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan masukkan nominal angka';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        secondNumber = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: _add, child: Icon(Icons.add)),
                        SizedBox(width: 20),
                        ElevatedButton(
                            onPressed: _subtract, child: Icon(Icons.remove)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        '$result',
                        style: TextStyle(fontSize: 23),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Team', style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: userData.length,
            itemBuilder: (ctx, index) {
              final user = userData[index];
              return Card(
                elevation: 5,
                color: Color.fromARGB(255, 140, 179, 222),
                child: ListTile(
                  title: Text('${user.name}'),
                  subtitle: Text('${user.nim}'),
                ),
              );
            },
          ),
      ),
    );
  }
}
