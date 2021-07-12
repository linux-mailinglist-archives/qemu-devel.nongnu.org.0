Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2793C5C54
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:37:34 +0200 (CEST)
Received: from localhost ([::1]:42554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vBl-0002zw-Qx
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7M-0004n9-BG
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:00 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7J-0002K9-MI
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:32:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id k32so8086420wms.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLGV3nOOa57cJf2gO1fpwVSEwaIR/mViJx+0lBSJNTo=;
 b=eTPCjvlV52H42iacsU5RvA5u2TFdNpdBgRlk7l8zAIA01agwz60m6gAXMtMjOepBvS
 AX6wcqInb0S+aQzMpM9l4GwxKK6C5zWFOBezc9dL/GxAatOaoqqioUuOU9h0RIwflVIg
 em7Lf6fviKsQzmxrFmTDFrJfd9uW0LA7EL53cufQZ6tRISTByh8AXUj8mCZrCMvgl3rT
 cvWmycOsXrSvhriVUxdEjADCwYVnBB8CSWi/wSYUb9UQj7U6pgNf6EOow03WnYQQ6Zd6
 CouiV++FRcd/YGsqWiW3aNJ7TcqJvTNdHy8bvNa5BYqSL8/VXhIIxUnB+RTkEJZWx8wy
 OZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLGV3nOOa57cJf2gO1fpwVSEwaIR/mViJx+0lBSJNTo=;
 b=RTXRIKegoVjSQlVEaHzADsiTWLq2/0Nv1yfZ7d+Wj8fssuRQOwH0eM96GiVA2cQqfj
 vx/oYMGAQUif1mHFCDg6VyUg+XvSyynUR05QuQSMtWzIbVlW/ZVzkk5WalMjWx5ul0I1
 D9sh9bnCMDmnU9eKV+pjjZNiiLY7ZXULVYCDsi9falqmZ78kNbKUkzHU5CK0lJqjXinG
 Aa4s9+pBYUn2HSTVW+DivZ1djyJaQeBXwoHRXbTtqjVOKjxh4K0uupNEIAyjkr5WWPLI
 L0qXFpAz4yubX9j5i0XU3o8PwW/wRZ3Db6QSdrtKVoMdWeAilVNx3FhJmg8MpfqlOBI5
 RxWg==
X-Gm-Message-State: AOAM533Z0DCHwZNQVo8KH412aoOoE0RNGOqZzi44SNt/4bcHNlU4cUzO
 HG5M1HUtJGqSPSplzYc+tK7Duw==
X-Google-Smtp-Source: ABdhPJwMkDsA/0iq1tL9Uf3/FbqLIK0auflfXQ8ph8H3r9pegkG3nYuPlpv2d5pxyFmOYQ12jCVDIA==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr25685291wmi.99.1626093176380; 
 Mon, 12 Jul 2021 05:32:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c125sm18783135wme.36.2021.07.12.05.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 380F81FFBA;
 Mon, 12 Jul 2021 13:26:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 32/40] tcg/plugins: enable by default for most TCG builds
Date: Mon, 12 Jul 2021 13:26:45 +0100
Message-Id: <20210712122653.11354-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210709143005.1554-33-alex.bennee@linaro.org>

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
index 97ea6e6629..60358529fd 100755
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
@@ -2196,6 +2196,8 @@ if test "$static" = "yes" ; then
   fi
   if test "$plugins" = "yes"; then
     error_exit "static and plugins are mutually incompatible"
+  else
+    plugins="no"
   fi
 fi
 
@@ -3089,6 +3091,69 @@ for drv in $audio_drv_list; do
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
 
@@ -3097,7 +3162,7 @@ glib_modules=gthread-2.0
 if test "$modules" = yes; then
     glib_modules="$glib_modules gmodule-export-2.0"
 fi
-if test "$plugins" = yes; then
+if test "$plugins" = "yes"; then
     glib_modules="$glib_modules gmodule-2.0"
 fi
 
@@ -3935,61 +4000,6 @@ if compile_prog "" "" ; then
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


