# 🎥 CCTV IoT - Cara Mudah Menjalankan Server

## 📋 Langkah Super Sederhana:

### 1️⃣ **JALANKAN SERVER**

- **Double-click file: `JALANKAN_SERVER.bat`**
- File ini akan otomatis:
  - ✅ Cek Python
  - ✅ Install dependencies (Flask, OpenCV)
  - ✅ Jalankan server CCTV

### 2️⃣ **AKSES VIDEO**

- Buka browser web
- Kunjungi: **http://localhost:5000**
- Atau langsung ke video: **http://localhost:5000/video_feed**

### 3️⃣ **STOP SERVER**

- Tekan **Ctrl+C** di window command
- Atau tutup window command

---

## 🆘 Jika Ada Masalah:

### **"Python tidak terinstall"**

- Download Python dari: https://python.org
- **PENTING**: Centang "Add Python to PATH" saat install

### **"Dependencies gagal install"**

- Buka Command Prompt
- Jalankan: `pip install flask opencv-python`

### **"Video tidak muncul"**

- Pastikan kamera RTSP dapat diakses
- IP kamera: 192.168.30.160
- Username: admin, Password: ZUHDGC

### **"Server error"**

- Cek apakah port 5000 sedang digunakan aplikasi lain
- Restart komputer jika perlu

---

## 📁 File Penting:

- `JALANKAN_SERVER.bat` - **FILE UTAMA - DOUBLE CLICK INI**
- `cctv-iot.py` - Script Python server
- `requirements.txt` - List dependencies

## 🗑️ File yang Sudah Dihapus:

- ~~setup.bat~~ - Tidak perlu (auto install)
- ~~start.bat~~ - Tidak perlu (diganti JALANKAN_SERVER.bat)
- ~~stop_server.bat~~ - Tidak perlu (Ctrl+C)
- ~~fix_opencv.bat~~ - Tidak perlu (auto fix)
- ~~test_system.bat~~ - Tidak perlu (auto check)

---

## 🎯 **INTINYA:**

**Cukup double-click `JALANKAN_SERVER.bat` dan selesai!** 🚀
