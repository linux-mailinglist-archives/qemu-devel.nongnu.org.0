Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51D3D37A4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 11:24:02 +0200 (CEST)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6rPV-00039k-4w
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 05:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1m6rOP-0002Js-Gm
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:22:53 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1m6rON-00044q-Ox
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:22:53 -0400
Received: by mail-lf1-x12a.google.com with SMTP id r17so1054497lfe.2
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jz/u9tOOl2W1QF1nAisy1JhcAcBdW4I3ROAIqA0mVZU=;
 b=XVR9INil/xX+QyQhNCnAsiMW1Mc9eBDK3jVs0QtTwD/6HJYGh3F0ZNX9sNh3UbexUI
 kxPaG2MwYNwx80XsS9sFhOnLgnLsI3QW3RqI0/EZUFvaertJjPXKZgGW93lOT4BZmwmM
 qWkX22GAGxKYlRz5XYME/2dBc/W0AGYG1/eVeoSj8dP9Mck1sRWw4Autm4hUnuxSdOuI
 YLtfaYTpW3YjXVY4O9gCnSU1WJUawJhYJUhB7o7ETItRCGnCKTkQ8ytioStRZmonrk8v
 Ed9T5fT/bbshRaoN1nXgTqs6MnqTBYIpOQ52rbaihUHOcXdNAZA0BWqriopuqXPPXi5W
 SL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jz/u9tOOl2W1QF1nAisy1JhcAcBdW4I3ROAIqA0mVZU=;
 b=o3tGFwvfm8Xc98enrjAxUZoA88a4lNdBlYQeWZy9vVNmHrXcvtesVogLHfWGwax1Bm
 AjEUYCZ0+gbhUfl1QgUwoh8QY6qFILVCwQkn3U0JuuyL9rA4048KhjIzJGYlydlBHYwT
 1VTaQK7uSfhhPg2oKNGKYiTWo0ucpskQhVdOH/gb6kOKJaDCGm9rcRLM+TJ71lZ51n7C
 0lwgWHobmPHUp8RLPd7EVBRwdWDYrjRycZONJl/tUo1x1ESiAhjxuwyXW/NI7SYjD8v0
 dg8MVwOyfgsaSs3+y9Om704duT2F8a/pgvSDqRPKjGQQ1oGEP0Se9LaA46kdCUKMXoLK
 Mslw==
X-Gm-Message-State: AOAM530mJsKel7ZtvLsSTefRe1zEAWhw8o/fpATRvUCZ91vQXccDbDRn
 z9qTtwXrANE/gtqFfM7ovtJjH3vt40Z09VEr
X-Google-Smtp-Source: ABdhPJwi05V+L7KwB73pI09mIhaEnjnUll6xPHeo6Y6tkAmu+bdC08WR9r2d5jFzP5pCSGHGWJbluQ==
X-Received: by 2002:ac2:59db:: with SMTP id x27mr2409934lfn.547.1627032168893; 
 Fri, 23 Jul 2021 02:22:48 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id f8sm1539914lfe.141.2021.07.23.02.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 02:22:48 -0700 (PDT)
From: Arkadiy <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] mips/tlb_helper: Add support for 'info tlb' cmd
Date: Fri, 23 Jul 2021 12:22:42 +0300
Message-Id: <20210723092242.17024-1-arkaisp2021@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: aleksandar.rikalo@syrmia.com, f4bug@amsat.org, NDNF <arkaisp2021@gmail.com>,
 pavel.dovgaluk@ispras.ru, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: NDNF <arkaisp2021@gmail.com>

This adds hmp 'info tlb' command support for the mips platform.
1k pages are not supported.

Signed-off-by: Ivanov Arkady <arkaisp2021@gmail.com>
---
 hmp-commands-info.hx     |  3 ++-
 target/mips/cpu.h        |  3 +++
 target/mips/meson.build  |  1 +
 target/mips/monitor.c    | 26 ++++++++++++++++++++++
 target/mips/tlb_helper.c | 48 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 target/mips/monitor.c

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 117ba25f91..d6aab9839c 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -222,7 +222,8 @@ SRST
 ERST
 
 #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
