Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26C3434FF
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 22:18:26 +0100 (CET)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO5Sr-0007hl-6J
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 17:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO5QE-0006ob-6e
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 17:15:42 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:35501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO5QB-0007xc-AX
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 17:15:41 -0400
Received: by mail-qk1-x731.google.com with SMTP id i9so8686332qka.2
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 14:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QwVEq09Lis33jdO1S4EGbGgeWkGH8hYBQwzlKj1LCg4=;
 b=siLHzrnLqHYG+GWeNA2qHt94LBf8I7WP+ZCuzmgEKeVK3SAm2LS5CgVliFffsj9HIZ
 t8DlEpj/92qr21oKZJZpj6T235+FqGMdsqD6auJ3NLh1A3oAlojJbUVFigB+q022LTj0
 jq6L7usYlooKXMB57eEMgeDzd5IiouVwmmFgxcmlQIWKt7Hr0XrJBypTvIsZ7Ge6QHbu
 iYAnWDbcBPUwiB6zuB28bE5SmIrmgn0KlYXZl6cXnRr9z0zqfIcebIpOdvm3/qUNIh7G
 C6Tv0d2u/6p84FgPoWFFPdT8WAjUNGPNfVTj9tssF8eptGhfe1dTgbFDaZMTxRDPPaAs
 BtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QwVEq09Lis33jdO1S4EGbGgeWkGH8hYBQwzlKj1LCg4=;
 b=LEt4zWCAjU8UK96AK3DosKGqPBy0mBBq22Xq/9zJHHgXbyaACkWNFuISkoJYlh78si
 tlaqZaskRT59lF+cKK9S9sQkSZWbgc8ZXj16VuVmcXDEkHUm/1iJgO6PE95d594CK4a8
 zVIFBrGUSpOEnMY7hY2q5Td+nJJbzfqgHD6HDjtmOPwr1bcDJs6I7XqzJJdk0bbqOS4W
 5C2/1iAMCZluXJVVEUeQ2Vl9/FrTUAeXk6Z1/N+atw2CIODFRDA5OnL9ckK/bPcmI0qg
 wrUzHk8BMhXYT82HUme/G4+TFmf7MEPC27AgN5Jm4J16rmkZ3+DbWr6CuVnufIrr472D
 pixw==
X-Gm-Message-State: AOAM532tRbaYKrjjSGq5FFUNAWCUaLLodxgyxFZRN8DSvDAyuQTukH4l
 t/yr8kVw0vtnITP80Nv97HIY/KeERPpo5tLi
X-Google-Smtp-Source: ABdhPJw6q+gb1ynJZ1lxDt1FNGbL86t+TVi6vC/wERTgq8ixL2fSoXOwlngHVDUvyfuixEnnN6wOZQ==
X-Received: by 2002:ae9:e113:: with SMTP id g19mr2725241qkm.480.1616361337909; 
 Sun, 21 Mar 2021 14:15:37 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 85sm9740904qkf.58.2021.03.21.14.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 14:15:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] exec: Build page-varry-common.c with -fno-lto
Date: Sun, 21 Mar 2021 15:15:34 -0600
Message-Id: <20210321211534.2101231-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: pbonzini@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In bbc17caf81f, we used an alias attribute to allow target_page
to be declared const, and yet be initialized late.

This fails when using LTO with several versions of gcc.
The compiler looks through the alias and decides that the const
variable is statically initialized to zero, then propagates that
zero to many uses of the variable.

This can be avoided by compiling one object file with -fno-lto.
In this way, any initializer cannot be seen, and the constant
propagation does not occur.

Since are certain to have this separate compilation unit, we can
drop the alias attribute as well.  We simply have differing
declarations for target_page in different compilation units.
Drop the use of init_target_page, and drop the configure detection
for CONFIG_ATTRIBUTE_ALIAS.

In order to change the compilation flags for a file with meson,
we must use a static_library.  This runs into specific_ss, where
we would need to create many static_library instances.

Fix this by splitting exec-page.c: the page-vary-common.c part is
compiled once as a static_library, while the page-vary.c part is
left in specific_ss in order to handle the target-specific value
of TARGET_PAGE_BITS_MIN.

Reported-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                |  19 -------
 meson.build              |  18 ++++++-
 include/exec/cpu-all.h   |  15 ++----
 include/exec/page-vary.h |  34 ++++++++++++
 exec-vary.c              | 108 ---------------------------------------
 page-vary-common.c       |  54 ++++++++++++++++++++
 page-vary.c              |  41 +++++++++++++++
 7 files changed, 150 insertions(+), 139 deletions(-)
 create mode 100644 include/exec/page-vary.h
 delete mode 100644 exec-vary.c
 create mode 100644 page-vary-common.c
 create mode 100644 page-vary.c

