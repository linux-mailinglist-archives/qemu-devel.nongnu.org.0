Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E253C3BDA31
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:28:53 +0200 (CEST)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n0G-0001vw-Se
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0moz-0002Q2-NM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:21 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mor-0004t6-HG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:11 -0400
Received: by mail-wm1-x32b.google.com with SMTP id w13so13831220wmc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGLYNasVaMqPdnpUXMw96sJwNeDV9lGD9J/c+8i/lvM=;
 b=aYCs0D+oBBMj0j8/7G0G5qv68fZTdXSU6eS/pNh02BhGHQ/7ggCJzZUa6wX6uvim9S
 Rs65S2QVVheE34DlzFStrmVMC14D93asM/lurYris1tSjbDsY4BowzJAF++VVrzjd3ix
 AEU3+s6P3hxvXh2ojEhc6sfTevFHl0aRQvx0u5hdTW4a33RS0no8CCVlGbZylsW4F4ym
 1CEaEI3fZ4z6uzuRsJDQd8wsE3JLCkFYSPV6KXhBHhRd+bEpitG2+1SXoJugUM5Q7hKD
 vZo+MA9z6AJNkX5ybCmqJu7Y5aItOnsDbcSN4bK2aPXknM39dlprhaf/ZJYSSr/H8Uc3
 4e+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGLYNasVaMqPdnpUXMw96sJwNeDV9lGD9J/c+8i/lvM=;
 b=BEUxGjM08OqHfLmuDKFqnUZTumpk0vgIb8RnaipYGt91xl/XDNBJJoRJwZiGeKEg3+
 //4S2cs6GOwcIm2DoiSh9IaiWDCQ5pYAyw3mHc24r4XVSYJ8LVI83CUFSRQleOPv5Mxe
 0wtjuvI0KJJMU6USe7gqSjnH/AGk5cqZ3qIz+k5GXFhu7OJHTxv5EOd+86lfFb+8WOw4
 CF8YsAKiM1biQzPCIi0ixIhx42+gH1NgpSX/zOr3jq8K5sqH32wvbagNiwt0g1q2OkC1
 ez+7yst4X1LE+bBcy0Ac1EGFcwpr7M3NLN5zXHk/3cW0O6Oi4vpuxryHUNnjPoracuF1
 rueg==
X-Gm-Message-State: AOAM533HyX2s5+JqHaTce12ynFUAWu9CRkmqE9FfDeCm60UuoqNotY4D
 yXchhoByx+vC09UamR44eyV3xg==
X-Google-Smtp-Source: ABdhPJw7xrf4bcKbQ8i68o0qwW1PGNaEUFuc2KehVF8eS1PSP2hUABZBZ0RPLN1mzU30VOxglOmD4w==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr1456430wmi.114.1625584623319; 
 Tue, 06 Jul 2021 08:17:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z4sm15802616wmf.9.2021.07.06.08.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:17:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 248791FFB7;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 31/39] tcg/plugins: enable by default for TCG builds
Date: Tue,  6 Jul 2021 15:58:09 +0100
Message-Id: <20210706145817.24109-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aside from a minor bloat to file size the ability to have TCG plugins
has no real impact on performance unless a plugin is actively loaded.
Even then the libempty.so plugin shows only a minor degradation in
performance caused by the extra book keeping the TCG has to do to keep
track of instructions. As it's a useful feature lets just enable it by
default and reduce our testing matrix a little.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - properly handle plugins being ""
  - make the test for linker support handle default case
  - move linker tests to before the glib-modules test
---
 docs/devel/tcg-plugins.rst |   3 +-
 configure                  | 125 ++++++++++++++++++++-----------------
 .gitlab-ci.d/buildtest.yml |  23 -------
 3 files changed, 71 insertions(+), 80 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 18c6581d85..0cd77c77d2 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -71,7 +71,8 @@ API
 Usage
 =====
 
-The QEMU binary needs to be compiled for plugin support::
+Any QEMU binary with TCG support has plugins enabled by default.
+Earlier releases needed to be explicitly enabled with::
 
   configure --enable-plugins
 
diff --git a/configure b/configure
index 9d72b31a9f..0ce6c1ff65 100755
--- a/configure
+++ b/configure
@@ -429,7 +429,7 @@ libxml2="auto"
 debug_mutex="no"
 libpmem="auto"
 default_devices="true"
-plugins="no"
+plugins="$default_feature"
 fuzzing="no"
 rng_none="no"
 secret_keyring="$default_feature"
