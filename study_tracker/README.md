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