Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C313542D9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:34:17 +0200 (CEST)
Received: from localhost ([::1]:57910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQIw-0002QX-Ep
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQGw-0000vB-Pe
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:10 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQGt-0001an-0E
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:10 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so7658456wmy.5
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DHtett1IUz2n3CMLudKiRCBR4Zj5cAfdPg9932iFNmU=;
 b=Wyz/RAbNOvQfQqtLStNPMf9mR5ED1oqzhA28pR9eplmKz1k6bLTkR5Jqvwax6eETIE
 1+Z0lEZNLPI48KJz+in9Df2k7HtplAHrvx1EZMDpplP1wARDqc4sgRlKE+UvSn8f17CW
 bbP8MomOCEDaynJVNiKXU4FIyu6zyxfc67tylq74U0eq3Qd9V3u39kpFB425J2RsV7rP
 5e2lGOLjNohGXJh7ybz2LgH+Km9n5C0EFm1v08Q0J9W6khw8O91UhgvHoP3lEfZejRNF
 id2twUZBClmIYZ/zVSkOoXc1xbAAaraFhCMdnuzZ31lAl3vfuYpNxk43b51M1FxLULHB
 /auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DHtett1IUz2n3CMLudKiRCBR4Zj5cAfdPg9932iFNmU=;
 b=fouUydiLteZ23kYo0Qbos9cTnQ7JJzYtgypnEaDPr+64BkSOnaCS/4R+l8ceB0Y0KM
 kqfBEUiMNgA1I5dFpvvHbdJyyvptaRdARlmIOSXnsRLv4kYHVOe9SPV2M4Bdemu29GP6
 6TA+UaCixjDKUL+PJofC646Nd7X6ONNgtr4V/CV6LcdO0Sxpzfdqo2cIXQvT8LJ3ezyR
 HtpF4TnbG9raVGDoKHSmUc8ZmF2PaThOivdqvsUroR/DlFhWj8C+qBQmH0YHOAMUPwKs
 QnzQtHxjQdFO8bU5yLhvs6BYmWucjG2H7Ab/YTl/O3GVlRwgNHz97JbkqVV8RWnftXAA
 n6LA==
X-Gm-Message-State: AOAM531AV/JH1V4s/2Y2Q5SRvqtkMPtXKf/6MBPf/CaVsOriWZpMEoT2
 K/gPwVcDDG+7ILmnCOyiW8DQ0joEfnXLSg==
X-Google-Smtp-Source: ABdhPJyIAWXJ4Fg7LBks2B3O4kXC5jIH46MfpvfkkkFJdNJO+tn+CNIN4ZIOq3prZ4lNHI4Cyi1sow==
X-Received: by 2002:a05:600c:3515:: with SMTP id
 h21mr25478241wmq.35.1617633125525; 
 Mon, 05 Apr 2021 07:32:05 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:05 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 01/27] arc: Add initial core cpu files
Date: Mon,  5 Apr 2021 15:31:12 +0100
Message-Id: <20210405143138.17016-2-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 target/arc/arc-common.h |  54 +++++
 target/arc/cpu-param.h  |  32 +++
 target/arc/cpu-qom.h    |  52 +++++
 target/arc/cpu.c        | 472 ++++++++++++++++++++++++++++++++++++++++
 target/arc/cpu.h        | 445 +++++++++++++++++++++++++++++++++++++
 target/arc/meson.build  |  21 ++
 6 files changed, 1076 insertions(+)
 create mode 100644 target/arc/arc-common.h
 create mode 100644 target/arc/cpu-param.h
 create mode 100644 target/arc/cpu-qom.h
 create mode 100644 target/arc/cpu.c
 create mode 100644 target/arc/cpu.h
 create mode 100644 target/arc/meson.build

