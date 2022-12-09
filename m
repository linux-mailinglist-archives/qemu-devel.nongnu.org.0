Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929D6481EA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXE-0005sG-Rz; Fri, 09 Dec 2022 06:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVy-0004X8-2K
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVq-0001Yf-19
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFXGWFkeLVolrLGcr3Zg8bJ0ywua5CC1+rJ/U6t4suM=;
 b=BS1vUEbOyRuS5HzZ44EUD1hbSSkH2OpdaCOnrMTDIdEmhHKoJDT6W1GQo/ILv3t9kTcgM3
 3qkHv9mEWyddY+fCDKzK5xqjkbc2ov3RGDgk1noe9D13GPCq6p/n6hPY3+FIZXr2FkgHHH
 kwhd2ubbQNao68AWawtDs48Qtb7IvZM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-330-kyTNXACOOi6euw29JXscRg-1; Fri, 09 Dec 2022 06:25:37 -0500
X-MC-Unique: kyTNXACOOi6euw29JXscRg-1
Received: by mail-ed1-f70.google.com with SMTP id
 z4-20020a05640240c400b0046c51875c17so1210019edb.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bFXGWFkeLVolrLGcr3Zg8bJ0ywua5CC1+rJ/U6t4suM=;
 b=Az/s9kaiEIkERucQa4oukR9sxm/M1eigNXQf7XUuWCmeJLzILrmasqwm4e8NPi+x3K
 hFkVQ42gxxS0JZcj2WwhF+Am/wtjGjPe6KRNlTk9ZC8c8jGk8Le3cPMcBKWxcUivsmKr
 hHdg4xXt7yhQp6rLgdmPobVZKdtlge3O5gyF2ls5ywlhI/vWwwQMaYsZNCcncyAbgcEj
 Ic2cf0EWVdD7ZYcEfmuiRylJLQY2BXLYH+M5jss/dTJwvXX5q8dqBvFIsmuPD7tWYyz1
 DXP3VK2Ir0W1ilak9u4wHx6VS9rYBngykhoByOkYlAZdQ0eDQR5zQA+C4pMwP5owv2sH
 XGEQ==
X-Gm-Message-State: ANoB5pkEnvyufsM+h87RcIXK+QbLYGTvmGzhUzGJ1fuqZ4ETGrAYTIA1
 2py5fkDEeJI7Q4Sk6dIV1+yHcup4ENYPRXpM9m5W1QWnrvEecW+pvHM/QgR7xfUfWLyeZugW5yW
 thHvXX4/BRMv7PCf32XcXKB4YiUOtDuroFCSNcfaUJ2/uNWC5Ylj53NOI7iGuaruAzb8=
X-Received: by 2002:a17:906:a410:b0:7c0:e5ca:411c with SMTP id
 l16-20020a170906a41000b007c0e5ca411cmr4368794ejz.17.1670585135622; 
 Fri, 09 Dec 2022 03:25:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4c0Hzam+Ci4Cu42126H7PNn5W3AKcyuA0q+V2yGqwgy/HhdbcefUvw9bGGU4hnIZg4D0jkNA==
X-Received: by 2002:a17:906:a410:b0:7c0:e5ca:411c with SMTP id
 l16-20020a170906a41000b007c0e5ca411cmr4368769ejz.17.1670585135141; 
 Fri, 09 Dec 2022 03:25:35 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a17090632c800b007aece68483csm434355ejk.193.2022.12.09.03.25.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/30] build: move stack protector flag selection to meson
Date: Fri,  9 Dec 2022 12:24:03 +0100
Message-Id: <20221209112409.184703-25-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 44 ++---------------------------------
 meson.build                   | 28 +++++++++++++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 34 insertions(+), 43 deletions(-)

diff --git a/configure b/configure
index 1f7c5bbba4b9..5d31294f316f 100755
--- a/configure
+++ b/configure
@@ -175,7 +175,7 @@ compile_prog() {
   local_cflags="$1"
   local_ldflags="$2"
   do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
-      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
+      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $local_ldflags
 }
 
 # symbolically link $1 to $2.  Portable version of "ln -sf".
@@ -221,7 +221,6 @@ static="no"
 cross_compile="no"
 cross_prefix=""
 host_cc="cc"
-stack_protector=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 
@@ -370,8 +369,6 @@ sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
-QEMU_LDFLAGS=
-
 # Flags that are needed during configure but later taken care of by Meson
 CONFIGURE_CFLAGS="-std=gnu11 -Wall"
 CONFIGURE_LDFLAGS=
@@ -773,10 +770,6 @@ for opt do
   ;;
   --disable-werror) werror="no"
   ;;
-  --enable-stack-protector) stack_protector="yes"
-  ;;
-  --disable-stack-protector) stack_protector="no"
-  ;;
   --enable-cfi)
       cfi="true";
       meson_option_add -Db_lto=true
@@ -944,7 +937,6 @@ Advanced options (experts only):
   --with-devices-ARCH=NAME override default configs/devices
   --enable-debug           enable common debug build options
   --disable-werror         disable compilation abort on warning
