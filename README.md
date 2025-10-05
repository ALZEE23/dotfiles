# dotfiles

## Linux Config Backup

### Cara Restore dconf
```bash
dconf load / < dconf/gnome-settings.ini

sudo dnf install $(cat rpm-packages.txt)

flatpak install flathub $(cat flatpak-apps.txt)

pip install -r pip-requirements.txt

cp bash/.bashrc ~/
cp zsh/.zshrc ~/

cp -r config/terminator ~/.config/

---
