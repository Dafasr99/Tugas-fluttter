# Tugas 7

# Pertanyaan beserta jawaban

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak memiliki state (keadaan) internal yang berubah selama widget tersebut hidup. Widget ini hanya mengambil nilai dari properti yang diberikan oleh parent widget-nya saat dibuat. Stateless widget digunakan untuk membangun bagian dari antarmuka pengguna yang tidak perlu diperbarui atau diubah secara dinamis, seperti tampilan label atau ikon.

Stateful widget, di sisi lain, adalah widget yang memiliki state internal yang dapat berubah selama widget tersebut hidup. Widget ini menggunakan StatefulWidget sebagai kelas induk, yang memiliki sebuah metode createState() yang mengembalikan sebuah instance dari kelas State yang mengontrol state dari widget tersebut. Stateful widget digunakan untuk membangun bagian dari antarmuka pengguna yang memerlukan pembaruan atau perubahan dinamis, seperti input pengguna atau tampilan daftar item.

Perbedaan utama antara Stateless dan Stateful widget adalah bahwa stateless widget tidak memiliki state internal yang dapat diubah, sedangkan stateful widget memiliki state internal yang dapat diubah. Oleh karena itu, stateful widget menggunakan metode setState() untuk memperbarui tampilan ketika terjadi perubahan state, sementara stateless widget tidak perlu melakukan hal ini. Karena stateful widget memiliki state internal yang dapat berubah, mereka membutuhkan lebih banyak sumber daya dan kinerja daripada stateless widget.

## Sebutkan seluruh widget yang kamu pakai di proyek kali ini dan jelaskan fungsinya masing-masing.

Berikut adalah daftar seluruh widget yang digunakan pada proyek kali ini:

- Scaffold: Widget ini digunakan sebagai kerangka umum dari sebuah halaman atau layar pada aplikasi Flutter. Widget ini menyediakan struktur dasar seperti AppBar, body, drawer, dan lain-lain.

- AppBar: Widget ini digunakan untuk menampilkan sebuah header atau bilah atas pada aplikasi. Widget ini sering digunakan untuk menampilkan judul halaman, ikon kembali, menu navigasi, dan lain-lain.

- SingleChildScrollView: Widget ini digunakan untuk membuat sebuah widget yang dapat di-scroll secara vertikal atau horizontal. Widget ini sering digunakan ketika kita ingin menampilkan widget yang memiliki banyak konten atau tidak muat di layar.

- Padding: Widget ini digunakan untuk memberikan jarak atau margin pada sebuah widget. Widget ini sering digunakan untuk mengatur jarak antara widget dengan widget lainnya.

- Column: Widget ini digunakan untuk menampilkan widget secara vertikal, satu per satu. Widget ini sering digunakan untuk menampilkan beberapa widget yang ingin ditampilkan secara berurutan.

- GridView: Widget ini digunakan untuk menampilkan widget secara grid, baik itu horizontal atau vertikal. Widget ini sering digunakan untuk menampilkan beberapa widget dalam bentuk grid.

- Material: Widget ini digunakan untuk memberikan sebuah konten yang dapat di-ink atau dicetak. Widget ini biasanya digunakan sebagai kontainer atau background dari sebuah widget.

- InkWell: Widget ini digunakan untuk memberikan sebuah area yang responsif terhadap sentuhan. Widget ini sering digunakan ketika kita ingin menambahkan fungsi onTap pada sebuah widget.

- Container: Widget ini digunakan untuk membuat sebuah kotak atau wadah untuk menampilkan konten. Widget ini sering digunakan untuk menambahkan dekorasi atau mengatur layout dari sebuah widget.

- Text: Widget ini digunakan untuk menampilkan sebuah teks. Widget ini sering digunakan untuk menampilkan judul, deskripsi, atau keterangan dari sebuah widget.

- Icon: Widget ini digunakan untuk menampilkan sebuah ikon. Widget ini sering digunakan untuk menambahkan gambar atau simbol ke sebuah widget.

- SnackBar: Widget ini digunakan untuk menampilkan sebuah pesan yang muncul sementara waktu pada bagian bawah layar. Widget ini sering digunakan ketika kita ingin memberikan sebuah pesan singkat kepada pengguna.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).

