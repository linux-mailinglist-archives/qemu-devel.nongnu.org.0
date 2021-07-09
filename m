Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7E3C261E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:40:48 +0200 (CEST)
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rgN-0002Am-KP
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdG-0004as-Iu
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdD-0000AT-O2
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id k4so6153766wrc.8
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3DUVqUcpt8ZcjM9bBc26vjf5nCrQAnBIuXMWdbcTqI=;
 b=W9HpQY+G3qNKNomCZPqEFyREfsynsgh5Ivly/n698LsCE1miplVtB7dV4LkSoRMjVn
 iALYISpMM8zrYp7f8Q/gDXUs/TFHFKuYgj9H52ELYXOmJ/f7pF+zSuKcpDn7j0zmHTTe
 NZ0rv3J4XJIW6RM5xwf0h79T8ek565T+ZuHNOa15eNN5DM7V2vjxNgskrEBT5SmwxhCf
 Bx4V6Ssat+faoAC1KtGXpk/RMJEHvf0eXkff6XRYOz0K6C2l3WpzjEC0f/FthhnbwoqZ
 GcPk7WU0mk4X7FplEfav5awHLaOgcXGGCqB6TK6q6f2vfcRLjwSAuPDLWjq3GHso7c1H
 7A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3DUVqUcpt8ZcjM9bBc26vjf5nCrQAnBIuXMWdbcTqI=;
 b=HQHXrZupos/mhm23cjJ6wn8KdM2/2+ZZ5Ihq9VfdOinJsuH9zNb8ISYozMTadebep2
 SBVh8dOABzRiQRZjk22q55eVwa7nKc9ZZq/Ul5LgA4WVMdevZmZiRub4znKEXZz9nK4r
 6khlTFGtK9HEC2uWG2nELISuUp2BhExoORpVV5PTCU1qTH8iHh3PwGa5cicP/PHyheQl
 l6yXimWULdwKZioCcd5OWImanuyw/MjEFs0b+MLGh3sFwO3FJGucg7g7MyJQKCCFyHbp
 Za3fIsv1xHUA+iojZPnOV7qkcqfKOOIlNLrC6jNsaCCBsvBg3PlZn0whOAC1uMb6rwc1
 nugg==
X-Gm-Message-State: AOAM532Ak8n0No9njyeF9oHLWbjmSs/liuCHc3rrr3P+wQ5xzgfdfYmh
 rpO1jWZqwMwRqADFErfc21uBEw==
X-Google-Smtp-Source: ABdhPJyltU2lic7WDYA0w9sH7ygFuh+/MBRyQg69ymiNdoxmt7uHqO3AxS1Gxqc0BhwbezSx6Cv2XQ==
X-Received: by 2002:a5d:46cc:: with SMTP id g12mr40576093wrs.136.1625841449206; 
 Fri, 09 Jul 2021 07:37:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m12sm4812161wms.24.2021.07.09.07.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3924C1FF8F;
 Fri,  9 Jul 2021 15:30:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 32/40] tcg/plugins: enable by default for most TCG builds
Date: Fri,  9 Jul 2021 15:29:57 +0100
Message-Id: <20210709143005.1554-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
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

We need to move our linker testing earlier so we can be sure we can
enable the loader module required. As we have ruled out static &
plugins in an earlier patch we can also reduce the indent a little.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - properly handle plugins being ""
  - make the test for linker support handle default case
  - move linker tests to before the glib-modules test
v3
  - remove stray debug ($plugins)
  - remove no longer needed if static = no check
  - update commit message
---
 docs/devel/tcg-plugins.rst |   3 +-
 configure                  | 122 ++++++++++++++++++++-----------------
 .gitlab-ci.d/buildtest.yml |  23 -------
 3 files changed, 67 insertions(+), 81 deletions(-)

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
index 1eb8ef5341..b960dd5f77 100755
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
@@ -3090,6 +3090,69 @@ for drv in $audio_drv_list; do
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
+    cat > $TMPTXT <<EOF
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
+    if compile_prog "" "-Wl,--dynamic-list=$TMPTXT" ; then
+        ld_dynamic_list="yes"
+    fi
+
+    #########################################
+    # See if -exported_symbols_list is supported by the linker
+
+    ld_exported_symbols_list="no"
+    cat > $TMPTXT <<EOF
+  _foo
+EOF
+
+    if compile_prog "" "-Wl,-exported_symbols_list,$TMPTXT" ; then
+        ld_exported_symbols_list="yes"
+    fi
+
+    if test "$ld_dynamic_list" = "no" &&
+       test "$ld_exported_symbols_list" = "no" ; then
+        if test "$plugins" = "yes"; then
+            error_exit \
+                "Plugin support requires dynamic linking and specifying a set of symbols " \
+                "that are exported to plugins. Unfortunately your linker doesn't " \
+                "support the flag (--dynamic-list or -exported_symbols_list) used " \
+                "for this purpose."
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
 
@@ -3098,7 +3161,7 @@ glib_modules=gthread-2.0
 if test "$modules" = yes; then
     glib_modules="$glib_modules gmodule-export-2.0"
 fi
-if test "$plugins" = yes; then
+if test "$plugins" = "yes"; then
     glib_modules="$glib_modules gmodule-2.0"
 fi
 
@@ -3936,61 +3999,6 @@ if compile_prog "" "" ; then
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
-      "for this purpose."
-fi
-
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


