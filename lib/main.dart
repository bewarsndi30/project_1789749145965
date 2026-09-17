import 'package:flutter/material.dart';

void main() {
  runApp(const KokanApp());
}

class KokanApp extends StatelessWidget {
  const KokanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'هەژمارکرنا خالێن کۆکانێ',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1E2E),
        primaryColor: const Color(0xFF89B4FA),
      ),
      home: const KokanHomePage(),
    );
  }
}

class KokanHomePage extends StatefulWidget {
  const KokanHomePage({super.key});

  @override
  State<KokanHomePage> createState() => _KokanHomePageState();
}

class _KokanHomePageState extends State<KokanHomePage> {
  final TextEditingController _vekrController = TextEditingController();
  final TextEditingController _girtenController = TextEditingController();
  final TextEditingController _ferqController = TextEditingController();
  final TextEditingController _neController = TextEditingController();

  int _totalScore = 0;

  void _calculateScore() {
    int vekr = int.tryParse(_vekrController.text) ?? 0;
    int girten = int.tryParse(_girtenController.text) ?? 0;
    int ferq = int.tryParse(_ferqController.text) ?? 0;
    int ne = int.tryParse(_neController.text) ?? 0;

    setState(() {
      _totalScore = (vekr * 20) + (girten * 10) + (ferq * 5) - (ne * 10);
    });
  }

  Widget _buildInputField(String labelText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            labelText,
            style: const TextStyle(color: Color(0xFFCDD6F4), fontSize: 14),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFF313244),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'بەرنامێ هەژمارکرنا کۆکانێ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF181825),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildInputField('چەند ترقە ڤەکرن؟', _vekrController),
            _buildInputField('چەند خال گرتن؟', _girtenController),
            _buildInputField('چەند خال فرقە؟', _ferqController),
            _buildInputField('چەند ترقە نە؟', _neController),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _calculateScore,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF89B4FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'هەژماربکە',
                  style: TextStyle(
                    color: Color(0xFF11111B),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF313244),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'ئەنجامێ کۆمکراڤی: $_totalScore خال',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFF9E2AF),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}