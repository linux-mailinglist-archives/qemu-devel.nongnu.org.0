Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A118C509CB5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:51:29 +0200 (CEST)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTTE-00042q-J3
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTQN-0002KP-C2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:48:31 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTQJ-00043q-UD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:48:30 -0400
Received: by mail-qt1-x831.google.com with SMTP id t26so2845915qtn.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D3ymw2ZgzLEiR5Z0gTvPXe2qZPTorxhv77gXBf6HrVk=;
 b=ZQHcrF0Lg5MAZXCz4PDdlocHacjAR+IOpyNtERAq3DzBNEogB+yE16q1omVeOlnw5k
 aFb++PhkrTrXHI3/288q4hcZsXwaTn9/SG5562XEyoHbVl1NaX6MYjKJpfsX5Q6Yti2Y
 EkEAtTFJBXHAkn6QEK2I0k55S8slPCvDipFnQtFNXXveq5K4dD0JLQdGd7Iw9/q+D13q
 3f0xjtNHyhBOVe9nNG6VLeH/IurcFl9nw9DJRfuaVduvqXii9cKzl2NHJjlnOdmrz00i
 Ynm908f8aS4OYom41yychSuNmcveyN19X3KI+ujXJaAzMvLE5yZhkeb1uxBsN0R8fvqt
 dQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D3ymw2ZgzLEiR5Z0gTvPXe2qZPTorxhv77gXBf6HrVk=;
 b=EKmgFk9KP/O1PTaeLB9yAoItXpXEFn++9IfKfpa8PAdaYj601/mzW6WCpPeqqM4K69
 sP56Ah/KIgnpRvjAzBOF312ZAx0lrHAZO9aX8t22HKj5+oDjx56prDGBiazSTdZdX0UC
 jxFUCGG/P4Yd2hNML8ZSOnqWwGkHiPJWVumtV4P0jnLx1v7w+vmRnLjxMm+yixnXk1YW
 YL1CmCvFbEO4VOewkWZWJ89e9yFy2KkX1I2yzuw8dhCucsnUYetEOvyjNcqGiSIlOf/b
 t8qx79yQj/NxvOF8R/tzcByJvfInI/bGl/DcDxohdQz9q4BcKXNZaqSSf2O1M9lPqhS1
 79mQ==
X-Gm-Message-State: AOAM533XfvDucod05LBVjVz1cecRpdSjOsSRe0h1xtdv12RC+JUCbL5+
 FtT9hw1ju9ofXchhGQckbCUoSi2LabRkd1xuGDMVCil96E0=
X-Google-Smtp-Source: ABdhPJxZne81fPmp0YgKbMohgxGniovkmWIqx1pSmDe8uH061X4slKxxcwFbp/ygd6Sd3/pPeOIKE8cXjRH9i3TKmtc=
X-Received: by 2002:ac8:5a41:0:b0:2f1:f30e:c07f with SMTP id
 o1-20020ac85a41000000b002f1f30ec07fmr16253203qta.112.1650534505502; Thu, 21
 Apr 2022 02:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-25-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-25-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 13:48:13 +0400
Message-ID: <CAJ+F1C+hjPLUSE8N2khDROT_G2-D-8X8M5W4Uf+F2r+ewgGz+g@mail.gmail.com>
Subject: Re: [PATCH 24/34] configure: switch directory options to automatic
 parsing
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e3db2d05dd270292"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e3db2d05dd270292
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 8:11 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> While prefix, bindir and qemu_suffix needs special treatment due to
> differences between Windows and POSIX systems, everything else
> needs no extra code in configure.
>
>
Afaik, it's not common to install binaries under $prefix on Windows. I
don't know any open-source project doing that. msys2 explicitly change it
to bin again:
https://github.com/msys2/MINGW-packages/blob/master/mingw-w64-qemu/PKGBUILD=
#L94


> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

 Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure                     | 58 ++---------------------------------
