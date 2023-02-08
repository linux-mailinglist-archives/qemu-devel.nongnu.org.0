Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C182E68FB35
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 00:33:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtuX-0003Cv-IZ; Wed, 08 Feb 2023 18:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pPtuS-0003BG-P4
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:31:28 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pPtuP-0005ps-Rb
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:31:28 -0500
Received: by mail-qt1-x82e.google.com with SMTP id m12so210751qth.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJLcdCW9Ct+Bvn6+4o87+8ZttLv2QC99zMir+rC/HCk=;
 b=iUQJcH7z1OkVPU72zdW+i9EqLvrUByXv8cC04ktis7RcVjdxJXiVlxTTgzYMsdT0us
 v1jxSXGAiWXIeLFDBLuFn3sBYl2j5Bc+FCiLPrz1uErznncFHjiVNotqCepreZoB4J8l
 74m0QI9c76PpkkTx+IL56R5mwJdhyQLVwyx7vYtNbvtxmBeQbgsOL2vZysctpjpeNuPq
 E4Kq13xQZDMLDl/tA6IwGsZOAlmJwPhNHmGy1uwR4mZG2GXP2iraOeT4WvsWZzf1Up4f
 SHAZDnXY2jH9VZcuaPzK5AHB2Y8X/zFYAGEKYocH5iHEwqg76aRHNYLxwalYyTJy1uxf
 bi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJLcdCW9Ct+Bvn6+4o87+8ZttLv2QC99zMir+rC/HCk=;
 b=hU65YPt2dBkN9aNUgqST6IIcweV0aaoG1y06X7/dNdHBYVRzI/iLGRYIc4gH27u870
 kxZY7yDLxR6N9LxhuUtbvIitSLsq7gM93rnZ3xnQxjNEXN94UXIU7OF8tb3c2yTsAmLV
 agYFDxGFc7YzLA8tNFCkLZ7zjMA/gva2c+3pndBZHulkcXtcXELh+5hBokAn5UJRScKp
 DDvPf5RHjeUhW05eKoJLycZJWXbp69p1on2k+XOCZTlCw26FtrocFDXcjpBoFTu1CiND
 /9Lj77GCqOjWiausKK9u7ovqhy764alSQvsZZnCqOYSJAC6rTi/8W6AhsKUnMVRL8s/w
 6hNQ==
X-Gm-Message-State: AO0yUKUkYr09FIE7a32HoMhwrNyJK62/MRSB/pS+7lTrCMvuYzEw3v/y
 vrEjoRs4pDdVWOvfxbscqNfRDVhLpp8W1g==
X-Google-Smtp-Source: AK7set/QE0bjUmcHpN7jQVOjsLyLexzExSrGwNxUi6xMKtT/jjrTQNpLnIOcVTvp/H58Lf9nqofNoQ==
X-Received: by 2002:ac8:4e48:0:b0:3b9:a51f:8988 with SMTP id
 e8-20020ac84e48000000b003b9a51f8988mr16898862qtw.31.1675899084573; 
 Wed, 08 Feb 2023 15:31:24 -0800 (PST)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::2bf5])
 by smtp.gmail.com with ESMTPSA id
 s63-20020a37a942000000b0071c9eea2056sm168048qke.14.2023.02.08.15.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 15:31:24 -0800 (PST)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/2] configure: './configure --help' should work
Date: Wed,  8 Feb 2023 18:31:11 -0500
Message-Id: <20230208233111.398577-3-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208233111.398577-1-dinahbaum123@gmail.com>
References: <20230208233111.398577-1-dinahbaum123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Always initialize --help display option

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
---
 configure | 676 +++++++++++++++++++++++++++---------------------------
 1 file changed, 338 insertions(+), 338 deletions(-)

diff --git a/configure b/configure
index 3b384914ce..1fb4d145f1 100755
--- a/configure
+++ b/configure
@@ -14,6 +14,344 @@ export CCACHE_RECACHE=yes
 # make source path absolute
 source_path=$(cd "$(dirname -- "$0")"; pwd)
 