- Membuka Terminal dan memasuki direktori pribadi dan meng-generate proyek Flutter dan masuk ke dalam direktori proyek (APP_NAME pada proyek ini adalah study_tracker).
```
flutter create study_tracker
cd study_tracker
```
- Membuat file baru bernama menu.dart pada folder lib dan meng-import
```
import 'package:flutter/material.dart';
```

- Setelah itu memperbaiki kode pada file main.dart dengan menambahkan import 
```
Import library 'package:study_tracker/menu.dart'
```

- Berikutnya pada file main.dart mengubah isi kode primarySwatch menjadi Colors.green.
```
primarySwatch: Colors.green,
```

- menghapus title yang ada pada const MyHomePage(title: 'Flutter Demo Home Page') sehingga menjadi:
```
const MyHomePage()
```

- Mengubah sifat widget halaman dari stateful menjadi stateless pada file menu.dart. Berikutnya ubag ({super.key, required this.title}) menjadi ({Key? key}) : super(key: key);. setelah itu menghapus final String title; sampai bawah serta tambahkan Widget build sehingga kode terlihat seperti di bawah.

```
class MyHomePage extends StatelessWidget {
    const MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```

- Setelah mengubah sifat widget halaman menu menjadi stateless, berikutnya menambahkan teks dan grid buttons yang akan menjadi menu aplikasi.
```
return Scaffold(
      appBar: AppBar(
        // Set title aplikasi menjadi Study Tracker
        title: const Text( 
          'Study Tracker',
        ),
      ),
      body: SingleChildScrollView( // Widget wrapper yang dapat discroll
        child: Padding( 
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column( // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Selamat datang!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: <Widget>[
                  Material(
                    color: const Color.fromARGB(255, 101, 76, 175),
                    child: InkWell( // Area responsive terhadap sentuhan
                      onTap: () {
                        // Memunculkan SnackBar ketika diklik
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Kamu telah menekan tombol Lihat Riwayat Tugas!")));
                      },
                      child: Container( // Container untuk menyimpan Icon dan Text
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.list_alt,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Text(
                                "Lihat Study Tracker",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: const Color.fromARGB(255, 252, 43, 1), 
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Kamu telah menekan tombol Tambah Tugas!")));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_box,
                                color: Colors.white,
                                size: 40.0,
                              ),
                              Padding(padding: EdgeInsets.all(1)),
                              Text(
                                "Tambah Tugas",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: const Color.fromARGB(255, 239, 4, 114),
                    child: InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Kamu telah menekan tombol Logout!")));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                // Kamu juga dapat mengggunakan icon lainnya
                                // seperti Icons.logout
                                Icons.door_back_door,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              Padding(padding: EdgeInsets.all(3)),
                              Text(
                                "Logout",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

- Merubah warna
```
Material(
    color: const Color.fromARGB(255, 101, 76, 175),
```


# Tugas 8

### Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator pada Flutter adalah sebuah widget yang sangat penting dalam mengatur navigasi antar halaman pada aplikasi. Dalam Flutter, setiap halaman pada aplikasi dianggap sebagai sebuah widget. Dalam Navigator, setiap halaman pada aplikasi diwakili oleh sebuah widget dan setiap transisi navigasi antar halaman dilakukan dengan mengubah widget yang ditampilkan pada layar.

Navigator menyediakan berbagai macam fitur navigasi, mulai dari push, pop, dan replace. Method replace digunakan untuk mengganti halaman yang sedang ditampilkan dengan halaman baru. Berikut adalah contoh kode untuk menggunakan method replace pada Navigator:
```
Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (context) => NewPage(),
  ),
);
```

Referensi:
barajacoding.or.id

### Sebutkan dan jelaskan tipe routing yang disediakan oleh Navigator.
Navigator di Flutter menyediakan beberapa tipe routing yang dapat digunakan untuk mengelola navigasi dan pergantian halaman dalam aplikasi. Berikut adalah beberapa tipe routing yang disediakan oleh Navigator:

- MaterialPageRoute: Ini adalah tipe routing default yang digunakan oleh Navigator jika tidak ada named routes yang cocok. Dalam tipe ini, Anda membuat instance dari MaterialPageRoute dan mengirimkan widget halaman baru sebagai parameter. Metode push pada Navigator digunakan untuk menambahkan halaman baru menggunakan MaterialPageRoute. MaterialPageRoute juga mengatur transisi animasi default antara halaman lama dan halaman baru. Contoh penggunaan MaterialPageRoute:
```
Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
```
- CupertinoPageRoute: Tipe routing ini digunakan untuk memberikan transisi yang khusus dan pengalaman navigasi yang mirip dengan aplikasi Flutter pada platform iOS. Ini menyediakan efek transisi yang mirip dengan navigasi pada platform iOS. Contoh penggunaan CupertinoPageRoute:
```
Navigator.push(context, CupertinoPageRoute(builder: (context) => HomeScreen()));
```
- PageRouteBuilder: Tipe routing ini memungkinkan Anda membuat rute kustom dengan mengontrol parameter transisi dan animasi secara manual. Anda dapat mengatur durasi, fungsi tween, dan lainnya untuk membuat animasi transisi yang disesuaikan sesuai kebutuhan. PageRouteBuilder membutuhkan pageBuilder untuk mengembalikan widget halaman baru dan transitionsBuilder untuk mengatur animasi transisi antara halaman lama dan halaman baru. Contoh penggunaan PageRouteBuilder:
```
Navigator.push(context, PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(opacity: animation, child: child);
  },
));
```
- MaterialPage<T>: Tipe routing ini digunakan dalam situasi tertentu, seperti ketika Anda ingin mengganti halaman dalam konteks bottom navigation bar. Ini memungkinkan Anda untuk mengganti halaman tetapi tetap mempertahankan tampilan bottom navigation bar. Contoh penggunaan MaterialPage:
```
Navigator.of(context).push(MaterialPage(child: HomeScreen()));
```
- PopupRoute: Ini adalah tipe routing yang digunakan ketika Anda ingin menampilkan halaman sebagai dialog atau overlay di atas halaman utama. Halaman ini muncul sebagai lapisan di atas halaman utama dan memerlukan interaksi sebelum kembali ke halaman sebelumnya. Contoh penggunaan PopupRoute:
```
Navigator.of(context).push(PopupRoute(builder: (context) => DialogScreen()));
```
### Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
```
Berikut adalah beberapa contoh jenis-jenis event yang umum digunakan dalam Flutter:

