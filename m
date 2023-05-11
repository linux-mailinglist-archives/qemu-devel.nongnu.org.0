Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF256FEF41
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:51:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2wp-0000Ng-8E; Thu, 11 May 2023 05:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wk-0000Kz-1u
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wh-0006gQ-Mh
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KulxYhT6Wle7oehE4orMMCVefdkwlV+I3CTzF01bhEs=;
 b=DeMYg9kSMj6VY1gChAQORH73DshfqYapv7yLTO130m8ttxtqzKq9kZbRtuP9x/0/Yt2Npy
 c3sOhzcID8dFaqqTJ7R/rdqpAUMNnikb3Yh6HgeUXz9U2dClZ+5IStHBeezp0I4ePGU893
 tFxAVeKhHRw6NbaKfbDRXShsHDtuX/I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-jg3nzDCkPfC72p97wMBmsA-1; Thu, 11 May 2023 05:50:46 -0400
X-MC-Unique: jg3nzDCkPfC72p97wMBmsA-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50bc88edf7eso7986827a12.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798644; x=1686390644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KulxYhT6Wle7oehE4orMMCVefdkwlV+I3CTzF01bhEs=;
 b=PeCRU/y+QHI22+LHeR++MbT2LCDqULKIrP8h+ZHszN/ZyGqs/YE7INSkFujef1bSTi
 UvLf1EUr/piB/ooptwaM+HyfIe4+ThWiyO1QCrP1gHISnUtuD2wc7whhDArzDkw1E1mX
 w3xpKXcRBwWAfuR110bOP9oz07dCHdZFF2axaipy+jPVdw1xtx5Ok0QKVdn3vmdu8jRU
 GsrLg3RjfbM1kSPU1/8D/9SXs3CYFXEVlQzQGuq1PEBJ16UMVKOFThoOpi++TGbun32R
 csv7Pu5FsRiGLbeA6d3b2KuDK+UqXU7+eurXeudaaRQ84X10XSH8O5rIhtiP0MnPXk0A
 +GuA==
X-Gm-Message-State: AC+VfDyEJWI//w5DdaL9zX3Sfdz/jI1HGQWVRvjln7ZgssPo7cQ7e+K4
 EF6MHfWWAcAbb8w3cj2drUbk7Vz63XavDscNWHN2K+lKXKqmSIYfJC0QT7GvqFZw27wx5zM+X/G
 vQi7VcLr4pu81X63yiNq0UDUt/MLPCQ6PSdFrnYCweZn01dURdE93cgAMP40NoF1sFTMhbmln5a
 w=
X-Received: by 2002:a17:907:3f0a:b0:967:21:5887 with SMTP id
 hq10-20020a1709073f0a00b0096700215887mr12576677ejc.40.1683798644118; 
 Thu, 11 May 2023 02:50:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lHPMIGBkStHNzBGAf29yWzOkuBsBBKG2FR8+vecY3wHFsnse6JsCiCgi9b+Qc+dFbKJOosg==
X-Received: by 2002:a17:907:3f0a:b0:967:21:5887 with SMTP id
 hq10-20020a1709073f0a00b0096700215887mr12576658ejc.40.1683798643656; 
 Thu, 11 May 2023 02:50:43 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 g8-20020aa7d1c8000000b00501d73cfc86sm2745220edp.9.2023.05.11.02.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/24] build: move glib detection and workarounds to meson
Date: Thu, 11 May 2023 11:50:04 +0200
Message-Id: <20230511095021.1397802-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU adds the path to glib.h to all compilation commands.  This is simpler
due to the pervasive use of static_library, and was grandfathered in from
the previous Make-based build system.  Until Meson 0.63 the only way to
do this was to detect glib in configure and use add_project_arguments,
but now it is possible to use add_project_dependencies instead.

