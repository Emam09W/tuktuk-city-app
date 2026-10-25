import 'package:flutter/material.dart';

void main() {
  runApp(const TukTukApp());
}

class TukTukApp extends StatelessWidget {
  const TukTukApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'توك توك مدينتي',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDriver = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('توك توك مدينتي 🛺'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'مشوارك في بلدك أسهل وأأمن',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('راكب')),
                ButtonSegment(value: true, label: Text('سائق')),
              ],
              selected: {isDriver},
              onSelectionChanged: (value) {
                setState(() => isDriver = value.first);
              },
            ),
            const SizedBox(height: 20),
            if (!isDriver) ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'مكان الركوب',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              const SizedBox(height: 12),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'الوجهة',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flag),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.payments),
                  title: const Text('السعر التقديري'),
                  subtitle: const Text(
                    'السعر تجريبي ويتحدد فعليًا حسب الاتفاق والمسافة',
                  ),
                ),
              ),
              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('طلب تجريبي فقط، لم يتم إرسال سائق'),
                    ),
                  );
                },
                icon: const Icon(Icons.local_taxi),
                label: const Text('اطلب توك توك'),
              ),
            ] else ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'اسم السائق',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'يلزم التحقق من الهوية قبل تفعيل حساب السائق.',
              ),
              FilledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('التسجيل تجريبي ولم يتم حفظ البيانات'),
                    ),
                  );
                },
                child: const Text('تسجيل كسائق'),
              ),
            ],
            const Divider(height: 36),
            const ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('اشتراكات المدارس والشغل'),
              subtitle: Text('فكرة اشتراك شهري للمشاوير المتكررة'),
            ),
            const ListTile(
              leading: Icon(Icons.search),
              title: Text('المفقودات'),
              subtitle: Text('إمكانية الإبلاغ عن شيء مفقود في التوك توك'),
            ),
            const ListTile(
              leading: Icon(Icons.shield),
              title: Text('الأمان'),
              subtitle: Text('التحقق من السائقين قبل التشغيل الفعلي'),
            ),
          ],
        ),
      ),
    );
  }
}
