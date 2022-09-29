Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A3C5EFB51
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:52:01 +0200 (CEST)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwlU-0001qr-Dm
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwR5-0003mI-Kl
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwR2-00037y-Ou
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWtuzhZlXWimeJzTK/CgOxliSMAqBzNFhn9r6Sbw5SQ=;
 b=cNpqqZIYITg2BqC8iX/WtPx9TQ+8RNsrPtmFdCX4sM5ypvDAaZYGXx4EjvCvSPWX4BfuKd
 JAwFx4QrX8fgaoHKkWtXShCCkj7MkYZMfqkqjTz0bC5MC7lIbiSvZKOT4Q9k62h2pDDUrH
 5OawCkphpvVZcNu5oEXQprSUiMBf0kA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-543-7X7b9RpbP86az1XD_1JYYA-1; Thu, 29 Sep 2022 12:30:50 -0400
X-MC-Unique: 7X7b9RpbP86az1XD_1JYYA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so1649351edd.12
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gWtuzhZlXWimeJzTK/CgOxliSMAqBzNFhn9r6Sbw5SQ=;
 b=Bf5xvLFsGSZQgbGLe4vKNyfA6lFCHM5q8VKp+jkK1CDUSYGLyTHuAaxTLwjGpu7QUs
 zmJBCV2vhrxv6Z4/rBbJiDCjgdAusfkmwmxBBfQ0qtxVaEunTfOLQUN9EYgAywxiBD9w
 VF71DGiRUnFUKsnDxgX1GwibmouN4fFCpgo2nTe/JWl5tq3vBqaDlmNLN4MT4ANVroxk
 eJxc+jUIDIS96HREUzkoNlq3G8rJJpbX2OurjbNx037EDfe89GsAjvbjeJJLBlSbSPY5
 WwZhFsDb0SOV8Jg05cvxCYxhVEmmF7Lww9FdCd/bZTVMM0rKzHZSTkgJC1sAT8kY6z/W
 pRAg==
X-Gm-Message-State: ACrzQf3+E+EZFYvrBas+aaP3gIYbH47QVcWMNW3jHOLQjgoieFfr6R+D
 qDoKYjlDDdCA4z3IX/6yHRbKezaZeUSsGP1KjpTlqM5YmpmneQ7N+BnaALKxR3dqLvgQd0rTpRu
 4F36qymbwLb6nO8RG3feO2hwF5p/tWWlMrNg+cAYDsWk1a1lnVGgTuh+P0cHH40koEQY=
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr4100425edz.301.1664469048000; 
 Thu, 29 Sep 2022 09:30:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FK4yzD/zWSWLubJsACNrDwx6zX30VYxatyv9hec/ekCMWl6jdaIHfixqFsOc2rM3ttwBfiw==
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id
 b7-20020a056402084700b00453943b0bf4mr4100393edz.301.1664469047670; 
 Thu, 29 Sep 2022 09:30:47 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a170906449300b0077077c62cadsm4211099ejo.31.2022.09.29.09.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 11/14] configure,
 meson: move C++ compiler detection to meson.build
Date: Thu, 29 Sep 2022 18:30:11 +0200
Message-Id: <20220929163014.16950-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure      | 57 --------------------------------------------------
 meson.build    | 37 ++++++++++++++++++++++----------
 scripts/main.c |  1 +
 3 files changed, 27 insertions(+), 68 deletions(-)
 create mode 100644 scripts/main.c

diff --git a/configure b/configure
index c5069775db..3e3c0f36c9 100755
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
@@ -2362,38 +2339,6 @@ fi
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
@@ -2474,7 +2419,6 @@ echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
-echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
@@ -2665,7 +2609,6 @@ if test "$skip_meson" = no; then
       echo "${a}-softmmu = '$c'" >> $cross
   done
 
-  test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
   echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
diff --git a/meson.build b/meson.build
index 48533ace7b..a1b265b133 100644
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