onPressed: Event ini digunakan pada tombol atau elemen yang dapat ditekan (misalnya: RaisedButton, IconButton) untuk menentukan tindakan yang akan dijalankan ketika tombol tersebut ditekan.

onSubmitted: Event ini digunakan pada input field (misalnya: TextField, TextFormField) untuk menentukan tindakan yang akan dijalankan ketika pengguna menekan tombol "Submit" atau "Enter" setelah memasukkan nilai ke dalam input field.

onChanged: Event ini digunakan pada input field (misalnya: TextField, TextFormField) untuk menentukan tindakan yang akan dijalankan ketika nilai input berubah. Event ini biasanya digunakan untuk memperbarui state aplikasi sesuai dengan perubahan input.

onTap: Event ini digunakan pada elemen yang dapat diklik (misalnya: Container, GestureDetector) untuk menentukan tindakan yang akan dijalankan ketika elemen tersebut diklik.

onLongPress: Event ini digunakan pada elemen yang dapat ditekan lama (misalnya: GestureDetector) untuk menentukan tindakan yang akan dijalankan ketika elemen tersebut ditekan lama.

onScroll: Event ini digunakan pada widget yang dapat di-scroll (misalnya: ListView, SingleChildScrollView) untuk menentukan tindakan yang akan dijalankan ketika pengguna melakukan scroll pada widget tersebut.

onDoubleTap: Event ini digunakan pada elemen yang dapat diklik (misalnya: GestureDetector) untuk menentukan tindakan yang akan dijalankan ketika elemen tersebut diklik dua kali dengan cepat.

onDragStart, onDragUpdate, onDragEnd: Event ini digunakan pada elemen yang dapat di-drag (misalnya: Draggable) untuk menentukan tindakan yang akan dijalankan saat drag dimulai, drag diperbarui, atau drag berakhir.

onPageChanged: Event ini digunakan pada widget yang dapat berubah halaman (misalnya: PageView) untuk menentukan tindakan yang akan dijalankan ketika halaman berubah.

