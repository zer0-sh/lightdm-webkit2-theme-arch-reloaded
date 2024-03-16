lightdm-webkit2-theme-arch-reloaded

# Arch reloaded a ultraminimal lightdm webkit2 theme

Welcome to Arch Reloaded, an ultra-minimalist theme for LightDM-Webkit2-Greeter, designed specifically for Arch Linux users who seek to maintain a minimalist and elegant approach.

Forked and retouched with my hand from [lightdm-webkit2-theme-arch](https://gitlab.com/kenogo/lightdm-webkit2-theme-arch).

---
### :D 
---

The source of the wallpapers is [this reddit thread](https://www.reddit.com/r/archlinux/comments/4gc2lw/some_arch_wallpapers_i_made/?st=ivzxvmxu&sh=727d2f4e), If you're feeling adventurous, you can also create your own [here](https://demon000.github.io/archwg)!

## Main features

- it's really minimal xd
- Manual user login initiation
- Hidden password input while typing.
- Session selection from available options on your system
- That's it, true minimalism at its finest!

## Screenshots

![Picture 1](/screenshots/session.png)

![Picture 2](/screenshots/username.png)

![Picture 3](/screenshots/password.png)


Enjoy!! :D 

---
## Requirements

To use this theme, make sure you meet the following requirements:

- **Arch Linux**: This theme is specifically designed for Arch Linux users. While it may work on other distributions, it's optimized for Arch. I don't know if it works on Arch based distros.
- **LightDM**: Ensure that you have LightDM installed and configured on your system.
- **LightDM-Webkit2-Greeter**: You need to have LightDM-Webkit2-Greeter installed. If you haven't installed it yet, you can do so using your package manager.
- **Git**: Git is required to clone the repository.
- **Text Editor**: You'll need a text editor to make any configuration changes or customization to the theme files.


## How to install? 🛠️

### Script
1. Clone the repo
```bash
git clone https://gitlab.com/zer0-sh/lightdm-webkit-2-theme-arch-reloaded
```
2. Change directory
```bash
cd lightdm-webkit-2-theme-arch-reloaded
```
3. Give permissions
```bash
chmod +x ./install.sh
```
4. Execute with sudo 
```bash
sudo ./install
```

5. install

Follow the prompts and instructions during the installation process.

6. Enjoy

### Manual

If you prefer to do it by hand.

1. Clone the repository:
```bash
git clone https://gitlab.com/zer0-sh/lightdm-webkit-2-theme-arch-reloaded
```
2. Navigate to the cloned theme directory:
```bash
cd lightdm-webkit-2-theme-arch-reloaded
```
3. Copy the theme folder to the LightDM themes directory:
```bash
sudo cp -r . /usr/share/lightdm-webkit/themes/arch-reloaded
```
4. Edit the LightDM configuration file:
Open the /etc/lightdm/lightdm.conf file in a text editor.
```bash
sudo nano /etc/lightdm/lightdm.conf
```
5. Add the theme configuration:
Add the line webkit-theme=arch-reloaded under the [Seat:*] section or create this section if it doesn't exist.
```bash
[Seat:*]
...
webkit-theme=arch-reloaded
```
6. Enjoy 

## AUR Package (Coming Soon)
Future(?) Someday(?) Si Dios quiere xd (?)
I'm currently working on packaging this theme for Arch Linux users via the Arch User Repository (AUR). This will make it even easier for you to install and manage updates for the theme.

#

<h3 align="center">𝒎𝒆𝒎𝒆𝒏𝒕𝒐 𝒎𝒐𝒓𝒊</h3>