diff --git a/configure b/configure
index 847bc4d095..dbb873e09c 100755
--- a/configure
+++ b/configure
@@ -4889,21 +4889,6 @@ if  test "$plugins" = "yes" &&
       "for this purpose. You can't build with --static."
 fi
 
-########################################
-# See if __attribute__((alias)) is supported.
-# This false for Xcode 9, but has been remedied for Xcode 10.
-# Unfortunately, travis uses Xcode 9 by default.
-
-attralias=no
-cat > $TMPC << EOF
-int x = 1;
-extern const int y __attribute__((alias("x")));
-int main(void) { return 0; }
-EOF
-if compile_prog "" "" ; then
-    attralias=yes
-fi
-
 ########################################
 # check if getauxval is available.
 
@@ -5935,10 +5920,6 @@ if test "$atomic64" = "yes" ; then
   echo "CONFIG_ATOMIC64=y" >> $config_host_mak
 fi
 
-if test "$attralias" = "yes" ; then
-  echo "CONFIG_ATTRIBUTE_ALIAS=y" >> $config_host_mak
-fi
-
 if test "$getauxval" = "yes" ; then
   echo "CONFIG_GETAUXVAL=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 5c85a15364..24e8897ba2 100644
--- a/meson.build
+++ b/meson.build
@@ -1933,7 +1933,6 @@ subdir('softmmu')
 
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
-specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
   'tcg/optimize.c',
@@ -1945,6 +1944,23 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
 ))
 specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
 
+# Work around a gcc bug/misfeature wherein constant propagation looks
+# through an alias:
+#   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
+# to guess that a const variable is always zero.  Without lto, this is
+# impossible, as the alias is restricted to page-vary-common.c.  Indeed,
+# without lto, not even the alias is required -- we simply use different
+# declarations in different compilation units.
+pagevary = files('page-vary-common.c')
+if get_option('b_lto')
+  pagevary = static_library('page-vary-common',
+                            sources: pagevary,
+                            c_args: ['-fno-lto'])
+  pagevary = declare_dependency(link_with: pagevary)
+endif
+common_ss.add(pagevary)
+specific_ss.add(files('page-vary.c'))
+
 subdir('backends')
 subdir('disas')
 subdir('migration')
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 76443eb11d..d76b0b9e02 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -215,22 +215,15 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
 /* page related stuff */
 
 #ifdef TARGET_PAGE_BITS_VARY
-typedef struct {
-    bool decided;
-    int bits;
-    target_long mask;
-} TargetPageBits;
-#if defined(CONFIG_ATTRIBUTE_ALIAS) || !defined(IN_EXEC_VARY)
+# include "exec/page-vary.h"
 extern const TargetPageBits target_page;
-#else
-extern TargetPageBits target_page;
-#endif
 #ifdef CONFIG_DEBUG_TCG
 #define TARGET_PAGE_BITS   ({ assert(target_page.decided); target_page.bits; })
-#define TARGET_PAGE_MASK   ({ assert(target_page.decided); target_page.mask; })
+#define TARGET_PAGE_MASK   ({ assert(target_page.decided); \
+                              (target_long)target_page.mask; })
 #else
 #define TARGET_PAGE_BITS   target_page.bits
-#define TARGET_PAGE_MASK   target_page.mask
+#define TARGET_PAGE_MASK   ((target_long)target_page.mask)
 #endif
 #define TARGET_PAGE_SIZE   (-(int)TARGET_PAGE_MASK)
 #else