onFocusChanged: Event ini digunakan pada elemen yang dapat mendapatkan fokus (misalnya: TextField, TextFormField) untuk menentukan tindakan yang akan dijalankan ketika fokus masuk atau keluar dari elemen tersebut.
```

### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
```
Scaffold: Widget Scaffold adalah kerangka atau tata letak dasar yang umum digunakan dalam aplikasi Flutter. Ini menyediakan struktur tampilan dasar dengan menyediakan AppBar, body, drawer, dan sebagainya.

AppBar: Widget AppBar digunakan untuk menampilkan bilah aplikasi di bagian atas layar. Ini biasanya berisi judul aplikasi, ikon aksi, dan fungsi navigasi lainnya.

Text: Widget Text digunakan untuk menampilkan teks statis di aplikasi. Anda dapat mengatur gaya, ukuran, warna, dan sebagainya untuk menyesuaikan penampilan teks.

DrawerMenu: Widget DrawerMenu digunakan untuk membuat menu geser yang dapat diakses dengan menggeser sisi layar. Biasanya digunakan untuk menampilkan navigasi atau opsi aplikasi.

ListTile: Widget ListTile digunakan untuk menampilkan item dalam daftar atau menu. Ini menyediakan tampilan yang konsisten dan nyaman, termasuk ikon, teks, dan fungsi onTap yang dapat ditetapkan.

TextButton: Widget TextButton digunakan untuk membuat tombol teks yang dapat diklik. Ini biasanya digunakan untuk tindakan atau interaksi pengguna yang sederhana.

SingleChildScrollView: Widget SingleChildScrollView digunakan untuk membuat tata letak yang dapat discroll secara vertikal. Ini berguna saat konten di dalamnya melebihi ukuran layar dan perlu diakses dengan menggulir.

Drawer: Widget Drawer digunakan untuk membuat konten menu yang muncul ketika drawer dibuka. Ini digunakan bersama dengan AppBar dan DrawerMenu untuk menyediakan navigasi dan opsi aplikasi.

Dialog: Widget Dialog digunakan untuk menampilkan jendela dialog atau popup di atas tampilan utama aplikasi. Ini memungkinkan interaksi pengguna yang terbatas sampai dialog ditutup.

Form: Widget Form digunakan untuk membuat formulir interaktif di aplikasi. Ini menyediakan fungsi validasi, pengumpulan data, dan pengiriman data ke server.

