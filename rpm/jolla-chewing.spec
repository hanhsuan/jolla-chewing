Name:       jolla-chewing
Version:    0.2
Release:    1
Summary:    Bopomofo layout and input method for Sailfish OS
License:    LGPLv2
URL:        https://github.com/hanhsuan/jolla-chewing
Source:     %{name}-%{version}.tar.gz
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
mkdir -p %{buildroot}%{_datadir}/maliit/plugins/com/jolla/layouts/chewing
cp -a src/layouts/chewing/BopomofoKey.qml %{buildroot}%{_datadir}/maliit/plugins/com/jolla/layouts/chewing
cp -a src/layouts/chewing.qml %{buildroot}%{_datadir}/maliit/plugins/com/jolla/layouts/
cp -a src/layouts/chewing.conf  %{buildroot}%{_datadir}/maliit/plugins/com/jolla/layouts/
cp -a src/ChewingInputHandler.qml %{buildroot}%{_datadir}/maliit/plugins/com/jolla/


%clean
rm -rf %{buildroot}

%files
%{_datadir}/maliit/plugins/com/jolla/layouts/chewing/BopomofoKey.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/chewing.qml
%{_datadir}/maliit/plugins/com/jolla/layouts/chewing.conf
%{_datadir}/maliit/plugins/com/jolla/ChewingInputHandler.qml
