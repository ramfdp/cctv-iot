# Proyek CCTV IoT - Struktur Direktori

Dokumen ini memberikan gambaran lengkap tentang struktur direktori proyek CCTV IoT.

## Struktur Root Proyek

```
cctv-iot/
│
├── cctv-iot.py                 # File aplikasi utama (server streaming RTSP ke HTTP)
├── requirements.txt            # Daftar dependensi Python
├── README.md                   # Gambaran proyek dan panduan cepat memulai
├── LICENSE                     # File lisensi proyek
├── .gitignore                  # Pola pengabaian Git
├── config.json                 # File konfigurasi (opsional)
│
├── .venv/                      # Environment virtual Python (dibuat otomatis)
│   ├── Lib/                    # Library dan paket Python
│   │   └── site-packages/      # Paket Python yang terinstall
│   │       ├── flask/          # Framework web Flask
│   │       ├── cv2/            # Library computer vision OpenCV
│   │       ├── werkzeug/       # Library utilitas WSGI
│   │       └── ...             # Dependensi lainnya
│   └── Scripts/                # Script environment virtual
│       ├── activate.bat        # Aktifkan environment virtual (Windows)
│       ├── deactivate.bat      # Nonaktifkan environment virtual (Windows)
│       ├── pip.exe             # Installer paket
│       └── python.exe          # Interpreter Python
│
├── src/                        # Direktori kode sumber
│   ├── core/                   # Modul aplikasi inti
│   │   ├── __init__.py         # Penanda paket Python
│   │   ├── camera.py           # Penanganan kamera dan koneksi RTSP
│   │   ├── streamer.py         # Logika streaming video
│   │   └── server.py           # Implementasi web server
│   │
│   ├── api/                    # Endpoint API dan routing
│   │   ├── __init__.py         # Penanda paket Python
│   │   ├── routes.py           # Definisi rute API
│   │   └── handlers.py         # Handler permintaan
│   │
│   ├── utils/                  # Fungsi utilitas dan helper
│   │   ├── __init__.py         # Penanda paket Python
│   │   ├── logger.py           # Konfigurasi logging
│   │   ├── config_loader.py    # Utilitas loading konfigurasi
│   │   └── validators.py       # Fungsi validasi input
│   │
│   └── config/                 # Manajemen konfigurasi
│       ├── __init__.py         # Penanda paket Python
│       ├── settings.py         # Pengaturan aplikasi
│       └── camera_profiles.py  # Profil konfigurasi kamera
│
├── tests/                      # Direktori test suite
│   ├── __init__.py             # Penanda paket Python
│   ├── test_camera.py          # Test fungsionalitas kamera
│   ├── test_streamer.py        # Test logika streaming
│   ├── test_api.py             # Test endpoint API
│   └── fixtures/               # Data test dan fixtures
│       ├── sample_config.json  # Konfigurasi sampel untuk testing
│       └── mock_responses/     # Response API tiruan
│
├── scripts/                    # Script utilitas dan otomasi
│   ├── install.bat             # Script instalasi Windows
│   ├── install.sh              # Script instalasi Linux/Mac
│   ├── run_development.py      # Peluncur server pengembangan
│   └── backup_config.py        # Utilitas backup konfigurasi
│
├── templates/                  # Template HTML (jika menggunakan template engine)
│   ├── index.html              # Halaman dashboard utama
│   ├── camera_view.html        # Tampilan kamera tunggal
│   └── multi_camera.html       # Tampilan grid kamera multiple
│
├── static/                     # Aset web statis
│   ├── css/                    # Stylesheet
│   │   ├── main.css            # Stylesheet utama
│   │   └── responsive.css      # Style responsive mobile
│   ├── js/                     # File JavaScript
│   │   ├── main.js             # Fungsionalitas JavaScript utama
│   │   └── camera_controls.js  # Fungsi kontrol kamera
│   └── images/                 # Gambar dan ikon statis
│       ├── favicon.ico         # Favicon website
│       └── logo.png            # Logo proyek
│
├── config/                     # File konfigurasi
│   ├── production.json         # Konfigurasi environment produksi
│   ├── development.json        # Konfigurasi environment pengembangan
│   ├── cameras.yaml            # Konfigurasi kamera
│   └── logging.conf            # Konfigurasi logging
│
├── logs/                       # Direktori file log
│   ├── app.log                 # Log aplikasi
│   ├── error.log               # Log error
│   └── access.log              # Log akses HTTP
│
├── recordings/                 # Penyimpanan rekaman video (jika diimplementasikan)
│   ├── camera_1/               # Rekaman dari kamera 1
│   ├── camera_2/               # Rekaman dari kamera 2
│   └── archive/                # Rekaman yang diarsipkan
│
├── data/                       # Direktori penyimpanan data
│   ├── snapshots/              # Snapshot kamera
│   ├── thumbnails/             # Thumbnail video
│   └── cache/                  # File cache sementara
│
└── docs/                       # Dokumentasi proyek
    ├── README.md               # Index dokumentasi
    ├── CHANGELOG.md            # Changelog proyek
    │
    ├── installation/           # Panduan instalasi
    │   ├── README.md           # Instruksi instalasi
    │   └── requirements.md     # Dokumentasi dependensi
    │
    ├── configuration/          # Panduan konfigurasi
    │   └── README.md           # Dokumentasi konfigurasi
    │
    ├── user-guide/             # Dokumentasi pengguna
    │   └── README.md           # Manual pengguna
    │
    ├── api/                    # Dokumentasi API
    │   └── README.md           # Referensi API
    │
    ├── architecture/           # Dokumentasi teknis
    │   └── README.md           # Arsitektur sistem
    │
    ├── examples/               # Contoh kode
    │   └── README.md           # Contoh implementasi
    │
    ├── troubleshooting/        # Panduan pemecahan masalah
    │   └── README.md           # Masalah umum dan solusi
    │
    └── assets/                 # Aset dokumentasi
        ├── images/             # Screenshot dan diagram
        └── diagrams/           # Diagram arsitektur
```