>  meson_options.txt             |  4 +--
>  scripts/meson-buildoptions.py | 11 +++++--
>  scripts/meson-buildoptions.sh | 21 +++++++++++++
>  4 files changed, 34 insertions(+), 60 deletions(-)
>
> diff --git a/configure b/configure
> index 200ef3be23..b704453c68 100755
> --- a/configure
> +++ b/configure
> @@ -311,6 +311,7 @@ plugins=3D"$default_feature"
>  meson=3D""
>  meson_args=3D""
>  ninja=3D""
> +bindir=3D"bin"
>  skip_meson=3Dno
>
>  # The following Meson options are handled manually (still they
> @@ -669,6 +670,7 @@ if test "$mingw32" =3D "yes" ; then
>    CONFIGURE_CFLAGS=3D"-mthreads $CONFIGURE_CFLAGS"
>    write_c_skeleton;
>    prefix=3D"/qemu"
> +  bindir=3D""
>    qemu_suffix=3D""
>  fi
>
> @@ -775,30 +777,10 @@ for opt do
>      static=3D"yes"
>      QEMU_PKG_CONFIG_FLAGS=3D"--static $QEMU_PKG_CONFIG_FLAGS"
>    ;;
> -  --mandir=3D*) mandir=3D"$optarg"
> -  ;;
>    --bindir=3D*) bindir=3D"$optarg"
>    ;;
> -  --libdir=3D*) libdir=3D"$optarg"
> -  ;;
> -  --libexecdir=3D*) libexecdir=3D"$optarg"
> -  ;;
> -  --includedir=3D*) includedir=3D"$optarg"
> -  ;;
> -  --datadir=3D*) datadir=3D"$optarg"
> -  ;;
>    --with-suffix=3D*) qemu_suffix=3D"$optarg"
>    ;;
> -  --docdir=3D*) docdir=3D"$optarg"
> -  ;;
> -  --localedir=3D*) localedir=3D"$optarg"
> -  ;;
> -  --sysconfdir=3D*) sysconfdir=3D"$optarg"
> -  ;;
> -  --localstatedir=3D*) local_statedir=3D"$optarg"
> -  ;;
> -  --firmwarepath=3D*) firmwarepath=3D"$optarg"
> -  ;;
>    --host=3D*|--build=3D*|\
>    --disable-dependency-tracking|\
>    --sbindir=3D*|--sharedstatedir=3D*|\
> @@ -1021,23 +1003,6 @@ case $git_submodules_action in
>      ;;
>  esac
>
> -libdir=3D"${libdir:-$prefix/lib}"
> -libexecdir=3D"${libexecdir:-$prefix/libexec}"
> -includedir=3D"${includedir:-$prefix/include}"
> -
> -if test "$mingw32" =3D "yes" ; then
> -    bindir=3D"${bindir:-$prefix}"
> -else
> -    bindir=3D"${bindir:-$prefix/bin}"
> -fi
> -mandir=3D"${mandir:-$prefix/share/man}"
> -datadir=3D"${datadir:-$prefix/share}"
> -docdir=3D"${docdir:-$prefix/share/doc}"
> -sysconfdir=3D"${sysconfdir:-$prefix/etc}"
> -local_statedir=3D"${local_statedir:-$prefix/var}"
> -firmwarepath=3D"${firmwarepath:-$datadir/qemu-firmware}"
> -localedir=3D"${localedir:-$datadir/locale}"
> -
>  if eval test -z "\${cross_cc_$cpu}"; then
>      eval "cross_cc_${cpu}=3D\$cc"
>      cross_cc_vars=3D"$cross_cc_vars cross_cc_${cpu}"
> @@ -1115,16 +1080,7 @@ Advanced options (experts only):
>    --with-git-submodules=3Dvalidate fail if git submodules are not up to =
date
>    --with-git-submodules=3Dignore   do not update or check git submodules
> (default if no .git dir)
>    --static                 enable static build [$static]
> -  --mandir=3DPATH            install man pages in PATH
> -  --datadir=3DPATH           install firmware in PATH/$qemu_suffix
> -  --localedir=3DPATH         install translation in PATH/$qemu_suffix
> -  --docdir=3DPATH            install documentation in PATH/$qemu_suffix
>    --bindir=3DPATH            install binaries in PATH
> -  --libdir=3DPATH            install libraries in PATH
> -  --libexecdir=3DPATH        install helper binaries in PATH
> -  --sysconfdir=3DPATH        install config in PATH/$qemu_suffix
> -  --localstatedir=3DPATH     install local state in PATH (set at runtime=
 on
> win32)
> -  --firmwarepath=3DPATH      search PATH for firmware files
>    --efi-aarch64=3DPATH       PATH of efi file to use for aarch64 VMs.
>    --with-suffix=3DSUFFIX     suffix for QEMU data inside
> datadir/libdir/sysconfdir/docdir [$qemu_suffix]
>    --without-default-features default all --enable-* options to "disabled=
"
> @@ -2409,18 +2365,8 @@ if test "$skip_meson" =3D no; then
>    run_meson() {
>      NINJA=3D$ninja $meson setup \
>          --prefix "$prefix" \
> -        --libdir "$libdir" \
> -        --libexecdir "$libexecdir" \
>          --bindir "$bindir" \
> -        --includedir "$includedir" \
> -        --datadir "$datadir" \
> -        --mandir "$mandir" \
> -        --sysconfdir "$sysconfdir" \
> -        --localedir "$localedir" \
> -        --localstatedir "$local_statedir" \
>          -Ddefault_devices=3D$default_devices \
> -        -Ddocdir=3D"$docdir" \
> -        -Dqemu_firmwarepath=3D"$firmwarepath" \
>          -Dqemu_suffix=3D"$qemu_suffix" \
>          -Dsmbd=3D"$smbd" \
>          -Doptimization=3D$(if test "$debug" =3D yes; then echo 0; else e=
cho
> 2; fi) \
> diff --git a/meson_options.txt b/meson_options.txt
> index 848426460c..a76fadbd7d 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -4,9 +4,9 @@
>
>  option('qemu_suffix', type : 'string', value: 'qemu',
>         description: 'Suffix for QEMU data/modules/config directories (ca=
n
> be empty)')
> -option('docdir', type : 'string', value : 'doc',
> +option('docdir', type : 'string', value : 'share/doc',
>         description: 'Base directory for documentation installation (can
> be empty)')
> -option('qemu_firmwarepath', type : 'string', value : '',
> +option('qemu_firmwarepath', type : 'string', value : 'qemu-firmware',
>         description: 'search PATH for firmware files')
>  option('pkgversion', type : 'string', value : '',
>         description: 'use specified string as sub-version of the package'=
)
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.p=
y
> index 0f9603a7f6..45cda8cd84 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -27,9 +27,7 @@
>
>  SKIP_OPTIONS =3D {
>      "default_devices",
> -    "docdir",
>      "fuzzing_engine",
> -    "qemu_firmwarepath",
>      "qemu_suffix",
>      "smbd",
>  }
> @@ -37,12 +35,21 @@
>  OPTION_NAMES =3D {
>      "malloc": "enable-malloc",
>      "pkgversion": "with-pkgversion",
> +    "qemu_firmwarepath": "firmwarepath",
>      "trace_backends": "enable-trace-backends",
>      "trace_file": "with-trace-file",
>  }
>
>  BUILTIN_OPTIONS =3D {
> +    "datadir",
> +    "includedir",
> +    "libdir",
> +    "libexecdir",
> +    "localedir",
> +    "localstatedir",
> +    "mandir",
>      "strip",
> +    "sysconfdir",
>  }
>
>  LINE_WIDTH =3D 76
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index a0c86db116..a52cc14d13 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -8,8 +8,11 @@ meson_options_help() {
>    printf "%s\n" '  --block-drv-rw-whitelist=3DVALUE'
>    printf "%s\n" '                           set block driver read-write
> whitelist (by default'
>    printf "%s\n" '                           affects only QEMU, not tools
> like qemu-img)'
> +  printf "%s\n" '  --datadir=3DVALUE          Data file directory [share=
]'
>    printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better
> performance)'
>    printf "%s\n" '  --disable-install-blobs  install provided firmware
> blobs'
> +  printf "%s\n" '  --docdir=3DVALUE           Base directory for
> documentation installation'
> +  printf "%s\n" '                           (can be empty) [share/doc]'
>    printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
>    printf "%s\n" '                           use block whitelist also in
> tools instead of only'
>    printf "%s\n" '                           QEMU'
> @@ -40,10 +43,18 @@ meson_options_help() {
>    printf "%s\n" '  --enable-trace-backends=3DCHOICES'
>    printf "%s\n" '                           Set available tracing
> backends [log] (choices:'
>    printf "%s\n" '
>  dtrace/ftrace/log/nop/simple/syslog/ust)'
> +  printf "%s\n" '  --firmwarepath=3DVALUE     search PATH for firmware
> files [qemu-firmware]'
>    printf "%s\n" '  --iasl=3DVALUE             Path to ACPI disassembler'
> +  printf "%s\n" '  --includedir=3DVALUE       Header file directory
> [include]'
>    printf "%s\n" '  --interp-prefix=3DVALUE    where to find shared
> libraries etc., use %M for'
>    printf "%s\n" '                           cpu name
> [/usr/gnemul/qemu-%M]'
> +  printf "%s\n" '  --libdir=3DVALUE           Library directory [lib64]'
> +  printf "%s\n" '  --libexecdir=3DVALUE       Library executable directo=
ry
> [libexec]'
> +  printf "%s\n" '  --localedir=3DVALUE        Locale data directory
> [share/locale]'
> +  printf "%s\n" '  --localstatedir=3DVALUE    Localstate data directory
> [/var/local]'
> +  printf "%s\n" '  --mandir=3DVALUE           Manual page directory
> [share/man]'
>    printf "%s\n" '  --sphinx-build=3DVALUE     Use specified sphinx-build
> for building document'
> +  printf "%s\n" '  --sysconfdir=3DVALUE       Sysconf data directory [et=
c]'
>    printf "%s\n" '  --tls-priority=3DVALUE     Default TLS protocol/ciphe=
r
> priority string'
>    printf "%s\n" '                           [NORMAL]'
>    printf "%s\n" '  --with-pkgversion=3DVALUE  use specified string as
> sub-version of the'
> @@ -206,6 +217,7 @@ _meson_option_parse() {
>      --disable-curl) printf "%s" -Dcurl=3Ddisabled ;;
>      --enable-curses) printf "%s" -Dcurses=3Denabled ;;
>      --disable-curses) printf "%s" -Dcurses=3Ddisabled ;;
> +    --datadir=3D*) quote_sh "-Ddatadir=3D$2" ;;
>      --enable-dbus-display) printf "%s" -Ddbus_display=3Denabled ;;
>      --disable-dbus-display) printf "%s" -Ddbus_display=3Ddisabled ;;
>      --enable-debug-mutex) printf "%s" -Ddebug_mutex=3Dtrue ;;
> @@ -214,6 +226,7 @@ _meson_option_parse() {
>      --disable-debug-stack-usage) printf "%s" -Ddebug_stack_usage=3Dfalse=
 ;;
