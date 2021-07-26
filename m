Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151363D576C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:24:31 +0200 (CEST)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xmg-0001Q0-2T
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1m7xli-0000Vs-Oe
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:23:30 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1m7xlg-0001Z5-Vo
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:23:30 -0400
Received: by mail-lf1-x131.google.com with SMTP id y34so14510994lfa.8
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uyy6Z6S87xugJ6JK6wDx/845JW2zQjwvasx0+IEJWCI=;
 b=kN/+0tMGF5XCZsO4dsIodvNoZiawxSih+DL2wbqdBawImvNJSF2n1yDBFJqJnH77Gt
 yYIeamE+Vg8eUqc6FEVLWjBD0nllz0ARPT/ezIhcCvvqope22kRe0IBG9NI0LpuMdiTX
 Iy3Mh8LzSlG0w3sY5vElRZIJQ0NwWxi74lG2ATgopKgR3w+yn99HLeHixBVT9RhsmAKU
 wkS0Ye6LFx5tIsCI+98d8+uwpKg5ynscM2ZBGOIQrf7/dE+doHgWA6p6xTPcRBjOeVbW
 eg9wohiDKNjNCaU02zp2lDHFyDM8g95N/jY92t7OImiJoOeoUbTdLSO4RiYYBuAp1MEU
 tzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uyy6Z6S87xugJ6JK6wDx/845JW2zQjwvasx0+IEJWCI=;
 b=DOZyfzM3uvKERTtNt6pMqScv67pbGVqlqbA0XyzWJGZphGgkZAGVZrld39p9y+lFwx
 jz37GxlIRtkkh8cGg+ry4Wr77ouM1eiYMyCHbBNPaVR7/csxrZdMufCicV8BRGz/DWHD
 7RR7w3tZdwjYXuIbLN0FAkKUjRmB+5e3nE50x3oC/M8Oy05KKMwQYYPNcGmrYnPiCIXq
 aRL06y6WGc2dkltPlsEtZOTJDItIDpdfb4qQx2V521B/BSDUymFIP4F3XHL2WhChF0lI
 bETaNpvoBixFn06q6M5FZUrZF86jJfFBYRDSih/zWDH1Hm1UvQjc4ECnsOLh68i94E7H
 tejg==
X-Gm-Message-State: AOAM5324GvDugsv4+D76JWnperAqnKNnhjf8wqY7+J1N8KHg9vCHfVOD
 x6D1PP5x8Ud/tGVUEsVHQU3Cju0HV/nZ2MYR
X-Google-Smtp-Source: ABdhPJxQuPOv51hvleU55eBgs7zQS6VzegQ4Rc6tpJdjqY/qOFOaNNiyCJNq2pVEwnts6bolc2gSHA==
X-Received: by 2002:a19:711b:: with SMTP id m27mr12314992lfc.247.1627295006485; 
 Mon, 26 Jul 2021 03:23:26 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id i16sm483982lfl.107.2021.07.26.03.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 03:23:26 -0700 (PDT)
From: Arkadiy <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] mips/tlb_helper: Add support for 'info tlb' cmd
Date: Mon, 26 Jul 2021 13:23:20 +0300
Message-Id: <20210726102320.56522-1-arkaisp2021@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x131.google.com
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
v3: dump all cores, fixed output
---
 hmp-commands-info.hx     |  3 ++-
 target/mips/cpu.h        |  3 +++
 target/mips/meson.build  |  1 +
 target/mips/monitor.c    | 27 ++++++++++++++++++++++
 target/mips/tlb_helper.c | 50 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 83 insertions(+), 1 deletion(-)
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
index 0000000000..b7ca9b77e6
--- /dev/null
+++ b/target/mips/monitor.c
@@ -0,0 +1,27 @@
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
+#include "qapi/qmp/qdict.h"
+
+void hmp_info_tlb(Monitor *mon, const QDict *qdict)
+{
+    CPUState *cs;
+    CPU_FOREACH(cs) {
+        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
+        dump_mmu(cs->env_ptr);
+    }
+
+}
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 082c17928d..d2a56a7196 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -24,6 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
+#include "qemu/qemu-print.h"
 
 enum {
     TLBRET_XI = -6,
@@ -37,6 +38,55 @@ enum {
 
 #if !defined(CONFIG_USER_ONLY)
 
+static void r4k_mmu_dump(CPUMIPSState *env)
+{
+    int i;
+    qemu_printf("TLB count = %i\n", env->tlb->tlb_in_use);
+    for (i = 0; i < env->tlb->tlb_in_use; i++) {
+        r4k_tlb_t *tlb = &env->tlb->mmu.r4k.tlb[i];
+
+        bool mi = !!((env->CP0_Config5 >> CP0C5_MI) & 1);
+
+        qemu_printf("TLB[%i]:\nG = %i EHINV = %i\nPageMask = 0x%08x", i, tlb->G,
+                    tlb->EHINV, tlb->PageMask);
+        if (!tlb->EHINV) {
+            if (mi) {
+                qemu_printf(" MMID = %i", tlb->MMID);
+            } else if (!tlb->G) {
+                qemu_printf(" ASID = %i", tlb->ASID);
+            }
+            qemu_printf("\nVPN = 0x"TARGET_FMT_lx" PFN[0] = 0x%08lx RI0 = %i"
+                        " XI0 = %i C0 = %i D0 = %i V0 = %i\n"
+                        "VPN = 0x"TARGET_FMT_lx" PFN[1] = 0x%08lx RI1 = %i"
+                        " XI1 = %i C1 = %i D1 = %i V1 = %i\n", tlb->VPN,
+                        tlb->PFN[0], tlb->RI0, tlb->XI0, tlb->C0, tlb->D0,
+                        tlb->V0, tlb->VPN, tlb->PFN[1], tlb->RI1, tlb->XI1,
+                        tlb->C1, tlb->D1, tlb->V1);
+        }
+    }
+}
+
+void dump_mmu(CPUMIPSState *env)
+{
+    switch (env->cpu_model->mmu_type) {
+    case MMU_TYPE_NONE:
+        qemu_printf("No TLB (no MMU)\n");
+        break;
+    case MMU_TYPE_R4000:
+        r4k_mmu_dump(env);
+        break;
+    case MMU_TYPE_FMT:
+        qemu_printf("No TLB (fixed mapping MMU)\n");
+        break;
+    case MMU_TYPE_R3000:
+    case MMU_TYPE_R6000:
+    case MMU_TYPE_R8000:
+    default:
+        qemu_printf("MMU type not supported\n");
+        g_assert_not_reached();
+    }
+}
+
 /* no MMU emulation */
 int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, int rw, int access_type)
-- 
2.25.1


