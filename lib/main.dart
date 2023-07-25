import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:multiple_api/providers/branchProvider.dart';
import 'package:multiple_api/providers/pinProvider.dart';
import 'package:multiple_api/providers/selectedBranchProvider.dart';
import 'package:multiple_api/providers/selectedPinProvider.dart';
import 'package:multiple_api/providers/selectedaccountProvider.dart';
import 'package:multiple_api/providers/user_account_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeApp(),
    );
  }
}

class HomeApp extends ConsumerWidget {
  HomeApp({Key? key}) : super(key: key);
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 160,
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: InkWell(
                child: const Icon(Icons.keyboard_backspace),
                onTap: () {},
              ),
              toolbarHeight: 80,
              title: const Padding(
                padding: EdgeInsets.only(right: 60.0),
                child: Text('New Debit Card Request'),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  // color: Color.fromRGBO(15, 60, 183, 0.938),
                  color: Color.fromRGBO(17, 46, 128, 0.813),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Card(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: 400,
                height: 800,
                child: Consumer(
                  builder: (context, ref, child) {
                    final selectedAccount = ref.watch(selectedAccountProvider);
                    final branchWatcher = ref.watch(branchProvider);
                    final pinWatcher = ref.watch(pinProvider);
                    final accountWatcher = ref.watch(accountProvider);
                    final selectedBranch = ref.watch(selectedBranchProvider);
                    final selectedPinn = ref.watch(selectedPinProvider);
                    if (branchWatcher is AsyncData &&
                        pinWatcher is AsyncData &&
                        accountWatcher is AsyncData) {
                      return FormBuilder(
                        key: _formkey,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 25.0, right: 180.0),
                                child: Text(
                                  "Card Information",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 25.0, right: 246.0),
                                child: Text(
                                  "Account",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 5.0, right: 5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20)),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 350,
                                          color: const Color.fromARGB(
                                              31, 210, 126, 216),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 7.0),
                                            child: accountWatcher.when(
                                              // ignore: body_might_complete_normally_nullable
                                              data: (data) {
                                                if (data.isNotEmpty) {
                                                  return Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          children: [
                                                            const Text(
                                                              "Select Account",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0),
                                                            ),
                                                            const Spacer(),
                                                            IconButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              icon: const Icon(
                                                                  Icons.close),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ListView.builder(
                                                          itemCount:
                                                              data.length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            String primary;
                                                            if (data[index]
                                                                    .primary ==
                                                                "N") {
                                                              primary =
                                                                  "SECONDARY";
                                                            } else {
                                                              primary =
                                                                  "PRIMARY";
                                                            }
                                                            return InkWell(
                                                              onTap: () {
                                                                ref
                                                                    .read(selectedAccountProvider
                                                                        .notifier)
                                                                    .getSelectedAccount({
                                                                  "type": data[
                                                                          index]
                                                                      .type,
                                                                  "number": data[
                                                                          index]
                                                                      .number,
                                                                  "primary":
                                                                      primary
                                                                });
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: SizedBox(
                                                                height: 80,
                                                                child: Card(
                                                                  elevation:
                                                                      1.0,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20.0,
                                                                        top:
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          data[index]
                                                                              .type,
                                                                          style: const TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 16.0),
                                                                        ),
                                                                        Text(
                                                                          data[index]
                                                                              .number,
                                                                          style: const TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FontStyle.italic),
                                                                        ),
                                                                        Text(
                                                                          primary,
                                                                          style: const TextStyle(
                                                                              color: Colors.black,
                                                                              fontStyle: FontStyle.italic,
                                                                              fontWeight: FontWeight.normal),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  // ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }
                                              },
                                              error: (error, stackTrace) {
                                                return Center(
                                                  child: Text('Error: $error'),
                                                );
                                              },
                                              loading: () {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        side: const BorderSide(
                                            color: Colors.grey, width: 1.0)),
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      height: 90,
                                      width: 320,
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                selectedAccount["type"],
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.expand_more)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                selectedAccount["number"],
                                                style: const TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 17.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Container(
                                                height: 21,
                                                width: 130,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: Chip(
                                                    label: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 7.0),
                                                      child: Text(
                                                        selectedAccount[
                                                            "primary"],
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 4, 52, 125),
                                                        ),
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 206, 225, 255),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 15.0, right: 180.0),
                                child: Text(
                                  "Collector Branch",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 5.0, right: 5.0),
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 340,
                                          color: const Color.fromARGB(
                                              31, 210, 126, 216),
                                          child: branchWatcher.when(
                                            // ignore: body_might_complete_normally_nullable
                                            data: (dataList) {
                                              print(dataList);
                                              if (dataList.isNotEmpty) {
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Row(
                                                        children: [
                                                          const Text(
                                                            "Select Branch",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0),
                                                          ),
                                                          const Spacer(),
                                                          IconButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            icon: const Icon(
                                                                Icons.close),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                        itemCount:
                                                            dataList.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              ref
                                                                  .read(selectedBranchProvider
                                                                      .notifier)
                                                                  .getSelectedBranch({
                                                                "name": dataList[
                                                                        index]
                                                                    .name
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: SizedBox(
                                                              height: 50,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            9.0,
                                                                        right:
                                                                            10.0),
                                                                child: Card(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10.0,
                                                                        left:
                                                                            10.0),
                                                                    child: Text(
                                                                      dataList[
                                                                              index]
                                                                          .name,
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                            },
                                            error: (error, stackTrace) {
                                              return Center(
                                                child: Text('Error: $error'),
                                              );
                                            },
                                            loading: () {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 16),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        side: const BorderSide(
                                            color: Colors.grey, width: 1.0)),
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      height: 60,
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            selectedBranch["name"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.expand_more)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 5.0, right: 220.0),
                                child: Text(
                                  "Pin option",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0),
                                ),
                              ),
                              Container(
                                // height: 30,
                                child: pinWatcher.when(
                                  data: (dataList) {
                                    return Column(
                                      children: [
                                        FormBuilderRadioGroup(
                                          decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 10.0),
                                            border: InputBorder.none,
                                          ),
                                          name: 'pin',
                                          onChanged: (value) {
                                            // selectedPin = value!;
                                            ref
                                                .read(selectedPinProvider
                                                    .notifier)
                                                .getSelectedPin({
                                              "name": value,
                                              "info": dataList
                                                  .firstWhere((data) =>
                                                      data.name == value)
                                                  .info,
                                            });
                                          },
                                          options: dataList
                                              .map((data) =>
                                                  FormBuilderFieldOption(
                                                    value: data.name,
                                                    child: Text(
                                                      data.name,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16.0),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Container(
                                            height: 110,
                                            width: 320,
                                            padding: const EdgeInsets.only(
                                                left: 10.0, bottom: 10.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              color: const Color.fromARGB(
                                                  255, 221, 236, 248),
                                              border: Border.all(
                                                  color:
                                                      Colors.lightBlueAccent),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.error,
                                                    color: Color.fromRGBO(
                                                        17, 46, 128, 0.813),
                                                  ),
                                                ),
                                                const SizedBox(width: 10.0),
                                                Expanded(
                                                  child: SingleChildScrollView(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: Text(
                                                        selectedPinn["info"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 21, 84, 180),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  error: (error, stackTrace) {
                                    return Text(
                                      "Error: $error",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    );
                                  },
                                  loading: () {
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                  height: 1,
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 25.0, right: 140.0),
                                child: Text(
                                  "Personal Information",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 25.0, right: 210.0),
                                child: Text(
                                  "Date of birth",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 55,
                                  child: FormBuilderDateTimePicker(
                                    name: "Date",
                                    decoration: InputDecoration(
                                        labelText: "Type or select a date",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.date_range),
                                        )),
                                    inputType: InputType.date,
                                    format: DateFormat("MMMM d,y"),
                                    initialDate: DateTime(1992),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 16.0, right: 158.0),
                                child: Text(
                                  "Citizenship Number",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 55,
                                  child: FormBuilderTextField(
                                    name: 'Citizenship',
                                    decoration: InputDecoration(
                                      labelText: '1212',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.numeric(),
                                      ],
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 16.0, right: 247.0),
                                child: Text(
                                  "Address",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 55,
                                  child: FormBuilderTextField(
                                    name: 'Address',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 1,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 56,
                                  width: 400,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 7, 89, 156),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                    ),
                                    onPressed: () {},
                                    child: const Text("Request For a New Card"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 50,
                        width: 40,
                        child: const Card(
                          child: ListTile(
                            title: Text(
                              'Error',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            subtitle: Text('Loading.....'),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