>      --enable-dmg) printf "%s" -Ddmg=3Denabled ;;
>      --disable-dmg) printf "%s" -Ddmg=3Ddisabled ;;
> +    --docdir=3D*) quote_sh "-Ddocdir=3D$2" ;;
>      --enable-docs) printf "%s" -Ddocs=3Denabled ;;
>      --disable-docs) printf "%s" -Ddocs=3Ddisabled ;;
>      --enable-dsound) printf "%s" -Ddsound=3Denabled ;;
> @@ -252,6 +265,7 @@ _meson_option_parse() {
>      --iasl=3D*) quote_sh "-Diasl=3D$2" ;;
>      --enable-iconv) printf "%s" -Diconv=3Denabled ;;
>      --disable-iconv) printf "%s" -Diconv=3Ddisabled ;;
> +    --includedir=3D*) quote_sh "-Dincludedir=3D$2" ;;
>      --enable-install-blobs) printf "%s" -Dinstall_blobs=3Dtrue ;;
>      --disable-install-blobs) printf "%s" -Dinstall_blobs=3Dfalse ;;
>      --interp-prefix=3D*) quote_sh "-Dinterp_prefix=3D$2" ;;
> @@ -265,6 +279,8 @@ _meson_option_parse() {
>      --disable-l2tpv3) printf "%s" -Dl2tpv3=3Ddisabled ;;
>      --enable-libdaxctl) printf "%s" -Dlibdaxctl=3Denabled ;;
>      --disable-libdaxctl) printf "%s" -Dlibdaxctl=3Ddisabled ;;
> +    --libdir=3D*) quote_sh "-Dlibdir=3D$2" ;;
> +    --libexecdir=3D*) quote_sh "-Dlibexecdir=3D$2" ;;
>      --enable-libiscsi) printf "%s" -Dlibiscsi=3Denabled ;;
>      --disable-libiscsi) printf "%s" -Dlibiscsi=3Ddisabled ;;
>      --enable-libnfs) printf "%s" -Dlibnfs=3Denabled ;;
> @@ -283,6 +299,8 @@ _meson_option_parse() {
>      --disable-linux-io-uring) printf "%s" -Dlinux_io_uring=3Ddisabled ;;
>      --enable-live-block-migration) printf "%s"
> -Dlive_block_migration=3Denabled ;;
>      --disable-live-block-migration) printf "%s"
> -Dlive_block_migration=3Ddisabled ;;
> +    --localedir=3D*) quote_sh "-Dlocaledir=3D$2" ;;
> +    --localstatedir=3D*) quote_sh "-Dlocalstatedir=3D$2" ;;
>      --enable-lzfse) printf "%s" -Dlzfse=3Denabled ;;
>      --disable-lzfse) printf "%s" -Dlzfse=3Ddisabled ;;
>      --enable-lzo) printf "%s" -Dlzo=3Denabled ;;
> @@ -290,6 +308,7 @@ _meson_option_parse() {
>      --enable-malloc=3D*) quote_sh "-Dmalloc=3D$2" ;;
>      --enable-malloc-trim) printf "%s" -Dmalloc_trim=3Denabled ;;
>      --disable-malloc-trim) printf "%s" -Dmalloc_trim=3Ddisabled ;;
> +    --mandir=3D*) quote_sh "-Dmandir=3D$2" ;;
>      --enable-membarrier) printf "%s" -Dmembarrier=3Denabled ;;
>      --disable-membarrier) printf "%s" -Dmembarrier=3Ddisabled ;;
>      --enable-module-upgrades) printf "%s" -Dmodule_upgrades=3Dtrue ;;
> @@ -323,6 +342,7 @@ _meson_option_parse() {
>      --disable-qcow1) printf "%s" -Dqcow1=3Ddisabled ;;
>      --enable-qed) printf "%s" -Dqed=3Denabled ;;
>      --disable-qed) printf "%s" -Dqed=3Ddisabled ;;
> +    --firmwarepath=3D*) quote_sh "-Dqemu_firmwarepath=3D$2" ;;
>      --enable-qga-vss) printf "%s" -Dqga_vss=3Denabled ;;
>      --disable-qga-vss) printf "%s" -Dqga_vss=3Ddisabled ;;
>      --enable-qom-cast-debug) printf "%s" -Dqom_cast_debug=3Dtrue ;;
> @@ -361,6 +381,7 @@ _meson_option_parse() {
>      --disable-spice-protocol) printf "%s" -Dspice_protocol=3Ddisabled ;;
>      --enable-strip) printf "%s" -Dstrip=3Dtrue ;;
>      --disable-strip) printf "%s" -Dstrip=3Dfalse ;;
> +    --sysconfdir=3D*) quote_sh "-Dsysconfdir=3D$2" ;;
>      --enable-tcg) printf "%s" -Dtcg=3Denabled ;;
>      --disable-tcg) printf "%s" -Dtcg=3Ddisabled ;;
>      --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=3Dtrue ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e3db2d05dd270292
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:11 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbo=
nzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">While prefix, bindir and qemu_suffix needs special treatmen=
t due to<br>
differences between Windows and POSIX systems, everything else<br>
needs no extra code in configure.<br>
<br></blockquote><div><br></div><div>Afaik, it&#39;s not common to install =
binaries under $prefix on Windows. I don&#39;t know any open-source project=
 doing that. msys2 explicitly change it to bin again: <a href=3D"https://gi=