diff --git a/include/exec/page-vary.h b/include/exec/page-vary.h
new file mode 100644
index 0000000000..c22a7a742e
--- /dev/null
+++ b/include/exec/page-vary.h
@@ -0,0 +1,34 @@
+/*
+ * Definitions for cpus with variable page sizes.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef EXEC_PAGE_VARY_H
+#define EXEC_PAGE_VARY_H
+
+typedef struct {
+    bool decided;
+    int bits;
+    uint64_t mask;
+} TargetPageBits;
+
+#ifdef IN_PAGE_VARY
+extern bool set_preferred_target_page_bits_common(int bits);
+extern void finalize_target_page_bits_common(int min);
+#endif
+
+#endif /* EXEC_PAGE_VARY_H */
diff --git a/exec-vary.c b/exec-vary.c
deleted file mode 100644
index a603b1b433..0000000000
--- a/exec-vary.c
+++ /dev/null
@@ -1,108 +0,0 @@
-/*
- * Variable page size handling
- *
- *  Copyright (c) 2003 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu-common.h"
-
-#define IN_EXEC_VARY 1
-
-#include "exec/exec-all.h"
-
-#ifdef TARGET_PAGE_BITS_VARY
-# ifdef CONFIG_ATTRIBUTE_ALIAS
-/*
- * We want to declare the "target_page" variable as const, which tells
- * the compiler that it can cache any value that it reads across calls.
- * This avoids multiple assertions and multiple reads within any one user.
- *
- * This works because we finish initializing the data before we ever read
- * from the "target_page" symbol.
- *
- * This also requires that we have a non-constant symbol by which we can
- * perform the actual initialization, and which forces the data to be
- * allocated within writable memory.  Thus "init_target_page", and we use
- * that symbol exclusively in the two functions that initialize this value.
- *
- * The "target_page" symbol is created as an alias of "init_target_page".
- */
-static TargetPageBits init_target_page;
-
-/*
- * Note that this is *not* a redundant decl, this is the definition of
- * the "target_page" symbol.  The syntax for this definition requires
- * the use of the extern keyword.  This seems to be a GCC bug in
- * either the syntax for the alias attribute or in -Wredundant-decls.
- *
- * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91765
- */
-#  pragma GCC diagnostic push
-#  pragma GCC diagnostic ignored "-Wredundant-decls"
-
-extern const TargetPageBits target_page
-    __attribute__((alias("init_target_page")));
-
-#  pragma GCC diagnostic pop
-# else
-/*
- * When aliases are not supported then we force two different declarations,
- * by way of suppressing the header declaration with IN_EXEC_VARY.
- * We assume that on such an old compiler, LTO cannot be used, and so the
- * compiler cannot not detect the mismatched declarations, and all is well.
- */
-TargetPageBits target_page;
-#  define init_target_page target_page
-# endif
-#endif
-
-bool set_preferred_target_page_bits(int bits)
-{
-    /*
-     * The target page size is the lowest common denominator for all
-     * the CPUs in the system, so we can only make it smaller, never
-     * larger. And we can't make it smaller once we've committed to
-     * a particular size.
-     */
-#ifdef TARGET_PAGE_BITS_VARY
-    assert(bits >= TARGET_PAGE_BITS_MIN);
-    if (init_target_page.bits == 0 || init_target_page.bits > bits) {
-        if (init_target_page.decided) {
-            return false;
-        }
-        init_target_page.bits = bits;
-    }
-#endif
-    return true;
-}
-
-void finalize_target_page_bits(void)
-{
-#ifdef TARGET_PAGE_BITS_VARY
-    if (init_target_page.bits == 0) {
-        init_target_page.bits = TARGET_PAGE_BITS_MIN;
-    }
-    init_target_page.mask = (target_long)-1 << init_target_page.bits;
-    init_target_page.decided = true;
-
-    /*
-     * For the benefit of an -flto build, prevent the compiler from
-     * hoisting a read from target_page before we finish initializing.
-     */
-    barrier();
-#endif
-}
diff --git a/page-vary-common.c b/page-vary-common.c
new file mode 100644
index 0000000000..9175556498
--- /dev/null
+++ b/page-vary-common.c
@@ -0,0 +1,54 @@
+/*
+ * Variable page size handling -- target independent part.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define IN_PAGE_VARY 1
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "exec/page-vary.h"
+
+/* WARNING: This file must *not* be complied with -flto. */
+
+TargetPageBits target_page;
+
+bool set_preferred_target_page_bits_common(int bits)
+{
+    /*
+     * The target page size is the lowest common denominator for all
+     * the CPUs in the system, so we can only make it smaller, never
+     * larger. And we can't make it smaller once we've committed to
+     * a particular size.
+     */
+    if (target_page.bits == 0 || target_page.bits > bits) {
+        if (target_page.decided) {
+            return false;
+        }
+        target_page.bits = bits;
+    }
+    return true;
+}
+
+void finalize_target_page_bits_common(int min)
+{
+    if (target_page.bits == 0) {
+        target_page.bits = min;
+    }
+    target_page.mask = -1ull << target_page.bits;
+    target_page.decided = true;
+}
diff --git a/page-vary.c b/page-vary.c
new file mode 100644
index 0000000000..057c7f1815
--- /dev/null
+++ b/page-vary.c
@@ -0,0 +1,41 @@
+/*
+ * Variable page size handling -- target specific part.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define IN_PAGE_VARY 1
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "exec/exec-all.h"
+
+bool set_preferred_target_page_bits(int bits)
+{
+#ifdef TARGET_PAGE_BITS_VARY
+    assert(bits >= TARGET_PAGE_BITS_MIN);
+    return set_preferred_target_page_bits_common(bits);
+#else
+    return true;
+#endif
+}
+
+void finalize_target_page_bits(void)
+{
+#ifdef TARGET_PAGE_BITS_VARY
+    finalize_target_page_bits_common(TARGET_PAGE_BITS_MIN);
+#endif
+}
-- 
2.25.1


