Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B962C6481DC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:39:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXX-0006Ij-Mt; Fri, 09 Dec 2022 06:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVq-0004Sp-C7
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVk-0001YT-FF
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOmJjp7FOaRPzTB1VOb9CHrzg0NOiH5lgsd4QAUGHvw=;
 b=ODqBuXEk1Q+AJaJ60igHdNI9mVCmqsdF6h8GP/dWN8oaV8uAj4ruX1x5MWxyMccGBIck2K
 exFxXDsVImjv2Vg3BZXoSjR08PLlw+bnOisj25DWICRJtPay/Xu4uIp55qY6+l+e8Yv3uS
 Djjvw22HjZYQmtdiyzDo5+wHxXrWces=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-VOdwwT4hNBqQAdZE18qUZQ-1; Fri, 09 Dec 2022 06:25:34 -0500
X-MC-Unique: VOdwwT4hNBqQAdZE18qUZQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 oz34-20020a1709077da200b007adc8d68e90so2920494ejc.11
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOmJjp7FOaRPzTB1VOb9CHrzg0NOiH5lgsd4QAUGHvw=;
 b=qorBXsvdV3/LOWgqtXKUIxEgSwbJEYwajYSPm7XQMk72Q+ceWUnPSQQQeb4rHdH7Q6
 bdVVflxdG2u68yRDzcFXV4in0VlZdZjWXKNNbCyH0bazFcILaQtxJYvypO4oO5u8I+2m
 JfAONvdXHn3+X0wvLfXUPEA+vFHlymT/pohgVjEu3zNvvkxK+I3liNDM8PZK+LJrEK3K
 HwGInykJ0Uxjuqlmng7JF4bTwYqzSkMTJZmJCfBE+1/4VNy7wg8/U9reuRX6hWJWV5aF
 zJ4Cmlzu9euv5zaKhG94oLKpVrnoa/vpPZSO4ta3jz34wJ0P4xIxphI2oDq7NIeJ0ped
 LZJg==
X-Gm-Message-State: ANoB5pnTtsBLB4TyuwvW42hHY1nCzhJmBXkzv/hOidTYydAyuVHon881
 AxclnE7A2uTdWZq4cp7V9IoiBfle/5+Y+963y9sOSHDmg4K6mo27oUdAoeIGcWtcsREqLmnUSOQ
 5Jv9hkEGSkHx9AZtl+KsvDDUQdOh+dh/E6XX/x4x2MOPXFq9Y8PESdzox8N4kI9iDmy4=
X-Received: by 2002:a17:907:c48d:b0:7b2:7181:2484 with SMTP id
 tp13-20020a170907c48d00b007b271812484mr4004433ejc.23.1670585133058; 
 Fri, 09 Dec 2022 03:25:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7c3I4vJbboD4YS1Y4yiMnlW3VN8q84okz3epovb1z8BzgKfAn7UnB190O6HNoewDurxPDphw==
X-Received: by 2002:a17:907:c48d:b0:7b2:7181:2484 with SMTP id
 tp13-20020a170907c48d00b007b271812484mr4004400ejc.23.1670585132127; 
 Fri, 09 Dec 2022 03:25:32 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709062e9900b007c100eba66asm451303eji.77.2022.12.09.03.25.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/30] build: move coroutine backend selection to meson
Date: Fri,  9 Dec 2022 12:24:02 +0100
Message-Id: <20221209112409.184703-24-pbonzini@redhat.com>
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

To simplify the code, rename coroutine-win32.c to match the option
passed to configure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                     | 62 -------------------
 meson.build                                   | 32 +++++++++-
 meson_options.txt                             |  3 +
 scripts/meson-buildoptions.py                 |  1 +
 scripts/meson-buildoptions.sh                 |  3 +
 ...{coroutine-win32.c => coroutine-windows.c} |  0
 util/meson.build                              |  2 +-
 7 files changed, 38 insertions(+), 65 deletions(-)
 rename util/{coroutine-win32.c => coroutine-windows.c} (100%)

diff --git a/configure b/configure
index fea9cbf3abd0..1f7c5bbba4b9 100755
--- a/configure
+++ b/configure
@@ -275,7 +275,6 @@ softmmu="yes"
 linux_user=""
 bsd_user=""
 pie=""
-coroutine=""
 plugins="$default_feature"
 meson=""
 ninja=""
@@ -792,8 +791,6 @@ for opt do
   ;;
   --enable-fdt=*) fdt="$optarg"
   ;;
-  --with-coroutine=*) coroutine="$optarg"
-  ;;
   --with-git=*) git="$optarg"
   ;;
   --with-git-submodules=*)
@@ -949,8 +946,6 @@ Advanced options (experts only):
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
   --cpu=CPU                Build for host CPU [$cpu]
-  --with-coroutine=BACKEND coroutine backend. Supported options:
-                           ucontext, sigaltstack, windows
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
@@ -1373,61 +1368,6 @@ case "$fdt" in
     ;;
 esac
 