thub.com/msys2/MINGW-packages/blob/master/mingw-w64-qemu/PKGBUILD#L94" targ=
et=3D"_blank">https://github.com/msys2/MINGW-packages/blob/master/mingw-w64=
-qemu/PKGBUILD#L94</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>=C2=A0Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 58 ++---------------------------------<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 +--<br>
=C2=A0scripts/meson-buildoptions.py | 11 +++++--<br>
=C2=A0scripts/meson-buildoptions.sh | 21 +++++++++++++<br>
=C2=A04 files changed, 34 insertions(+), 60 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 200ef3be23..b704453c68 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -311,6 +311,7 @@ plugins=3D&quot;$default_feature&quot;<br>
=C2=A0meson=3D&quot;&quot;<br>
=C2=A0meson_args=3D&quot;&quot;<br>
=C2=A0ninja=3D&quot;&quot;<br>
+bindir=3D&quot;bin&quot;<br>
=C2=A0skip_meson=3Dno<br>
<br>
=C2=A0# The following Meson options are handled manually (still they<br>
@@ -669,6 +670,7 @@ if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then=
<br>
=C2=A0 =C2=A0CONFIGURE_CFLAGS=3D&quot;-mthreads $CONFIGURE_CFLAGS&quot;<br>
=C2=A0 =C2=A0write_c_skeleton;<br>
=C2=A0 =C2=A0prefix=3D&quot;/qemu&quot;<br>
+=C2=A0 bindir=3D&quot;&quot;<br>
=C2=A0 =C2=A0qemu_suffix=3D&quot;&quot;<br>
=C2=A0fi<br>
<br>
@@ -775,30 +777,10 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0static=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0 =C2=A0QEMU_PKG_CONFIG_FLAGS=3D&quot;--static $QEMU_PKG_CONFIG=
_FLAGS&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --mandir=3D*) mandir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--bindir=3D*) bindir=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --libdir=3D*) libdir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --libexecdir=3D*) libexecdir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --includedir=3D*) includedir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --datadir=3D*) datadir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--with-suffix=3D*) qemu_suffix=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --docdir=3D*) docdir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --localedir=3D*) localedir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --sysconfdir=3D*) sysconfdir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --localstatedir=3D*) local_statedir=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --firmwarepath=3D*) firmwarepath=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--host=3D*|--build=3D*|\<br>
=C2=A0 =C2=A0--disable-dependency-tracking|\<br>
=C2=A0 =C2=A0--sbindir=3D*|--sharedstatedir=3D*|\<br>
@@ -1021,23 +1003,6 @@ case $git_submodules_action in<br>
=C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0esac<br>
<br>
-libdir=3D&quot;${libdir:-$prefix/lib}&quot;<br>
-libexecdir=3D&quot;${libexecdir:-$prefix/libexec}&quot;<br>
-includedir=3D&quot;${includedir:-$prefix/include}&quot;<br>
-<br>
-if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 bindir=3D&quot;${bindir:-$prefix}&quot;<br>
-else<br>
-=C2=A0 =C2=A0 bindir=3D&quot;${bindir:-$prefix/bin}&quot;<br>
-fi<br>
-mandir=3D&quot;${mandir:-$prefix/share/man}&quot;<br>
-datadir=3D&quot;${datadir:-$prefix/share}&quot;<br>
-docdir=3D&quot;${docdir:-$prefix/share/doc}&quot;<br>
-sysconfdir=3D&quot;${sysconfdir:-$prefix/etc}&quot;<br>
-local_statedir=3D&quot;${local_statedir:-$prefix/var}&quot;<br>
-firmwarepath=3D&quot;${firmwarepath:-$datadir/qemu-firmware}&quot;<br>
-localedir=3D&quot;${localedir:-$datadir/locale}&quot;<br>
-<br>
=C2=A0if eval test -z &quot;\${cross_cc_$cpu}&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0eval &quot;cross_cc_${cpu}=3D\$cc&quot;<br>
=C2=A0 =C2=A0 =C2=A0cross_cc_vars=3D&quot;$cross_cc_vars cross_cc_${cpu}&qu=
ot;<br>
@@ -1115,16 +1080,7 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--with-git-submodules=3Dvalidate fail if git submodules are no=
t up to date<br>
=C2=A0 =C2=A0--with-git-submodules=3Dignore=C2=A0 =C2=A0do not update or ch=
eck git submodules (default if no .git dir)<br>
=C2=A0 =C2=A0--static=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0enable static build [$static]<br>
-=C2=A0 --mandir=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install ma=
n pages in PATH<br>
-=C2=A0 --datadir=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install fi=
rmware in PATH/$qemu_suffix<br>
-=C2=A0 --localedir=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install transla=
tion in PATH/$qemu_suffix<br>
-=C2=A0 --docdir=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install do=
cumentation in PATH/$qemu_suffix<br>
=C2=A0 =C2=A0--bindir=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insta=
ll binaries in PATH<br>
-=C2=A0 --libdir=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install li=
braries in PATH<br>
-=C2=A0 --libexecdir=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 install helper binar=
ies in PATH<br>
-=C2=A0 --sysconfdir=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 install config in PA=
TH/$qemu_suffix<br>
-=C2=A0 --localstatedir=3DPATH=C2=A0 =C2=A0 =C2=A0install local state in PA=
TH (set at runtime on win32)<br>
-=C2=A0 --firmwarepath=3DPATH=C2=A0 =C2=A0 =C2=A0 search PATH for firmware =
files<br>
=C2=A0 =C2=A0--efi-aarch64=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0PATH of efi fil=
e to use for aarch64 VMs.<br>
=C2=A0 =C2=A0--with-suffix=3DSUFFIX=C2=A0 =C2=A0 =C2=A0suffix for QEMU data=
 inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]<br>
