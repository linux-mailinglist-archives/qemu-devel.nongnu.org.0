Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867173C86CD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:12:24 +0200 (CEST)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gYg-0006jf-62
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNp-0007Tn-8N
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNi-0007d1-Dr
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f17so3616457wrt.6
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NdFhM3mErXM9CZH7/QXNM2pE9ztXd5aa82fNrrn30UU=;
 b=nxXZlDjOf12sKfB6+Q/pQXJbj89MHIoClUAk6s1jdINLIz5PPcaUYBUT8C0FtzN/DQ
 mjLSddlwsCQz6iODBVWlMGrlEwTeene4lKYXjzaW1pTNtMP4acujOMdG2qN240jzVUhp
 0DvWomIFQc75LlYKhJdFrgfNdLnNT2ZQ/IO701j6e1SXbX5DBGqR2XIWwLjNTIPfrhQj
 FSt63mRO1dBW84oi0/AbcTgEGqjjAzSi/yP2fJ9ViccAeyuid0AY5G6JgSgKU2Ul0LTd
 A7byGk83mGQQ9qzMkVXCEOTl8UfppvFmi9MA4d80VQXbEjXTzFHWGIWo6eGqLcS6nsJB
 T8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NdFhM3mErXM9CZH7/QXNM2pE9ztXd5aa82fNrrn30UU=;
 b=XhQi2CV8xoFKjXb44wZM5KMPEX/4Edd2WcdcHSgTqbe96wwgkFSbb6dTsnVlbDvCEM
 niYR70k+wId+85bdTFvEWqD56N3f8egmXAwW8sQ5+m/ztyfQ/EeeXw8O1g2891/VNs8F
 0k3DfjM8bCfYRIRvEaLq4FrMHJ9NM3d7EgR5lh83u6hQ61ReuP69zxUH2rDES33or8ey
 Tful/joIBH31RizrYv5cV9B2GCARXsYho7lXSRIr2l2YPqAy+sM7poPPK/F9YZjjhzEJ
 I1NFktPmgDTb0RgyNLHepP5zh9P3GgbwjFAheFnkkxzMgkso4GS4j+TtWFN1acsC2laC
 qiLg==
X-Gm-Message-State: AOAM533AtLFpr8lQgokxFSqys32Jud20PFhMH+8PyQUSa4BfsHRb1bJ2
 tkLVAU47zOJ9w9s602NmKcBEsw==
X-Google-Smtp-Source: ABdhPJw7lz7sDDzkU2LgEFcirsihGalPPCownQhmhMAqxpa9R3kDgE1gb+zWlmY6DmGjALRiMOLKug==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr13495773wro.183.1626274860943; 
 Wed, 14 Jul 2021 08:01:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o14sm3066671wrj.66.2021.07.14.08.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92AD91FFBE;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 36/44] tcg/plugins: enable by default for most TCG builds
Date: Wed, 14 Jul 2021 16:00:28 +0100
Message-Id: <20210714150036.21060-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
index e7f2fcd02c..49b5481139 100755
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
@@ -2209,6 +2209,8 @@ if test "$static" = "yes" ; then
   fi
   if test "$plugins" = "yes"; then
     error_exit "static and plugins are mutually incompatible"
+  else
+    plugins="no"
   fi
 fi
 
@@ -3102,6 +3104,69 @@ for drv in $audio_drv_list; do
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
 
@@ -3110,7 +3175,7 @@ glib_modules=gthread-2.0
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


