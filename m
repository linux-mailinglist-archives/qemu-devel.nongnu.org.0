Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D7648380
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:13:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3e7b-0005bQ-KG; Fri, 09 Dec 2022 09:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3e7Y-0005ax-HN
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:13:00 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3e7W-0008GX-2T
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:13:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id o15so3337589wmr.4
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+4qP43dTBNfbX5/hT0cf6EnB8grRGWLnGcg5jRbJnpI=;
 b=kOYvT5b/tHbsMKYyyrd9y4dWfe0W+hOy10kG4Cni78isvfqhLAdSVJcCAmVQUUvCtf
 yLWQf1BsfRj2HKn/NxBVuUdyZvKo8+EFhNohSeM+q6HyVdJREKhUz9kB+dJoBwpXYwHh
 O+LB4aOCNZRgTZn1cunOtgqlPkx3DQzG+oOD4nzMVUfH5vjMPFlPDgdLB182bRmFHRa3
 Zo7KFyQkR8GZSInFlwnwZR8a0oOQWM33D80NK8hsra1IrzsoN0Irin5XgZ09NYdoYSik
 PorWuJbxp6jqwvX7RV+4DIUW2gX3Q4WAwa3JNpiuw/yO2xGjEHmxKzJ6ZvzSPOIyv8Wd
 yPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+4qP43dTBNfbX5/hT0cf6EnB8grRGWLnGcg5jRbJnpI=;
 b=IGr3ykdNcH6hNjOfaqo6H2nGZ1EGy7+VuLGMVuIRBmr5nSbmF0zl1Na1AttgsYXdmD
 ymvl2DzwFgOYD5VRP9GnpYaCwcNCIIRpIhwHKevglnI19cWbHuZaKvY6PuRQ7M3M78QU
 U2UbXUyBBpkfBG7+mgo6dWSphsrONHX51+PLSJXXc65X0d9Q46oJ0OiMKSaX0Eg1w1m8
 dh3ZFxtWdYtord17an3wTrVd7CUKEVuG7x6TFp/vFMUwvvUlXYGL2Vf35J5NPGvGeaZj
 /ETIr0ePsBXl5vK39m3k1i72cjRa+Kt3OBpP+shjRLYHISGs2oh3nqstdeip2AgqXvwy
 rRow==
X-Gm-Message-State: ANoB5pnn+4+oNT4f8awDkX47KKyIQWOLsIt/h+Z0m4y21tVSY1b0QKv9
 9++nblFrSGPxmaK/1b9lbreuaB/Rj3+M85KSf7Q=
X-Google-Smtp-Source: AA0mqf4925bynbu7bQwEAzsEvXNRQ0Cb3V0LBPylVLH1aYXp79wuMyuGitSElq3L2XAUllYzk9tnag==
X-Received: by 2002:a05:600c:a52:b0:3d1:c8c8:fb5 with SMTP id
 c18-20020a05600c0a5200b003d1c8c80fb5mr5127833wmq.18.1670595175987; 
 Fri, 09 Dec 2022 06:12:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003cf483ee8e0sm9645128wmq.24.2022.12.09.06.12.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 06:12:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH-for-8.0] softmmu: Extract watchpoint API from physmem.c
Date: Fri,  9 Dec 2022 15:12:54 +0100
Message-Id: <20221209141254.68662-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The watchpoint API is specific to TCG system emulation.

Move it to a new compile unit. The inlined stubs are used
for user-mode and non-TCG accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS           |   1 +
 include/hw/core/cpu.h |   2 +-
 softmmu/meson.build   |   3 +-
 softmmu/physmem.c     | 191 ------------------------------------
 softmmu/watchpoint.c  | 220 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 224 insertions(+), 193 deletions(-)
 create mode 100644 softmmu/watchpoint.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..979c3e2c3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -120,6 +120,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: softmmu/cpus.c
+F: softmmu/watchpoint.c
 F: cpus-common.c
 F: page-vary.c
 F: page-vary-common.c
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8830546121..b490cc80d8 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -943,7 +943,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
     return false;
 }
 