=C2=A0 =C2=A0--without-default-features default all --enable-* options to &=
quot;disabled&quot;<br>
@@ -2409,18 +2365,8 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0run_meson() {<br>
=C2=A0 =C2=A0 =C2=A0NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--prefix &quot;$prefix&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --libdir &quot;$libdir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --libexecdir &quot;$libexecdir&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--bindir &quot;$bindir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir &quot;$includedir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --datadir &quot;$datadir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --mandir &quot;$mandir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysconfdir &quot;$sysconfdir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --localedir &quot;$localedir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 --localstatedir &quot;$local_statedir&quot; \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddefault_devices=3D$default_devices \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ddocdir=3D&quot;$docdir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dqemu_firmwarepath=3D&quot;$firmwarepath&quot=
; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dqemu_suffix=3D&quot;$qemu_suffix&quot; =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dsmbd=3D&quot;$smbd&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Doptimization=3D$(if test &quot;$debug&q=
uot; =3D yes; then echo 0; else echo 2; fi) \<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 848426460c..a76fadbd7d 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -4,9 +4,9 @@<br>
<br>
=C2=A0option(&#39;qemu_suffix&#39;, type : &#39;string&#39;, value: &#39;qe=
mu&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Suffix for QEMU data/modules/=
config directories (can be empty)&#39;)<br>
-option(&#39;docdir&#39;, type : &#39;string&#39;, value : &#39;doc&#39;,<b=
r>
+option(&#39;docdir&#39;, type : &#39;string&#39;, value : &#39;share/doc&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Base directory for documentat=
ion installation (can be empty)&#39;)<br>
-option(&#39;qemu_firmwarepath&#39;, type : &#39;string&#39;, value : &#39;=
&#39;,<br>
+option(&#39;qemu_firmwarepath&#39;, type : &#39;string&#39;, value : &#39;=
qemu-firmware&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;search PATH for firmware file=
s&#39;)<br>
=C2=A0option(&#39;pkgversion&#39;, type : &#39;string&#39;, value : &#39;&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;use specified string as sub-v=
ersion of the package&#39;)<br>
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py<=
br>
index 0f9603a7f6..45cda8cd84 100755<br>
--- a/scripts/meson-buildoptions.py<br>
+++ b/scripts/meson-buildoptions.py<br>
@@ -27,9 +27,7 @@<br>
<br>
=C2=A0SKIP_OPTIONS =3D {<br>
=C2=A0 =C2=A0 =C2=A0&quot;default_devices&quot;,<br>
-=C2=A0 =C2=A0 &quot;docdir&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;fuzzing_engine&quot;,<br>
-=C2=A0 =C2=A0 &quot;qemu_firmwarepath&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;qemu_suffix&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;smbd&quot;,<br>
=C2=A0}<br>
@@ -37,12 +35,21 @@<br>
=C2=A0OPTION_NAMES =3D {<br>
=C2=A0 =C2=A0 =C2=A0&quot;malloc&quot;: &quot;enable-malloc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;pkgversion&quot;: &quot;with-pkgversion&quot;,<br=
>
+=C2=A0 =C2=A0 &quot;qemu_firmwarepath&quot;: &quot;firmwarepath&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;trace_backends&quot;: &quot;enable-trace-backends=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;trace_file&quot;: &quot;with-trace-file&quot;,<br=
>
=C2=A0}<br>
<br>
=C2=A0BUILTIN_OPTIONS =3D {<br>
+=C2=A0 =C2=A0 &quot;datadir&quot;,<br>
+=C2=A0 =C2=A0 &quot;includedir&quot;,<br>
+=C2=A0 =C2=A0 &quot;libdir&quot;,<br>
+=C2=A0 =C2=A0 &quot;libexecdir&quot;,<br>
+=C2=A0 =C2=A0 &quot;localedir&quot;,<br>
+=C2=A0 =C2=A0 &quot;localstatedir&quot;,<br>
+=C2=A0 =C2=A0 &quot;mandir&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;strip&quot;,<br>
+=C2=A0 =C2=A0 &quot;sysconfdir&quot;,<br>
=C2=A0}<br>
<br>
=C2=A0LINE_WIDTH =3D 76<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index a0c86db116..a52cc14d13 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -8,8 +8,11 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --block-drv-rw-whitelist=
=3DVALUE&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set block=
 driver read-write whitelist (by default&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affects o=
nly QEMU, not tools like qemu-img)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --datadir=3DVALUE=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Data file directory [share]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --disable-coroutine-pool c=
oroutine freelist (better performance)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --disable-install-blobs=C2=
=A0 install provided firmware blobs&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --docdir=3DVALUE=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Base directory for documentation installation&#3=
9;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(can be empty) [=
share/doc]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-block-drv-whiteli=
st-in-tools&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use block=
 whitelist also in tools instead of only&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU&#39;=
<br>
@@ -40,10 +43,18 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-trace-backends=3D=
CHOICES&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Set avail=
able tracing backends [log] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtrace/ft=
race/log/nop/simple/syslog/ust)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --firmwarepath=3DVALUE=C2=A0 =
=C2=A0 =C2=A0search PATH for firmware files [qemu-firmware]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --iasl=3DVALUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Path to ACPI disassembler&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --includedir=3DVALUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Header file directory [include]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --interp-prefix=3DVALUE=C2=
=A0 =C2=A0 where to find shared libraries etc., use %M for&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu name =
[/usr/gnemul/qemu-%M]&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --libdir=3DVALUE=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Library directory [lib64]&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --libexecdir=3DVALUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Library executable directory [libexec]&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --localedir=3DVALUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Locale data directory [share/locale]&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --localstatedir=3DVALUE=C2=A0 =
=C2=A0 Localstate data directory [/var/local]&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --mandir=3DVALUE=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Manual page directory [share/man]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --sphinx-build=3DVALUE=C2=
=A0 =C2=A0 =C2=A0Use specified sphinx-build for building document&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --sysconfdir=3DVALUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Sysconf data directory [etc]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --tls-priority=3DVALUE=C2=
=A0 =C2=A0 =C2=A0Default TLS protocol/cipher priority string&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[NORMAL]&=
#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --with-pkgversion=3DVALUE=
=C2=A0 use specified string as sub-version of the&#39;<br>
@@ -206,6 +217,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-curl) printf &quot;%s&quot; -Dcurl=3Ddisabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-curses) printf &quot;%s&quot; -Dcurses=3Denabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-curses) printf &quot;%s&quot; -Dcurses=3Ddisa=
bled ;;<br>
+=C2=A0 =C2=A0 --datadir=3D*) quote_sh &quot;-Ddatadir=3D$2&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-dbus-display) printf &quot;%s&quot; -Ddbus_dis=
play=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-dbus-display) printf &quot;%s&quot; -Ddbus_di=
splay=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-debug-mutex) printf &quot;%s&quot; -Ddebug_mut=
ex=3Dtrue ;;<br>
@@ -214,6 +226,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-debug-stack-usage) printf &quot;%s&quot; -Dde=
bug_stack_usage=3Dfalse ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-dmg) printf &quot;%s&quot; -Ddmg=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-dmg) printf &quot;%s&quot; -Ddmg=3Ddisabled ;=
;<br>
+=C2=A0 =C2=A0 --docdir=3D*) quote_sh &quot;-Ddocdir=3D$2&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-docs) printf &quot;%s&quot; -Ddocs=3Denabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--disable-docs) printf &quot;%s&quot; -Ddocs=3Ddisabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-dsound) printf &quot;%s&quot; -Ddsound=3Denabl=
ed ;;<br>
@@ -252,6 +265,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--iasl=3D*) quote_sh &quot;-Diasl=3D$2&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-iconv) printf &quot;%s&quot; -Diconv=3Denabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-iconv) printf &quot;%s&quot; -Diconv=3Ddisabl=
ed ;;<br>
+=C2=A0 =C2=A0 --includedir=3D*) quote_sh &quot;-Dincludedir=3D$2&quot; ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--enable-install-blobs) printf &quot;%s&quot; -Dinstall=
_blobs=3Dtrue ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-install-blobs) printf &quot;%s&quot; -Dinstal=
l_blobs=3Dfalse ;;<br>
=C2=A0 =C2=A0 =C2=A0--interp-prefix=3D*) quote_sh &quot;-Dinterp_prefix=3D$=
2&quot; ;;<br>
@@ -265,6 +279,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-l2tpv3) printf &quot;%s&quot; -Dl2tpv3=3Ddisa=
bled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-libdaxctl) printf &quot;%s&quot; -Dlibdaxctl=
=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-libdaxctl) printf &quot;%s&quot; -Dlibdaxctl=
=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --libdir=3D*) quote_sh &quot;-Dlibdir=3D$2&quot; ;;<br>
+=C2=A0 =C2=A0 --libexecdir=3D*) quote_sh &quot;-Dlibexecdir=3D$2&quot; ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--enable-libiscsi) printf &quot;%s&quot; -Dlibiscsi=3De=
nabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-libiscsi) printf &quot;%s&quot; -Dlibiscsi=3D=
disabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-libnfs) printf &quot;%s&quot; -Dlibnfs=3Denabl=
ed ;;<br>
@@ -283,6 +299,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-linux-io-uring) printf &quot;%s&quot; -Dlinux=
_io_uring=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-live-block-migration) printf &quot;%s&quot; -D=
live_block_migration=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-live-block-migration) printf &quot;%s&quot; -=
Dlive_block_migration=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --localedir=3D*) quote_sh &quot;-Dlocaledir=3D$2&quot; ;;<br=
>
+=C2=A0 =C2=A0 --localstatedir=3D*) quote_sh &quot;-Dlocalstatedir=3D$2&quo=
t; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-lzfse) printf &quot;%s&quot; -Dlzfse=3Denabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-lzfse) printf &quot;%s&quot; -Dlzfse=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-lzo) printf &quot;%s&quot; -Dlzo=3Denabled ;;<=
br>
@@ -290,6 +308,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--enable-malloc=3D*) quote_sh &quot;-Dmalloc=3D$2&quot;=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-malloc-trim) printf &quot;%s&quot; -Dmalloc_tr=
im=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-malloc-trim) printf &quot;%s&quot; -Dmalloc_t=
rim=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --mandir=3D*) quote_sh &quot;-Dmandir=3D$2&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-membarrier) printf &quot;%s&quot; -Dmembarrier=
=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-membarrier) printf &quot;%s&quot; -Dmembarrie=
r=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-module-upgrades) printf &quot;%s&quot; -Dmodul=
e_upgrades=3Dtrue ;;<br>
@@ -323,6 +342,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-qcow1) printf &quot;%s&quot; -Dqcow1=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-qed) printf &quot;%s&quot; -Dqed=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-qed) printf &quot;%s&quot; -Dqed=3Ddisabled ;=
;<br>
+=C2=A0 =C2=A0 --firmwarepath=3D*) quote_sh &quot;-Dqemu_firmwarepath=3D$2&=
quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-qga-vss) printf &quot;%s&quot; -Dqga_vss=3Dena=
bled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-qga-vss) printf &quot;%s&quot; -Dqga_vss=3Ddi=
sabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-qom-cast-debug) printf &quot;%s&quot; -Dqom_ca=
st_debug=3Dtrue ;;<br>
@@ -361,6 +381,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-spice-protocol) printf &quot;%s&quot; -Dspice=
_protocol=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-strip) printf &quot;%s&quot; -Dstrip=3Dtrue ;;=
<br>
=C2=A0 =C2=A0 =C2=A0--disable-strip) printf &quot;%s&quot; -Dstrip=3Dfalse =
;;<br>
+=C2=A0 =C2=A0 --sysconfdir=3D*) quote_sh &quot;-Dsysconfdir=3D$2&quot; ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--enable-tcg) printf &quot;%s&quot; -Dtcg=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-tcg) printf &quot;%s&quot; -Dtcg=3Ddisabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--enable-tcg-interpreter) printf &quot;%s&quot; -Dtcg_i=
nterpreter=3Dtrue ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000e3db2d05dd270292--