TextFormField: Widget TextFormField digunakan di dalam Form untuk memasukkan dan mengelola input teks dari pengguna. Ini menyediakan validasi, pemformatan, dan fitur-fitur lain yang terkait dengan masukan pengguna.
```

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).
- Membuat sebuah folder baru dengan nama widgets pada folder lib. Folder ini akan digunakan untuk menyimpan widgets pada aplikasi study tracker. Berikutnya membuat sebuah file baru dengan nama drawer.dart pada folder lib/widgets dan meng-import beberapa file yang akan digunakan ke dalam drawer.dart.
```
import 'package:study_tracker/pages/menu.dart';
import 'package:flutter/material.dart';
```
 - Menambahkan kode berikut pada drawer.dart
 ```
 class DrawerMenu extends StatelessWidget {

  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [          
        ],
      ),
    );
  }
}
```
- Menambahkan halaman menu yang akan dimunculkan pada drawer/hamburger menu dalam bentuk ListTile.
```
child: Column(
      children: [
        // Menambahkan clickable menu
        ListTile(
          title: const Text('Menu'),
          onTap: () {
            // Route menu ke halaman utama
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
```
- Membuka pages/menu.dart dan menambahkan drawer ke halaman tersebut dengan menambahkan potongan kode berikut.
```
appBar: AppBar(
  title: const Text(
    'Money Tracker',
  ),
),
drawer: const DrawerMenu(), // Menambahkan drawer pada halaman
body: SingleChildScrollView(
```
- Berikutnya halaman membuat form dengan menambahkan file baru pada folder lib/pages dengan nama form.dart serta menambahkan boilerplate berikut ke dalam file tersebut.
```
class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form'),
            ),
            drawer: const DrawerMenu(),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('Hello World!'),
                    ],
                ),
            ),
        );
    }
}
```

- Setelah itu menambahkan beberapa impor kedalam kode tersebut
```
import 'package:study_tracker/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
```
/lib/pages/menu.dart
```
import 'package:study_tracker/pages/form.dart';
```
lib/widgets/drawer.dart
```
import 'package:study_tracker/pages/form.dart';
```
- Mengubah fungsi tombol Tambah Transaksi pada lib/pages/menu.dart agar mengarahkan ke halaman MyFormPage. Dengan melakukan redirection dengan menambahkan kode berikut pada bagian onTap: () { } yang ada pada Container tombol Tambah Transaksi pada MyHomePage.
```
Container(
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const MyFormPage()),
    );
  }
),
```

- Berikutnya mencoba untuk menambahkan dua tipe input form yang ada di Flutter, yaitu TextFormField dan DropdownButton. Dengan mengubah widget Center menjadi Form.
```
body: Form(),
```
- Menambahkan form key sebagai handle dari state, validasi, dan penyimpanan form.
```
...
class _MyFormPageState extends State<MyFormPage> {
final _formKey = GlobalKey<FormState>();

@override
...
    body: Form(
        key: _formKey,
    ),
...
```

- Membuat widget SingleChildScrollView sebagai child dari widget Form.
```
...
body: Form(
  key: _formKey,
  child: SingleChildScrollView(),
),
...
```

- Membuat widget Container sebagai child dari widget SingleChildScrollView.
```
...
child: SingleChildScrollView(
  child: Container(),
),
...
```

- Menambahkan padding pada widget Container agar tampilan widget menjadi rapi. Sebagai contoh, kita akan memakai padding sebesar 20 pixels.
```
...
child: Container(
  padding: const EdgeInsets.all(20.0),
),
...
```

- Mmebuat widget Column sebagai child dari widget Container.
```
...
child: Container(
  padding: const EdgeInsets.all(20.0),
  child: Column(),
),
...
```

- Membuat widget TextFormField yang dibungkus oleh Padding sebagai salah satu children dari widget Column. Selain itu, tambahkan variabel baru sebagai placeholder dari nilai yang diketik pada TextFormField nantinya. Seta TextFormField sebagai penampung variabel nama transaksi. Berikut adalah contohnya.
```
...
class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaTugas = "";
  String _namaMatkul = "";
  int persentaseProgress = 0;
  String _deskripsiTugas = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
          title: Text('Form'),
      ),
      drawer: const DrawerMenu(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Tugas Pemrograman",
                      labelText: "Nama Tugas",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.edit_note),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _namaTugas = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _namaTugas = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama tugas tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: PBP",
                      labelText: "Nama Mata Kuliah",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.edit_note),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _namaMatkul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _namaMatkul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama mata kuliah tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