+werror=""
+
+print_error() {
+    (echo
+    echo "ERROR: $1"
+    while test -n "$2"; do
+        echo "       $2"
+        shift
+    done
+    echo) >&2
+}
+
+error_exit() {
+    print_error "$@"
+    exit 1
+}
+
+meson_option_build_array() {
+  printf '['
+  (if test "$targetos" = windows; then
+    IFS=\;
+  else
+    IFS=:
+  fi
+  for e in $1; do
+    printf '"""'
+    # backslash escape any '\' and '"' characters
+    printf "%s" "$e" | sed -e 's/\([\"]\)/\\\1/g'
+    printf '""",'
+  done)
+  printf ']\n'
+}
+
+. "$source_path/scripts/meson-buildoptions.sh"
+
+quote_sh() {
+    printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
+}
+
+meson_options=
+meson_option_add() {
+  meson_options="$meson_options $(quote_sh "$1")"
+}
+meson_option_parse() {
+  meson_options="$meson_options $(_meson_option_parse "$@")"
+  if test $? -eq 1; then
+    echo "ERROR: unknown option $1"
+    echo "Try '$0 --help' for more information"
+    exit 1
+  fi
+}
+
+for opt do
+  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
+  case "$opt" in
+  --help|-h) show_help=yes
+  ;;
+  --version|-V) exec cat "$source_path/VERSION"
+  ;;
+  --prefix=*) prefix="$optarg"
+  ;;
+  --cross-prefix=*)
+  ;;
+  --cc=*)
+  ;;
+  --host-cc=*) host_cc="$optarg"
+  ;;
+  --cxx=*)
+  ;;
+  --objcc=*) objcc="$optarg"
+  ;;
+  --make=*) make="$optarg"
+  ;;
+  --install=*)
+  ;;
+  --python=*) python="$optarg" ; explicit_python=yes
+  ;;
+  --skip-meson) skip_meson=yes
+  ;;
+  --meson=*) meson="$optarg"
+  ;;
+  --ninja=*) ninja="$optarg"
+  ;;
+  --smbd=*) smbd="$optarg"
+  ;;
+  --extra-cflags=*)
+  ;;
+  --extra-cxxflags=*)
+  ;;
+  --extra-objcflags=*)
+  ;;
+  --extra-ldflags=*)
+  ;;
+  --cross-cc-*)
+  ;;
+  --cross-prefix-*)
+  ;;
+  --enable-debug-info) meson_option_add -Ddebug=true
+  ;;
+  --disable-debug-info) meson_option_add -Ddebug=false
+  ;;
+  --enable-modules)
+      modules="yes"
+  ;;
+  --disable-modules)
+      modules="no"
+  ;;
+  --cpu=*)
+  ;;
+  --target-list=*) target_list="$optarg"
+                   if test "$target_list_exclude"; then
+                       error_exit "Can't mix --target-list with --target-list-exclude"
+                   fi
+  ;;
+  --target-list-exclude=*) target_list_exclude="$optarg"
+                   if test "$target_list"; then
+                       error_exit "Can't mix --target-list-exclude with --target-list"
+                   fi
+  ;;
+  --with-default-devices) meson_option_add -Ddefault_devices=true
+  ;;
+  --without-default-devices) meson_option_add -Ddefault_devices=false
+  ;;
+  --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-FOO option"
+  ;;
+  --with-devices-*) device_arch=${opt#--with-devices-};
+                    device_arch=${device_arch%%=*}
+                    cf=$source_path/configs/devices/$device_arch-softmmu/$optarg.mak
+                    if test -f "$cf"; then
+                        device_archs="$device_archs $device_arch"
+                        eval "devices_${device_arch}=\$optarg"
+                    else
+                        error_exit "File $cf does not exist"
+                    fi
+  ;;
+  --without-default-features) # processed above
+  ;;
+  --static)
+    static="yes"
+    QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
+  ;;
+  --bindir=*) bindir="$optarg"
+  ;;
+  --with-suffix=*) qemu_suffix="$optarg"
+  ;;
+  --host=*|--build=*|\
+  --disable-dependency-tracking|\
+  --sbindir=*|--sharedstatedir=*|\
+  --oldincludedir=*|--datarootdir=*|--infodir=*|\
+  --htmldir=*|--dvidir=*|--pdfdir=*|--psdir=*)
+    # These switches are silently ignored, for compatibility with
+    # autoconf-generated configure scripts. This allows QEMU's
+    # configure to be used by RPM and similar macros that set
+    # lots of directory switches by default.
+  ;;
+  --enable-debug-tcg) debug_tcg="yes"
+  ;;
+  --disable-debug-tcg) debug_tcg="no"
+  ;;
+  --enable-debug)
+      # Enable debugging options that aren't excessively noisy
+      debug_tcg="yes"
+      meson_option_parse --enable-debug-mutex ""
+      meson_option_add -Doptimization=0
+      fortify_source="no"
+  ;;
+  --enable-sanitizers) sanitizers="yes"
+  ;;
+  --disable-sanitizers) sanitizers="no"
+  ;;
+  --enable-tsan) tsan="yes"
+  ;;
+  --disable-tsan) tsan="no"
+  ;;
+  --disable-tcg) tcg="disabled"
+                 plugins="no"
+  ;;
+  --enable-tcg) tcg="enabled"
+  ;;
+  --disable-system) softmmu="no"
+  ;;
+  --enable-system) softmmu="yes"
+  ;;
+  --disable-user)
+      linux_user="no" ;
+      bsd_user="no" ;
+  ;;
+  --enable-user) ;;
+  --disable-linux-user) linux_user="no"
+  ;;
+  --enable-linux-user) linux_user="yes"
+  ;;
+  --disable-bsd-user) bsd_user="no"
+  ;;
+  --enable-bsd-user) bsd_user="yes"
+  ;;
+  --enable-pie) pie="yes"
+  ;;
+  --disable-pie) pie="no"
+  ;;
+  --enable-werror) werror="yes"
+  ;;
+  --disable-werror) werror="no"
+  ;;
+  --enable-stack-protector) stack_protector="yes"
+  ;;
+  --disable-stack-protector) stack_protector="no"
+  ;;
+  --enable-safe-stack) safe_stack="yes"
+  ;;
+  --disable-safe-stack) safe_stack="no"
+  ;;
+  --enable-cfi)
+      cfi="true";
+      meson_option_add -Db_lto=true
+  ;;
+  --disable-cfi) cfi="false"
+  ;;
+  --disable-fdt) fdt="disabled"
+  ;;
+  --enable-fdt) fdt="enabled"
+  ;;
+  --enable-fdt=git) fdt="internal"
+  ;;
+  --enable-fdt=*) fdt="$optarg"
+  ;;
+  --with-coroutine=*) coroutine="$optarg"
+  ;;
+  --with-git=*) git="$optarg"
+  ;;
+  --with-git-submodules=*)
+      git_submodules_action="$optarg"
+  ;;
+  --enable-plugins) if test "$mingw32" = "yes"; then
+                        error_exit "TCG plugins not currently supported on Windows platforms"
+                    else
+                        plugins="yes"
+                    fi
+  ;;
+  --disable-plugins) plugins="no"
+  ;;
+  --enable-containers) use_containers="yes"
+  ;;
+  --disable-containers) use_containers="no"
+  ;;
+  --gdb=*) gdb_bin="$optarg"
+  ;;
+  --enable-vfio-user-server) vfio_user_server="enabled"
+  ;;
+  --disable-vfio-user-server) vfio_user_server="disabled"
+  ;;
+  # everything else has the same name in configure and meson
+  --*) meson_option_parse "$opt" "$optarg"
+  ;;
+  esac
+done
+
+# test for any invalid configuration combinations
+if test "$plugins" = "yes" -a "$tcg" = "disabled"; then
+    error_exit "Can't enable plugins on non-TCG builds"
+fi
+
+if test x"$show_help" = x"yes" ; then
+cat << EOF
+
+Usage: configure [options]
+Options: [defaults in brackets after descriptions]
+
+Standard options:
+  --help                   print this message
+  --prefix=PREFIX          install in PREFIX [$prefix]
+  --target-list=LIST       set target list (default: build all)
+$(echo Available targets: $default_target_list | \
+  fold -s -w 53 | sed -e 's/^/                           /')
+  --target-list-exclude=LIST exclude a set of targets from the default target-list
+
+Advanced options (experts only):
+  --cross-prefix=PREFIX    use PREFIX for compile tools, PREFIX can be blank [$cross_prefix]
+  --cc=CC                  use C compiler CC [$cc]
+  --host-cc=CC             use C compiler CC [$host_cc] for code run at
+                           build time
+  --cxx=CXX                use C++ compiler CXX [$cxx]
+  --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
+  --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
+  --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
+  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
+  --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
+  --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
+  --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
+  --cross-prefix-ARCH=PREFIX cross compiler prefix when building ARCH guest test cases
+  --make=MAKE              use specified make [$make]
+  --python=PYTHON          use specified python [$python]
+  --meson=MESON            use specified meson [$meson]
+  --ninja=NINJA            use specified ninja [$ninja]
+  --smbd=SMBD              use specified smbd [$smbd]
+  --with-git=GIT           use specified git [$git]
+  --with-git-submodules=update   update git submodules (default if .git dir exists)
+  --with-git-submodules=validate fail if git submodules are not up to date
+  --with-git-submodules=ignore   do not update or check git submodules (default if no .git dir)
+  --static                 enable static build [$static]
+  --bindir=PATH            install binaries in PATH
+  --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
+  --without-default-features default all --enable-* options to "disabled"
+  --without-default-devices  do not include any device that is not needed to
+                           start the emulator (only use if you are including
+                           desired devices in configs/devices/)
+  --with-devices-ARCH=NAME override default configs/devices
+  --enable-debug           enable common debug build options
+  --enable-sanitizers      enable default sanitizers
+  --enable-tsan            enable thread sanitizer
+  --disable-werror         disable compilation abort on warning
+  --disable-stack-protector disable compiler-provided stack protection
+  --cpu=CPU                Build for host CPU [$cpu]
+  --with-coroutine=BACKEND coroutine backend. Supported options:
+                           ucontext, sigaltstack, windows
+  --enable-plugins
+                           enable plugins via shared library loading
+  --disable-containers     don't use containers for cross-building
+  --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
+EOF
+  meson_options_help
+cat << EOF
+  system          all system emulation targets
+  user            supported user emulation targets
+  linux-user      all linux usermode emulation targets
+  bsd-user        all BSD usermode emulation targets
+  pie             Position Independent Executables
+  modules         modules support (non-Windows)
+  debug-tcg       TCG debugging (default is disabled)
+  debug-info      debugging information
+  safe-stack      SafeStack Stack Smash Protection. Depends on
+                  clang/llvm >= 3.7 and requires coroutine backend ucontext.
+
+NOTE: The object files are built at the place where configure is launched
+EOF
+exit 0
+fi
+
 if test "$PWD" = "$source_path"
 then
     echo "Using './build' as the directory for build output"
