Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765F5A03F2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 00:29:01 +0200 (CEST)
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQyrr-0003Ty-J4
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 18:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQyh7-0008Pt-Lm
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 18:18:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQyh1-0006cp-QZ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 18:17:53 -0400
Received: by mail-pl1-x633.google.com with SMTP id u22so16878873plq.12
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 15:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OmG1KkQAuW3Sra8rU8ttCLZoW+g0VRmMlyVWawrmTAY=;
 b=aUceF0M0+u4zsPfO4b0/+Tt8Vw57D67K6GuCJVuA+djsOaohbfPNHnfRFiLvigplfh
 N0UFjkFoz3/3NjlEIHTAMiOK0CcfMd5ZAxV+mAb36+/PBfoK3ZnQeV+TjI/nie06wVdS
 cRj/1aStDV3lSdkl5Ei71JfxKGSHytBoegl2nWhs3YvHZdWvRTj3uMgBW8ZO2XtqlBLX
 W7CrTS0EtyTLQyblANEf3fpSFx7zXJ41efy1vhxlw4fDfIu6mDzzB9auTwOXRFaLu6QK
 IMKUCe9uv0BPQcQg8qE/wI1Q/4I/3QpO3du7ZoNVvDH8Q/2ac1jbh4J6cjzJRFvAGBAZ
 5FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OmG1KkQAuW3Sra8rU8ttCLZoW+g0VRmMlyVWawrmTAY=;
 b=LGUUTgRAMnOGKAo8K6kaQVqVsmNHWgIwLlGg1lnVvePVD8QinjxMD0jh+ibte1V+E7
 rtxL7AcyO/UwPKElPLKXCSYIp+PQsT3H0syx3KCzkVztw0Y3pS1KtRMrO8ufMYNf9WgZ
 aCUX2nhlM90Xwaro89FT4Z/pdfYvPYD4pTvJqtnBXAr07o3ny0BLntWqOfyXI6dY7Q/t
 9bO3Ppj+IeZU1JKUEGVuC8LjGzm2EF2kDmqsOR1G9MSIdkNi4pRIabR1wdpsF7ZSj27t
 pX7e9lkQE57dCEykLpfXy5b4gqR7XelWlrq8HLab/Wjkwst4FF7y/pdnC7n6XZ5u24rm
 KBdA==
X-Gm-Message-State: ACgBeo1LeBuJwlde3L4AeyjInQsQRMps9st4h8y416FuwGfL1+3mHI/a
 haCGLkVBNHVtocCDTxCvS5bxO7GRS6mvDw==
X-Google-Smtp-Source: AA6agR4HkhQjQVN18dG+Wzr68ro0m2Xr2dEa5uft5bjX43a4ONipXWJGeADAX9/tq/im02axIcct7g==
X-Received: by 2002:a17:903:2286:b0:172:f8e3:6f11 with SMTP id
 b6-20020a170903228600b00172f8e36f11mr817659plh.3.1661379466200; 
 Wed, 24 Aug 2022 15:17:46 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902f71200b0016909be39e5sm4243031plo.177.2022.08.24.15.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 15:17:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
Date: Wed, 24 Aug 2022 15:17:00 -0700
Message-Id: <20220824221701.41932-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824221701.41932-1-atishp@rivosinc.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Qemu virt machine can support few cache events and cycle/instret counters.
It also supports counter overflow for these events.

Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
capabilities. There are some dummy nodes added for testing as well.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c    | 16 +++++++++++++
 target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/pmu.h |  1 +
 3 files changed, 74 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ff8c0df5cd47..befa9d2c26ac 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -30,6 +30,7 @@
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
 #include "hw/core/sysbus-fdt.h"
+#include "target/riscv/pmu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -708,6 +709,20 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     aplic_phandles[socket] = aplic_s_phandle;
 }
 
+static void create_fdt_pmu(RISCVVirtState *s)
+{
+    char *pmu_name;
+    MachineState *mc = MACHINE(s);
+    RISCVCPU hart = s->soc[0].harts[0];
+
+    pmu_name = g_strdup_printf("/soc/pmu");
+    qemu_fdt_add_subnode(mc->fdt, pmu_name);
+    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pmu");
+    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
+
+    g_free(pmu_name);
+}
+
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
@@ -1036,6 +1051,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
 
     create_fdt_flash(s, memmap);
     create_fdt_fw_cfg(s, memmap);
+    create_fdt_pmu(s);
 
 update_bootargs:
     if (cmdline && *cmdline) {
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index a5f504e53c88..b8e56d2b7b8e 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -20,11 +20,68 @@
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/device_tree.h"
 
 #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
 #define MAKE_32BIT_MASK(shift, length) \
         (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
 
+/*
+ * To keep it simple, any event can be mapped to any programmable counters in
+ * QEMU. The generic cycle & instruction count events can also be monitored
+ * using programmable counters. In that case, mcycle & minstret must continue
+ * to provide the correct value as well. Heterogeneous PMU per hart is not
+ * supported yet. Thus, number of counters are same across all harts.
+ */
+void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
+{
+    uint32_t fdt_event_ctr_map[20] = {};
+    uint32_t cmask;
+
+    /* All the programmable counters can map to any event */
+    cmask = MAKE_32BIT_MASK(3, num_ctrs);
+
+   /*
+    * The event encoding is specified in the SBI specification
+    * Event idx is a 20bits wide number encoded as follows:
+    * event_idx[19:16] = type
+    * event_idx[15:0] = code
+    * The code field in cache events are encoded as follows:
+    * event_idx.code[15:3] = cache_id
+    * event_idx.code[2:1] = op_id
+    * event_idx.code[0:0] = result_id
+    */
+
+   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
+   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
+   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
+
+   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
+   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
+   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
+
+   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
+   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
+
+   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
+   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
+
+   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
+   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
+   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
+
+   /* This a OpenSBI specific DT property documented in OpenSBI docs */
+   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
+                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
+}
+
 static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
 {
     if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 036653627f78..3004ce37b636 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -31,5 +31,6 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx);
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
+void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_name);
 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
-- 
2.25.1


