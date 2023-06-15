# Fedora Setup Script - Alpha, WIP
This is a post-install script to help me set up Fedora installs how I like them as quickly as possible. I may add interactivity and flexibility later.

## Usage

1. Clone the repo:
```
git clone https://github.com/starship-boi/fedora-setup
```
2. Enter the repo directory:
```
cd fedora-setup
```
Note: At this point, consider inspecting the scripts to ensure they have not been tampered with.

2. Make the scripts executable:
```
chmod +x main.sh root.sh user.sh
```
3. Run `main.sh`:
```
./main.sh
```
Bear in mind that this require `sudo` permissions.

### Single command:
```
git clone https://github.com/starship-boi/fedora-setup && cd fedora-setup && chmod +x main.sh root.sh user.sh && ./main.sh
```