-#ifdef CONFIG_USER_ONLY
+#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
 static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                                         int flags, CPUWatchpoint **watchpoint)
 {
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 3272af1f31..918166cdc0 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -8,7 +8,8 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
 )])
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
-  'icount.c'
+  'icount.c',
+  'watchpoint.c',
 )])
 
 softmmu_ss.add(files(
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 1b606a3002..1a9e4aa1cf 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -780,197 +780,6 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
     return cpu->cpu_ases[asidx].as;
 }
 
-/* Add a watchpoint.  */
-int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                          int flags, CPUWatchpoint **watchpoint)
-{
-    CPUWatchpoint *wp;
-    vaddr in_page;
-
-    /* forbid ranges which are empty or run off the end of the address space */
-    if (len == 0 || (addr + len - 1) < addr) {
-        error_report("tried to set invalid watchpoint at %"
-                     VADDR_PRIx ", len=%" VADDR_PRIu, addr, len);
-        return -EINVAL;
-    }
-    wp = g_malloc(sizeof(*wp));
-
-    wp->vaddr = addr;
-    wp->len = len;
-    wp->flags = flags;
-
-    /* keep all GDB-injected watchpoints in front */
-    if (flags & BP_GDB) {
-        QTAILQ_INSERT_HEAD(&cpu->watchpoints, wp, entry);
-    } else {
-        QTAILQ_INSERT_TAIL(&cpu->watchpoints, wp, entry);
-    }
-
-    in_page = -(addr | TARGET_PAGE_MASK);
-    if (len <= in_page) {
-        tlb_flush_page(cpu, addr);
-    } else {
-        tlb_flush(cpu);
-    }
-
-    if (watchpoint)
-        *watchpoint = wp;
-    return 0;
-}
-
-/* Remove a specific watchpoint.  */
-int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
-                          int flags)
-{
-    CPUWatchpoint *wp;
-
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (addr == wp->vaddr && len == wp->len
-                && flags == (wp->flags & ~BP_WATCHPOINT_HIT)) {
-            cpu_watchpoint_remove_by_ref(cpu, wp);
-            return 0;
-        }
-    }
-    return -ENOENT;
-}
-
-/* Remove a specific watchpoint by reference.  */
-void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
-{
-    QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, entry);
-
-    tlb_flush_page(cpu, watchpoint->vaddr);
-
-    g_free(watchpoint);
-}
-
-/* Remove all matching watchpoints.  */
-void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
-{
-    CPUWatchpoint *wp, *next;
-
-    QTAILQ_FOREACH_SAFE(wp, &cpu->watchpoints, entry, next) {
-        if (wp->flags & mask) {
-            cpu_watchpoint_remove_by_ref(cpu, wp);
-        }
-    }
-}
-
-#ifdef CONFIG_TCG
-/* Return true if this watchpoint address matches the specified
- * access (ie the address range covered by the watchpoint overlaps
- * partially or completely with the address range covered by the
- * access).
- */
-static inline bool watchpoint_address_matches(CPUWatchpoint *wp,
-                                              vaddr addr, vaddr len)
-{
-    /* We know the lengths are non-zero, but a little caution is
-     * required to avoid errors in the case where the range ends
-     * exactly at the top of the address space and so addr + len
-     * wraps round to zero.
-     */
-    vaddr wpend = wp->vaddr + wp->len - 1;
-    vaddr addrend = addr + len - 1;
-
-    return !(addr > wpend || wp->vaddr > addrend);
-}
-
-/* Return flags for watchpoints that match addr + prot.  */
-int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
-{
-    CPUWatchpoint *wp;
-    int ret = 0;
-
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (watchpoint_address_matches(wp, addr, len)) {
-            ret |= wp->flags;
-        }
-    }
-    return ret;
-}
-
-/* Generate a debug exception if a watchpoint has been hit.  */
-void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                          MemTxAttrs attrs, int flags, uintptr_t ra)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUWatchpoint *wp;
-
-    assert(tcg_enabled());
-    if (cpu->watchpoint_hit) {
-        /*
-         * We re-entered the check after replacing the TB.
-         * Now raise the debug interrupt so that it will
-         * trigger after the current instruction.
-         */
-        qemu_mutex_lock_iothread();
-        cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
-        qemu_mutex_unlock_iothread();
-        return;
-    }
-
-    if (cc->tcg_ops->adjust_watchpoint_address) {
-        /* this is currently used only by ARM BE32 */
-        addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
-    }
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (watchpoint_address_matches(wp, addr, len)
-            && (wp->flags & flags)) {
-            if (replay_running_debug()) {
-                /*
-                 * replay_breakpoint reads icount.
-                 * Force recompile to succeed, because icount may
-                 * be read only at the end of the block.
-                 */
-                if (!cpu->can_do_io) {
-                    /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ | curr_cflags(cpu);
-                    cpu_loop_exit_restore(cpu, ra);
-                }
-                /*
-                 * Don't process the watchpoints when we are
-                 * in a reverse debugging operation.
-                 */
-                replay_breakpoint();
-                return;
-            }
-            if (flags == BP_MEM_READ) {
-                wp->flags |= BP_WATCHPOINT_HIT_READ;
-            } else {
-                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
-            }
-            wp->hitaddr = MAX(addr, wp->vaddr);
-            wp->hitattrs = attrs;
-
-            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
-                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
-                wp->flags &= ~BP_WATCHPOINT_HIT;
-                continue;
-            }
-            cpu->watchpoint_hit = wp;
-
-            mmap_lock();
-            /* This call also restores vCPU state */
-            tb_check_watchpoint(cpu, ra);
-            if (wp->flags & BP_STOP_BEFORE_ACCESS) {
-                cpu->exception_index = EXCP_DEBUG;
-                mmap_unlock();
-                cpu_loop_exit(cpu);
-            } else {
-                /* Force execution of one insn next time.  */
-                cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ | curr_cflags(cpu);
-                mmap_unlock();
-                cpu_loop_exit_noexc(cpu);
-            }
-        } else {
-            wp->flags &= ~BP_WATCHPOINT_HIT;
-        }
-    }
-}
-
-#endif /* CONFIG_TCG */
-
 /* Called from RCU critical section */
 static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
 {
diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
new file mode 100644
index 0000000000..279129dd1c
--- /dev/null
+++ b/softmmu/watchpoint.c
@@ -0,0 +1,220 @@
+/*
+ * CPU watchpoints
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
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "exec/exec-all.h"
+#include "exec/translate-all.h"
+#include "sysemu/tcg.h"
+#include "sysemu/replay.h"
+#include "hw/core/tcg-cpu-ops.h"
+#include "hw/core/cpu.h"
+
+/* Add a watchpoint.  */
+int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
+                          int flags, CPUWatchpoint **watchpoint)
+{
+    CPUWatchpoint *wp;
+    vaddr in_page;
+
+    /* forbid ranges which are empty or run off the end of the address space */
+    if (len == 0 || (addr + len - 1) < addr) {
+        error_report("tried to set invalid watchpoint at %"
+                     VADDR_PRIx ", len=%" VADDR_PRIu, addr, len);
+        return -EINVAL;
+    }
+    wp = g_malloc(sizeof(*wp));
+
+    wp->vaddr = addr;
+    wp->len = len;
+    wp->flags = flags;
+
+    /* keep all GDB-injected watchpoints in front */
+    if (flags & BP_GDB) {
+        QTAILQ_INSERT_HEAD(&cpu->watchpoints, wp, entry);
+    } else {
+        QTAILQ_INSERT_TAIL(&cpu->watchpoints, wp, entry);
+    }
+
+    in_page = -(addr | TARGET_PAGE_MASK);
+    if (len <= in_page) {
+        tlb_flush_page(cpu, addr);
+    } else {
+        tlb_flush(cpu);
+    }
+
+    if (watchpoint) {
+        *watchpoint = wp;
+    }
+    return 0;
+}
+
+/* Remove a specific watchpoint.  */
+int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
+                          int flags)
+{
+    CPUWatchpoint *wp;
+
+    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+        if (addr == wp->vaddr && len == wp->len
+                && flags == (wp->flags & ~BP_WATCHPOINT_HIT)) {
+            cpu_watchpoint_remove_by_ref(cpu, wp);
+            return 0;
+        }
+    }
+    return -ENOENT;
+}
+
+/* Remove a specific watchpoint by reference.  */
+void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
+{
+    QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, entry);
+
+    tlb_flush_page(cpu, watchpoint->vaddr);
+
+    g_free(watchpoint);
+}
+
+/* Remove all matching watchpoints.  */
+void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
+{
+    CPUWatchpoint *wp, *next;
+
+    QTAILQ_FOREACH_SAFE(wp, &cpu->watchpoints, entry, next) {
+        if (wp->flags & mask) {
+            cpu_watchpoint_remove_by_ref(cpu, wp);
+        }
+    }
+}
+
+/*
+ * Return true if this watchpoint address matches the specified
+ * access (ie the address range covered by the watchpoint overlaps
+ * partially or completely with the address range covered by the
+ * access).
+ */
+static inline bool watchpoint_address_matches(CPUWatchpoint *wp,
+                                              vaddr addr, vaddr len)
+{
+    /*
+     * We know the lengths are non-zero, but a little caution is
+     * required to avoid errors in the case where the range ends
+     * exactly at the top of the address space and so addr + len
+     * wraps round to zero.
+     */
+    vaddr wpend = wp->vaddr + wp->len - 1;
+    vaddr addrend = addr + len - 1;
+
+    return !(addr > wpend || wp->vaddr > addrend);
+}
+
+/* Return flags for watchpoints that match addr + prot.  */
+int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
+{
+    CPUWatchpoint *wp;
+    int ret = 0;
+
+    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+        if (watchpoint_address_matches(wp, addr, len)) {
+            ret |= wp->flags;
+        }
+    }
+    return ret;
+}
+
+/* Generate a debug exception if a watchpoint has been hit.  */
+void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                          MemTxAttrs attrs, int flags, uintptr_t ra)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUWatchpoint *wp;
+
+    assert(tcg_enabled());
+    if (cpu->watchpoint_hit) {
+        /*
+         * We re-entered the check after replacing the TB.
+         * Now raise the debug interrupt so that it will
+         * trigger after the current instruction.
+         */
+        qemu_mutex_lock_iothread();
+        cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
+        qemu_mutex_unlock_iothread();
+        return;
+    }
+
+    if (cc->tcg_ops->adjust_watchpoint_address) {
+        /* this is currently used only by ARM BE32 */
+        addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
+    }
+    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+        if (watchpoint_address_matches(wp, addr, len)
+            && (wp->flags & flags)) {
+            if (replay_running_debug()) {
+                /*
+                 * replay_breakpoint reads icount.
+                 * Force recompile to succeed, because icount may
+                 * be read only at the end of the block.
+                 */
+                if (!cpu->can_do_io) {
+                    /* Force execution of one insn next time.  */
+                    cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ
+                                          | curr_cflags(cpu);
+                    cpu_loop_exit_restore(cpu, ra);
+                }
+                /*
+                 * Don't process the watchpoints when we are
+                 * in a reverse debugging operation.
+                 */
+                replay_breakpoint();
+                return;
+            }
+            if (flags == BP_MEM_READ) {
+                wp->flags |= BP_WATCHPOINT_HIT_READ;
+            } else {
+                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
+            }
+            wp->hitaddr = MAX(addr, wp->vaddr);
+            wp->hitattrs = attrs;
+
+            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
+                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
+                wp->flags &= ~BP_WATCHPOINT_HIT;
+                continue;
+            }
+            cpu->watchpoint_hit = wp;
+
+            mmap_lock();
+            /* This call also restores vCPU state */
+            tb_check_watchpoint(cpu, ra);
+            if (wp->flags & BP_STOP_BEFORE_ACCESS) {
+                cpu->exception_index = EXCP_DEBUG;
+                mmap_unlock();
+                cpu_loop_exit(cpu);
+            } else {
+                /* Force execution of one insn next time.  */
+                cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ
+                                      | curr_cflags(cpu);
+                mmap_unlock();
+                cpu_loop_exit_noexc(cpu);
+            }
+        } else {
+            wp->flags &= ~BP_WATCHPOINT_HIT;
+        }
+    }
+}
-- 
2.38.1


