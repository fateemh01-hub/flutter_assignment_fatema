import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF7F3FF),
      ),

      home: const AssignmentPage(),
    );
  }
}

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  // Form
  final formKey = GlobalKey<FormState>();

  // TextFields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final requiredController = TextEditingController();

  // Checkbox
  bool agree = false;

  // Radio
  String? gender;

  // Switch
  bool notifications = false;

  // Slider
  double experience = 5;

  // RangeSlider
  RangeValues age = const RangeValues(20, 30);

  // Dropdown
  String? city;

  // المدن
  List<String> cities = ['صنعاء', 'عدن', 'تعز', 'الحديدة', 'إب'];

  // PopupMenu
  String? language;

  // زر الإرسال
  void submit() {
    bool formOK = formKey.currentState!.validate();

    if (formOK &&
        agree &&
        gender != null &&
        city != null &&
        language != null &&
        age.start < age.end) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'ملخص البيانات',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),

            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الاسم الكريم😊: ${nameController.text}'),
                  const SizedBox(height: 8),

                  Text('البريد الاكتروني 📧: ${emailController.text}'),
                  const SizedBox(height: 8),

                  Text(' الهاتف 📱: ${phoneController.text}'),
                  const SizedBox(height: 8),

                  Text('الحقل المطلوب: ${requiredController.text}'),
                  const SizedBox(height: 8),

                  Text('الموافقة على الشروط: ${agree ? "نعم" : "لا"}'),
                  const SizedBox(height: 8),

                  Text('الجنس: $gender'),
                  const SizedBox(height: 8),

                  Text('الإشعارات: ${notifications ? "مفعلة" : "غير مفعلة"}'),
                  const SizedBox(height: 8),

                  Text('الخبرة: ${experience.toStringAsFixed(1)}'),
                  const SizedBox(height: 8),

                  Text(
                    'العمر: ${age.start.toStringAsFixed(0)} - '
                    '${age.end.toStringAsFixed(0)}',
                  ),
                  const SizedBox(height: 8),

                  Text('المدينة: $city'),
                  const SizedBox(height: 8),

                  Text('اللغة: $language'),
                ],
              ),
            ),

            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('إغلاق'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {});
    }
  }

  // إعادة التعيين
  void reset() {
    setState(() {
      nameController.clear();
      emailController.clear();
      phoneController.clear();
      requiredController.clear();
      

      agree = false;
      gender = null;
      notifications = false;

      experience = 5;
      age = const RangeValues(20, 30);

      city = null;
      language = null;
    });

    formKey.currentState?.reset();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    requiredController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==============================
      // AppBar
      // ==============================
      appBar: AppBar(
        title: const Text(
          'Flutter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,

        backgroundColor: Colors.deepPurple,

        elevation: 4,
      ),

      // ==============================
      // الصفحة
      // ==============================
      body: Form(
        key: formKey,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // ==========================
              // 1 TextField
              // ==========================
              const Text(
                '1.الاسم الكريم ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: nameController,

                decoration: const InputDecoration(
                  labelText:'ادخل الاسم لطفا 😊',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // ==========================
              // 2 البريد
              // ==========================
              const Text(
                '2. البريد الإلكتروني',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText:'البريد الاكتروني📧',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),

                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'ادخل البريد الاكتروني بطريقه الصحيحه😡';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // ==========================
              // 3 الهاتف
              // ==========================
              const Text(
                '3. رقم الهاتف',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: phoneController,

                keyboardType: TextInputType.phone,

                decoration: const InputDecoration(
                  labelText:'رقم الهاتف📱',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),

                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'رقم الهاتف يجب أن يكون 10 أرقام';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // ==========================
              // 4 حقل مطلوب
              // ==========================
              const Text(
                '4. نوع الوظيفة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: requiredController,

                decoration: const InputDecoration(
                  labelText: 'هذا الحقل مطلوب',
                  prefixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // ==========================
              // 5 Checkbox
              // ==========================
              const Text(
                '5. الموافقة على الشروط',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,

                title: const Text('أوافق على الشروط والأحكام'),

                value: agree,

                activeColor: Colors.deepPurple,

                onChanged: (value) {
                  setState(() {
                    agree = value ?? false;
                  });
                },
              ),

              if (!agree)
                const Text(
                  'يجب الموافقة على الشروط',
                  style: TextStyle(color: Colors.red),
                ),

              const SizedBox(height: 15),

              // ==========================
              // 6 Radio
              // ==========================
              const Text(
                '6. الجنس',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              RadioListTile<String>(
                title: const Text('ذكر👨'),

                value: 'ذكر',

                groupValue: gender,

                activeColor: const Color.fromARGB(255, 233, 30, 142),

                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text('أنثى👧'),

                value: 'أنثى',

                groupValue: gender,

                activeColor: const Color.fromARGB(255, 233, 30, 142),

                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),

              if (gender == null)
                const Text('اختر الجنس', style: TextStyle(color: Colors.red)),

              const SizedBox(height: 15),

              // ==========================
              // 7 Switch
              // ==========================
              const Text(
                '7. الإشعارات',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              SwitchListTile(
                contentPadding: EdgeInsets.zero,

                title: const Text('تفعيل الإشعارات'),

                value: notifications,

                activeColor: const Color.fromARGB(255, 233, 30, 142),

                onChanged: (value) {
                  setState(() {
                    notifications = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              // ==========================
              // 8 Slider
              // ==========================
              const Text(
                '8. الخبرة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              Text('مستوى الخبرة: ${experience.toStringAsFixed(0)}'),

              Slider(
                min: 0,
                max: 10,

                divisions: 10,

                value: experience,

                activeColor: Colors.deepPurple,

                label: experience.toStringAsFixed(0),

                onChanged: (value) {
                  setState(() {
                    experience = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              // ==========================
              // 9 RangeSlider
              // ==========================
              const Text(
                '9. العمر',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              Text(
                'العمر: ${age.start.toStringAsFixed(0)} - '
                '${age.end.toStringAsFixed(0)}',
              ),

              RangeSlider(
                min: 0,
                max: 50,

                divisions: 50,

                values: age,

                activeColor: const Color.fromARGB(255, 233, 30, 142),

                labels: RangeLabels(
                  age.start.toStringAsFixed(0),
                  age.end.toStringAsFixed(0),
                ),

                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
              ),

              if (age.start >= age.end)
                const Text(
                  'نطاق العمر غير صحيح',
                  style: TextStyle(color: Colors.red),
                ),

              const SizedBox(height: 15),

              // ==========================
              // 10 Dropdown
              // ==========================
              const Text(
                '10. المدينة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              DropdownButtonFormField<String>(
                initialValue: city,

                decoration: const InputDecoration(
                  labelText: 'اختر المدينة',
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),

                items: cities.map((cityName) {
                  return DropdownMenuItem(
                    value: cityName,
                    child: Text(cityName),
                  );
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },

                validator: (value) {
                  if (value == null) {
                    return 'اختر المدينة';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // ==========================
              // 11 PopupMenu
              // ==========================
              const Text(
                '11. اللغة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() {
                    language = value;
                  });
                },

                itemBuilder: (context) {
                  return const [
                    PopupMenuItem(value: 'العربية', child: Text('العربية')),

                    PopupMenuItem(value: 'English', child: Text('English')),
                  ];
                },

                child: Container(
                  padding: const EdgeInsets.all(14),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    border: Border.all(color: Colors.deepPurple),

                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(language ?? 'اختر اللغة'),

                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ),
              ),

              if (language == null)
                const Padding(
                  padding: EdgeInsets.only(top: 8),

                  child: Text(
                    'اختر اللغة',
                    style: TextStyle(color: Colors.red),
                  ),
                ),

              const SizedBox(height: 30),

              // ==========================
              // زر إرسال
              // ==========================
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: submit,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,

                    foregroundColor: Colors.white,

                    padding: const EdgeInsets.all(15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: const Text('إرسال', style: TextStyle(fontSize: 18)),
                ),
              ),

              const SizedBox(height: 10),

              // ==========================
              // زر إعادة التعيين
              // ==========================
              SizedBox(
                width: double.infinity,

                child: OutlinedButton(
                  onPressed: reset,

                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.pink,

                    side: const BorderSide(color: Colors.pink),

                    padding: const EdgeInsets.all(14),
                  ),

                  child: const Text(
                    'إعادة تعيين',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