-##########################################
-# check and set a backend for coroutine
-
-# We prefer ucontext, but it's not always possible. The fallback
-# is sigcontext. On Windows the only valid backend is the Windows
-# specific one.
-
-ucontext_works=no
-if test "$darwin" != "yes"; then
-  cat > $TMPC << EOF
-#include <ucontext.h>
-#ifdef __stub_makecontext
-#error Ignoring glibc stub makecontext which will always fail
-#endif
-int main(void) { makecontext(0, 0, 0); return 0; }
-EOF
-  if compile_prog "" "" ; then
-    ucontext_works=yes
-  fi
-fi
-
-if test "$coroutine" = ""; then
-  if test "$mingw32" = "yes"; then
-    coroutine=win32
-  elif test "$ucontext_works" = "yes"; then
-    coroutine=ucontext
-  else
-    coroutine=sigaltstack
-  fi
-else
-  case $coroutine in
-  windows)
-    if test "$mingw32" != "yes"; then
-      error_exit "'windows' coroutine backend only valid for Windows"
-    fi
-    # Unfortunately the user visible backend name doesn't match the
-    # coroutine-*.c filename for this case, so we have to adjust it here.
-    coroutine=win32
-    ;;
-  ucontext)
-    if test "$ucontext_works" != "yes"; then
-      error_exit "'ucontext' backend requested but makecontext not available"
-    fi
-    ;;
-  sigaltstack)
-    if test "$mingw32" = "yes"; then
-      error_exit "only the 'windows' coroutine backend is valid for Windows"
-    fi
-    ;;
-  *)
-    error_exit "unknown coroutine backend $coroutine"
-    ;;
-  esac
-fi
-
 ########################################
 # check if ccache is interfering with
 # semantic analysis of macros
@@ -2002,8 +1942,6 @@ if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
 fi
 
-echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
-
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 7ee9f081d0a1..b9df49667a19 100644
--- a/meson.build
+++ b/meson.build
@@ -211,6 +211,34 @@ if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
+coroutine_backend = get_option('coroutine_backend')
+ucontext_probe = '''
+  #include <ucontext.h>
+  #ifdef __stub_makecontext
+  #error Ignoring glibc stub makecontext which will always fail
+  #endif
+  int main(void) { makecontext(0, 0, 0); return 0; }'''
+
+# On Windows the only valid backend is the Windows specific one.
+# For POSIX prefer ucontext, but it's not always possible. The fallback
+# is sigcontext.
+supported_backends = []
+if targetos == 'windows'
+  supported_backends += ['windows']
+else
+  if targetos != 'darwin' and cc.links(ucontext_probe)
+    supported_backends += ['ucontext']
+  endif
+  supported_backends += ['sigaltstack']
+endif
+
+if coroutine_backend == 'auto'
+  coroutine_backend = supported_backends[0]
+elif coroutine_backend not in supported_backends
+  error('"@0@" backend requested but not available.  Available backends: @1@' \
+        .format(coroutine_backend, ', '.join(supported_backends)))
+endif
+
 # Compiles if SafeStack *not* enabled
 safe_stack_probe = '''
   int main(void)
@@ -232,7 +260,7 @@ if get_option('safe_stack') != not cc.compiles(safe_stack_probe)
   qemu_cflags += safe_stack_arg
   qemu_ldflags += safe_stack_arg
 endif
-if get_option('safe_stack') and config_host['CONFIG_COROUTINE_BACKEND'] != 'ucontext'
+if get_option('safe_stack') and coroutine_backend != 'ucontext'
   error('SafeStack is only supported with the ucontext coroutine backend')
 endif
 
@@ -3949,7 +3977,7 @@ summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
 # Block layer
 summary_info = {}
-summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
+summary_info += {'coroutine backend': coroutine_backend}
 summary_info += {'coroutine pool':    have_coroutine_pool}
 if have_block
   summary_info += {'Block whitelist (rw)': get_option('block_drv_rw_whitelist')}
diff --git a/meson_options.txt b/meson_options.txt
index d39d2a060ae7..126f89517e9a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -33,6 +33,9 @@ option('fuzzing_engine', type : 'string', value : '',
        description: 'fuzzing engine library for OSS-Fuzz')
 option('trace_file', type: 'string', value: 'trace',
        description: 'Trace file prefix for simple backend')
+option('coroutine_backend', type: 'combo',
+       choices: ['ucontext', 'sigaltstack', 'windows', 'auto'],
+       value: 'auto', description: 'coroutine backend to use')
 
 # Everything else can be set via --enable/--disable-* option
 # on the configure script command line.  After adding an option
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 8e4e5c4e8bd6..66a79cf37ea8 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -35,6 +35,7 @@
 OPTION_NAMES = {
     "b_coverage": "gcov",
     "b_lto": "lto",
+    "coroutine_backend": "with-coroutine",
     "debug": "debug-info",
     "malloc": "enable-malloc",
     "pkgversion": "with-pkgversion",
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 237220d9b308..29695ac88eea 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -59,6 +59,8 @@ meson_options_help() {
   printf "%s\n" '  --sysconfdir=VALUE       Sysconf data directory [etc]'
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
+  printf "%s\n" '  --with-coroutine=CHOICE  coroutine backend to use (choices:'
+  printf "%s\n" '                           auto/sigaltstack/ucontext/windows)'
   printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
   printf "%s\n" '                           package'
   printf "%s\n" '  --with-trace-file=VALUE  Trace file prefix for simple backend [trace]'
@@ -236,6 +238,7 @@ _meson_option_parse() {
     --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
     --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
     --disable-coreaudio) printf "%s" -Dcoreaudio=disabled ;;
+    --with-coroutine=*) quote_sh "-Dcoroutine_backend=$2" ;;
     --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=true ;;
     --disable-coroutine-pool) printf "%s" -Dcoroutine_pool=false ;;
     --enable-crypto-afalg) printf "%s" -Dcrypto_afalg=enabled ;;
diff --git a/util/coroutine-win32.c b/util/coroutine-windows.c
similarity index 100%
rename from util/coroutine-win32.c
rename to util/coroutine-windows.c
diff --git a/util/meson.build b/util/meson.build
index 25b9b61f9817..b2a0aea21beb 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -74,7 +74,7 @@ if have_block or have_ga
   util_ss.add(files('lockcnt.c'))
   util_ss.add(files('main-loop.c'))
   util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-coroutine-io.c'))
-  util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
+  util_ss.add(files(f'coroutine-@coroutine_backend@.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('qemu-sockets.c'))
 endif
-- 
2.38.1


