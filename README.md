# 🖼️ Resize iOS icons   

A small Bash script that takes a **1024×1024 PNG** image and generates all the required square sizes for iOS app icons.  

## ⚡️ Features
- Takes one source image (default: **1024×1024 px**).  
- Generates resized icons at the following dimensions (iPhone + iPad):  
  `40, 58, 60, 76, 80, 87, 114, 120, 128, 136, 152, 167, 180, 192` pixels.  
- Outputs everything into a `resized/` folder.  
- Works with **ImageMagick 7** (`magick`).  

---

## 📦 Installation

### 1. Clone the repo
```bash
git clone https://github.com/PierreHugo/ios-icon-resizer.git
cd ios-icon-resizer
```

### 2. Make the script executable
```bash
chmod +x resize-ios-icons.sh
```

### 3. (Optional) Install globally
Copy the script into `/usr/local/bin` to use it as a global command:  
```bash
sudo cp resize-ios-icons.sh /usr/local/bin/resize-icons
```

Now you can run it from anywhere with:  
```bash
resize-icons my-icon.png
```

👉 Without `sudo`, you can add it to `~/bin` and update your `$PATH`:  
```bash
mkdir -p ~/bin
cp resize-ios-icons.sh ~/bin/resize-icons
chmod +x ~/bin/resize-icons

echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

---

## 🛠️ Requirements
- **ImageMagick 7** (must have the `magick` command available).  
  Check your install with:  
  ```bash
  magick -version
  ```

---

## 🚀 Usage

### Run directly
```bash
./resize-ios-icons.sh app-icon-1024.png
```

### If installed globally
```bash
resize-icons app-icon-1024.png
```

All resized icons will be placed into the `./resized/` directory.  

---

## 📂 Example Output
```
resized/
 ├── app-icon-1024_40.png
 ├── app-icon-1024_58.png
 ├── app-icon-1024_60.png
 ├── app-icon-1024_76.png
 ├── ...
 └── app-icon-1024_192.png
```

---

## 📜 License
Free to use and modify ✌️  