@@ -93,25 +431,6 @@ invoke=$(printf " '%s'" "$0" "$@")
 test -n "$GITLAB_CI" && echo "configuring with: $invoke"
 { echo "$invoke"; echo; echo "#"; } >> config.log
 
-quote_sh() {
-    printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
-}
-
-print_error() {
-    (echo
-    echo "ERROR: $1"
-    while test -n "$2"; do
-        echo "       $2"
-        shift
-    done
-    echo) >&2
-}
-
-error_exit() {
-    print_error "$@"
-    exit 1
-}
-
 do_compiler() {
   # Run the compiler, capturing its output to the log. First argument
   # is compiler binary to execute.
@@ -639,249 +958,6 @@ if test "$mingw32" = "yes" ; then
   qemu_suffix=""
 fi
 
-werror=""
-
-meson_option_build_array() {
-  printf '['
-  (if test "$targetos" = windows; then
-    IFS=\;
-  else
-    IFS=:
-  fi
-  for e in $1; do
-    printf '"""'
-    # backslash escape any '\' and '"' characters
-    printf "%s" "$e" | sed -e 's/\([\"]\)/\\\1/g'
-    printf '""",'
-  done)
-  printf ']\n'
-}
-
-. "$source_path/scripts/meson-buildoptions.sh"
-
-meson_options=
-meson_option_add() {
-  meson_options="$meson_options $(quote_sh "$1")"
-}
-meson_option_parse() {
-  meson_options="$meson_options $(_meson_option_parse "$@")"
-  if test $? -eq 1; then
-    echo "ERROR: unknown option $1"
-    echo "Try '$0 --help' for more information"
-    exit 1
-  fi
-}
-
-for opt do
-  optarg=$(expr "x$opt" : 'x[^=]*=\(.*\)')
-  case "$opt" in
-  --help|-h) show_help=yes
-  ;;
-  --version|-V) exec cat "$source_path/VERSION"
-  ;;
-  --prefix=*) prefix="$optarg"
-  ;;
-  --cross-prefix=*)
-  ;;
-  --cc=*)
-  ;;
-  --host-cc=*) host_cc="$optarg"
-  ;;
-  --cxx=*)
-  ;;
-  --objcc=*) objcc="$optarg"
-  ;;
-  --make=*) make="$optarg"
-  ;;
-  --install=*)
-  ;;
-  --python=*) python="$optarg" ; explicit_python=yes
-  ;;
-  --skip-meson) skip_meson=yes
-  ;;
-  --meson=*) meson="$optarg"
-  ;;
-  --ninja=*) ninja="$optarg"
-  ;;
-  --smbd=*) smbd="$optarg"
-  ;;
-  --extra-cflags=*)
-  ;;
-  --extra-cxxflags=*)
-  ;;
-  --extra-objcflags=*)
-  ;;
-  --extra-ldflags=*)
-  ;;
-  --cross-cc-*)
-  ;;
-  --cross-prefix-*)
-  ;;
-  --enable-debug-info) meson_option_add -Ddebug=true
-  ;;
-  --disable-debug-info) meson_option_add -Ddebug=false
-  ;;
-  --enable-modules)
-      modules="yes"
-  ;;
-  --disable-modules)
-      modules="no"
-  ;;
-  --cpu=*)
-  ;;
-  --target-list=*) target_list="$optarg"
-                   if test "$target_list_exclude"; then
-                       error_exit "Can't mix --target-list with --target-list-exclude"
-                   fi
-  ;;
-  --target-list-exclude=*) target_list_exclude="$optarg"
-                   if test "$target_list"; then
-                       error_exit "Can't mix --target-list-exclude with --target-list"
-                   fi
-  ;;
-  --with-default-devices) meson_option_add -Ddefault_devices=true
-  ;;
-  --without-default-devices) meson_option_add -Ddefault_devices=false
-  ;;
-  --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-FOO option"
-  ;;
-  --with-devices-*) device_arch=${opt#--with-devices-};
-                    device_arch=${device_arch%%=*}
-                    cf=$source_path/configs/devices/$device_arch-softmmu/$optarg.mak
-                    if test -f "$cf"; then
-                        device_archs="$device_archs $device_arch"
-                        eval "devices_${device_arch}=\$optarg"
-                    else
-                        error_exit "File $cf does not exist"
-                    fi
-  ;;
-  --without-default-features) # processed above
-  ;;
-  --static)
-    static="yes"
-    QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
-  ;;
-  --bindir=*) bindir="$optarg"
-  ;;
-  --with-suffix=*) qemu_suffix="$optarg"
-  ;;
-  --host=*|--build=*|\
-  --disable-dependency-tracking|\
-  --sbindir=*|--sharedstatedir=*|\
-  --oldincludedir=*|--datarootdir=*|--infodir=*|\
-  --htmldir=*|--dvidir=*|--pdfdir=*|--psdir=*)
-    # These switches are silently ignored, for compatibility with
-    # autoconf-generated configure scripts. This allows QEMU's
-    # configure to be used by RPM and similar macros that set
-    # lots of directory switches by default.
-  ;;
-  --enable-debug-tcg) debug_tcg="yes"
-  ;;
-  --disable-debug-tcg) debug_tcg="no"
-  ;;
-  --enable-debug)
-      # Enable debugging options that aren't excessively noisy
-      debug_tcg="yes"
-      meson_option_parse --enable-debug-mutex ""
-      meson_option_add -Doptimization=0
-      fortify_source="no"
-  ;;
-  --enable-sanitizers) sanitizers="yes"
-  ;;
-  --disable-sanitizers) sanitizers="no"
-  ;;
-  --enable-tsan) tsan="yes"
-  ;;
-  --disable-tsan) tsan="no"
-  ;;
-  --disable-tcg) tcg="disabled"
-                 plugins="no"
-  ;;
-  --enable-tcg) tcg="enabled"
-  ;;
-  --disable-system) softmmu="no"
-  ;;
-  --enable-system) softmmu="yes"
-  ;;
-  --disable-user)
-      linux_user="no" ;
-      bsd_user="no" ;
-  ;;
-  --enable-user) ;;
-  --disable-linux-user) linux_user="no"
-  ;;
-  --enable-linux-user) linux_user="yes"
-  ;;
-  --disable-bsd-user) bsd_user="no"
-  ;;
-  --enable-bsd-user) bsd_user="yes"
-  ;;
-  --enable-pie) pie="yes"
-  ;;
-  --disable-pie) pie="no"
-  ;;
-  --enable-werror) werror="yes"
-  ;;
-  --disable-werror) werror="no"
-  ;;
-  --enable-stack-protector) stack_protector="yes"
-  ;;
-  --disable-stack-protector) stack_protector="no"
-  ;;
-  --enable-safe-stack) safe_stack="yes"
-  ;;
-  --disable-safe-stack) safe_stack="no"
-  ;;
-  --enable-cfi)
-      cfi="true";
-      meson_option_add -Db_lto=true
-  ;;
-  --disable-cfi) cfi="false"
-  ;;
-  --disable-fdt) fdt="disabled"
-  ;;
-  --enable-fdt) fdt="enabled"
-  ;;
-  --enable-fdt=git) fdt="internal"
-  ;;
-  --enable-fdt=*) fdt="$optarg"
-  ;;
-  --with-coroutine=*) coroutine="$optarg"
-  ;;
-  --with-git=*) git="$optarg"
-  ;;
-  --with-git-submodules=*)
-      git_submodules_action="$optarg"
-  ;;
-  --enable-plugins) if test "$mingw32" = "yes"; then
-                        error_exit "TCG plugins not currently supported on Windows platforms"
-                    else
-                        plugins="yes"
-                    fi
-  ;;
-  --disable-plugins) plugins="no"
-  ;;
-  --enable-containers) use_containers="yes"
-  ;;
-  --disable-containers) use_containers="no"
-  ;;
-  --gdb=*) gdb_bin="$optarg"
-  ;;
-  --enable-vfio-user-server) vfio_user_server="enabled"
-  ;;
-  --disable-vfio-user-server) vfio_user_server="disabled"
-  ;;
-  # everything else has the same name in configure and meson
-  --*) meson_option_parse "$opt" "$optarg"
-  ;;
-  esac
-done
-
-# test for any invalid configuration combinations
-if test "$plugins" = "yes" -a "$tcg" = "disabled"; then
-    error_exit "Can't enable plugins on non-TCG builds"
-fi
-
 case $git_submodules_action in
     update|validate)
         if test ! -e "$source_path/.git"; then