diff --git a/target/arc/arc-common.h b/target/arc/arc-common.h
new file mode 100644
index 0000000000..ff9f97d457
--- /dev/null
+++ b/target/arc/arc-common.h
@@ -0,0 +1,54 @@
+/*
+ *  Common header file to be used by cpu and disassembler.
+ *  Copyright (C) 2017 Free Software Foundation, Inc.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with GAS or GDB; see the file COPYING3. If not, write to
+ *  the Free Software Foundation, 51 Franklin Street - Fifth Floor, Boston,
+ *  MA 02110-1301, USA.
+ */
+
+#ifndef ARC_COMMON_H
+#define ARC_COMMON_H
+
+
+/* CPU combi. */
+#define ARC_OPCODE_ARCALL  (ARC_OPCODE_ARC600 | ARC_OPCODE_ARC700       \
+                            | ARC_OPCODE_ARCv2EM | ARC_OPCODE_ARCv2HS)
+#define ARC_OPCODE_ARCFPX  (ARC_OPCODE_ARC700 | ARC_OPCODE_ARCv2EM)
+#define ARC_OPCODE_ARCV1   (ARC_OPCODE_ARC700 | ARC_OPCODE_ARC600)
+#define ARC_OPCODE_ARCV2   (ARC_OPCODE_ARCv2EM | ARC_OPCODE_ARCv2HS)
+#define ARC_OPCODE_ARCMPY6E  (ARC_OPCODE_ARC700 | ARC_OPCODE_ARCV2)
+
+
+enum arc_cpu_family {
+    ARC_OPCODE_NONE    = 0,
+    ARC_OPCODE_DEFAULT = 1 << 0,
+    ARC_OPCODE_ARC600  = 1 << 1,
+    ARC_OPCODE_ARC700  = 1 << 2,
+    ARC_OPCODE_ARCv2EM = 1 << 3,
+    ARC_OPCODE_ARCv2HS = 1 << 4
+};
+
+typedef struct {
+    uint32_t value;
+    uint32_t type;
+} operand_t;
+
+typedef struct {
+    uint32_t class;
+    uint32_t limm;
+    uint8_t len;
+    bool limm_p;
+    operand_t operands[3];
+    uint8_t n_ops;
+    uint8_t cc;
+    uint8_t aa;
+    uint8_t zz;
+    bool d;
+    bool f;
+    bool di;
+    bool x;
+} insn_t;
+
+#endif
diff --git a/target/arc/cpu-param.h b/target/arc/cpu-param.h
new file mode 100644
index 0000000000..512f4c8b75
--- /dev/null
+++ b/target/arc/cpu-param.h
@@ -0,0 +1,32 @@
+/*
+ * ARC cpu parameters for qemu.
+ *
+ * Copyright (c) 2020 Synopsys Inc.
+ * Contributed by Shahab Vahedi <shahab@synopsys.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef ARC_CPU_PARAM_H
+#define ARC_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS            32
+#define TARGET_PAGE_BITS            13
+#define TARGET_PHYS_ADDR_SPACE_BITS 32
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+#define NB_MMU_MODES                2
+
+#endif
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/target/arc/cpu-qom.h b/target/arc/cpu-qom.h
new file mode 100644
index 0000000000..ee60db158d
--- /dev/null
+++ b/target/arc/cpu-qom.h
@@ -0,0 +1,52 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synopsys Inc.
+ * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_ARC_CPU_QOM_H
+#define QEMU_ARC_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+
+#define TYPE_ARC_CPU            "arc-cpu"
+
+#define ARC_CPU_CLASS(klass)                                    \
+    OBJECT_CLASS_CHECK(ARCCPUClass, (klass), TYPE_ARC_CPU)
+#define ARC_CPU(obj)                            \
+    OBJECT_CHECK(ARCCPU, (obj), TYPE_ARC_CPU)
+#define ARC_CPU_GET_CLASS(obj)                          \
+    OBJECT_GET_CLASS(ARCCPUClass, (obj), TYPE_ARC_CPU)
+
+/*
+ *  ARCCPUClass:
+ *  @parent_realize: The parent class' realize handler.
+ *  @parent_reset: The parent class' reset handler.
+ *
+ *  A ARC CPU model.
+ */
+typedef struct ARCCPUClass {
+    /*< private >*/
+    CPUClass parent_class;
+    /*< public >*/
+
+    DeviceRealize parent_realize;
+    DeviceReset parent_reset;
+} ARCCPUClass;
+
+typedef struct ARCCPU ARCCPU;
+
+#endif
diff --git a/target/arc/cpu.c b/target/arc/cpu.c
new file mode 100644
index 0000000000..f1a5b2a7c1
--- /dev/null
+++ b/target/arc/cpu.c
@@ -0,0 +1,472 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synopsys Inc.
+ * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "migration/vmstate.h"
+#include "exec/log.h"
+#include "mmu.h"
+#include "mpu.h"
+#include "hw/qdev-properties.h"
+#include "irq.h"
+#include "hw/arc/cpudevs.h"
+#include "timer.h"
+#include "gdbstub.h"
+
+static const VMStateDescription vms_arc_cpu = {
+    .name               = "cpu",
+    .version_id         = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+      VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property arc_cpu_properties[] = {
+    DEFINE_PROP_UINT32("address-size", ARCCPU, cfg.addr_size, 32),
+    DEFINE_PROP_BOOL("aps", ARCCPU, cfg.aps_feature, false),
+    DEFINE_PROP_BOOL("byte-order", ARCCPU, cfg.byte_order, false),
+    DEFINE_PROP_BOOL("bitscan", ARCCPU, cfg.bitscan_option, true),
+    DEFINE_PROP_UINT32("br_bc-entries", ARCCPU, cfg.br_bc_entries, -1),
+    DEFINE_PROP_UINT32("br_pt-entries", ARCCPU, cfg.br_pt_entries, -1),
+    DEFINE_PROP_BOOL("full-tag", ARCCPU, cfg.br_bc_full_tag, false),
+    DEFINE_PROP_UINT8("rs-entries", ARCCPU, cfg.br_rs_entries, -1),
+    DEFINE_PROP_UINT32("tag-size", ARCCPU, cfg.br_bc_tag_size, -1),
+    DEFINE_PROP_UINT8("tosq-entries", ARCCPU, cfg.br_tosq_entries, -1),
+    DEFINE_PROP_UINT8("fb-entries", ARCCPU, cfg.br_fb_entries, -1),
+    DEFINE_PROP_BOOL("code-density", ARCCPU, cfg.code_density, true),
+    DEFINE_PROP_BOOL("code-protect", ARCCPU, cfg.code_protect, false),
+    DEFINE_PROP_UINT8("dcc-memcyc", ARCCPU, cfg.dccm_mem_cycles, -1),
+    DEFINE_PROP_BOOL("ddcm-posedge", ARCCPU, cfg.dccm_posedge, false),
+    DEFINE_PROP_UINT8("dcc-mem-banks", ARCCPU, cfg.dccm_mem_bancks, -1),
+    DEFINE_PROP_UINT8("mem-cycles", ARCCPU, cfg.dc_mem_cycles, -1),
+    DEFINE_PROP_BOOL("dc-posedge", ARCCPU, cfg.dc_posedge, false),
+    DEFINE_PROP_BOOL("unaligned", ARCCPU, cfg.dmp_unaligned, true),
+    DEFINE_PROP_BOOL("ecc-excp", ARCCPU, cfg.ecc_exception, false),
+    DEFINE_PROP_UINT32("ext-irq", ARCCPU, cfg.external_interrupts, 128),
+    DEFINE_PROP_UINT8("ecc-option", ARCCPU, cfg.ecc_option, -1),
+    DEFINE_PROP_BOOL("firq", ARCCPU, cfg.firq_option, true),
+    DEFINE_PROP_BOOL("fpu-dp", ARCCPU, cfg.fpu_dp_option, false),
+    DEFINE_PROP_BOOL("fpu-fma", ARCCPU, cfg.fpu_fma_option, false),
+    DEFINE_PROP_BOOL("fpu-div", ARCCPU, cfg.fpu_div_option, false),
+    DEFINE_PROP_BOOL("actionpoints", ARCCPU, cfg.has_actionpoints, false),
+    DEFINE_PROP_BOOL("fpu", ARCCPU, cfg.has_fpu, false),
+    DEFINE_PROP_BOOL("has-irq", ARCCPU, cfg.has_interrupts, true),
+    DEFINE_PROP_BOOL("has-mmu", ARCCPU, cfg.has_mmu, true),
+    DEFINE_PROP_BOOL("has-mpu", ARCCPU, cfg.has_mpu, true),
+    DEFINE_PROP_BOOL("timer0", ARCCPU, cfg.has_timer_0, true),
+    DEFINE_PROP_BOOL("timer1", ARCCPU, cfg.has_timer_1, true),
+    DEFINE_PROP_BOOL("has-pct", ARCCPU, cfg.has_pct, false),
+    DEFINE_PROP_BOOL("has-rtt", ARCCPU, cfg.has_rtt, false),
+    DEFINE_PROP_BOOL("has-smart", ARCCPU, cfg.has_smart, false),
+    DEFINE_PROP_UINT32("intv-base", ARCCPU, cfg.intvbase_preset, 0x0),
+    DEFINE_PROP_UINT32("lpc-size", ARCCPU, cfg.lpc_size, 32),
+    DEFINE_PROP_UINT8("mpu-numreg", ARCCPU, cfg.mpu_num_regions, 0),
+    DEFINE_PROP_UINT8("mpy-option", ARCCPU, cfg.mpy_option, 2),
+    DEFINE_PROP_UINT32("mmu-pagesize0", ARCCPU, cfg.mmu_page_size_sel0, -1),
+    DEFINE_PROP_UINT32("mmu-pagesize1", ARCCPU, cfg.mmu_page_size_sel1, -1),
+    DEFINE_PROP_UINT32("mmu-pae", ARCCPU, cfg.mmu_pae_enabled, -1),
+    DEFINE_PROP_UINT32("ntlb-numentries", ARCCPU, cfg.ntlb_num_entries, -1),
+    DEFINE_PROP_UINT32("num-actionpoints", ARCCPU, cfg.num_actionpoints, -1),
+    DEFINE_PROP_UINT32("num-irq", ARCCPU, cfg.number_of_interrupts, 240),
+    DEFINE_PROP_UINT32("num-irqlevels", ARCCPU, cfg.number_of_levels, 15),
+    DEFINE_PROP_UINT32("pct-counters", ARCCPU, cfg.pct_counters, -1),
+    DEFINE_PROP_UINT32("pct-irq", ARCCPU, cfg.pct_interrupt, -1),
+    DEFINE_PROP_UINT32("pc-size", ARCCPU, cfg.pc_size, 32),
+    DEFINE_PROP_UINT32("num-regs", ARCCPU, cfg.rgf_num_regs, 32),
+    DEFINE_PROP_UINT32("banked-regs", ARCCPU, cfg.rgf_banked_regs, -1),
+    DEFINE_PROP_UINT32("num-banks", ARCCPU, cfg.rgf_num_banks, 0),
+    DEFINE_PROP_BOOL("rtc-opt", ARCCPU, cfg.rtc_option, false),
+    DEFINE_PROP_UINT32("rtt-featurelevel", ARCCPU, cfg.rtt_feature_level, -1),
+    DEFINE_PROP_BOOL("stack-check", ARCCPU, cfg.stack_checking, false),
+    DEFINE_PROP_BOOL("swap-option", ARCCPU, cfg.swap_option, true),
+    DEFINE_PROP_UINT32("smrt-stackentries", ARCCPU, cfg.smar_stack_entries, -1),
+    DEFINE_PROP_UINT32("smrt-impl", ARCCPU, cfg.smart_implementation, -1),
+    DEFINE_PROP_UINT32("stlb", ARCCPU, cfg.stlb_num_entries, -1),
+    DEFINE_PROP_UINT32("slc-size", ARCCPU, cfg.slc_size, -1),
+    DEFINE_PROP_UINT32("slc-linesize", ARCCPU, cfg.slc_line_size, -1),
+    DEFINE_PROP_UINT32("slc-ways", ARCCPU, cfg.slc_ways, -1),
+    DEFINE_PROP_UINT32("slc-tagbanks", ARCCPU, cfg.slc_tag_banks, -1),
+    DEFINE_PROP_UINT32("slc-tram", ARCCPU, cfg.slc_tram_delay, -1),
+    DEFINE_PROP_UINT32("slc-dbank", ARCCPU, cfg.slc_dbank_width, -1),
+    DEFINE_PROP_UINT32("slc-data", ARCCPU, cfg.slc_data_banks, -1),
+    DEFINE_PROP_UINT32("slc-delay", ARCCPU, cfg.slc_dram_delay, -1),
+    DEFINE_PROP_BOOL("slc-memwidth", ARCCPU, cfg.slc_mem_bus_width, false),
+    DEFINE_PROP_UINT32("slc-ecc", ARCCPU, cfg.slc_ecc_option, -1),
+    DEFINE_PROP_BOOL("slc-datahalf", ARCCPU, cfg.slc_data_halfcycle_steal, false),
+    DEFINE_PROP_BOOL("slc-dataadd", ARCCPU, cfg.slc_data_add_pre_pipeline, false),
+    DEFINE_PROP_BOOL("uaux", ARCCPU, cfg.uaux_option, false),
+    DEFINE_PROP_UINT32("freq_hz", ARCCPU, cfg.freq_hz, 4600000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void arc_cpu_set_pc(CPUState *cs, vaddr value)
+{
+    ARCCPU *cpu = ARC_CPU(cs);
+
+    CPU_PCL(&cpu->env) = value & (~((target_ulong) 3));
+    cpu->env.pc = value;
+}
+
+static bool arc_cpu_has_work(CPUState *cs)
+{
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+}
+
+static void arc_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
+{
+    ARCCPU      *cpu = ARC_CPU(cs);
+    CPUARCState *env = &cpu->env;
+
+    CPU_PCL(&cpu->env) = tb->pc & (~((target_ulong) 3));
+    env->pc = tb->pc;
+}
+
+static void arc_cpu_reset(DeviceState *dev)
+{
+    CPUState *s = CPU(dev);
+    ARCCPU *cpu = ARC_CPU(s);
+    ARCCPUClass *arcc = ARC_CPU_GET_CLASS(cpu);
+    CPUARCState *env = &cpu->env;
+
+    if (qemu_loglevel_mask(CPU_LOG_RESET)) {
+        qemu_log("CPU Reset (CPU)\n");
+        log_cpu_state(s, 0);
+    }
+
+    /* Initialize mmu/reset it. */
+    arc_mmu_init(env);
+
+    arc_mpu_init(cpu);
+
+    arc_resetTIMER(cpu);
+    arc_resetIRQ(cpu);
+
+    arcc->parent_reset(dev);
+
+    memset(env->r, 0, sizeof(env->r));
+    env->lock_lf_var = 0;
+
+    env->stat.is_delay_slot_instruction = 0;
+    /*
+     * kernel expects MPY support to check for presence of
+     * extension core regs r58/r59.
+     *
+     * VERSION32x32=0x06: ARCv2 32x32 Multiply
+     * DSP=0x1: MPY_OPTION 7
+     */
+    cpu->mpy_build = 0x00001006;
+}
+
+static void arc_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
+{
+    ARCCPU *cpu = ARC_CPU(cs);
+
+    switch (cpu->family) {
+    case ARC_OPCODE_ARC700:
+        info->mach = bfd_mach_arc_arc700;
+        break;
+    case ARC_OPCODE_ARC600:
+        info->mach = bfd_mach_arc_arc600;
+        break;
+    case ARC_OPCODE_ARCv2EM:
+        info->mach = bfd_mach_arc_arcv2em;
+        break;
+    case ARC_OPCODE_ARCv2HS:
+        info->mach = bfd_mach_arc_arcv2hs;
+        break;
+    default:
+        info->mach = bfd_mach_arc_arcv2;
+        break;
+    }
+
+    info->print_insn = print_insn_arc;
+    info->endian = BFD_ENDIAN_LITTLE;
+}
+
+
+static void arc_cpu_realizefn(DeviceState *dev, Error **errp)
+{
+    CPUState *cs = CPU(dev);
+    ARCCPU *cpu = ARC_CPU(dev);
+    ARCCPUClass *arcc = ARC_CPU_GET_CLASS(dev);
+    Error *local_err = NULL;
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    arc_cpu_register_gdb_regs_for_features(cpu);
+
+    qemu_init_vcpu(cs);
+
+    /*
+     * Initialize build registers depending on the simulation
+     * parameters.
+     */
+    cpu->freq_hz = cpu->cfg.freq_hz;
+
+    cpu->isa_config = 0x02;
+    switch (cpu->cfg.pc_size) {
+    case 16:
+        break;
+    case 20:
+        cpu->isa_config |= 1 << 8;
+        break;
+    case 24:
+        cpu->isa_config |= 2 << 8;
+        break;
+    case 28:
+        cpu->isa_config |= 3 << 8;
+        break;
+    default:
+        cpu->isa_config |= 4 << 8;
+        break;
+    }
+
+    switch (cpu->cfg.lpc_size) {
+    case 0:
+        break;
+    case 8:
+        cpu->isa_config |= 1 << 12;
+        break;
+    case 12:
+        cpu->isa_config |= 2 << 12;
+        break;
+    case 16:
+        cpu->isa_config |= 3 << 12;
+        break;
+    case 20:
+        cpu->isa_config |= 4 << 12;
+        break;
+    case 24:
+        cpu->isa_config |= 5 << 12;
+        break;
+    case 28:
+        cpu->isa_config |= 6 << 12;
+        break;
+    default:
+        cpu->isa_config |= 7 << 12;
+        break;
+    }
+
+    switch (cpu->cfg.addr_size) {
+    case 16:
+        break;
+    case 20:
+        cpu->isa_config |= 1 << 16;
+        break;
+    case 24:
+        cpu->isa_config |= 2 << 16;
+        break;
+    case 28:
+        cpu->isa_config |= 3 << 16;
+        break;
+    default:
+        cpu->isa_config |= 4 << 16;
+        break;
+    }
+
+    cpu->isa_config |= (cpu->cfg.byte_order ? BIT(20) : 0) | BIT(21)
+      | (cpu->cfg.dmp_unaligned ? BIT(22) : 0) | BIT(23)
+      | (cpu->cfg.code_density ? (2 << 24) : 0) | BIT(28);
+
+    arc_initializeTIMER(cpu);
+    arc_initializeIRQ(cpu);
+
+    cpu_reset(cs);
+
+    arcc->parent_realize(dev, errp);
+}
+
+static void arc_cpu_initfn(Object *obj)
+{
+    ARCCPU *cpu = ARC_CPU(obj);
+
+    /* Initialize aux-regs. */
+    arc_aux_regs_init();
+
+    cpu_set_cpustate_pointers(cpu);
+}
+
+static ObjectClass *arc_cpu_class_by_name(const char *cpu_model)
+{
+    ObjectClass *oc;
+    char *typename;
+    char **cpuname;
+
+    if (!cpu_model) {
+        return NULL;
+    }
+
+    cpuname = g_strsplit(cpu_model, ",", 1);
+    typename = g_strdup_printf("%s-" TYPE_ARC_CPU, cpuname[0]);
+    oc = object_class_by_name(typename);
+
+    g_strfreev(cpuname);
+    g_free(typename);
+
+    if (!oc
+        || !object_class_dynamic_cast(oc, TYPE_ARC_CPU)
+        || object_class_is_abstract(oc)) {
+        return NULL;
+    }
+
+    return oc;
+}
+
+static gchar *arc_gdb_arch_name(CPUState *cs)
+{
+    return g_strdup(GDB_TARGET_STRING);
+}
+
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps arc_tcg_ops = {
+    .initialize = arc_translate_init,
+    .synchronize_from_tb = arc_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = arc_cpu_exec_interrupt,
+    .tlb_fill = arc_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+    .do_interrupt = arc_cpu_do_interrupt,
+#endif /* !CONFIG_USER_ONLY */
+};
+
+static void arc_cpu_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUClass *cc = CPU_CLASS(oc);
+    ARCCPUClass *arcc = ARC_CPU_CLASS(oc);
+
+    device_class_set_parent_realize(dc, arc_cpu_realizefn,
+                                    &arcc->parent_realize);
+
+    device_class_set_parent_reset(dc, arc_cpu_reset, &arcc->parent_reset);
+
+    cc->class_by_name = arc_cpu_class_by_name;
+
+    cc->has_work = arc_cpu_has_work;
+    cc->dump_state = arc_cpu_dump_state;
+    cc->set_pc = arc_cpu_set_pc;
+#ifndef CONFIG_USER_ONLY
+    cc->memory_rw_debug = arc_cpu_memory_rw_debug;
+    cc->get_phys_page_debug = arc_cpu_get_phys_page_debug;
+    cc->vmsd = &vms_arc_cpu;
+#endif
+    cc->disas_set_info = arc_cpu_disas_set_info;
+    cc->gdb_read_register = arc_cpu_gdb_read_register;
+    cc->gdb_write_register = arc_cpu_gdb_write_register;
+
+    /* Core GDB support */
+    cc->gdb_core_xml_file = "arc-v2-core.xml";
+    cc->gdb_num_core_regs = GDB_REG_LAST;
+    cc->gdb_arch_name = arc_gdb_arch_name;
+
+    cc->tcg_ops = &arc_tcg_ops;
+
+    device_class_set_props(dc, arc_cpu_properties);
+}
+
+static void arc_any_initfn(Object *obj)
+{
+    /* Set cpu feature flags */
+    ARCCPU *cpu = ARC_CPU(obj);
+    cpu->family = ARC_OPCODE_ARC700;
+}
+
+static void arc600_initfn(Object *obj)
+{
+    ARCCPU *cpu = ARC_CPU(obj);
+    cpu->family = ARC_OPCODE_ARC600;
+}
+
+static void arc700_initfn(Object *obj)
+{
+    ARCCPU *cpu = ARC_CPU(obj);
+    cpu->family = ARC_OPCODE_ARC700;
+}
+
+static void arcem_initfn(Object *obj)
+{
+    ARCCPU *cpu = ARC_CPU(obj);
+    cpu->family = ARC_OPCODE_ARCv2EM;
+}
+
+static void archs_initfn(Object *obj)
+{
+    ARCCPU *cpu = ARC_CPU(obj);
+    cpu->family = ARC_OPCODE_ARCv2HS;
+}
+
+typedef struct ARCCPUInfo {
+    const char     *name;
+    void (*initfn)(Object *obj);
+} ARCCPUInfo;
+
+static const ARCCPUInfo arc_cpus[] = {
+    { .name = "arc600", .initfn = arc600_initfn },
+    { .name = "arc700", .initfn = arc700_initfn },
+    { .name = "arcem", .initfn = arcem_initfn },
+    { .name = "archs", .initfn = archs_initfn },
+    { .name = "any", .initfn = arc_any_initfn },
+};
+
+static void cpu_register(const ARCCPUInfo *info)
+{
+    TypeInfo type_info = {
+        .parent = TYPE_ARC_CPU,
+        .instance_size = sizeof(ARCCPU),
+        .instance_init = info->initfn,
+        .class_size = sizeof(ARCCPUClass),
+    };
+
+    type_info.name = g_strdup_printf("%s-" TYPE_ARC_CPU, info->name);
+    type_register(&type_info);
+    g_free((void *)type_info.name);
+}
+
+static const TypeInfo arc_cpu_type_info = {
+    .name = TYPE_ARC_CPU,
+    .parent = TYPE_CPU,
+    .instance_size = sizeof(ARCCPU),
+    .instance_init = arc_cpu_initfn,
+    .class_size = sizeof(ARCCPUClass),
+    .class_init = arc_cpu_class_init,
+    .abstract = true,
+};
+
+static void arc_cpu_register_types(void)
+{
+    int i;
+    type_register_static(&arc_cpu_type_info);
+
+    for (i = 0; i < ARRAY_SIZE(arc_cpus); i++) {
+        cpu_register(&arc_cpus[i]);
+    }
+}
+
+type_init(arc_cpu_register_types)
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/target/arc/cpu.h b/target/arc/cpu.h
new file mode 100644
index 0000000000..37d2a3582f
--- /dev/null
+++ b/target/arc/cpu.h
@@ -0,0 +1,445 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synopsys Inc.
+ * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef CPU_ARC_H
+#define CPU_ARC_H
+
+#include "exec/cpu-defs.h"
+#include "fpu/softfloat.h"
+
+#include "target/arc/arc-common.h"
+#include "target/arc/mmu.h"
+#include "target/arc/mpu.h"
+#include "target/arc/cache.h"
+
+#define ARC_CPU_TYPE_SUFFIX "-" TYPE_ARC_CPU
+#define ARC_CPU_TYPE_NAME(model) model ARC_CPU_TYPE_SUFFIX
+#define CPU_RESOLVING_TYPE TYPE_ARC_CPU
+
+enum arc_features {
+    ARC_FEATURE_ARC5,
+    ARC_FEATURE_ARC600,
+    ARC_FEATURE_ARC700,
+    no_features,
+};
+
+enum arc_endianess {
+    ARC_ENDIANNESS_LE = 0,
+    ARC_ENDIANNESS_BE,
+};
+
+/* U-Boot - kernel ABI */
+#define ARC_UBOOT_CMDLINE 1
+#define ARC_UBOOT_DTB     2
+
+
+#define CPU_GP(env)     ((env)->r[26])
+#define CPU_FP(env)     ((env)->r[27])
+#define CPU_SP(env)     ((env)->r[28])
+#define CPU_ILINK(env)  ((env)->r[29])
+#define CPU_ILINK1(env) ((env)->r[29])
+#define CPU_ILINK2(env) ((env)->r[30])
+#define CPU_BLINK(env)  ((env)->r[31])
+#define CPU_LP(env)     ((env)->r[60])
+#define CPU_IMM(env)    ((env)->r[62])
+#define CPU_PCL(env)    ((env)->r[63])
+
+enum exception_code_list {
+    EXCP_NO_EXCEPTION = -1,
+    EXCP_RESET = 0,
+    EXCP_MEMORY_ERROR,
+    EXCP_INST_ERROR,
+    EXCP_MACHINE_CHECK,
+    EXCP_TLB_MISS_I,
+    EXCP_TLB_MISS_D,
+    EXCP_PROTV,
+    EXCP_PRIVILEGEV,
+    EXCP_SWI,
+    EXCP_TRAP,
+    EXCP_EXTENSION,
+    EXCP_DIVZERO,
+    EXCP_DCERROR,
+    EXCP_MISALIGNED,
+    EXCP_IRQ,
+    EXCP_LPEND_REACHED = 9000,
+    EXCP_FAKE
+};
+
+
+/*
+ * Status32 register bits
+ *   -- Ixxx xxxx xxxU ARRR ESDL ZNCV Udae eeeH --
+ *
+ *   I = IE - Interrupt Enable
+ *   x =    - Reserved
+ *   U = US - User sleep mode enable
+ *   A = AD - Disable alignment checking
+ *   R = RB - Select a register bank
+ *   E = ES - EI_S table instruction pending
+ *   S = SC - Enable stack checking
+ *   D = DZ - RV_DivZero exception enable
+ *   L =    - Zero-overhead loop disable
+ *   Z =    - Zero status flag
+ *   N =    - Negative status flag
+ *   C =    - Cary status flag
+ *   V =    - Overflow status flag
+ *   U =    - User mode
+ *   d = DE - Delayed branch is pending
+ *   a = AE - Processor is in an exception
+ *   e = E  - Interrupt priority operating level`I
+ *   H =    - Halt flag
+ */
+
+/* Flags in pstate */
+#define Hf_b  (0)
+#define AEf_b (5)
+#define Uf_b  (7)
+#define Lf_b  (12)
+#define DZf_b (13)
+#define SCf_b (14)
+#define ESf_b (15)
+#define ADf_b (19)
+#define USf_b (20)
+
+/* Flags with their on fields */
+#define IEf_b   (31)
+#define IEf_bS  (1)
+
+#define Ef_b    (1)
+#define Ef_bS   (4)
+
+#define DEf_b   (6)
+#define DEf_bS  (1)
+
+#define Vf_b    (8)
+#define Vf_bS   (1)
+#define Cf_b    (9)
+#define Cf_bS   (1)
+#define Nf_b    (10)
+#define Nf_bS   (1)
+#define Zf_b    (11)
+#define Zf_bS   (1)
+
+#define RBf_b   (16)
+#define RBf_bS  (3)
+
+
+#define PSTATE_MASK \
+     ((1 << Hf_b)  \
+    | (1 << AEf_b) \
+    | (1 << Uf_b)  \
+    | (1 << Lf_b)  \
+    | (1 << DZf_b) \
+    | (1 << SCf_b) \
+    | (1 << ESf_b) \
+    | (1 << ADf_b) \
+    | (1 << USf_b))
+
+#define GET_STATUS_BIT(STAT, BIT) ((STAT.pstate >> BIT##_b) & 0x1)
+#define SET_STATUS_BIT(STAT, BIT, VALUE) { \
+    STAT.pstate &= ~(1 << BIT##_b); \
+    STAT.pstate |= (VALUE << BIT##_b); \
+}
+
+typedef struct {
+    target_ulong pstate;
+
+    target_ulong RBf;
+    target_ulong Ef;     /* irq priority treshold. */
+    target_ulong Vf;     /*  overflow                */
+    target_ulong Cf;     /*  carry                   */
+    target_ulong Nf;     /*  negative                */
+    target_ulong Zf;     /*  zero                    */
+    target_ulong DEf;
+    target_ulong IEf;
+
+    /* Reserved bits */
+
+    /* Next instruction is a delayslot instruction */
+    bool is_delay_slot_instruction;
+} ARCStatus;
+
+/* ARC processor timer module. */
+typedef struct {
+    target_ulong T_Cntrl;
+    target_ulong T_Limit;
+    uint64_t last_clk;
+} ARCTimer;
+
+/* ARC PIC interrupt bancked regs. */
+typedef struct {
+    target_ulong priority;
+    target_ulong trigger;
+    target_ulong pulse_cancel;
+    target_ulong enable;
+    target_ulong pending;
+    target_ulong status;
+} ARCIrq;
+
+typedef struct CPUARCState {
+    target_ulong        r[64];
+
+    ARCStatus stat, stat_l1, stat_er;
+
+    struct {
+        target_ulong    S2;
+        target_ulong    S1;
+        target_ulong    CS;
+    } macmod;
+
+    target_ulong intvec;
+
+    target_ulong eret;
+    target_ulong erbta;
+    target_ulong ecr;
+    target_ulong efa;
+    target_ulong bta;
+    target_ulong bta_l1;
+    target_ulong bta_l2;
+
+    target_ulong pc;     /*  program counter         */
+    target_ulong lps;    /*  loops start             */
+    target_ulong lpe;    /*  loops end               */
+
+    target_ulong npc;    /* required for LP - zero overhead loops. */
+
+    target_ulong lock_lf_var;
+
+#define TMR_IE  (1 << 0)
+#define TMR_NH  (1 << 1)
+#define TMR_W   (1 << 2)
+#define TMR_IP  (1 << 3)
+#define TMR_PD  (1 << 4)
+    ARCTimer timer[2];    /* ARC CPU-Timer 0/1 */
+
+    ARCIrq irq_bank[256]; /* IRQ register bank */
+    uint32_t irq_select;     /* AUX register */
+    uint32_t aux_irq_act;    /* AUX register */
+    uint32_t irq_priority_pending; /* AUX register */
+    uint32_t icause[16];     /* Banked cause register */
+    uint32_t aux_irq_hint;   /* AUX register, used to trigger soft irq */
+    uint32_t aux_user_sp;
+    uint32_t aux_irq_ctrl;
+    uint32_t aux_rtc_ctrl;
+    uint32_t aux_rtc_low;
+    uint32_t aux_rtc_high;
+
+    /* Fields required by exception handling. */
+    uint32_t causecode;
+    uint32_t param;
+
+    struct arc_mmu mmu;       /* mmu.h */
+    ARCMPU mpu;               /* mpu.h */
+    struct arc_cache cache;   /* cache.h */
+
+    /* used for propagatinng "hostpc/return address" to sub-functions */
+    uintptr_t host_pc;
+
+    bool      stopped;
+
+    /* Fields up to this point are cleared by a CPU reset */
+    struct {} end_reset_fields;
+
+    uint64_t last_clk_rtc;
+
+    void *irq[256];
+    QEMUTimer *cpu_timer[2]; /* Internal timer. */
+    QEMUTimer *cpu_rtc;      /* Internal RTC. */
+
+    const struct arc_boot_info *boot_info;
+
+    bool enabled_interrupts;
+} CPUARCState;
+
+/*
+ * ArcCPU:
+ * @env: #CPUMBState
+ *
+ * An ARC CPU.
+ */
+struct ARCCPU {
+    /*< private >*/
+    CPUState parent_obj;
+
+    /*< public >*/
+
+    /* ARC Configuration Settings. */
+    struct {
+        uint32_t addr_size;
+        uint32_t br_bc_entries;
+        uint32_t br_pt_entries;
+        uint32_t br_bc_tag_size;
+        uint32_t external_interrupts;
+        uint32_t intvbase_preset;
+        uint32_t lpc_size;
+        uint32_t mmu_page_size_sel0;
+        uint32_t mmu_page_size_sel1;
+        uint32_t mmu_pae_enabled;
+        uint32_t ntlb_num_entries;
+        uint32_t num_actionpoints;
+        uint32_t number_of_interrupts;
+        uint32_t number_of_levels;
+        uint32_t pct_counters;
+        uint32_t pct_interrupt;
+        uint32_t pc_size;
+        uint32_t rgf_num_regs;
+        uint32_t rgf_banked_regs;
+        uint32_t rgf_num_banks;
+        uint32_t rtt_feature_level;
+        uint32_t smar_stack_entries;
+        uint32_t smart_implementation;
+        uint32_t stlb_num_entries;
+        uint32_t slc_size;
+        uint32_t slc_line_size;
+        uint32_t slc_ways;
+        uint32_t slc_tag_banks;
+        uint32_t slc_tram_delay;
+        uint32_t slc_dbank_width;
+        uint32_t slc_data_banks;
+        uint32_t slc_dram_delay;
+        uint32_t slc_ecc_option;
+        uint32_t freq_hz; /* CPU frequency in hz, needed for timers. */
+        uint8_t  br_rs_entries;
+        uint8_t  br_tosq_entries;
+        uint8_t  br_fb_entries;
+        uint8_t  dccm_mem_cycles;
+        uint8_t  dccm_mem_bancks;
+        uint8_t  dc_mem_cycles;
+        uint8_t  ecc_option;
+        uint8_t  mpu_num_regions;
+        uint8_t  mpy_option;
+        bool     aps_feature;
+        bool     byte_order;
+        bool     bitscan_option;
+        bool     br_bc_full_tag;
+        bool     code_density;
+        bool     code_protect;
+        bool     dccm_posedge;
+        bool     dc_posedge;
+        bool     dmp_unaligned;
+        bool     ecc_exception;
+        bool     firq_option;
+        bool     fpu_dp_option;
+        bool     fpu_fma_option;
+        bool     fpu_div_option;
+        bool     has_actionpoints;
+        bool     has_fpu;
+        bool     has_interrupts;
+        bool     has_mmu;
+        bool     has_mpu;
+        bool     has_timer_0;
+        bool     has_timer_1;
+        bool     has_pct;
+        bool     has_rtt;
+        bool     has_smart;
+        bool     rtc_option;
+        bool     stack_checking;
+        bool     swap_option;
+        bool     slc_mem_bus_width;
+        bool     slc_data_halfcycle_steal;
+        bool     slc_data_add_pre_pipeline;
+        bool     uaux_option;
+    } cfg;
+
+    uint32_t family;
+
+    /* Build AUX regs. */
+#define TIMER0_IRQ 16
+#define TIMER1_IRQ 17
+#define TB_T0  (1 << 8)
+#define TB_T1  (1 << 9)
+#define TB_RTC (1 << 10)
+#define TB_P0_MSK (0x0f0000)
+#define TB_P1_MSK (0xf00000)
+    uint32_t freq_hz; /* CPU frequency in hz, needed for timers. */
+
+    uint32_t timer_build;   /* Timer configuration AUX register. */
+    uint32_t irq_build;     /* Interrupt Build Configuration Register. */
+    uint32_t vecbase_build; /* Interrupt Vector Base Address Configuration. */
+    uint32_t mpy_build;     /* Multiply configuration register. */
+    uint32_t isa_config;    /* Instruction Set Configuration Register. */
+
+    CPUNegativeOffsetState neg;
+    CPUARCState env;
+};
+
+/* are we in user mode? */
+static inline bool is_user_mode(const CPUARCState *env)
+{
+    return GET_STATUS_BIT(env->stat, Uf) != 0;
+}
+
+#define cpu_list            arc_cpu_list
+#define cpu_signal_handler  cpu_arc_signal_handler
+#define cpu_init(cpu_model) cpu_generic_init(TYPE_ARC_CPU, cpu_model)
+
+typedef CPUARCState CPUArchState;
+typedef ARCCPU ArchCPU;
+
+#include "exec/cpu-all.h"
+
+static inline int cpu_mmu_index(const CPUARCState *env, bool ifetch)
+{
+    return GET_STATUS_BIT(env->stat, Uf) != 0 ? 1 : 0;
+}
+
+static inline void cpu_get_tb_cpu_state(CPUARCState *env, target_ulong *pc,
+                                        target_ulong *cs_base,
+                                        uint32_t *pflags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+#ifdef CONFIG_USER_ONLY
+    assert(0); /* Not really supported at the moment. */
+#else
+    *pflags = cpu_mmu_index(env, 0);
+#endif
+}
+
+void arc_translate_init(void);
+
+void arc_cpu_list(void);
+int cpu_arc_exec(CPUState *cpu);
+int cpu_arc_signal_handler(int host_signum, void *pinfo, void *puc);
+int arc_cpu_memory_rw_debug(CPUState *cs, vaddr address, uint8_t *buf,
+                            int len, bool is_write);
+void arc_cpu_do_interrupt(CPUState *cpu);
+
+void arc_cpu_dump_state(CPUState *cs, FILE *f, int flags);
+hwaddr arc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+int arc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
+int arc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+
+void QEMU_NORETURN arc_raise_exception(CPUARCState *env, int32_t excp_idx);
+
+void not_implemented_mmu_init(struct arc_mmu *mmu);
+bool not_implemented_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                                  MMUAccessType access_type, int mmu_idx,
+                                  bool probe, uintptr_t retaddr);
+
+void arc_mmu_init(CPUARCState *env);
+bool arc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
+hwaddr arc_mmu_debug_translate(CPUARCState *env, vaddr addr);
+void arc_mmu_disable(CPUARCState *env);
+
+#include "exec/cpu-all.h"
+
+#endif /* !defined (CPU_ARC_H) */
diff --git a/target/arc/meson.build b/target/arc/meson.build
new file mode 100644
index 0000000000..9bbfb01f98
--- /dev/null
+++ b/target/arc/meson.build
@@ -0,0 +1,21 @@
+arc_softmmu_ss = ss.source_set()
+arc_softmmu_ss.add(files(
+  'translate.c',
+  'helper.c',
+  'cpu.c',
+  'op_helper.c',
+  'gdbstub.c',
+  'decoder.c',
+  'regs.c',
+  'regs-impl.c',
+  'semfunc.c',
+  'semfunc-helper.c',
+  'mmu.c',
+  'mpu.c',
+  'timer.c',
+  'irq.c',
+  'cache.c',
+))
+
+target_arch += {'arc': arc_softmmu_ss}
+target_softmmu_arch += {'arc': arc_softmmu_ss}
-- 
2.20.1


