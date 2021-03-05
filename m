Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C431632ECA6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 14:57:13 +0100 (CET)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIAx5-0000hK-9S
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 08:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIAuz-0007bs-1i
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:55:01 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIAuw-00079I-Gh
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:55:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w7so1515311wmb.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 05:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qs3X4Vrdn0QMj8+l/h+TrHu30GN7onIaZQm+5Oo555k=;
 b=jWWRCWeikH/1ic62WGfEJYHM+DuvzknFxwhVseBkLuusYU+eEMHt+kbDQ+vZoXG1hG
 E480h4jv12fQN59oCGAF73lhDlxTMIJaXhtbXn49+cfwzPYrmraAFWHyW9L5VoJTbnxU
 otz7In9ozoO59KoBLWuZt0b+CdjAup7gfQWOrZRgjYrfbna66gYjTyIC5JWi/cJR95wB
 622C65aTMddClNfTku9igojnCks6U54F43TxxYs5IWKTfZyZWn9lFVYlFo+ZPqaYH3GK
 pF7W+Inv1nJtJdjI+9ABrsTP/8GVXfPLkt+8/nVsPQyVnK3sBBA4NY30kOfkB+XZ29bx
 lv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qs3X4Vrdn0QMj8+l/h+TrHu30GN7onIaZQm+5Oo555k=;
 b=lvgvzhG1ouEafjA8sOar9qGPzHgVT0YRtIGTcAa7nMhqJ2sQQhJKV2D4+zf8SFljL/
 evJWd6+BXbBLk6QK9NvOrDBSPPD8Ffw0IN+U78xnInBfjl1B+whJZPVal/bxAmgKN0o6
 dv4/ZpC/Vs2jHqwNU0Dd1pnalVpP+H2Kbh50or6imgViT6jvl+xdoNzHkhglXYIoNeBj
 D2VeZfxE8BVmlJcNeiNzm0FUjfr7Nc1tqq9fcgypuulRa7SF4xII2vwVdrdyYR+hshjk
 EUOoGXwY7dvWYZNbexVApLzMbVpAsupekqcfkPDewbHAqnpfaU48q2oyIXN+m4KSVd3H
 Jzow==
X-Gm-Message-State: AOAM533UMpTbCRRHWj5cZTN88rlQ5MwQSUpBPFomsIrqtUWbvLcHVxBD
 NNOHW+U105t9uEztl3j0N3ZO4A==
X-Google-Smtp-Source: ABdhPJy8hC7aVLOobsPev3Mc+dPtTbxQE6TpV+hR2c9f8+9uALyAyR/Z3n2Lb9SWiRxXZQH70VJ6ug==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr8912110wmb.135.1614952496967; 
 Fri, 05 Mar 2021 05:54:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm4446648wml.34.2021.03.05.05.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 05:54:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 496E51FF8F;
 Fri,  5 Mar 2021 13:54:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of SYS_HEAPINFO
Date: Fri,  5 Mar 2021 13:54:51 +0000
Message-Id: <20210305135451.15427-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305135451.15427-1-alex.bennee@linaro.org>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bug 1915925 <1915925@bugs.launchpad.net>, Keith Packard <keithp@keithp.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not sure this every worked properly and it's certainly not
exercised by check-tcg or Peter's semihosting tests. Hoist it into
it's own helper function and attempt to validate the results in the
linux-user semihosting test at the least.

Bug: https://bugs.launchpad.net/bugs/1915925
Cc: Bug 1915925 <1915925@bugs.launchpad.net>
Cc: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/semicall.h      |   1 +
 semihosting/arm-compat-semi.c | 129 +++++++++++++++++++---------------
 tests/tcg/arm/semihosting.c   |  34 ++++++++-
 3 files changed, 107 insertions(+), 57 deletions(-)

diff --git a/tests/tcg/arm/semicall.h b/tests/tcg/arm/semicall.h
index d4f6818192..676a542be5 100644
--- a/tests/tcg/arm/semicall.h
+++ b/tests/tcg/arm/semicall.h
@@ -9,6 +9,7 @@
 
 #define SYS_WRITE0      0x04
 #define SYS_READC       0x07