...
```

- Kemudia Menambahkan fungsi showDialog() pada bagian onPressed() dan munculkan widget Dialog pada fungsi tersebut. Berikut adalah contoh potongan kodenya.
```
...
onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          child: Container(
            child: ListView(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              shrinkWrap: true,
              children: <Widget>[
                Center(child: const Text('Informasi Data')),
                SizedBox(height: 20),
                // TODO: Munculkan informasi yang didapat dari form
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Kembali'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
},
...
```

# Tugas 9

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu dengan menggunakan metode jsonDecode() yang disediakan oleh Flutter. Metode ini memungkinkan kita untuk mengonversi data JSON menjadi objek Dart secara langsung tanpa harus membuat model terlebih dahulu.

Namun, dalam banyak kasus, membuat model terlebih dahulu sebelum pengambilan data JSON memiliki beberapa keuntungan. Berikut adalah alasan mengapa membuat model sebelum melakukan pengambilan data JSON bisa lebih baik:

Struktur data yang jelas: Dengan membuat model, kita dapat mendefinisikan struktur data yang jelas dan tipe data yang tepat untuk setiap properti. Ini membantu dalam pemahaman dan pengelolaan data dengan lebih baik.

Kemudahan penggunaan dan pemeliharaan: Dengan menggunakan model, kita dapat dengan mudah mengakses dan memanipulasi data dengan mengandalkan properti dan metode yang didefinisikan di dalam model. Ini membuat kode lebih terstruktur dan mudah dipelihara.

Validasi data: Dengan membuat model, kita dapat menambahkan validasi pada properti untuk memastikan data yang diterima sesuai dengan kebutuhan aplikasi. Ini membantu menghindari kesalahan dan masalah data yang tidak valid.

IDE Support: Saat menggunakan model, IDE atau editor kode yang digunakan dapat memberikan dukungan yang lebih baik dalam mengenali properti, memberikan saran otomatis, dan membantu dalam refaktorisasi kode.

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter melibatkan beberapa langkah, yaitu:

Mengambil data JSON: Pertama, kita perlu mengambil data JSON dari sumbernya. Ini bisa dilakukan dengan menggunakan package http untuk melakukan permintaan HTTP ke API atau menggunakan package seperti dio atau retrofit untuk pengambilan data JSON melalui REST API.

Mendekode JSON: Setelah mendapatkan respons JSON, kita perlu mendekode JSON menjadi objek Dart yang dapat digunakan dalam aplikasi. Untuk melakukan ini, kita dapat menggunakan fungsi jsonDecode() yang disediakan oleh package dart:convert untuk mengonversi string JSON menjadi objek Dart.

Membentuk objek: Selanjutnya, kita perlu membentuk objek dari data JSON yang telah didekode. Jika kita telah membuat model sebelumnya, kita dapat menggunakan model tersebut untuk membuat objek dengan mengisi nilainya sesuai dengan data dari JSON. Jika tidak, kita dapat menggunakan Map atau List untuk mewakili struktur data JSON.

Menampilkan data: Setelah objek telah dibentuk, kita dapat menggunakan widget-widget Flutter seperti Text, ListView, GridView, atau widget kustom lainnya untuk menampilkan data tersebut. Widget-widget ini dapat diisi dengan data yang telah diambil dari JSON dan diubah menjadi objek Dart.

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter melibatkan beberapa langkah berikut:

Flutter: Pada sisi Flutter, pengguna akan memasukkan data akun seperti nama pengguna dan kata sandi melalui formulir atau input field yang disediakan oleh Flutter. Data ini akan dikirim ke backend Django untuk proses autentikasi.

Pengiriman Data ke Django: Data akun yang dimasukkan oleh pengguna akan dikirim dari Flutter ke backend Django menggunakan HTTP POST request. Data tersebut akan dikirim ke API endpoint yang ditentukan di backend Django.

Django: Di sisi backend Django, API endpoint akan menerima data yang dikirim dari Flutter. Django kemudian akan memproses data tersebut untuk melakukan autentikasi. Django memiliki fitur autentikasi yang kuat dan telah menyediakan mekanisme seperti Token Authentication, Session Authentication, atau OAuth untuk melakukan proses autentikasi.

Verifikasi Akun: Django akan memverifikasi data akun yang diterima dari Flutter dengan basis data pengguna yang tersimpan. Proses ini mencakup verifikasi nama pengguna dan kata sandi yang sesuai dengan akun yang valid. Jika data akun valid, Django akan menghasilkan token atau session yang akan digunakan untuk otentikasi selanjutnya.

Penanganan Autentikasi Berhasil: Jika autentikasi berhasil, Django akan memberikan tanggapan dengan kode status HTTP yang sesuai (misalnya, 200 OK) dan data tambahan seperti token atau informasi pengguna yang dapat digunakan untuk otorisasi dan otentikasi selanjutnya.

Tanggapan ke Flutter: Backend Django akan mengirim tanggapan ke Flutter yang berisi informasi autentikasi yang diperlukan, seperti token autentikasi atau session ID. Tanggapan ini akan diterima oleh Flutter dan dapat digunakan untuk menyimpan status otentikasi pengguna.

Menampilkan Menu pada Flutter: Setelah proses autentikasi berhasil, Flutter dapat menampilkan menu atau halaman berdasarkan status otentikasi pengguna. Jika pengguna berhasil masuk, menu yang sesuai akan ditampilkan dengan opsi tambahan dan tampilan yang relevan. Jika autentikasi gagal, Flutter dapat menampilkan pesan kesalahan atau mengarahkan pengguna ke halaman masuk kembali.

### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
Scaffold: Scaffold adalah sebuah widget yang menyediakan struktur tata letak dasar untuk aplikasi Material Design. Scaffold biasanya digunakan sebagai "kerangka" utama dalam membangun antarmuka aplikasi Flutter.

AppBar: AppBar adalah sebuah widget yang digunakan untuk menampilkan sebuah bilah aplikasi yang berisi judul dan berbagai macam aksi seperti tombol kembali dan menu navigasi. AppBar biasanya ditempatkan di bagian atas layar.

Provider: Provider adalah sebuah widget yang digunakan untuk mengelola dan menyediakan state atau data kepada widget lain di dalam aplikasi. Provider memungkinkan untuk mengimplementasikan pola manajemen state seperti "InheritedWidget" atau "ScopedModel" dengan cara yang lebih sederhana.

MaterialApp: MaterialApp adalah sebuah widget yang menyediakan konfigurasi aplikasi global seperti judul, tema, navigasi, dan masih banyak lagi. MaterialApp biasanya digunakan sebagai "root" dari pohon widget aplikasi.

Container: Container adalah sebuah widget yang digunakan untuk mengatur tata letak dan penampilan visual dari widget lainnya. Container dapat digunakan untuk mengatur ukuran, margin, padding, warna latar belakang, dan dekorasi lainnya.

Column: Column adalah sebuah widget yang digunakan untuk menempatkan widget-widget dalam susunan vertikal. Widget-widget tersebut akan ditampilkan dalam urutan yang ditentukan dan akan mengisi ruang secara vertikal.

ElevatedButton: ElevatedButton adalah sebuah widget yang digunakan untuk membuat sebuah tombol yang tampil dengan tampilan yang "menonjol" (elevated) dan biasanya digunakan sebagai tombol aksi.

FutureBuilder: FutureBuilder adalah sebuah widget yang digunakan untuk menangani dan mengubah tampilan berdasarkan status hasil dari sebuah Future. FutureBuilder menerima sebuah Future dan builder function yang akan dipanggil ketika status Future berubah.

Center: Center adalah sebuah widget yang digunakan untuk menengahkan widget yang ada di dalamnya secara horizontal dan vertikal.

ListView.builder: ListView.builder adalah sebuah widget yang digunakan untuk menampilkan daftar elemen dalam bentuk scrollable. ListView.builder membangun elemen secara dinamis berdasarkan jumlah elemen yang ditentukan.

ListTile: ListTile adalah sebuah widget yang digunakan untuk menampilkan sebuah item dalam daftar, biasanya digunakan dalam ListView atau ListTile.

MaterialPageRoute: MaterialPageRoute adalah sebuah widget yang digunakan untuk menentukan rute navigasi dan animasi transisi antar halaman dalam aplikasi Flutter.

SnackBar: SnackBar adalah sebuah widget yang digunakan untuk menampilkan pesan singkat yang muncul di bagian bawah layar. SnackBar biasanya digunakan untuk memberikan umpan balik kepada pengguna tentang tindakan yang berhasil atau gagal.

AlertDialog: AlertDialog adalah sebuah widget yang digunakan untuk menampilkan dialog dengan konten dan aksi yang ditentukan. AlertDialog biasanya digunakan untuk menampilkan pesan penting atau meminta konfirmasi dari pengguna.

TextField: TextField adalah sebuah widget yang digunakan untuk mengambil input teks dari pengguna. TextField menyediakan berbagai macam pengaturan seperti validasi, tampilan, dan tindakan yang terkait dengan input teks.

SizedBox: SizedBox adalah sebuah widget yang digunakan untuk mengatur ukuran lebar dan tinggi sebuah widget. SizedBox biasanya digunakan untuk memberikan spasi atau mengatur ukuran widget secara eksplisit.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial).

- Melakukan migrasi PaaS dengan menggunakan Dom Cloud Hosting

- Mengintergrasikan Sistem Autentikasi Web Service Django dengan Aplikasi Flutter
```
Membuat django-app bernama authentication dengan perintah python manage.py startapp authentication pada aplikasi Django yang telah kamu buat sebelumnya.

Menambahkan authentication ke INSTALLED_APPS pada django_project/settings.py aplikasimu.

Menjalankan perintah pip install django-cors-headers untuk menginstal library yang dibutuhkan.

Menambahkan corsheaders ke INSTALLED_APPS pada django_project/settings.py aplikasi.

Menambahkan corsheaders.middleware.CorsMiddleware ke MIDDLEWARE pada django_tutorial/settings.py aplikasi.

Membuat sebuah variabel baru di django_project/settings.py dengan ama CORS_ALLOW_ALL_ORIGINS dan berikan nilai True, (CORS_ALLOW_ALL_ORIGINS=True).

Membuat sebuah variabel baru di django_project/settings.py dengan nama CORS_ALLOW_CREDENTIALS dan berikan nilai True, (CORS_ALLOW_CREDENTIALS=True).

Menambakan beberapa variabel berikut ini pada django_project/settings.py aplikasi.
```
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
Membuat sebuah metode view untuk login pada authentication/views.py.
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email/password."
        }, status=401)
```
Membuat file urls.py pada folder authentication dan tambahkan kode berikut.
```
from django.urls import path
from authentication.views import *

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```
Menambahkan path('auth/', include('authentication.urls')), pada file django_tutorial/urls.py.

```

- membuat model yang menyesuaikan dengan data JSON, kita dapat memanfaatkan website Quicktype dengan tahapan sebagai berikut.

Bukalah endpoint JSON yang sudah dibuat sebelumnya pada tutorial 2.

Salinlah data JSON dan buka situs web Quicktype.

Pada situs web Quicktype, ubahlah setup name menjadi Assigment, source type menjadi JSON, dan language menjadi Dart.

Tempel data JSON yang telah disalin sebelumnya ke dalam textbox yang tersedia pada Quicktype.

Setelah mendapatkan kode model melalui Quicktype, buka kembali proyek Flutter dan lakukan langkah-langkah berikut.

Membuat file baru pada folder lib/model dengan nama assignment_content.dart.

Tempel kode yang telah disalin sebelumnya ke file assignment_content.dart.

- berikutnya menambahkan Dependensi HTTP dengan melakukan flutter pub add http pada terminal proyek Flutter untuk menambahkan package http.

Pada file android/app/src/main/AndroidManifest.xml, tambahkan kode berikut untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat.
```
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```

- Mengambil, Mengolah, dan Menampilkan Data dari Web Service, dengam membuat file baru pada folder lib/pages dengan nama assignment.dart. Serta pada file assignment.dart, impor library yang dibutuhkan. Ubahlah sesuai dengan nama proyek Flutter yang dibuat buat.
```
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:study_tracker/model/transaction_record.dart';
...

- Menambahkan kode dibawah ini

```

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({Key? key}) : super(key: key);

  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  Future<List<Assignment>> fetchAssignment() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'https://webbed-energy-zoa.domcloud.io/tracker/json/');
    var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Assignment
    List<Assignment> listAssignment = [];
    for (var d in data) {
        if (d != null) {
            listAssignment.add(Assignment.fromJson(d));
        }
    }
    return listAssignment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas'),
      ),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
        future: fetchAssignment(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                  children: const [
                  Text(
                      "Tidak ada data tugas.",
                      style:
                          TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(pk: snapshot.data![index].pk),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                      BoxShadow(
                        color:
                          snapshot.data![index].fields.progress > 50
                            ?Colors.blueAccent
                            : Colors.red,
                        blurRadius: 2.0)
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.subject}"),
                      ],
                    ),
                  )
                )
              );
            }
          }
        }
      )
    );
  }
}
```
- Mengintregasikan Layanan Form Django dengan Aplikasi Flutter dengan memnbuat sebuah fungsi view baru pada study_tracker/views.py aplikasi Django dengan potongan kode berikut.
```

@csrf_exempt
def create_assignment_flutter(request):
    if request.method == 'POST':

        data = json.loads(request.body)

        new_assignment = Assignment.objects.create(
            name = data["name"],
            subject = data["subject"],
            progress = int(data["progress"]),
            description = data["description"]
        )

        new_assignment.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```

- Mengintregasikan Fitur Logout Django dengan Aplikasi Flutter dengan membuat sebuah metode view untuk logout pada authentication/views.py.
```
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```

Dan menambahkan path
```
path('logout/', logout, name='logout'),
```

Terakhir mengubah perintah onTap: () pada Container logout di pages/menu.dart menjadi kode berikut.
```
...
onTap: () async {
    final response = await request.logout(
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        "https://study_tracker/auth/logout/");
        String message = response["message"];
        if (response['status']) {
            String uname = response["username"];
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
            ));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
            );
        } else {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: Text("$message"),
        ));
    }
},
...
```

