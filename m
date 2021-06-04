Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A039BCD6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:16:03 +0200 (CEST)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCUL-0007Vx-Vs
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHY-0007eY-RI
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:02:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHR-0005hM-Ap
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:02:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id f20so1465561wmg.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eXvK+3AOQ6m3KywdrH0nWhrBTBSo/h3FF5G5cv3gKts=;
 b=TbUh/sVvJMx2lNXgKLs7LZ0ebdn2mcV+RRTLFTzw3w5qWuePqnwfVzScSvBwDekxth
 MVQXhGkyRJe7GfusnmnqJtzvdnS8/j93G3XsmjqVJo0m8yZFfPWm4N/3/TjBjbvizsfz
 mtJDpJ35Ad7WELaz3hOz2w2ipyVEGl6HE13nJ0PfMbu0476nH0Lydqf2aBn0KC54ftjj
 6N+H1FwRdSlbVLETp9yvNPUflnNH2Cczal+yz08ocYVs2Z1ee3n5DdrzjyRhLco6vINo
 9iuhoaP13DvCM/y5rhqQcTX25f1WXoa3ahLqpPS5oafJrvzt9k/4qKLxDS7fthS5VGLY
 hw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXvK+3AOQ6m3KywdrH0nWhrBTBSo/h3FF5G5cv3gKts=;
 b=TBYnTdi0GWrDu6zSxAx3YXeLVLu/2GAiRn1fY/cNgFpVcM2QF6gS2tbC5uqCrr+pUT
 cJDTp0lfYasvsB3uZXR5juLAYsryGyiz0dwX6961Mq2/UdYEnTCf1/ZDV1x7uiYiG35F
 3haIIVQxV6AqXx+rR+yT4oWChsgqexhun3THvwrnHtuC/WwaIViqOPiXRmZ+OR1Fh9cm
 7loCF9L9vUUVBtHsuvuur+sAzPOgEq1DxVd3cgqmsSeI0vsR408LOCH2ZzK8BslXDd/p
 kCNkyPhqfFeAjPQfMqVwKvRwR4IxHnVsW39KjnhqPa5nj4QwjcWfPYVh56m6cFawWFRA
 9Xcg==
X-Gm-Message-State: AOAM533CEKUwcsWiRXxECQrTDixrDYqZzNR8MSe+DdJVydq5JJlTPrC5
 1GP1BvaiQEyVUa1b4W5tsknkMg==
X-Google-Smtp-Source: ABdhPJxmHzQFLq/Bcz/LHLmuMY4y8Iw0IJ9oewIfbwvB9WKxAvugHjiYeYIdZS4k0SgtXj5ar4QJiQ==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr4229149wmb.80.1622822559175; 
 Fri, 04 Jun 2021 09:02:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x10sm7174349wrt.65.2021.06.04.09.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 959141FFAB;
 Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 21/99] target/arm: tcg: split tlb_helper user-only and
 sysemu-only parts
Date: Fri,  4 Jun 2021 16:51:54 +0100
Message-Id: <20210604155312.15902-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tlb_helper.h        | 17 ++++++
 target/arm/tcg/sysemu/tlb_helper.c | 83 +++++++++++++++++++++++++
 target/arm/tcg/tlb_helper.c        | 97 ++----------------------------
 target/arm/tcg/user/tlb_helper.c   | 32 ++++++++++
 target/arm/tcg/sysemu/meson.build  |  1 +
 target/arm/tcg/user/meson.build    |  1 +
 6 files changed, 138 insertions(+), 93 deletions(-)
 create mode 100644 target/arm/tcg/tlb_helper.h
 create mode 100644 target/arm/tcg/sysemu/tlb_helper.c
 create mode 100644 target/arm/tcg/user/tlb_helper.c

