Name: jolla-chewing
Version: 0.2
Release: 1
Summary: Bopomofo layout and input method for Sailfish OS
License: LGPLv2
Source: %{name}-%{version}.tar.gz
URL: https://github.com/hanhsuan/jolla-chewing
Requires:   libqmlchewing_plugin
Requires:   jolla-keyboard

%description
Allows you to use bopomofo to enter traditional Chinese on Sailfish OS.

%define debug_package %{nil}

%prep
%setup -q

%build
# do nothing

%install
#rm -rf %{buildroot}
#make install DESTDIR=%{buildroot}
mkdir -p %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/
mkdir -p %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/chewing/
cp -a src/layouts/chewing/ZhuKey.qml %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/chewing/
cp -a src/layouts/chewing/ZhuComboKey.qml %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/chewing/
cp -a src/layouts/chewing.qml %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/
cp -a src/layouts/chewing.conf %{buildroot}/usr/share/maliit/plugins/com/jolla/layouts/
cp -a src/ChewingInputHandler.qml %{buildroot}/usr/share/maliit/plugins/com/jolla/

%clean
rm -rf %{buildroot}

%files
/usr/share/maliit/plugins/com/jolla/layouts/chewing/ZhuKey.qml
/usr/share/maliit/plugins/com/jolla/layouts/chewing/ZhuComboKey.qml
/usr/share/maliit/plugins/com/jolla/layouts/chewing.qml
/usr/share/maliit/plugins/com/jolla/layouts/chewing.conf
/usr/share/maliit/plugins/com/jolla/ChewingInputHandler.qml
