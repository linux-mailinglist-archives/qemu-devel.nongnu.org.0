Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6E5EBF3E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:07:51 +0200 (CEST)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7VG-0007dI-N0
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NN-000859-Qp
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NL-0008Vf-Qk
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664272779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZvvOrSffxAvNyvTqnxvbaS4G1IkK9vUU36lJHAhErM=;
 b=VNP+vrLIn0paEt5oXEKkNiwNklUatwuZowzZT4ud6cvAZ74tpyGhOFM3hhu8Eq2jd4xcI2
 Qb2OEDSAsyzmzWb9YKVuCNMYRlwPHdOH3MBdIsMckj1Q9CTJQ3zfaPFvQ1YZCs59rm16kE
 O8Al5zjk+arMp7n3ogEPzvlRKYY9afw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-bn8fzegbPkmSz6Cz03Atpw-1; Tue, 27 Sep 2022 05:59:37 -0400
X-MC-Unique: bn8fzegbPkmSz6Cz03Atpw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z13-20020a05640240cd00b0045276a79364so7352079edb.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cZvvOrSffxAvNyvTqnxvbaS4G1IkK9vUU36lJHAhErM=;
 b=eKEeHaN1x80X6xk2i8FzAox6jkhWY0xU8WQxD4Y++dwp10nLRA6W9XYiXxno9H7PrN
 9GyUTOQjd0LVLq8n4TJNnrSVhuLt5S98ry4se3mz2UZAJXARrZxdNFg4Fw3Kcii5tvp5
 S9unR/oRkq/6p/4umFn3JwQcnmyOQRNLBiZ5EQECHNVTHfKUKfveZ9r9EJrJ0Quu/Rwc
 fhohImbKDUQ4uru2CY8XbitaesfY7XDqcGVG4YMgsFylUuzRI+5q5+7iLsa3DaBprcyk
 yBd0oHEalgMRDa2lyWCeeNXmY5dbCoFlg5zpU8SA2797PUdaqD07zatUGgHA3Bp/YdkL
 X4Mw==
X-Gm-Message-State: ACrzQf1nPmN6w+/RrrNGiMf2QoA7LdSUaXNy6Yg7xWwbE1BvwsRZhuAu
 P12WsVbQNgPzHw8gs604jIov40evFgJBXXQ0JAawN8P/loSq7G4V/IfXKWrO6HVWjXq6LmRYA0x
 xmUHqY15vedHGjKughSEKPsoAPdq8s072cOTRinwTBjVOolTwBhiz724iwIyoa4OtBe8=
X-Received: by 2002:a05:6402:3582:b0:451:3f7b:a7c5 with SMTP id
 y2-20020a056402358200b004513f7ba7c5mr27554683edc.63.1664272775794; 
 Tue, 27 Sep 2022 02:59:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM59HiQ/LJRKPB4qlkG2AM8HAG/5jpynZ4t/NT9a2ipWtideWLQ5L2pRJnpn+wQ0PkH5rnAG4Q==
X-Received: by 2002:a05:6402:3582:b0:451:3f7b:a7c5 with SMTP id
 y2-20020a056402358200b004513f7ba7c5mr27554659edc.63.1664272775434; 
 Tue, 27 Sep 2022 02:59:35 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a1709060d9500b0073d638a7a89sm538305eji.99.2022.09.27.02.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:59:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Subject: [PATCH 4/5] configure,
 meson: move C++ compiler detection to meson.build
Date: Tue, 27 Sep 2022 11:59:20 +0200
Message-Id: <20220927095921.261760-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927095921.261760-1-pbonzini@redhat.com>
References: <20220927095921.261760-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test is slightly weaker than before, because it does not
call an extern "C" function from a C source file.  However,
in practice what we seek to detect is ABI compatibility of the
various sanitizer flags, and for that it is enough to compile
anything with CC and link it with CXX.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure      | 57 --------------------------------------------------
 meson.build    | 37 ++++++++++++++++++++++----------
 scripts/main.c |  1 +
 3 files changed, 27 insertions(+), 68 deletions(-)
 create mode 100644 scripts/main.c

diff --git a/configure b/configure
index 680d96d09f..0a6f57c371 100755
--- a/configure
+++ b/configure
@@ -75,7 +75,6 @@ fi
 TMPB="qemu-conf"
 TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
-TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPM="${TMPDIR1}/${TMPB}.m"
 TMPE="${TMPDIR1}/${TMPB}.exe"
 
@@ -158,10 +157,6 @@ do_cc() {
     do_compiler_werror "$cc" $CPU_CFLAGS "$@"
 }
 
-do_cxx() {
-    do_compiler_werror "$cxx" $CPU_CFLAGS "$@"
-}
-
 do_objc() {
     do_compiler_werror "$objcc" $CPU_CFLAGS "$@"
 }