gmodule is detected in a separate variable, with export enabled for
modules and disabled for plugin.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                | 98 +---------------------------------------
 contrib/plugins/Makefile |  4 +-
 meson.build              | 92 +++++++++++++++++++++++++++++--------
 util/meson.build         |  4 +-
 4 files changed, 80 insertions(+), 118 deletions(-)

diff --git a/configure b/configure
index 2edc5070cd26..fe15efa9ebe1 100755
--- a/configure
+++ b/configure
@@ -231,7 +231,6 @@ safe_stack=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 gdb_arches=""
-glib_has_gslice="no"
 
 if test -e "$source_path/.git"
 then
@@ -1509,95 +1508,6 @@ if ! has "$pkg_config_exe"; then
   error_exit "pkg-config binary '$pkg_config_exe' not found"
 fi
 
-##########################################
-# glib support probe
-
-# When bumping glib_req_ver, please check also whether we should increase
-# the _WIN32_WINNT setting in osdep.h according to the value from glib
-glib_req_ver=2.56
-glib_modules=gthread-2.0
-if test "$modules" = yes; then
-    glib_modules="$glib_modules gmodule-export-2.0"
-elif test "$plugins" = "yes"; then
-    glib_modules="$glib_modules gmodule-no-export-2.0"
-fi
-
-for i in $glib_modules; do
-    if $pkg_config --atleast-version=$glib_req_ver $i; then
-        glib_cflags=$($pkg_config --cflags $i)
-        glib_libs=$($pkg_config --libs $i)
-    else
-        error_exit "glib-$glib_req_ver $i is required to compile QEMU"
-    fi
-done
-
-# Check whether glib has gslice, which we have to avoid for correctness.
-# TODO: remove this check and the corresponding workaround (qtree) when
-# the minimum supported glib is >= $glib_dropped_gslice_version.
-glib_dropped_gslice_version=2.75.3
-for i in $glib_modules; do
-    if ! $pkg_config --atleast-version=$glib_dropped_gslice_version $i; then
-        glib_has_gslice="yes"
-	break
-    fi
-done
-
-glib_bindir="$($pkg_config --variable=bindir glib-2.0)"
-if test -z "$glib_bindir" ; then
-	glib_bindir="$($pkg_config --variable=prefix glib-2.0)"/bin
-fi
-
-# This workaround is required due to a bug in pkg-config file for glib as it
-# doesn't define GLIB_STATIC_COMPILATION for pkg-config --static
-
-if test "$static" = yes && test "$mingw32" = yes; then
-    glib_cflags="-DGLIB_STATIC_COMPILATION $glib_cflags"
-fi
-
-# Sanity check that the current size_t matches the
-# size that glib thinks it should be. This catches
-# problems on multi-arch where people try to build
-# 32-bit QEMU while pointing at 64-bit glib headers
-cat > $TMPC <<EOF
-#include <glib.h>
-#include <unistd.h>
-
-#define QEMU_BUILD_BUG_ON(x) \
-  typedef char qemu_build_bug_on[(x)?-1:1] __attribute__((unused));
-
-int main(void) {
-   QEMU_BUILD_BUG_ON(sizeof(size_t) != GLIB_SIZEOF_SIZE_T);
-   return 0;
-}
-EOF
-
-if ! compile_prog "$glib_cflags" "$glib_libs" ; then
-    error_exit "sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T."\
-               "You probably need to set PKG_CONFIG_LIBDIR"\
-	       "to point to the right pkg-config files for your"\
-	       "build target"
-fi
-
-# Silence clang warnings triggered by glib < 2.57.2
-cat > $TMPC << EOF
-#include <glib.h>
-typedef struct Foo {
-    int i;
-} Foo;
-static void foo_free(Foo *f)
-{
-    g_free(f);
-}
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(Foo, foo_free)
-int main(void) { return 0; }
-EOF
-if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
-    if cc_has_warning_flag "-Wno-unused-function"; then
-        glib_cflags="$glib_cflags -Wno-unused-function"
-        CONFIGURE_CFLAGS="$CONFIGURE_CFLAGS -Wno-unused-function"
-    fi
-fi
-
 ##########################################
 # fdt probe
 