-    defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
+    defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K) || \
+    defined(TARGET_MIPS) || defined(TARGET_MIPS64)
     {
         .name       = "tlb",
         .args_type  = "",
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index b9e227a30e..5aa6f2b760 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1337,6 +1337,9 @@ void itc_reconfigure(struct MIPSITUState *tag);
 /* helper.c */
 target_ulong exception_resume_pc(CPUMIPSState *env);
 
+/*tlb_helper.c*/
+void dump_mmu(CPUMIPSState *env);
+
 static inline void cpu_get_tb_cpu_state(CPUMIPSState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9741545440..c0b19048ee 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -31,6 +31,7 @@ mips_softmmu_ss.add(files(
   'cp0_timer.c',
   'machine.c',
   'mips-semi.c',
+  'monitor.c',
 ))
 mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cp0_helper.c',
diff --git a/target/mips/monitor.c b/target/mips/monitor.c
new file mode 100644
index 0000000000..9c9dfd2caa
--- /dev/null
+++ b/target/mips/monitor.c
@@ -0,0 +1,26 @@
+/*
+ * monitor.c
+ *
+ * Copyright (c) 2010-2021 Institute for System Programming
+ *                         of the Russian Academy of Sciences.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp-target.h"
+#include "monitor/hmp.h"
+
+void hmp_info_tlb(Monitor *mon, const QDict *qdict)
+{
+    CPUArchState *env = mon_get_cpu_env(mon);
+    if (!env) {
+        monitor_printf(mon, "No CPU available\n");
+        return;
+    }
+    dump_mmu(env);
+}
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 082c17928d..1c0c2831d6 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -24,6 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
+#include "qemu/qemu-print.h"
 
 enum {
     TLBRET_XI = -6,
@@ -37,6 +38,53 @@ enum {
 
 #if !defined(CONFIG_USER_ONLY)
 
+static void r4k_mmu_dump(CPUMIPSState *env)
+{
+    int i;
+    for (i = 0; i < env->tlb->tlb_in_use; i++) {
+        r4k_tlb_t *tlb = &env->tlb->mmu.r4k.tlb[i];
+
+        bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+
+        qemu_printf("TLB[%i]:\nG = %i EHINV = %i\nPageMask = %08x", i, tlb->G,
+                    tlb->EHINV, tlb->PageMask);
+        if (!tlb->EHINV) {
+            if (mi) {
+                qemu_printf(" MMID = %i", tlb->MMID);
+            } else if (!tlb->G) {
+                qemu_printf(" ASID = %i", tlb->ASID);
+            }
+            qemu_printf("\nVPN = "TARGET_FMT_lx" PFN[0] = %08lx RI0 = %i"
+                        " XI0 = %i C0 = %i D0 = %i V0 = %i\n"
+                        "VPN = "TARGET_FMT_lx" PFN[1] = %08lx RI1 = %i XI1 = %i"
+                        " C1 = %i D1 = %i V1 = %i\n", tlb->VPN, tlb->PFN[0],
+                        tlb->RI0, tlb->XI0, tlb->C0, tlb->D0, tlb->V0, tlb->VPN,
+                        tlb->PFN[1], tlb->RI1, tlb->XI1,
+                        tlb->C1, tlb->D1, tlb->V1);
+        }
+    }
+}
+
+void dump_mmu(CPUMIPSState *env)
+{
+    switch (env->cpu_model->mmu_type) {
+    case MMU_TYPE_NONE:
+        qemu_printf("no MMU emulation\n");
+        break;
+    case MMU_TYPE_R4000:
+        r4k_mmu_dump(env);
+        break;
+    case MMU_TYPE_FMT:
+        qemu_printf("fixed mapping MMU emulation\n");
+        break;
+    case MMU_TYPE_R3000:
+    case MMU_TYPE_R6000:
+    case MMU_TYPE_R8000:
+    default:
+        qemu_printf("MMU type not supported\n");
+    }
+}
+
 /* no MMU emulation */
 int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, int rw, int access_type)
-- 
2.25.1


