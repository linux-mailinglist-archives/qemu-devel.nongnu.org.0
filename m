Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994776481CC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:34:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXk-0006V0-QM; Fri, 09 Dec 2022 06:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVq-0004Sm-3P
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVi-0001VM-LC
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udw7Cd2DtsloA+ZAMxHVLgSgxDIJxCnS0GVlNd0dzvE=;
 b=BX5DQKOmgGHfMFC8p2A6Hua13d8aA5e+rUbRkKB15G15UK0C6U6Q0rvcRmSvdJyldK8OMc
 g0FvMNyC0uaxAEGgozbOJ/LwVTZBD28m9j4GNY+Pdrna51ZRS+CWM0NrcmCYA0oANL1Vq7
 T/AxNV2qQxZGUL/MRjqzLEj4L8DYiz0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-BdF8waihM92NcyRxfQ0jzQ-1; Fri, 09 Dec 2022 06:25:31 -0500
X-MC-Unique: BdF8waihM92NcyRxfQ0jzQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m18-20020a056402511200b0046db14dc1c9so1211329edd.10
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udw7Cd2DtsloA+ZAMxHVLgSgxDIJxCnS0GVlNd0dzvE=;
 b=YpnxmO5N1wcJ7cQPIosouVUSi9dT8boSuF0Q6dUaRK5+I6ml7VaOR7g/TK2lukMw+9
 MOO8mbsp2Tz/3w87A12gT1CiVpa0yspDY9x1HBtwSy4QZ/NC2HxwD0VoY6IZiZWCrSph
 v17xI4mu2ApWLasLK7GSn4VHUtzwlxx+AEqlfuI9qr4uVW/U1/VmRTnh8w+boheWDoPU
 JWEgRJASjuUcuU9z0lr9d24/Kn2N65i6eGdfdZHiJux4Q9SG9YaSZWl3vu5zoIpjy7DT
 Ka0Ph0HuWgA+F1Go1rr7vNRi/IPdaDe1bJq6ipDrVR8rtC8/nhbRM4rolzHHIRbUhB4s
 vZPg==
X-Gm-Message-State: ANoB5pmJQR7M4NDIawdfRBCKq8gFDcHRcGJvs4C0BVg/v/Mvd5PlDlBd
 qRaAnyxzMUwl5KdSvTeS/3EsMB5XKLlCeORsHpUgMCbrX0mP8oYxchED7IZtxFjDHQdDxhvv+Ze
 Dh9Aw6VqDPKVMVSVYW9Ba9zmcWCAM2UyC4XLNrCVSMTlDJ5hRVsnh4/bnTiGv7cCRCJQ=
X-Received: by 2002:a17:906:37ce:b0:7c1:41bb:70ac with SMTP id
 o14-20020a17090637ce00b007c141bb70acmr1160740ejc.64.1670585129941; 
 Fri, 09 Dec 2022 03:25:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5OPAwawVp9irzX9Zoz1hhd1H890sXDeU/1WD4mCdnwbnlZtXBaYobb9tg88FZVAnJH2qKPOg==
X-Received: by 2002:a17:906:37ce:b0:7c1:41bb:70ac with SMTP id
 o14-20020a17090637ce00b007c141bb70acmr1160709ejc.64.1670585129327; 
 Fri, 09 Dec 2022 03:25:29 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906200200b007ad94422cf6sm434203ejo.198.2022.12.09.03.25.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/30] build: move SafeStack tests to meson
Date: Fri,  9 Dec 2022 12:24:01 +0100
Message-Id: <20221209112409.184703-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

This disables the old behavior of detecting SafeStack from environment
CFLAGS.  SafeStack is now enabled purely based on the configure arguments.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 73 -----------------------------------
 meson.build                   | 26 +++++++++++++
 meson_options.txt             |  2 +
 scripts/meson-buildoptions.sh |  4 ++
 4 files changed, 32 insertions(+), 73 deletions(-)

diff --git a/configure b/configure
index babcf5d28a85..fea9cbf3abd0 100755
--- a/configure
+++ b/configure
@@ -222,7 +222,6 @@ cross_compile="no"
 cross_prefix=""
 host_cc="cc"
 stack_protector=""
-safe_stack=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 
@@ -779,10 +778,6 @@ for opt do
   ;;
   --disable-stack-protector) stack_protector="no"
   ;;
-  --enable-safe-stack) safe_stack="yes"
-  ;;
-  --disable-safe-stack) safe_stack="no"
-  ;;
   --enable-cfi)
       cfi="true";
       meson_option_add -Db_lto=true
@@ -969,8 +964,6 @@ cat << EOF
   bsd-user        all BSD usermode emulation targets
   pie             Position Independent Executables
   debug-tcg       TCG debugging (default is disabled)
-  safe-stack      SafeStack Stack Smash Protection. Depends on
-                  clang/llvm >= 3.7 and requires coroutine backend ucontext.
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -1435,68 +1428,6 @@ else
   esac
 fi
 