diff --git a/target/arm/tcg/tlb_helper.h b/target/arm/tcg/tlb_helper.h
new file mode 100644
index 0000000000..6ce3d315cf
--- /dev/null
+++ b/target/arm/tcg/tlb_helper.h
@@ -0,0 +1,17 @@
+/*
+ * ARM TLB (Translation lookaside buffer) helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef TLB_HELPER_H
+#define TLB_HELPER_H
+
+#include "cpu.h"
+
+void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, ARMMMUFaultInfo *fi);
+
+#endif /* TLB_HELPER_H */
diff --git a/target/arm/tcg/sysemu/tlb_helper.c b/target/arm/tcg/sysemu/tlb_helper.c
new file mode 100644
index 0000000000..586f602989
--- /dev/null
+++ b/target/arm/tcg/sysemu/tlb_helper.c
@@ -0,0 +1,83 @@
+/*
+ * ARM TLB (Translation lookaside buffer) helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "tcg/tlb_helper.h"
+
+/*
+ * arm_cpu_do_transaction_failed: handle a memory system error response
+ * (eg "no device/memory present at address") by raising an external abort
+ * exception
+ */
+void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                   vaddr addr, unsigned size,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, MemTxAttrs attrs,
+                                   MemTxResult response, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+
+    fi.ea = arm_extabort_type(response);
+    fi.type = ARMFault_SyncExternal;
+    arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
+}
+
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot, ret;
+    MemTxAttrs attrs = {};
+    ARMCacheAttrs cacheattrs = {};
+
+    /*
+     * Walk the page table and (if the mapping exists) add the page
+     * to the TLB.  On success, return true.  Otherwise, if probing,
+     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
+     * register format, and signal the fault.
+     */
+    ret = get_phys_addr(&cpu->env, address, access_type,
+                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
+                        &phys_addr, &attrs, &prot, &page_size,
+                        &fi, &cacheattrs);
+    if (likely(!ret)) {
+        /*
+         * Map a single [sub]page. Regions smaller than our declared
+         * target page size are handled specially, so for those we
+         * pass in the exact addresses.
+         */
+        if (page_size >= TARGET_PAGE_SIZE) {
+            phys_addr &= TARGET_PAGE_MASK;
+            address &= TARGET_PAGE_MASK;
+        }
+        /* Notice and record tagged memory. */
+        if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
+            arm_tlb_mte_tagged(&attrs) = true;
+        }
+
+        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+                                prot, mmu_idx, page_size);
+        return true;
+    } else if (probe) {
+        return false;
+    } else {
+        /* now we have a real cpu fault */
+        cpu_restore_state(cs, retaddr, true);
+        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+    }
+}
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 3107f9823e..77aefc274d 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -9,6 +9,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "tcg/tlb_helper.h"
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
@@ -49,9 +50,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     return syn;
 }
 
-static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
-                                            MMUAccessType access_type,
-                                            int mmu_idx, ARMMMUFaultInfo *fi)
+void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
     int target_el;
@@ -122,93 +123,3 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     fi.type = ARMFault_Alignment;
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
-
-#if !defined(CONFIG_USER_ONLY)
-
-/*
- * arm_cpu_do_transaction_failed: handle a memory system error response
- * (eg "no device/memory present at address") by raising an external abort
- * exception
- */
-void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                   vaddr addr, unsigned size,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, MemTxAttrs attrs,
-                                   MemTxResult response, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-
-    fi.ea = arm_extabort_type(response);
-    fi.type = ARMFault_SyncExternal;
-    arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
-}
-
-#endif /* !defined(CONFIG_USER_ONLY) */
-
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
-
-#ifdef CONFIG_USER_ONLY
-    int flags = page_get_flags(useronly_clean_ptr(address));
-    if (flags & PAGE_VALID) {
-        fi.type = ARMFault_Permission;
-    } else {
-        fi.type = ARMFault_Translation;
-    }
-    fi.level = 3;
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
-#else
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot, ret;
-    MemTxAttrs attrs = {};
-    ARMCacheAttrs cacheattrs = {};
-
-    /*
-     * Walk the page table and (if the mapping exists) add the page
-     * to the TLB.  On success, return true.  Otherwise, if probing,
-     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
-     * register format, and signal the fault.
-     */
-    ret = get_phys_addr(&cpu->env, address, access_type,
-                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &phys_addr, &attrs, &prot, &page_size,
-                        &fi, &cacheattrs);
-    if (likely(!ret)) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (page_size >= TARGET_PAGE_SIZE) {
-            phys_addr &= TARGET_PAGE_MASK;
-            address &= TARGET_PAGE_MASK;
-        }
-        /* Notice and record tagged memory. */
-        if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
-            arm_tlb_mte_tagged(&attrs) = true;
-        }
-
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
-                                prot, mmu_idx, page_size);
-        return true;
-    } else if (probe) {
-        return false;
-    } else {
-        /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr, true);
-        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
-    }
-#endif
-}
diff --git a/target/arm/tcg/user/tlb_helper.c b/target/arm/tcg/user/tlb_helper.c
new file mode 100644
index 0000000000..9f24c96ba0
--- /dev/null
+++ b/target/arm/tcg/user/tlb_helper.c
@@ -0,0 +1,32 @@
+/*
+ * ARM TLB (Translation lookaside buffer) helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "tcg/tlb_helper.h"
+
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+
+    int flags = page_get_flags(useronly_clean_ptr(address));
+    if (flags & PAGE_VALID) {
+        fi.type = ARMFault_Permission;
+    } else {
+        fi.type = ARMFault_Translation;
+    }
+    fi.level = 3;
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+}
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index 1a4d7a0940..8f5e955cbd 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -1,4 +1,5 @@
 arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'debug_helper.c',
   'mte_helper.c',
+  'tlb_helper.c',
 ))
diff --git a/target/arm/tcg/user/meson.build b/target/arm/tcg/user/meson.build
index e681e5f5a1..cdca5d970c 100644
--- a/target/arm/tcg/user/meson.build
+++ b/target/arm/tcg/user/meson.build
@@ -1,3 +1,4 @@
 arm_user_ss.add(when: 'CONFIG_TCG', if_true: files(
   'mte_helper.c',
+  'tlb_helper.c',
 ))
-- 
2.20.1