@@ -2454,16 +2364,10 @@ echo "PYTHON=$python" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
+echo "PKG_CONFIG=${pkg_config_exe}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
-echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
-echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
-echo "GLIB_BINDIR=$glib_bindir" >> $config_host_mak
-echo "GLIB_VERSION=$($pkg_config --modversion glib-2.0)" >> $config_host_mak
-if test "$glib_has_gslice" = "yes" ; then
-    echo "HAVE_GLIB_WITH_SLICE_ALLOCATOR=y" >> $config_host_mak
-fi
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 23e0396687e8..8a316cd76f2f 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -3,7 +3,7 @@
 # This Makefile example is fairly independent from the main makefile
 # so users can take and adapt it for their build. We only really
 # include config-host.mak so we don't have to repeat probing for
-# cflags that the main configure has already done for us.
+# programs that the main configure has already done for us.
 #
 
 BUILD_DIR := $(CURDIR)/../..
@@ -26,7 +26,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
-CFLAGS = $(GLIB_CFLAGS)
+CFLAGS := $(shell $(PKG_CONFIG) --cflags glib-2.0)
 CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
 CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
 CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
diff --git a/meson.build b/meson.build
index 56d0c5ba52f5..f1a74126f506 100644
--- a/meson.build
+++ b/meson.build
@@ -492,23 +492,79 @@ endif
 # Dependencies #
 ################
 
-# The path to glib.h is added to all compilation commands.  This was
-# grandfathered in from the QEMU Makefiles.
-add_project_arguments(config_host['GLIB_CFLAGS'].split(),
-                      native: false, language: all_languages)
-glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
-                          link_args: config_host['GLIB_LIBS'].split(),
-                          version: config_host['GLIB_VERSION'],
-                          variables: {
-                            'bindir': config_host['GLIB_BINDIR'],
-                          })
-# override glib dep with the configure results (for subprojects)
-meson.override_dependency('glib-2.0', glib)
-# pass down whether Glib has the slice allocator
-if config_host.has_key('HAVE_GLIB_WITH_SLICE_ALLOCATOR')
-  config_host_data.set('HAVE_GLIB_WITH_SLICE_ALLOCATOR', true)
+# When bumping glib minimum version, please check also whether to increase
+# the _WIN32_WINNT setting in osdep.h according to the value from glib
+glib_req_ver = '>=2.56.0'
+glib_pc = dependency('glib-2.0', version: glib_req_ver, required: true,
+                    method: 'pkg-config')
+glib_cflags = []
+if config_host.has_key('CONFIG_MODULES')
+  gmodule = dependency('gmodule-export-2.0', version: glib_req_ver, required: true,
+                       method: 'pkg-config')
+elif config_host.has_key('CONFIG_PLUGIN')
+  gmodule = dependency('gmodule-no-export-2.0', version: glib_req_ver, required: true,
+                       method: 'pkg-config')
+else
+  gmodule = not_found
 endif
 
