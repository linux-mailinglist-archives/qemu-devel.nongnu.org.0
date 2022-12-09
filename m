Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FFD6481A0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bWB-0004ny-Ho; Fri, 09 Dec 2022 06:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bV7-00045i-ES
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUz-00011i-JB
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQVG1qMxVxADoLqdsGTmmP6GVi8GQAzTiysq17FwIyI=;
 b=fOE3hdR31OYS6AiwOXdyrUrB0bp1g1vuNfZqkxA44XjBcP51CV1SpgVfz7L9wSQkDg9fgD
 QN/+kLTEf35uzhJ6k7CwqjicR6KLZR88ZKljIspodCr6Twvq9Ce5UbJHgMR8ISm6oplBNM
 7/zf0IEqkgxMR25TRgLw8RABmvH9zRo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-ypmJzCcIO2GoELsflSt59g-1; Fri, 09 Dec 2022 06:24:58 -0500
X-MC-Unique: ypmJzCcIO2GoELsflSt59g-1
Received: by mail-ej1-f69.google.com with SMTP id
 sh37-20020a1709076ea500b007c09b177cd1so2910655ejc.12
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQVG1qMxVxADoLqdsGTmmP6GVi8GQAzTiysq17FwIyI=;
 b=4cqC5yUQcD89tDktg1E++KgFc5NRa5tBsQ+Ax21L5zzlgnGR4+c2wwRjIUac6yH2Gj
 wjPX8r7lKYGmpXYAdlVPSH2pDemhjogbn3f+5F7J3lNlNyMSEZfjazaHIJt4vyds1tDS
 WFWd308aqkikZpcaRzxx9vRjk/Pn3yzIprFrtugq8P5LoJCosCSJVbZKUHfPLEtUfLWa
 ap8HbBU8dq7K+fDdUtKOkztq2VXds71vUAwah1T98kXo6b/zJjGpu/JxPM5Zq2+oKYkb
 Kq+zUNV5+LhPk9MGkgpD5tAPVm7wA8BPow5W9qk4Zyms342i9kC1GOJ72yLUXr7n/XXm
 79Dw==
X-Gm-Message-State: ANoB5pkvdkDq9xt4xoaGRLIbW84A1oZsyJFM5mUio8cJ1BAxtCffJfc6
 1JLO8sChpZPUwmPx9W/Y9Gk1R+f9M3JlIcbPwukW8lgUwtocChhGQQq8ws0Wh2fm6G3EDWwp8EA
 V+YTFfK39pvWexUY8v55ILVgznEcysIo9hHO+w5w1GWbcocBpKzEkvSLVcRlU2Yw+CkE=
X-Received: by 2002:a17:906:8ce:b0:7ad:dd10:c614 with SMTP id
 o14-20020a17090608ce00b007addd10c614mr4339446eje.44.1670585096552; 
 Fri, 09 Dec 2022 03:24:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50sxpyGC6+oVsCT0pLbfQC1k6FRolEU14ic9/ZXEPaQpxUFhDcg1u1acisGZfZ4NMP2PaljQ==
X-Received: by 2002:a17:906:8ce:b0:7ad:dd10:c614 with SMTP id
 o14-20020a17090608ce00b007addd10c614mr4339429eje.44.1670585096105; 
 Fri, 09 Dec 2022 03:24:56 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 fe17-20020a1709072a5100b007be301a1d51sm437578ejc.211.2022.12.09.03.24.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/30] build: move glib detection and workarounds to meson
Date: Fri,  9 Dec 2022 12:23:55 +0100
Message-Id: <20221209112409.184703-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

QEMU adds the path to glib.h is added to all compilation commands.
This is simpler due to the pervasive use of static_library, and was
grandfathered in from the previous Make-based build system.  Until
Meson 0.63 the only way to do this was to detect glib in configure
and use add_project_arguments, but now it is possible to use
add_project_dependencies instead.

