# Swap Manager Tool

A user-friendly command-less swap management utility for Linux systems. Easily manage, add, modify, and monitor your system's swap space without complex command-line operations.

## ✨ Features

- **Simple GUI Interface** - Manage swap without remembering complex commands
- **Add Swap Space** - Create new swap partitions or swap files
- **Modify Swap** - Adjust existing swap configurations
- **Monitor Swap** - View current swap usage and statistics
- **Swap Removal** - Safely remove swap partitions or files
- **User-Friendly** - Intuitive interface designed for all skill levels

## 📋 Requirements

- Linux-based operating system
- Root/sudo privileges for swap operations
- Bash shell

## 🚀 Quick Start

### Installation

Clone the repository to your system:

```bash
git clone https://github.com/MichaelCode-tech/swap-manager-tool.git
cd swap-manager-tool
```

### Usage

Navigate to the project directory and run the main script:

```bash
./swap-manager
```

The GUI will launch, allowing you to:
- View current swap configuration
- Add new swap space
- Modify existing swap settings
- Monitor swap usage in real-time
- Remove swap partitions or files

## 📖 How to Use

1. **Launch the Tool**
   ```bash
   ./swap-manager
   ```

2. **Select an Operation**
   - Choose from the menu options
   - Follow the on-screen prompts

3. **View Results**
   - Confirm the operation completed successfully
   - Check updated swap status

## ⚠️ Important Notes

- **Root Access Required**: Most swap operations require superuser privileges
- **Backup Data**: Always back up important data before making swap modifications
- **System Impact**: Swap changes may affect system performance and stability

## 🛠️ Supported Operations

| Operation | Description |
|-----------|-------------|
| Add Swap | Create new swap space from file or partition |
| Modify Swap | Adjust swap priority and settings |
| Remove Swap | Safely disable and remove swap space |
| View Status | Display current swap configuration and usage |
| Monitor | Real-time swap usage monitoring |

## 📁 Project Structure

```
swap-manager-tool/
├── README.md
├── swap-manager          # Main executable script
└── [configuration files] # Supporting configuration
```

## 🐛 Troubleshooting

### Script Won't Execute
Ensure the script has execute permissions:
```bash
chmod +x swap-manager
```

### Permission Denied
The tool requires root privileges for most operations:
```bash
sudo ./swap-manager
```

### GUI Not Appearing
Verify you have a display server running (X11 or Wayland).

## 💡 Tips for Optimal Use

- Monitor your system's memory usage before adjusting swap
- Set appropriate swap size (typically 2x RAM for systems with < 8GB RAM)
- Regularly check swap usage to identify memory issues
- Consider using swap files on systems with encrypted partitions

## 📝 License

Please refer to the LICENSE file in the repository for licensing information.

## 🤝 Contributing

Contributions, bug reports, and feature requests are welcome! Please feel free to submit issues or pull requests.

## 👤 Author

**MichaelCode.tech**

- GitHub: [@MichaelCode-tech](https://github.com/MichaelCode-tech)
- Repository: [swap-manager-tool](https://github.com/MichaelCode-tech/swap-manager-tool.git)

## 📞 Support

For issues, questions, or suggestions, please open an issue on the [GitHub Issues](https://github.com/Jdhdx/swap-manager-tool/issues) page.

---

**Happy Swap Managing!** 🚀

Made with ❤️ for Linux system administrators and power users.
