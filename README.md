# jolla-chewing
Bopomofo layout and input method for [Sailfish OS](https://sailfishos.org/) bases on the [libchewing](https://codeberg.org/chewing/libchewing) and [libqmlchewing-plug](https://github.com/hanhsuan/libqmlchewing-plug).

# How to build

## Build with Sailfish OS SDK 3.13.5

Install the `libchewing` package in the development environment, built from [source code](https://github.com/hanhsuan/SailfishOS-libchewing) by yourself, or use the prebuilt [one](https://github.com/hanhsuan/SailfishOS-libchewing/releases). Install the `libqmlchewing-plug` package in the development environment, built from [source code](https://github.com/hanhsuan/libqmlchewing-plug) by yourself. The architecture should be the same as your environment.

### container

* Enter the container with root permission

```bash
sfdk build-shell --maintain
```

* Install the rpm package

```bash
zypper in libchewing-0.8.5-0.aarch64.rpm libqmlchewing_plugin-0.1-3.aarch64.rpm
```

* Back to the host and build

```bash
git clone https://github.com/hanhsuan/jolla-chewing.git

cd jolla-chewing

sfdk build
```

## How to install the rpm in the Sailfish OS VM

* Start the VM first

* Copy rpm pakcages to the VM

```bash
scp -p 2223 -i ~/SailfishOS/vmshare/ssh/private_keys/sdk chewing-data-0.8.5-0.i486.rpm libchewing-0.8.5-0.i486.rpm libqmlchewing_plugin-0.1-3.i486.rpm jolla-chewing-0.1-3.i486.rpm root@localhost:/home/defaultuser/
```

* ssh into the VM to install the rpm package

```bash
ssh -p 2223 -i ~/SailfishOS/vmshare/ssh/private_keys/sdk root@localhost

cd /home/defaultuser/

pkcon install-local chewing-data-0.8.5-0.i486.rpm libchewing-0.8.5-0.i486.rpm libqmlchewing_plugin-0.1-3.i486.rpm jolla-chewing-0.1-3.i486.rpm
```

## How to enable Chewing

* Got to settings > Text Input

![enable](demo/select_text_input.jpg)

* Add Chewing keyboard

![add](demo/add_chewing_keyboard.jpg)

* Chewing keyboard enabled

![enabled](demo/chewing_keyboard_added.jpg)

* Use Chewing keyboard

![use](demo/use_chewing_keyboard.jpg)

* Text input demo

![use](demo/chewing_input.jpg)

## Thanks
Thank [Arvid](https://github.com/ecryth/jolla-anthy-jp) for providing a good example that helped me understand how to do it back in 2016.