@@ -171,24 +166,6 @@ add_to() {
     eval $1=\${$1:+\"\$$1 \"}\$2
 }
 
-update_cxxflags() {
-    # Set QEMU_CXXFLAGS from QEMU_CFLAGS by filtering out those
-    # options which some versions of GCC's C++ compiler complain about
-    # because they only make sense for C programs.
-    QEMU_CXXFLAGS="-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
-    CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
-    for arg in $QEMU_CFLAGS; do
-        case $arg in
-            -Wstrict-prototypes|-Wmissing-prototypes|-Wnested-externs|\
-            -Wold-style-declaration|-Wold-style-definition|-Wredundant-decls)
-                ;;
-            *)
-                QEMU_CXXFLAGS=${QEMU_CXXFLAGS:+$QEMU_CXXFLAGS }$arg
-                ;;
-        esac
-    done
-}
-
 compile_object() {
   local_cflags="$1"
   do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
@@ -2371,38 +2348,6 @@ fi
 #######################################
 # generate config-host.mak
 
-# Check that the C++ compiler exists and works with the C compiler.
-# All the QEMU_CXXFLAGS are based on QEMU_CFLAGS. Keep this at the end to don't miss any other that could be added.
-if has $cxx; then
-    cat > $TMPC <<EOF
-int c_function(void);
-int main(void) { return c_function(); }
-EOF
-
-    compile_object
-
-    cat > $TMPCXX <<EOF
-extern "C" {
-   int c_function(void);
-}
-int c_function(void) { return 42; }
-EOF
-
-    update_cxxflags
-
-    if do_cxx $CXXFLAGS $EXTRA_CXXFLAGS $CONFIGURE_CXXFLAGS $QEMU_CXXFLAGS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
-        # C++ compiler $cxx works ok with C compiler $cc
-        :
-    else
-        echo "C++ compiler $cxx does not work with C compiler $cc"
-        echo "Disabling C++ specific optional code"
-        cxx=
-    fi
-else
-    echo "No C++ compiler available; disabling C++ specific optional code"
-    cxx=
-fi
-
 if ! (GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
     exit 1
 fi
@@ -2486,7 +2431,6 @@ echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
-echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
@@ -2608,7 +2552,6 @@ if test "$skip_meson" = no; then
       echo "${a}-softmmu = '$c'" >> $cross
   done
 
-  test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
   echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
diff --git a/meson.build b/meson.build
index e1700d1d55..f57a60ac4c 100644
--- a/meson.build
+++ b/meson.build
@@ -180,7 +180,6 @@ endif
 ##################
 
 qemu_cflags = config_host['QEMU_CFLAGS'].split()
-qemu_cxxflags = config_host['QEMU_CXXFLAGS'].split()
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
@@ -194,7 +193,6 @@ endif
 
 if get_option('gprof')
   qemu_cflags += ['-p']
-  qemu_cxxflags += ['-p']
   qemu_objcflags += ['-p']
   qemu_ldflags += ['-p']
 endif
@@ -240,8 +238,33 @@ if get_option('fuzzing')
 endif
 
 add_global_arguments(qemu_cflags, native: false, language: ['c'])
-add_global_arguments(qemu_cxxflags, native: false, language: ['cpp'])
 add_global_arguments(qemu_objcflags, native: false, language: ['objc'])
+
+# Check that the C++ compiler exists and works with the C compiler.
+link_language = 'c'
+linker = cc
+qemu_cxxflags = []
+if add_languages('cpp', required: false, native: false)
+  cxx = meson.get_compiler('cpp')
+  add_global_arguments(['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACROS', '-D__STDC_FORMAT_MACROS'],
+                       native: false, language: 'cpp')
+  foreach k: qemu_cflags
+    if k not in ['-Wstrict-prototypes', '-Wmissing-prototypes', '-Wnested-externs',
+                 '-Wold-style-declaration', '-Wold-style-definition', '-Wredundant-decls']
+      qemu_cxxflags += [k]
+    endif
+  endforeach
+  add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
+
+  if cxx.links(files('scripts/main.c'), args: qemu_cflags)
+    link_language = 'cpp'
+    linker = cxx
+  else
+    message('C++ compiler does not work with C compiler')
+    message('Disabling C++-specific optional code')
+  endif
+endif
+
 add_global_link_arguments(qemu_ldflags, native: false, language: ['c', 'cpp', 'objc'])
 
 if targetos == 'linux'
@@ -255,14 +278,6 @@ add_project_arguments('-iquote', '.',
                       '-iquote', meson.current_source_dir() / 'include',
                       language: ['c', 'cpp', 'objc'])
 
-link_language = meson.get_external_property('link_language', 'cpp')
-if link_language == 'cpp'
-  add_languages('cpp', required: true, native: false)
-  cxx = meson.get_compiler('cpp')
-  linker = cxx
-else
-  linker = cc
-endif
 if host_machine.system() == 'darwin'
   add_languages('objc', required: false, native: false)
 endif
diff --git a/scripts/main.c b/scripts/main.c
new file mode 100644
index 0000000000..b552c8e4ed
--- /dev/null
+++ b/scripts/main.c
@@ -0,0 +1 @@
+int main(void) {}
-- 
2.37.3