+# This workaround is required due to a bug in pkg-config file for glib as it
+# doesn't define GLIB_STATIC_COMPILATION for pkg-config --static
+if targetos == 'windows' and get_option('prefer_static')
+  glib_cflags += ['-DGLIB_STATIC_COMPILATION']
+endif
+
+# Sanity check that the current size_t matches the
+# size that glib thinks it should be. This catches
+# problems on multi-arch where people try to build
+# 32-bit QEMU while pointing at 64-bit glib headers
+
+if not cc.compiles('''
+  #include <glib.h>
+  #include <unistd.h>
+
+  #define QEMU_BUILD_BUG_ON(x) \
+  typedef char qemu_build_bug_on[(x)?-1:1] __attribute__((unused));
+
+  int main(void) {
+     QEMU_BUILD_BUG_ON(sizeof(size_t) != GLIB_SIZEOF_SIZE_T);
+     return 0;
+  }''', dependencies: glib_pc, args: glib_cflags)
+  error('''sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T.
+        You probably need to set PKG_CONFIG_LIBDIR" to point
+        to the right pkg-config files for your build target.''')
+endif
+
+# Silence clang warnings triggered by glib < 2.57.2
+if not cc.compiles('''
+  #include <glib.h>
+  typedef struct Foo {
+    int i;
+  } Foo;
+  static void foo_free(Foo *f)
+  {
+    g_free(f);
+  }
+  G_DEFINE_AUTOPTR_CLEANUP_FUNC(Foo, foo_free)
+  int main(void) { return 0; }''', dependencies: glib_pc, args: ['-Werror'])
+  glib_cflags += cc.get_supported_arguments('-Wno-unused-function')
+endif
+glib = declare_dependency(dependencies: [glib_pc, gmodule],
+                          compile_args: glib_cflags,
+                          version: glib_pc.version())
+
+# Check whether glib has gslice, which we have to avoid for correctness.
+# TODO: remove this check and the corresponding workaround (qtree) when
+# the minimum supported glib is >= 2.75.3
+glib_has_gslice = glib.version().version_compare('<2.75.3')
+
+# override glib dep to include the above refinements
+meson.override_dependency('glib-2.0', glib)
+
+# The path to glib.h is added to all compilation commands.
+add_project_dependencies(glib.partial_dependency(compile_args: true, includes: true),
+                         native: false, language: all_languages)
+
 gio = not_found
 gdbus_codegen = not_found
 gdbus_codegen_error = '@0@ requires gdbus-codegen, please install libgio'
@@ -931,7 +987,7 @@ if have_system and get_option('curses').allowed()
         int main(void) {
           iconv_t conv = iconv_open("WCHAR_T", "UCS-2");
           return conv != (iconv_t) -1;
-        }''', args: config_host['GLIB_CFLAGS'].split() + config_host['GLIB_LIBS'].split() + link_args)
+        }''', args: link_args, dependencies: glib)
         iconv = declare_dependency(link_args: link_args, dependencies: glib)
         break
       endif
@@ -1961,6 +2017,7 @@ config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'
 config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
 config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
 config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
+config_host_data.set('HAVE_GLIB_WITH_SLICE_ALLOCATOR', glib_has_gslice)
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
@@ -3028,7 +3085,6 @@ subdir('ui')
 subdir('hw')
 subdir('gdbstub')
 
-
 if enable_modules
   libmodulecommon = static_library('module-common', files('module-common.c') + genh, pic: true, c_args: '-DBUILD_DSO')
   modulecommon = declare_dependency(link_whole: libmodulecommon, compile_args: '-DBUILD_DSO')
@@ -3653,7 +3709,7 @@ if host_machine.system() == 'windows'
     '@OUTPUT@',
     get_option('prefix'),
     meson.current_source_dir(),
-    config_host['GLIB_BINDIR'],
+    glib_pc.get_variable('bindir'),
     host_machine.cpu(),
     '--',
     '-DDISPLAYVERSION=' + meson.project_version(),
diff --git a/util/meson.build b/util/meson.build
index 3c2cfc6ede66..2cb103fc727e 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -26,7 +26,9 @@ util_ss.add(when: 'CONFIG_WIN32', if_true: files('oslib-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: files('qemu-thread-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: winmm)
 util_ss.add(when: 'CONFIG_WIN32', if_true: pathcch)
-util_ss.add(when: 'HAVE_GLIB_WITH_SLICE_ALLOCATOR', if_true: files('qtree.c'))
+if glib_has_gslice
+  util_ss.add(files('qtree.c'))
+endif
 util_ss.add(files('envlist.c', 'path.c', 'module.c'))
 util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
-- 
2.40.1