@@ -3085,6 +3085,73 @@ for drv in $audio_drv_list; do
     esac
 done
 
+##########################################
+# plugin linker support probe
+
+if test "$plugins" != "no"; then
+
+    #########################################
+    # See if --dynamic-list is supported by the linker
+
+    ld_dynamic_list="no"
+    if test "$static" = "no" ; then
+        cat > $TMPTXT <<EOF
+{
+  foo;
+};
+EOF
+
+        cat > $TMPC <<EOF
+#include <stdio.h>
+void foo(void);
+
+void foo(void)
+{
+  printf("foo\n");
+}
+
+int main(void)
+{
+  foo();
+  return 0;
+}
+EOF
+
+        if compile_prog "" "-Wl,--dynamic-list=$TMPTXT" ; then
+            ld_dynamic_list="yes"
+        fi
+    fi
+
+    #########################################
+    # See if -exported_symbols_list is supported by the linker
+
+    ld_exported_symbols_list="no"
+    if test "$static" = "no" ; then
+        cat > $TMPTXT <<EOF
+  _foo
+EOF
+
+        if compile_prog "" "-Wl,-exported_symbols_list,$TMPTXT" ; then
+            ld_exported_symbols_list="yes"
+        fi
+    fi
+
+    if test "$ld_dynamic_list" = "no" &&
+       test "$ld_exported_symbols_list" = "no" ; then
+        if test "$plugins" = "yes"; then
+            error_exit \
+                "Plugin ($plugins) support requires dynamic linking and specifying a set of symbols " \
+                "that are exported to plugins. Unfortunately your linker doesn't " \
+                "support the flag (--dynamic-list or -exported_symbols_list) used " \
+                "for this purpose. You can't build with --static."
+        else
+            plugins="no"
+        fi
+    else
+        plugins="yes"
+    fi
+fi
+
 ##########################################
 # glib support probe
 
@@ -3093,7 +3160,7 @@ glib_modules=gthread-2.0
 if test "$modules" = yes; then
     glib_modules="$glib_modules gmodule-export-2.0"
 fi
-if test "$plugins" = yes; then
+if test "$plugins" = "yes"; then
     glib_modules="$glib_modules gmodule-2.0"
 fi
 
@@ -3931,60 +3998,6 @@ if compile_prog "" "" ; then
   atomic64=yes
 fi
 
-#########################################
-# See if --dynamic-list is supported by the linker
-ld_dynamic_list="no"
-if test "$static" = "no" ; then
-    cat > $TMPTXT <<EOF
-{
-  foo;
-};
-EOF
-
-    cat > $TMPC <<EOF
-#include <stdio.h>
-void foo(void);
-
-void foo(void)
-{
-  printf("foo\n");
-}
-
-int main(void)
-{
-  foo();
-  return 0;
-}
-EOF
-
-    if compile_prog "" "-Wl,--dynamic-list=$TMPTXT" ; then
-        ld_dynamic_list="yes"
-    fi
-fi
-
-#########################################
-# See if -exported_symbols_list is supported by the linker
-
-ld_exported_symbols_list="no"
-if test "$static" = "no" ; then
-    cat > $TMPTXT <<EOF
-  _foo
-EOF
-
-    if compile_prog "" "-Wl,-exported_symbols_list,$TMPTXT" ; then
-        ld_exported_symbols_list="yes"
-    fi
-fi
-
-if  test "$plugins" = "yes" &&
-    test "$ld_dynamic_list" = "no" &&
-    test "$ld_exported_symbols_list" = "no" ; then
-  error_exit \
-      "Plugin support requires dynamic linking and specifying a set of symbols " \
-      "that are exported to plugins. Unfortunately your linker doesn't " \
-      "support the flag (--dynamic-list or -exported_symbols_list) used " \
-      "for this purpose. You can't build with --static."
-fi
 
 ########################################
 # check if getauxval is available.
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d9b834c848..89df51517c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -354,29 +354,6 @@ build-some-softmmu:
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
-# Run check-tcg against linux-user (with plugins)
-# we skip sparc64-linux-user until it has been fixed somewhat
-# we skip cris-linux-user as it doesn't use the common run loop
-build-user-plugins:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
-    MAKE_CHECK_ARGS: check-tcg
-  timeout: 1h 30m
-
-build-some-softmmu-plugins:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
-    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
-    MAKE_CHECK_ARGS: check-tcg
-
 clang-system:
   extends: .native_build_job_template
   needs:
-- 
2.20.1


