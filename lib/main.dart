import 'package:covid_19_app/Helperes/covid_19_heleperes.dart';
import 'package:covid_19_app/Modeles/covid_19_modeles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Covid 19 app"),
      ),
      body: FutureBuilder(
          future: CoronaHelper.coronaHelper.fetchAllCasesRecordsData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.hasError}"));
            } else if (snapshot.hasData) {
              List<Corona?> data = snapshot.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      leading: Text(
                        "Country: \n ${data[i]!.country},",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.purple,
                        ),
                      ),
                      title: Text(
                        'Total Case:${data[i]!.cases}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                      //  covid_res.confvalue.toString() ?? '',
                      //Colors.blue
                      subtitle: Text(
                        'Recovered:${data[i]!.recovered}',
                        style: const TextStyle(color: Colors.green),
                      ),
                      // covid_res.recvalue.toString() ?? '',
                      // Colors.green
                      trailing: Text(
                        'Deaths:${data[i]!.deaths}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          }),
      //  covid_res.deaths.toString() ?? '',
      //Colors.red),
    );
  }
}