-##################################################
-# SafeStack
-
-
-if test "$safe_stack" = "yes"; then
-cat > $TMPC << EOF
-int main(void)
-{
-#if ! __has_feature(safe_stack)
-#error SafeStack Disabled
-#endif
-    return 0;
-}
-EOF
-  flag="-fsanitize=safe-stack"
-  # Check that safe-stack is supported and enabled.
-  if compile_prog "-Werror $flag" "$flag"; then
-    # Flag needed both at compilation and at linking
-    QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-    QEMU_LDFLAGS="$QEMU_LDFLAGS $flag"
-  else
-    error_exit "SafeStack not supported by your compiler"
-  fi
-  if test "$coroutine" != "ucontext"; then
-    error_exit "SafeStack is only supported by the coroutine backend ucontext"
-  fi
-else
-cat > $TMPC << EOF
-int main(void)
-{
-#if defined(__has_feature)
-#if __has_feature(safe_stack)
-#error SafeStack Enabled
-#endif
-#endif
-    return 0;
-}
-EOF
-if test "$safe_stack" = "no"; then
-  # Make sure that safe-stack is disabled
-  if ! compile_prog "-Werror" ""; then
-    # SafeStack was already enabled, try to explicitly remove the feature
-    flag="-fno-sanitize=safe-stack"
-    if ! compile_prog "-Werror $flag" "$flag"; then
-      error_exit "Configure cannot disable SafeStack"
-    fi
-    QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-    QEMU_LDFLAGS="$QEMU_LDFLAGS $flag"
-  fi
-else # "$safe_stack" = ""
-  # Set safe_stack to yes or no based on pre-existing flags
-  if compile_prog "-Werror" ""; then
-    safe_stack="no"
-  else
-    safe_stack="yes"
-    if test "$coroutine" != "ucontext"; then
-      error_exit "SafeStack is only supported by the coroutine backend ucontext"
-    fi
-  fi
-fi
-fi
-
 ########################################
 # check if ccache is interfering with
 # semantic analysis of macros
@@ -2153,10 +2084,6 @@ if test "$ccache_cpp2" = "yes"; then
   echo "export CCACHE_CPP2=y" >> $config_host_mak
 fi
 
-if test "$safe_stack" = "yes"; then
-  echo "CONFIG_SAFESTACK=y" >> $config_host_mak
-fi
-
 # tests/tcg configuration
 (config_host_mak=tests/tcg/config-host.mak
 mkdir -p tests/tcg
diff --git a/meson.build b/meson.build
index 41a45fa495b2..7ee9f081d0a1 100644
--- a/meson.build
+++ b/meson.build
@@ -211,6 +211,31 @@ if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
+# Compiles if SafeStack *not* enabled
+safe_stack_probe = '''
+  int main(void)
+  {
+  #if defined(__has_feature)
+  #if __has_feature(safe_stack)
+  #error SafeStack Enabled
+  #endif
+  #endif
+      return 0;
+  }'''
+if get_option('safe_stack') != not cc.compiles(safe_stack_probe)
+  safe_stack_arg = get_option('safe_stack') ? '-fsanitize=safe-stack' : '-fno-sanitize=safe-stack'
+  if get_option('safe_stack') != not cc.compiles(safe_stack_probe, args: safe_stack_arg)
+    error(get_option('safe_stack') \
+          ? 'SafeStack not supported by your compiler' \
+          : 'Cannot disable SafeStack')
+  endif
+  qemu_cflags += safe_stack_arg
+  qemu_ldflags += safe_stack_arg
+endif
+if get_option('safe_stack') and config_host['CONFIG_COROUTINE_BACKEND'] != 'ucontext'
+  error('SafeStack is only supported with the ucontext coroutine backend')
+endif
+
 if get_option('sanitizers')
   if cc.has_argument('-fsanitize=address')
     qemu_cflags = ['-fsanitize=address'] + qemu_cflags
@@ -1928,6 +1953,7 @@ config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_RDMA', rdma.found())
+config_host_data.set('CONFIG_SAFESTACK', get_option('safe_stack'))
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
diff --git a/meson_options.txt b/meson_options.txt
index feeefa2ccbc1..d39d2a060ae7 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -84,6 +84,8 @@ option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
+option('safe_stack', type: 'boolean', value: false,
+       description: 'SafeStack Stack Smash Protection (clang/llvm >= 3.7)')
 option('sanitizers', type: 'boolean', value: false,
        description: 'enable default sanitizers')
 option('tsan', type: 'boolean', value: false,
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index bafc40ddfbf4..237220d9b308 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -36,6 +36,8 @@ meson_options_help() {
   printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
   printf "%s\n" '                           getrandom()'
+  printf "%s\n" '  --enable-safe-stack      SafeStack Stack Smash Protection (clang/llvm >='
+  printf "%s\n" '                           3.7)'
   printf "%s\n" '  --enable-sanitizers      enable default sanitizers'
   printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
@@ -390,6 +392,8 @@ _meson_option_parse() {
     --disable-replication) printf "%s" -Dreplication=disabled ;;
     --enable-rng-none) printf "%s" -Drng_none=true ;;
     --disable-rng-none) printf "%s" -Drng_none=false ;;
+    --enable-safe-stack) printf "%s" -Dsafe_stack=true ;;
+    --disable-safe-stack) printf "%s" -Dsafe_stack=false ;;
     --enable-sanitizers) printf "%s" -Dsanitizers=true ;;
     --disable-sanitizers) printf "%s" -Dsanitizers=false ;;
     --enable-sdl) printf "%s" -Dsdl=enabled ;;
-- 
2.38.1