-  --disable-stack-protector disable compiler-provided stack protection
   --cpu=CPU                Build for host CPU [$cpu]
   --enable-plugins
                            enable plugins via shared library loading
@@ -1157,7 +1149,7 @@ EOF
     optflag="$(echo $1 | sed -e 's/^-Wno-/-W/')"
     do_objc -Werror $optflag \
       $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
-      -o $TMPE $TMPM $QEMU_LDFLAGS
+      -o $TMPE $TMPM
 }
 
 for flag in $gcc_flags; do
@@ -1169,37 +1161,6 @@ for flag in $gcc_flags; do
     fi
 done
 
-if test "$stack_protector" != "no"; then
-  cat > $TMPC << EOF
-int main(int argc, char *argv[])
-{
-    char arr[64], *p = arr, *c = argv[argc - 1];
-    while (*c) {
-        *p++ = *c++;
-    }
-    return 0;
-}
-EOF
-  gcc_flags="-fstack-protector-strong -fstack-protector-all"
-  sp_on=0
-  for flag in $gcc_flags; do
-    # We need to check both a compile and a link, since some compiler
-    # setups fail only on a .c->.o compile and some only at link time
-    if compile_object "-Werror $flag" &&
-       compile_prog "-Werror $flag" ""; then
-      QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-      QEMU_LDFLAGS="$QEMU_LDFLAGS $flag"
-      sp_on=1
-      break
-    fi
-  done
-  if test "$stack_protector" = yes; then
-    if test $sp_on = 0; then
-      error_exit "Stack protector not supported"
-    fi
-  fi
-fi
-
 # Disable -Wmissing-braces on older compilers that warn even for
 # the "universal" C zero initializer {0}.
 cat > $TMPC << EOF
@@ -1968,7 +1929,6 @@ echo "PKG_CONFIG=${pkg_config_exe}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
-echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
diff --git a/meson.build b/meson.build
index b9df49667a19..c5a8dce9e1d6 100644
--- a/meson.build
+++ b/meson.build
@@ -200,7 +200,7 @@ foreach arg : config_host['QEMU_CFLAGS'].split()
   endif
 endforeach
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
-qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
+qemu_ldflags = []
 
 if get_option('gprof')
   qemu_common_flags += ['-p']
@@ -211,6 +211,32 @@ if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
+if not get_option('stack_protector').disabled()
+  stack_protector_probe = '''
+    int main(int argc, char *argv[])
+    {
+      char arr[64], *p = arr, *c = argv[argc - 1];
+      while (*c) {
+          *p++ = *c++;
+      }
+      return 0;
+    }'''
+  have_stack_protector = false
+  foreach arg : ['-fstack-protector-strong', '-fstack-protector-all']
+    # We need to check both a compile and a link, since some compiler
+    # setups fail only on a .c->.o compile and some only at link time
+    if cc.compiles(stack_protector_probe, args: ['-Werror', arg]) and \
+       cc.links(stack_protector_probe, args: ['-Werror', arg])
+      have_stack_protector = true
+      qemu_cflags += arg
+      qemu_ldflags += arg
+      break
+    endif
+  endforeach
+  get_option('stack_protector') \
+    .require(have_stack_protector, error_message: 'Stack protector not supported')
+endif
+
 coroutine_backend = get_option('coroutine_backend')
 ucontext_probe = '''
   #include <ucontext.h>
diff --git a/meson_options.txt b/meson_options.txt
index 126f89517e9a..98456b7cf2ea 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -93,6 +93,8 @@ option('sanitizers', type: 'boolean', value: false,
        description: 'enable default sanitizers')
 option('tsan', type: 'boolean', value: false,
        description: 'enable thread sanitizer')
+option('stack_protector', type: 'feature', value: 'auto',
+       description: 'compiler-provided stack protection')
 option('cfi', type: 'boolean', value: false,
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: false,
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 29695ac88eea..a87b3702e955 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -157,6 +157,7 @@ meson_options_help() {
   printf "%s\n" '  sparse          sparse checker'
   printf "%s\n" '  spice           Spice server support'
   printf "%s\n" '  spice-protocol  Spice protocol support'
+  printf "%s\n" '  stack-protector compiler-provided stack protection'
   printf "%s\n" '  tcg             TCG support'
   printf "%s\n" '  tools           build support utilities that come with QEMU'
   printf "%s\n" '  tpm             TPM support'
@@ -424,6 +425,8 @@ _meson_option_parse() {
     --disable-spice) printf "%s" -Dspice=disabled ;;
     --enable-spice-protocol) printf "%s" -Dspice_protocol=enabled ;;
     --disable-spice-protocol) printf "%s" -Dspice_protocol=disabled ;;
+    --enable-stack-protector) printf "%s" -Dstack_protector=enabled ;;
+    --disable-stack-protector) printf "%s" -Dstack_protector=disabled ;;
     --enable-strip) printf "%s" -Dstrip=true ;;
     --disable-strip) printf "%s" -Dstrip=false ;;
     --sysconfdir=*) quote_sh "-Dsysconfdir=$2" ;;
-- 
2.38.1