## Deskripsi File

### File Inti

- **cctv-iot.py**: Entry point aplikasi utama yang berisi server Flask dan logika streaming video
- **requirements.txt**: Dependensi paket Python (Flask, OpenCV, dll.)
- **README.md**: Gambaran proyek, instalasi, dan instruksi penggunaan
- **config.json**: File konfigurasi untuk pengaturan kamera, parameter server, dll.

### Virtual Environment (.venv/)

- **Environment Python Terisolasi**: Berisi semua dependensi proyek
- **Spesifik Platform**: Struktur bervariasi antara Windows/Linux/Mac
- **Dibuat Otomatis**: Dibuat saat menjalankan `python -m venv .venv`

### Kode Sumber (src/)

- **Desain Modular**: Diorganisir berdasarkan fungsionalitas
- **core/**: Logika aplikasi inti (penanganan kamera, streaming, server)
- **api/**: Endpoint REST API dan routing
- **utils/**: Utilitas bersama dan fungsi helper
- **config/**: Manajemen konfigurasi dan pengaturan

### Dokumentasi (docs/)

- **Cakupan Komprehensif**: Instalasi, konfigurasi, penggunaan, dan troubleshooting
- **Format Markdown**: Mudah dibaca dan dipelihara
- **Organisasi Terstruktur**: Bagian terpisah untuk audiens yang berbeda
- **Aset**: Gambar dan diagram untuk mendukung dokumentasi

## Panduan Penggunaan Direktori

### Struktur Pengembangan

1. **Simpan kode sumber di src/**: Pisahkan dari script dan konfigurasi
2. **Gunakan virtual environment**: Isolasi dependensi proyek
3. **Organisir berdasarkan fungsionalitas**: Kelompokkan file terkait bersama-sama
4. **Dokumentasikan segalanya**: Pertahankan dokumentasi yang komprehensif

### Deployment Produksi

1. **Konfigurasi spesifik environment**: Pisahkan pengaturan development dan produksi
2. **Manajemen log**: Logging terpusat dengan rotasi
3. **Pertimbangan keamanan**: Lindungi file konfigurasi dan kredensial
4. **Strategi backup**: Backup reguler konfigurasi dan rekaman

### Pertimbangan Skalabilitas

1. **Arsitektur modular**: Mudah diperluas dengan fitur baru
2. **Configuration-driven**: Mendukung konfigurasi kamera multiple
3. **Logging dan monitoring**: Monitoring sistem yang komprehensif
4. **Optimisasi performa**: Caching dan manajemen resource

## Praktik Terbaik

1. **Version Control**: Gunakan .gitignore untuk mengecualikan file yang tidak perlu
2. **Dokumentasi**: Jaga dokumentasi tetap up-to-date dengan perubahan kode
3. **Testing**: Implementasikan cakupan test yang komprehensif
4. **Keamanan**: Penyimpanan kredensial yang aman dan kontrol akses
5. **Monitoring**: Implementasikan logging dan pelacakan error

## Ekspansi Masa Depan

Struktur ini mendukung peningkatan masa depan seperti:

- Dukungan multi-kamera
- Otentikasi pengguna
- Fungsionalitas perekaman
- Deteksi gerakan
- Integrasi aplikasi mobile
- Deployment cloud
