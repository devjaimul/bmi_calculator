import 'package:bmi_calculator/views/chrat.dart';
import 'package:bmi_calculator/widgets/form_feiled.dart';
import 'package:bmi_calculator/widgets/texts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ageController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double? ans=0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                dispose();
              },
              icon: const Icon(
                Icons.replay,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FormFiled(
                    text: "Age",
                    controller: ageController,
                  ),
                  FormFiled(
                    text: 'Ht(ft)',
                    controller: ftController,
                  ),
                  FormFiled(
                    text: 'Ht(in)',
                    controller: inchController,
                  ),
                  Center(
                    child: DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          value: 'ft',
                          child: Text('ft'),
                        ),
                        DropdownMenuItem(
                          value: 'inch',
                          child: Text('inch'),
                        ),
                      ],
                      value: 'ft',
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.male,
                        size: 25,
                      )),
                  const Text(
                    '|',
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.female,
                        size: 25,
                      )),
                  FormFiled(
                    text: "Weight (Kg)",
                    long: size.width * 0.35,
                    controller: weightController,
                  ),
                  IconButton(
                      onPressed: () {
                        double? ft = double.tryParse(ftController.text) ?? 0;
                        double? inch =
                            double.tryParse(inchController.text) ?? 0;
                        double? weight =
                            double.tryParse(weightController.text) ?? 0;

                        double? meter = (ft * 12 + inch) * 0.0254;
                        ans = (weight / (meter * meter));
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.check_circle_outline_outlined,
                        size: 25,
                      ))
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                  height: 350,
                  child: Chart(
                    answer: ans,
                  )),
              Column(
                children: [
                  TextWidget(
                    text1: 'Very Severely UnderWeight',
                    text2: '<-15.9',
                    color: (ans?.toDouble() ?? 0) <= 15.9
                        ? Colors.green
                        : Colors.black,
                  ),
                  TextWidget(
                      text1: 'Severely UnderWeight',
                      text2: '16.0 - 16.9',
                      color: ((ans?.toDouble() ?? 0) >= 16.0 &&
                          (ans?.toDouble() ?? 0) <= 16.9)
                          ? Colors.teal.shade400
                          : Colors.black,),
                  TextWidget(
                      text1: 'UnderWeight',
                      text2: '17.0 - 18.4',
                      color: ((ans?.toDouble() ?? 0) >= 17.0 &&
                          (ans?.toDouble() ?? 0) <= 18.4)
                          ? Colors.teal
                          : Colors.black,),
                  TextWidget(
                      text1: 'Normal',
                      text2: '18.5 - 24.9',
                      color: ((ans?.toDouble() ?? 0) >= 18.5 &&
                          (ans?.toDouble() ?? 0) <= 24.9)
                          ? Colors.green
                          : Colors.black,),
                  TextWidget(
                      text1: 'OverWeight',
                      text2: '25.0 - 29.9',
                      color: ((ans?.toDouble() ?? 0) >= 25.0 &&
                          (ans?.toDouble() ?? 0) <= 29.9)
                          ? Colors.green
                          : Colors.black,),
                  TextWidget(
                      text1: 'Obese Class |',
                      text2: '30.0 - 34.9',
                      color: ((ans?.toDouble() ?? 0) >= 30.0 &&
                          (ans?.toDouble() ?? 0) <= 34.9)
                          ? Colors.red.shade300
                          : Colors.black,),
                  TextWidget(
                      text1: 'Obese Class ||',
                      text2: '35.0 - 39.9',
                      color:((ans?.toDouble() ?? 0) >= 35.0 &&
                          (ans?.toDouble() ?? 0) <= 39.9)
                          ? Colors.red.shade400
                          : Colors.black,),
                  TextWidget(
                      text1: 'Obese Class |||',
                      text2: '>=45.0',
                      color: (ans?.toDouble() ?? 0) >= 45.0
                          ? Colors.red
                          : Colors.black,),


                  // TextWidget(text1: 'Very Severely UnderWeight', text2: '<-15.9',answer: ans,),
                  // TextWidget(text1: 'Severely UnderWeight', text2: '16.0 - 16.9',answer: ans),
                  // TextWidget(text1: 'UnderWeight', text2: '17.0 - 18.4',answer: ans),
                  // TextWidget(text1: 'Normal', text2: '18.5 - 24.9',answer: ans),
                  // TextWidget(text1: 'OverWeight', text2: '25.0 - 29.9',answer: ans),
                  // TextWidget(text1: 'Obese Class |', text2: '30.0 - 34.9',answer: ans),
                  // TextWidget(text1: 'Obese Class ||', text2: '35.0 - 39.9',answer: ans),
                  // TextWidget(text1: 'Obese Class |||', text2: '>=45.0',answer: ans),
                ],
              ),
              SizedBox(height: 10,),
              const Text(
                'Normal Weight : 117.9 -159.4 lb',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ageController.clear();
    ftController.clear();
    inchController.clear();
    weightController.clear();
  }
}