gmodule is detected in a separate variable and added via both
block_ss (for --enable-modules) and plugins/meson.build (for
--enable-plugins).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build        |  1 +
 configure                | 83 +---------------------------------------
 contrib/plugins/Makefile |  4 +-
 meson.build              | 81 +++++++++++++++++++++++++++++++++------
 plugins/meson.build      |  2 +-
 5 files changed, 74 insertions(+), 97 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index b7c68b83a36f..f2e0e86f3b0a 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -145,6 +145,7 @@ block_gen_c = custom_target('block-gen.c',
 block_ss.add(block_gen_c)
 
 block_ss.add(files('stream.c'))
+block_ss.add(gmodule)
 
 softmmu_ss.add(files('qapi-sysemu.c'))
 
diff --git a/configure b/configure
index 9c5393a25de7..fb28dd3963bd 100755
--- a/configure
+++ b/configure
@@ -1426,84 +1426,6 @@ if ! has "$pkg_config_exe"; then
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
 
@@ -2361,13 +2283,10 @@ echo "PYTHON=$python" >> $config_host_mak
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
-echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
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
index c4fa82ae8ba4..f63ab7f83bed 100644
--- a/meson.build
+++ b/meson.build
@@ -495,19 +495,77 @@ endif
 # Dependencies #
 ################
 
-# The path to glib.h is added to all compilation commands.  This was
-# grandfathered in from the QEMU Makefiles.
-add_project_arguments(config_host['GLIB_CFLAGS'].split(),
-                      native: false, language: all_languages)
-glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
-                          link_args: config_host['GLIB_LIBS'].split(),
-                          version: config_host['GLIB_VERSION'],
+# When bumping glib minimum version, please check also whether to increase
+# the _WIN32_WINNT setting in osdep.h according to the value from glib
+glib_req_ver = '>=2.56.0'
+glib = dependency('glib-2.0', version: glib_req_ver, required: true,
+                  method: 'pkg-config')
+glib_cflags = []
+if config_host.has_key('CONFIG_MODULES')
+  gmodule = dependency('gmodule-export-2.0', version: glib_req_ver, required: true,
+                       method: 'pkg-config')
+elif config_host.has_key('CONFIG_PLUGIN')
+  gmodule = dependency('gmodule-no-export-2.0', version: glib_req_ver, required: true,
+                       method: 'pkg-config')
+else
+  gmodule = not_found
+endif
+
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
+  }''', dependencies: glib, args: glib_cflags)
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
+  int main(void) { return 0; }''', dependencies: glib, args: ['-Werror'])
+  glib_cflags += cc.get_supported_arguments('-Wno-unused-function')
+endif
+glib = declare_dependency(dependencies: glib,
+                          compile_args: glib_cflags,
+                          version: glib.version(),
                           variables: {
-                            'bindir': config_host['GLIB_BINDIR'],
+                            'bindir': glib.get_variable('bindir')
                           })
-# override glib dep with the configure results (for subprojects)
+
+# override glib dep to include the above refinements
 meson.override_dependency('glib-2.0', glib)
 
+# The path to glib.h is added to all compilation commands.
+add_project_dependencies(glib.partial_dependency(compile_args: true, includes: true),
+                         native: false, language: all_languages)
+
 gio = not_found
 gdbus_codegen = not_found
 gdbus_codegen_error = '@0@ requires gdbus-codegen, please install libgio'
@@ -923,7 +981,7 @@ if have_system and get_option('curses').allowed()
         int main(void) {
           iconv_t conv = iconv_open("WCHAR_T", "UCS-2");
           return conv != (iconv_t) -1;
-        }''', args: config_host['GLIB_CFLAGS'].split() + config_host['GLIB_LIBS'].split() + link_args)
+        }''', args: link_args, dependencies: glib)
         iconv = declare_dependency(link_args: link_args, dependencies: glib)
         break
       endif
@@ -2977,7 +3035,6 @@ subdir('ui')
 subdir('hw')
 subdir('gdbstub')
 
-
 if enable_modules
   libmodulecommon = static_library('module-common', files('module-common.c') + genh, pic: true, c_args: '-DBUILD_DSO')
   modulecommon = declare_dependency(link_whole: libmodulecommon, compile_args: '-DBUILD_DSO')
@@ -3590,7 +3647,7 @@ if host_machine.system() == 'windows'
     '@OUTPUT@',
     get_option('prefix'),
     meson.current_source_dir(),
-    config_host['GLIB_BINDIR'],
+    glib.get_variable('bindir'),
     host_machine.cpu(),
     '--',
     '-DDISPLAYVERSION=' + meson.project_version(),
diff --git a/plugins/meson.build b/plugins/meson.build
index 752377c66d32..04cb7d252aab 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -17,4 +17,4 @@ specific_ss.add(when: 'CONFIG_PLUGIN', if_true: [files(
   'loader.c',
   'core.c',
   'api.c',
-), declare_dependency(link_args: plugin_ldflags)])
+), gmodule, declare_dependency(link_args: plugin_ldflags)])
-- 
2.38.1