+#define SYS_HEAPINFO    0x16
 #define SYS_REPORTEXC   0x18
 
 uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 94950b6c56..a8fdbceb5f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -822,6 +822,78 @@ static const GuestFDFunctions guestfd_fns[] = {
     put_user_utl(val, args + (n) * sizeof(target_ulong))
 #endif
 
+/*
+ * SYS_HEAPINFO is a little weird: "On entry, the PARAMETER REGISTER
+ * contains the address of a pointer to a four-field data block" which
+ * we then fill in. The PARAMETER REGISTER is unchanged.
+ */
+
+struct HeapInfo {
+    target_ulong heap_base;
+    target_ulong heap_limit;
+    target_ulong stack_base;
+    target_ulong stack_limit;
+};
+
+static bool do_heapinfo(CPUState *cs, target_long arg0)
+{
+    target_ulong limit;
+    struct HeapInfo info = {};
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = cs->opaque;
+#else
+    target_ulong rambase = common_semi_rambase(cs);
+#endif
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Some C libraries assume the heap immediately follows .bss, so
+     * allocate it using sbrk.
+     */
+    if (!ts->heap_limit) {
+        abi_ulong ret;
+
+        ts->heap_base = do_brk(0);
+        limit = ts->heap_base + COMMON_SEMI_HEAP_SIZE;
+        /* Try a big heap, and reduce the size if that fails.  */
+        for (;;) {
+            ret = do_brk(limit);
+            if (ret >= limit) {
+                break;
+            }
+            limit = (ts->heap_base >> 1) + (limit >> 1);
+        }
+        ts->heap_limit = limit;
+    }
+
+    info.heap_base = ts->heap_base;
+    info.heap_limit = ts->heap_limit;
+    info.stack_base = ts->stack_base;
+    info.stack_limit = 0; /* Stack limit.  */
+
+    if (copy_to_user(arg0, &info, sizeof(info))) {
+        errno = EFAULT;
+        return  set_swi_errno(cs, -1);
+    }
+#else
+    limit = current_machine->ram_size;
+    /* TODO: Make this use the limit of the loaded application.  */
+    info.heap_base = rambase + limit / 2;
+    info.heap_limit = rambase + limit;
+    info.stack_base = rambase + limit; /* Stack base */
+    info.stack_limit = rambase; /* Stack limit.  */
+
+    if (cpu_memory_rw_debug(cs, arg0, &info, sizeof(info), true)) {
+        errno = EFAULT;
+        return  set_swi_errno(cs, -1);
+    }
+
+#endif
+
+    return 0;
+}
+
+
 /*
  * Do a semihosting call.
  *
@@ -1184,63 +1256,8 @@ target_ulong do_common_semihosting(CPUState *cs)
         }
     case TARGET_SYS_HEAPINFO:
         {
-            target_ulong retvals[4];
-            target_ulong limit;
-            int i;
-#ifdef CONFIG_USER_ONLY
-            TaskState *ts = cs->opaque;
-#else
-            target_ulong rambase = common_semi_rambase(cs);
-#endif
-
             GET_ARG(0);
-
-#ifdef CONFIG_USER_ONLY
-            /*
-             * Some C libraries assume the heap immediately follows .bss, so
-             * allocate it using sbrk.
-             */
-            if (!ts->heap_limit) {
-                abi_ulong ret;
-
-                ts->heap_base = do_brk(0);
-                limit = ts->heap_base + COMMON_SEMI_HEAP_SIZE;
-                /* Try a big heap, and reduce the size if that fails.  */
-                for (;;) {
-                    ret = do_brk(limit);
-                    if (ret >= limit) {
-                        break;
-                    }
-                    limit = (ts->heap_base >> 1) + (limit >> 1);
-                }
-                ts->heap_limit = limit;
-            }
-
-            retvals[0] = ts->heap_base;
-            retvals[1] = ts->heap_limit;
-            retvals[2] = ts->stack_base;
-            retvals[3] = 0; /* Stack limit.  */
-#else
-            limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
-            retvals[3] = rambase; /* Stack limit.  */
-#endif
-
-            for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-                bool fail;
-
-                fail = SET_ARG(i, retvals[i]);
-
-                if (fail) {
-                    /* Couldn't write back to argument block */
-                    errno = EFAULT;
-                    return set_swi_errno(cs, -1);
-                }
-            }
-            return 0;
+            return do_heapinfo(cs, arg0);
         }
     case TARGET_SYS_EXIT:
     case TARGET_SYS_EXIT_EXTENDED:
diff --git a/tests/tcg/arm/semihosting.c b/tests/tcg/arm/semihosting.c
index 33faac9916..fd5780ec3c 100644
--- a/tests/tcg/arm/semihosting.c
+++ b/tests/tcg/arm/semihosting.c
@@ -7,7 +7,13 @@
  * SPDX-License-Identifier: GPL-3.0-or-later
  */
 
+#define _GNU_SOURCE  /* asprintf is a GNU extension */
+
 #include <stdint.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
 #include "semicall.h"
 
 int main(int argc, char *argv[argc])
@@ -18,8 +24,34 @@ int main(int argc, char *argv[argc])
     uintptr_t exit_block[2] = {0x20026, 0};
     uintptr_t exit_code = (uintptr_t) &exit_block;
 #endif
+    struct {
+        void *heap_base;
+        void *heap_limit;
+        void *stack_base;
+        void *stack_limit;
+    } info;
+    void *ptr_to_info = (void *) &info;
+    char *heap_info, *stack_info;
+    void *brk = sbrk(0);
+
+    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World\n");
+
+    memset(&info, 0, sizeof(info));
+    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
+
+    asprintf(&heap_info, "heap: %p -> %p\n", info.heap_base, info.heap_limit);
+    __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
+    if (info.heap_base != brk) {
+        sprintf(heap_info, "heap mismatch: %p\n", brk);
+        __semi_call(SYS_WRITE0, (uintptr_t) heap_info);
+        return -1;
+    }
+
+    asprintf(&stack_info, "stack: %p -> %p\n", info.stack_base, info.stack_limit);
+    __semi_call(SYS_WRITE0, (uintptr_t) stack_info);
+    free(heap_info);
+    free(stack_info);
 
-    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
     __semi_call(SYS_REPORTEXC, exit_code);
     /* if we get here we failed */
     return -1;
-- 
2.20.1