@@ -954,82 +1030,6 @@ for config in $mak_wilds; do
     fi
 done
 
-if test x"$show_help" = x"yes" ; then
-cat << EOF
-
-Usage: configure [options]
-Options: [defaults in brackets after descriptions]
-
-Standard options:
-  --help                   print this message
-  --prefix=PREFIX          install in PREFIX [$prefix]
-  --target-list=LIST       set target list (default: build all)
-$(echo Available targets: $default_target_list | \
-  fold -s -w 53 | sed -e 's/^/                           /')
-  --target-list-exclude=LIST exclude a set of targets from the default target-list
-
-Advanced options (experts only):
-  --cross-prefix=PREFIX    use PREFIX for compile tools, PREFIX can be blank [$cross_prefix]
-  --cc=CC                  use C compiler CC [$cc]
-  --host-cc=CC             use C compiler CC [$host_cc] for code run at
-                           build time
-  --cxx=CXX                use C++ compiler CXX [$cxx]
-  --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
-  --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
-  --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
-  --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
-  --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
-  --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
-  --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
-  --cross-prefix-ARCH=PREFIX cross compiler prefix when building ARCH guest test cases
-  --make=MAKE              use specified make [$make]
-  --python=PYTHON          use specified python [$python]
-  --meson=MESON            use specified meson [$meson]
-  --ninja=NINJA            use specified ninja [$ninja]
-  --smbd=SMBD              use specified smbd [$smbd]
-  --with-git=GIT           use specified git [$git]
-  --with-git-submodules=update   update git submodules (default if .git dir exists)
-  --with-git-submodules=validate fail if git submodules are not up to date
-  --with-git-submodules=ignore   do not update or check git submodules (default if no .git dir)
-  --static                 enable static build [$static]
-  --bindir=PATH            install binaries in PATH
-  --with-suffix=SUFFIX     suffix for QEMU data inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]
-  --without-default-features default all --enable-* options to "disabled"
-  --without-default-devices  do not include any device that is not needed to
-                           start the emulator (only use if you are including
-                           desired devices in configs/devices/)
-  --with-devices-ARCH=NAME override default configs/devices
-  --enable-debug           enable common debug build options
-  --enable-sanitizers      enable default sanitizers
-  --enable-tsan            enable thread sanitizer
-  --disable-werror         disable compilation abort on warning
-  --disable-stack-protector disable compiler-provided stack protection
-  --cpu=CPU                Build for host CPU [$cpu]
-  --with-coroutine=BACKEND coroutine backend. Supported options:
-                           ucontext, sigaltstack, windows
-  --enable-plugins
-                           enable plugins via shared library loading
-  --disable-containers     don't use containers for cross-building
-  --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
-EOF
-  meson_options_help
-cat << EOF
-  system          all system emulation targets
-  user            supported user emulation targets
-  linux-user      all linux usermode emulation targets
-  bsd-user        all BSD usermode emulation targets
-  pie             Position Independent Executables
-  modules         modules support (non-Windows)
-  debug-tcg       TCG debugging (default is disabled)
-  debug-info      debugging information
-  safe-stack      SafeStack Stack Smash Protection. Depends on
-                  clang/llvm >= 3.7 and requires coroutine backend ucontext.
-
-NOTE: The object files are built at the place where configure is launched
-EOF
-exit 0
-fi
-
 # Remove old dependency files to make sure that they get properly regenerated
 rm -f ./*/config-devices.mak.d
 
-- 
2.30.2


