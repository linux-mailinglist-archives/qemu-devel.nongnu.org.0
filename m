Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98822AF62A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:23:27 +0100 (CET)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsu6-0005ap-QZ
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:23:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcsp2-0000KV-2U
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:12 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcsox-0007ux-21
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:11 -0500
Received: by mail-wr1-x443.google.com with SMTP id l1so3064215wrb.9
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SaIO9w2OoY9pOClbaJGDyjdA+RWSueePuFMkYKw57Bs=;
 b=aRobm4nUA3dEab2vCJgC5fjXRgb+wni52zQ6KN1UkLXY64FsAvK6Xa6kKrRtZCCXIl
 YbYfUG/ePFJASArfRfUlOE2ntenbSj3sLZANf6gcq/CTo582t91AJrMvqjTHHp632ruw
 rTfrZqAR0HKCj4FjzK/KXwt6nKNrVj32cweGJR9/phrplZUgQg3Wcf+p+kSbpwueupp2
 GyS3SuD9wL9a6m4UWGVEBRle9IjkTSSLdMH93VY+LFZNLdFhKxfxi5SF8VYgY87vWx5J
 3BeuzCrVPcpb4w2S+VVmBWOpq2pnTzqiSFXaIsuhzBYL1GIXmUr5/sGy2k2SsP73VoBv
 e/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SaIO9w2OoY9pOClbaJGDyjdA+RWSueePuFMkYKw57Bs=;
 b=TCL/+avQNnQDNLX8teXerpHj5aRDZSiJotcM+8sKcrdDZqVCSdUUOoOXDURQXDAf7F
 YnN1Yp0OSoLbVe76NUeFQ44lH+RSigpHrYKjK6hO4YnfwTdhXlPl4y4Qis4WCO6GV0jC
 Z8T30LxR8wsAF+ImyVobmZ9EuNmgnqquy5JAScIpRVmsgW54sWAF8VH6EOwp/dADQOh1
 Dal20Uq7OBAbFDH22g8jbEFlDcQBh0XyoQCiBXWED4TU+fjT/xZoFYAVoMk7QtwtLxOd
 MphdwyAmMNj+ZApg9lUW0PKrQrlyyJJYuQ0tGFnojAKqIEGzh6pFHH1ENq3IJP01mLMC
 CPHw==
X-Gm-Message-State: AOAM532JfuAat8gEVy8Z1vBfPQ4zeNKFS4gdvd0wzvzqY6MZhyM80svx
 lCd7lOpcyXsfW6eoSp9KbNUF2dKEaqByZQ==
X-Google-Smtp-Source: ABdhPJxWJa70+SkooBccuPsifKUqV7a9MZ4I3igcL5ufUnOzOzFdfqWzRhbK7EY1EXeJncGqPV5QHQ==
X-Received: by 2002:adf:9cc6:: with SMTP id h6mr31135269wre.341.1605111484688; 
 Wed, 11 Nov 2020 08:18:04 -0800 (PST)
Received: from cmiranda-laptop.localdomain (bl19-104-46.dsl.telepac.pt.
 [2.80.104.46])
 by smtp.gmail.com with ESMTPSA id s188sm3115178wmf.45.2020.11.11.08.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:18:04 -0800 (PST)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 01/15] arc: Add initial core cpu files
Date: Wed, 11 Nov 2020 16:17:44 +0000
Message-Id: <20201111161758.9636-2-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111161758.9636-1-cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Cupertino Miranda <cupertinomiranda@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 target/arc/arc-common.h |  54 ++++
 target/arc/cpu-param.h  |  32 +++
 target/arc/cpu-qom.h    |  52 ++++
 target/arc/cpu.c        | 467 +++++++++++++++++++++++++++++++++++
 target/arc/cpu.h        | 531 ++++++++++++++++++++++++++++++++++++++++
 target/arc/internals.h  |  38 +++
 target/arc/meson.build  |  20 ++
 7 files changed, 1194 insertions(+)
 create mode 100644 target/arc/arc-common.h
 create mode 100644 target/arc/cpu-param.h
 create mode 100644 target/arc/cpu-qom.h
 create mode 100644 target/arc/cpu.c
 create mode 100644 target/arc/cpu.h
 create mode 100644 target/arc/internals.h
 create mode 100644 target/arc/meson.build

diff --git a/target/arc/arc-common.h b/target/arc/arc-common.h
new file mode 100644
index 0000000000..d931944149
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
+  ARC_OPCODE_NONE    = 0,
+  ARC_OPCODE_DEFAULT = 1 << 0,
+  ARC_OPCODE_ARC600  = 1 << 1,
+  ARC_OPCODE_ARC700  = 1 << 2,
+  ARC_OPCODE_ARCv2EM = 1 << 3,
+  ARC_OPCODE_ARCv2HS = 1 << 4
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
index 0000000000..2baa19486d
--- /dev/null
+++ b/target/arc/cpu.c
@@ -0,0 +1,467 @@
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
+#include "internals.h"
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
+  ARCCPU *cpu = ARC_CPU(cs);
+
+  CPU_PCL(&cpu->env) = value & 0xfffffffc;
+  cpu->env.pc = value;
+}
+
+static bool arc_cpu_has_work(CPUState *cs)
+{
+  return cs->interrupt_request & CPU_INTERRUPT_HARD;
+}
+
+static void arc_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+{
+  ARCCPU      *cpu = ARC_CPU(cs);
+  CPUARCState *env = &cpu->env;
+
+  CPU_PCL(&cpu->env) = tb->pc & 0xfffffffc;
+  env->pc = tb->pc;
+}
+
+static void arc_cpu_reset(DeviceState *dev)
+{
+  CPUState *s = CPU(dev);
+  ARCCPU *cpu = ARC_CPU(s);
+  ARCCPUClass *arcc = ARC_CPU_GET_CLASS(cpu);
+  CPUARCState *env = &cpu->env;
+
+  if (qemu_loglevel_mask(CPU_LOG_RESET)) {
+    qemu_log("CPU Reset (CPU)\n");
+    log_cpu_state(s, 0);
+  }
+
+  /* Initialize mmu/reset it. */
+  arc_mmu_init(&env->mmu);
+
+  arc_mpu_init(cpu);
+
+  arc_resetTIMER(cpu);
+  arc_resetIRQ(cpu);
+
+  arcc->parent_reset(dev);
+
+  memset(env->r, 0, sizeof(env->r));
+  env->lock_lf_var = 0;
+
+  env->stat.is_delay_slot_instruction = 0;
+    /*
+     * kernel expects MPY support to check for presence of
+     * extension core regs r58/r59.
+     *
+     * VERSION32x32=0x06: ARCv2 32x32 Multiply
+     * DSP=0x1: MPY_OPTION 7
+     */
+    env->mpy_build = 0x00001006;
+}
+
+static void arc_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
+{
+  ARCCPU *cpu = ARC_CPU(cs);
+  CPUARCState *env = &cpu->env;
+
+  switch (env->family) {
+  case ARC_OPCODE_ARC700:
+    info->mach = bfd_mach_arc_arc700;
+    break;
+  case ARC_OPCODE_ARC600:
+    info->mach = bfd_mach_arc_arc600;
+    break;
+  case ARC_OPCODE_ARCv2EM:
+    info->mach = bfd_mach_arc_arcv2em;
+    break;
+  case ARC_OPCODE_ARCv2HS:
+    info->mach = bfd_mach_arc_arcv2hs;
+    break;
+  default:
+    info->mach = bfd_mach_arc_arcv2;
+    break;
+  }
+
+  info->print_insn = print_insn_arc;
+  info->endian = BFD_ENDIAN_LITTLE;
+}
+
+
+static void arc_cpu_realizefn(DeviceState *dev, Error **errp)
+{
+  CPUState *cs = CPU(dev);
+  ARCCPU *cpu = ARC_CPU(dev);
+  ARCCPUClass *arcc = ARC_CPU_GET_CLASS(dev);
+  Error *local_err = NULL;
+  CPUARCState *env = &cpu->env;
+
+  cpu_exec_realizefn(cs, &local_err);
+  if (local_err != NULL) {
+    error_propagate(errp, local_err);
+    return;
+  }
+
+  arc_cpu_register_gdb_regs_for_features(cpu);
+
+  qemu_init_vcpu(cs);
+
+  /*
+   * Initialize build registers depending on the simulation
+   * parameters.
+   */
+  env->freq_hz = cpu->cfg.freq_hz;
+
+  env->isa_config = 0x02;
+  switch (cpu->cfg.pc_size) {
+  case 16:
+    break;
+  case 20:
+    env->isa_config |= 1 << 8;
+    break;
+  case 24:
+    env->isa_config |= 2 << 8;
+    break;
+  case 28:
+    env->isa_config |= 3 << 8;
+    break;
+  default:
+    env->isa_config |= 4 << 8;
+    break;
+  }
+
+  switch (cpu->cfg.lpc_size) {
+  case 0:
+    break;
+  case 8:
+    env->isa_config |= 1 << 12;
+    break;
+  case 12:
+    env->isa_config |= 2 << 12;
+    break;
+  case 16:
+    env->isa_config |= 3 << 12;
+    break;
+  case 20:
+    env->isa_config |= 4 << 12;
+    break;
+  case 24:
+    env->isa_config |= 5 << 12;
+    break;
+  case 28:
+    env->isa_config |= 6 << 12;
+    break;
+  default:
+    env->isa_config |= 7 << 12;
+    break;
+  }
+
+  switch (cpu->cfg.addr_size) {
+  case 16:
+    break;
+  case 20:
+    env->isa_config |= 1 << 16;
+    break;
+  case 24:
+    env->isa_config |= 2 << 16;
+    break;
+  case 28:
+    env->isa_config |= 3 << 16;
+    break;
+  default:
+    env->isa_config |= 4 << 16;
+    break;
+  }
+
+  env->isa_config |= (cpu->cfg.byte_order ? BIT(20) : 0) | BIT(21)
+    | (cpu->cfg.dmp_unaligned ? BIT(22) : 0) | BIT(23)
+    | (cpu->cfg.code_density ? (2 << 24) : 0) | BIT(28);
+
+  arc_initializeTIMER(cpu);
+  arc_initializeIRQ(cpu);
+
+  cpu_reset(cs);
+
+  arcc->parent_realize(dev, errp);
+}
+
+static void arc_cpu_initfn(Object *obj)
+{
+  ARCCPU *cpu = ARC_CPU(obj);
+
+  /* Initialize aux-regs. */
+  arc_aux_regs_init();
+
+  cpu_set_cpustate_pointers(cpu);
+}
+
+static ObjectClass *arc_cpu_class_by_name(const char *cpu_model)
+{
+  ObjectClass *oc;
+  char *typename;
+  char **cpuname;
+
+  if (!cpu_model) {
+    return NULL;
+  }
+
+  cpuname = g_strsplit(cpu_model, ",", 1);
+  typename = g_strdup_printf("%s-" TYPE_ARC_CPU, cpuname[0]);
+  oc = object_class_by_name(typename);
+
+  g_strfreev(cpuname);
+  g_free(typename);
+
+  if (!oc
+      || !object_class_dynamic_cast(oc, TYPE_ARC_CPU)
+      || object_class_is_abstract(oc)) {
+    return NULL;
+  }
+
+  return oc;
+}
+
+static gchar *arc_gdb_arch_name(CPUState *cs)
+{
+    return g_strdup("arc:ARCv2");
+}
+
+static void arc_cpu_class_init(ObjectClass *oc, void *data)
+{
+  DeviceClass *dc = DEVICE_CLASS(oc);
+  CPUClass *cc = CPU_CLASS(oc);
+  ARCCPUClass *arcc = ARC_CPU_CLASS(oc);
+
+  device_class_set_parent_realize(dc, arc_cpu_realizefn,
+                                  &arcc->parent_realize);
+
+  device_class_set_parent_reset(dc, arc_cpu_reset, &arcc->parent_reset);
+
+  cc->class_by_name = arc_cpu_class_by_name;
+
+  cc->has_work = arc_cpu_has_work;
+  cc->do_interrupt = arc_cpu_do_interrupt;
+  cc->cpu_exec_interrupt = arc_cpu_exec_interrupt;
+  cc->dump_state = arc_cpu_dump_state;
+  cc->set_pc = arc_cpu_set_pc;
+#ifndef CONFIG_USER_ONLY
+  cc->memory_rw_debug = arc_cpu_memory_rw_debug;
+  cc->get_phys_page_debug = arc_cpu_get_phys_page_debug;
+  cc->vmsd = &vms_arc_cpu;
+#endif
+  cc->disas_set_info = arc_cpu_disas_set_info;
+  cc->synchronize_from_tb = arc_cpu_synchronize_from_tb;
+  cc->gdb_read_register = arc_cpu_gdb_read_register;
+  cc->gdb_write_register = arc_cpu_gdb_write_register;
+
+  /* Core GDB support */
+  cc->gdb_core_xml_file = "arc-v2-core.xml";
+  cc->gdb_num_core_regs = GDB_REG_LAST;
+  cc->gdb_arch_name = arc_gdb_arch_name;
+
+#ifdef CONFIG_TCG
+    cc->tcg_initialize = arc_translate_init;
+    cc->tlb_fill = arc_cpu_tlb_fill;
+#endif
+    device_class_set_props(dc, arc_cpu_properties);
+}
+
+static void arc_any_initfn(Object *obj)
+{
+  /* Set cpu feature flags */
+  ARCCPU *cpu = ARC_CPU(obj);
+  cpu->env.family = ARC_OPCODE_ARC700;
+}
+
+static void arc600_initfn(Object *obj)
+{
+  ARCCPU *cpu = ARC_CPU(obj);
+  cpu->env.family = ARC_OPCODE_ARC600;
+}
+
+static void arc700_initfn(Object *obj)
+{
+  ARCCPU *cpu = ARC_CPU(obj);
+  cpu->env.family = ARC_OPCODE_ARC700;
+}
+
+static void arcem_initfn(Object *obj)
+{
+  ARCCPU *cpu = ARC_CPU(obj);
+  cpu->env.family = ARC_OPCODE_ARCv2EM;
+}
+
+static void archs_initfn(Object *obj)
+{
+  ARCCPU *cpu = ARC_CPU(obj);
+  cpu->env.family = ARC_OPCODE_ARCv2HS;
+}
+
+typedef struct ARCCPUInfo {
+  const char     *name;
+  void (*initfn)(Object *obj);
+} ARCCPUInfo;
+
+static const ARCCPUInfo arc_cpus[] = {
+  { .name = "arc600", .initfn = arc600_initfn },
+  { .name = "arc700", .initfn = arc700_initfn },
+  { .name = "arcem", .initfn = arcem_initfn },
+  { .name = "archs", .initfn = archs_initfn },
+  { .name = "any", .initfn = arc_any_initfn },
+};
+
+static void cpu_register(const ARCCPUInfo *info)
+{
+  TypeInfo type_info = {
+    .parent = TYPE_ARC_CPU,
+    .instance_size = sizeof(ARCCPU),
+    .instance_init = info->initfn,
+    .class_size = sizeof(ARCCPUClass),
+  };
+
+  type_info.name = g_strdup_printf("%s-" TYPE_ARC_CPU, info->name);
+  type_register(&type_info);
+  g_free((void *)type_info.name);
+}
+
+static const TypeInfo arc_cpu_type_info = {
+  .name = TYPE_ARC_CPU,
+  .parent = TYPE_CPU,
+  .instance_size = sizeof(ARCCPU),
+  .instance_init = arc_cpu_initfn,
+  .class_size = sizeof(ARCCPUClass),
+  .class_init = arc_cpu_class_init,
+  .abstract = true,
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
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/target/arc/cpu.h b/target/arc/cpu.h
new file mode 100644
index 0000000000..d5408c6fea
--- /dev/null
+++ b/target/arc/cpu.h
@@ -0,0 +1,531 @@
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
+#include "cpu-qom.h"
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
+#define MMU_IDX       0
+
+#define PHYS_BASE_RAM 0x00000000
+#define VIRT_BASE_RAM 0x00000000
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
+enum gdb_regs {
+    GDB_REG_0 = 0,
+    GDB_REG_1,
+    GDB_REG_2,
+    GDB_REG_3,
+    GDB_REG_4,
+    GDB_REG_5,
+    GDB_REG_6,
+    GDB_REG_7,
+    GDB_REG_8,
+    GDB_REG_9,
+    GDB_REG_10,
+    GDB_REG_11,
+    GDB_REG_12,
+    GDB_REG_13,
+    GDB_REG_14,
+    GDB_REG_15,
+    GDB_REG_16,
+    GDB_REG_17,
+    GDB_REG_18,
+    GDB_REG_19,
+    GDB_REG_20,
+    GDB_REG_21,
+    GDB_REG_22,
+    GDB_REG_23,
+    GDB_REG_24,
+    GDB_REG_25,
+    GDB_REG_26,         /* GP                         */
+    GDB_REG_27,         /* FP                         */
+    GDB_REG_28,         /* SP                         */
+    GDB_REG_29,         /* ILINK                      */
+    GDB_REG_30,         /* R30                        */
+    GDB_REG_31,         /* BLINK                      */
+    GDB_REG_58,         /* little_endian? ACCL : ACCH */
+    GDB_REG_59,         /* little_endian? ACCH : ACCL */
+    GDB_REG_60,         /* LP                         */
+    GDB_REG_63,         /* Immediate                  */
+    GDB_REG_LAST
+};
+
+enum gdb_aux_min_regs {
+    GDB_AUX_MIN_REG_PC = 0, /* program counter */
+    GDB_AUX_MIN_REG_LPS,    /* loop body start */
+    GDB_AUX_MIN_REG_LPE,    /* loop body end   */
+    GDB_AUX_MIN_REG_STATUS, /* status flag     */
+    GDB_AUX_MIN_REG_LAST
+};
+
+enum gdb_aux_other_regs {
+    /* builds */
+    GDB_AUX_OTHER_REG_TIMER_BUILD = 0,  /* timer build                */
+    GDB_AUX_OTHER_REG_IRQ_BUILD,        /* irq build                  */
+    GDB_AUX_OTHER_REG_MPY_BUILD,        /* multiply configuration     */
+    GDB_AUX_OTHER_REG_VECBASE_BUILD,    /* vector base address config */
+    GDB_AUX_OTHER_REG_ISA_CONFIG,       /* isa config                 */
+    /* timers */
+    GDB_AUX_OTHER_REG_TIMER_CNT0,       /* timer 0 counter */
+    GDB_AUX_OTHER_REG_TIMER_CTRL0,      /* timer 0 control */
+    GDB_AUX_OTHER_REG_TIMER_LIM0,       /* timer 0 limit   */
+    GDB_AUX_OTHER_REG_TIMER_CNT1,       /* timer 1 counter */
+    GDB_AUX_OTHER_REG_TIMER_CTRL1,      /* timer 1 control */
+    GDB_AUX_OTHER_REG_TIMER_LIM1,       /* timer 1 limit   */
+    /* mmu */
+    GDB_AUX_OTHER_REG_PID,              /* process identity  */
+    GDB_AUX_OTHER_REG_TLBPD0,           /* page descriptor 0 */
+    GDB_AUX_OTHER_REG_TLBPD1,           /* page descriptor 1 */
+    GDB_AUX_OTHER_REG_TLB_INDEX,        /* tlb index         */
+    GDB_AUX_OTHER_REG_TLB_CMD,          /* tlb command       */
+    /* mpu */
+    GDB_AUX_OTHER_REG_MPU_BUILD,        /* MPU build           */
+    GDB_AUX_OTHER_REG_MPU_EN,           /* MPU enable          */
+    GDB_AUX_OTHER_REG_MPU_ECR,          /* MPU exception cause */
+    GDB_AUX_OTHER_REG_MPU_BASE0,        /* MPU base 0          */
+    GDB_AUX_OTHER_REG_MPU_BASE1,        /* MPU base 1          */
+    GDB_AUX_OTHER_REG_MPU_BASE2,        /* MPU base 2          */
+    GDB_AUX_OTHER_REG_MPU_BASE3,        /* MPU base 3          */
+    GDB_AUX_OTHER_REG_MPU_BASE4,        /* MPU base 4          */
+    GDB_AUX_OTHER_REG_MPU_BASE5,        /* MPU base 5          */
+    GDB_AUX_OTHER_REG_MPU_BASE6,        /* MPU base 6          */
+    GDB_AUX_OTHER_REG_MPU_BASE7,        /* MPU base 7          */
+    GDB_AUX_OTHER_REG_MPU_BASE8,        /* MPU base 8          */
+    GDB_AUX_OTHER_REG_MPU_BASE9,        /* MPU base 9          */
+    GDB_AUX_OTHER_REG_MPU_BASE10,       /* MPU base 10         */
+    GDB_AUX_OTHER_REG_MPU_BASE11,       /* MPU base 11         */
+    GDB_AUX_OTHER_REG_MPU_BASE12,       /* MPU base 12         */
+    GDB_AUX_OTHER_REG_MPU_BASE13,       /* MPU base 13         */
+    GDB_AUX_OTHER_REG_MPU_BASE14,       /* MPU base 14         */
+    GDB_AUX_OTHER_REG_MPU_BASE15,       /* MPU base 15         */
+    GDB_AUX_OTHER_REG_MPU_PERM0,        /* MPU permission 0    */
+    GDB_AUX_OTHER_REG_MPU_PERM1,        /* MPU permission 1    */
+    GDB_AUX_OTHER_REG_MPU_PERM2,        /* MPU permission 2    */
+    GDB_AUX_OTHER_REG_MPU_PERM3,        /* MPU permission 3    */
+    GDB_AUX_OTHER_REG_MPU_PERM4,        /* MPU permission 4    */
+    GDB_AUX_OTHER_REG_MPU_PERM5,        /* MPU permission 5    */
+    GDB_AUX_OTHER_REG_MPU_PERM6,        /* MPU permission 6    */
+    GDB_AUX_OTHER_REG_MPU_PERM7,        /* MPU permission 7    */
+    GDB_AUX_OTHER_REG_MPU_PERM8,        /* MPU permission 8    */
+    GDB_AUX_OTHER_REG_MPU_PERM9,        /* MPU permission 9    */
+    GDB_AUX_OTHER_REG_MPU_PERM10,       /* MPU permission 10   */
+    GDB_AUX_OTHER_REG_MPU_PERM11,       /* MPU permission 11   */
+    GDB_AUX_OTHER_REG_MPU_PERM12,       /* MPU permission 12   */
+    GDB_AUX_OTHER_REG_MPU_PERM13,       /* MPU permission 13   */
+    GDB_AUX_OTHER_REG_MPU_PERM14,       /* MPU permission 14   */
+    GDB_AUX_OTHER_REG_MPU_PERM15,       /* MPU permission 15   */
+    /* excpetions */
+    GDB_AUX_OTHER_REG_ERSTATUS,         /* exception return status  */
+    GDB_AUX_OTHER_REG_ERBTA,            /* exception return BTA     */
+    GDB_AUX_OTHER_REG_ECR,              /* exception cause register */
+    GDB_AUX_OTHER_REG_ERET,             /* exception return address */
+    GDB_AUX_OTHER_REG_EFA,              /* exception fault address  */
+    /* irq */
+    GDB_AUX_OTHER_REG_ICAUSE,           /* interrupt cause        */
+    GDB_AUX_OTHER_REG_IRQ_CTRL,         /* context saving control */
+    GDB_AUX_OTHER_REG_IRQ_ACT,          /* active                 */
+    GDB_AUX_OTHER_REG_IRQ_PRIO_PEND,    /* priority pending       */
+    GDB_AUX_OTHER_REG_IRQ_HINT,         /* hint                   */
+    GDB_AUX_OTHER_REG_IRQ_SELECT,       /* select                 */
+    GDB_AUX_OTHER_REG_IRQ_ENABLE,       /* enable                 */
+    GDB_AUX_OTHER_REG_IRQ_TRIGGER,      /* trigger                */
+    GDB_AUX_OTHER_REG_IRQ_STATUS,       /* status                 */
+    GDB_AUX_OTHER_REG_IRQ_PULSE,        /* pulse cancel           */
+    GDB_AUX_OTHER_REG_IRQ_PENDING,      /* pending                */
+    GDB_AUX_OTHER_REG_IRQ_PRIO,         /* priority               */
+    /* miscellaneous */
+    GDB_AUX_OTHER_REG_BTA,              /* branch target address */
+
+    GDB_AUX_OTHER_REG_LAST
+};
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
+typedef struct status_register {
+    uint32_t Hf;     /* halt                    */
+    uint32_t Ef;     /* irq priority treshold. */
+    uint32_t AEf;
+    uint32_t DEf;
+    uint32_t Uf;
+    uint32_t Vf;     /*  overflow                */
+    uint32_t Cf;     /*  carry                   */
+    uint32_t Nf;     /*  negative                */
+    uint32_t Zf;     /*  zero                    */
+    uint32_t Lf;
+    uint32_t DZf;
+    uint32_t SCf;
+    uint32_t ESf;
+    uint32_t RBf;
+    uint32_t ADf;
+    uint32_t USf;
+    uint32_t IEf;
+
+    /* Reserved bits */
+
+    /* Next instruction is a delayslot instruction */
+    uint32_t is_delay_slot_instruction;
+} status_t;
+
+/* ARC processor timer module. */
+typedef struct {
+    /*
+     * TODO: This volatile is needed to pass RTC tests. We need to
+     * verify why.
+     */
+    volatile uint32_t T_Cntrl;
+    volatile uint32_t T_Limit;
+    volatile uint64_t last_clk;
+} arc_timer_t;
+
+/* ARC PIC interrupt bancked regs. */
+typedef struct {
+    uint32_t priority;
+    uint32_t trigger;
+    uint32_t pulse_cancel;
+    uint32_t enable;
+    uint32_t pending;
+    uint32_t status;
+} arc_irq_t;
+
+typedef struct CPUARCState {
+    uint32_t        r[64];
+
+    status_t stat, stat_l1, stat_er;
+
+    struct {
+        uint32_t    S2;
+        uint32_t    S1;
+        uint32_t    CS;
+    } macmod;
+
+    uint32_t intvec;
+
+    uint32_t eret;
+    uint32_t erbta;
+    uint32_t ecr;
+    uint32_t efa;
+    uint32_t bta;
+    uint32_t bta_l1;
+    uint32_t bta_l2;
+
+    uint32_t pc;     /*  program counter         */
+    uint32_t lps;    /*  loops start             */
+    uint32_t lpe;    /*  loops end               */
+
+    uint32_t npc;    /* required for LP - zero overhead loops. */
+
+    uint32_t lock_lf_var;
+
+    struct {
+        uint32_t LD;     /*  load pending bit        */
+        uint32_t SH;     /*  self halt               */
+        uint32_t BH;     /*  breakpoint halt         */
+        uint32_t UB;     /*  user mode break enabled */
+        uint32_t ZZ;     /*  sleep mode              */
+        uint32_t RA;     /*  reset applied           */
+        uint32_t IS;     /*  single instruction step */
+        uint32_t FH;     /*  force halt              */
+        uint32_t SS;     /*  single step             */
+    } debug;
+
+#define TMR_IE  (1 << 0)
+#define TMR_NH  (1 << 1)
+#define TMR_W   (1 << 2)
+#define TMR_IP  (1 << 3)
+#define TMR_PD  (1 << 4)
+    arc_timer_t timer[2];    /* ARC CPU-Timer 0/1 */
+
+    arc_irq_t irq_bank[256]; /* IRQ register bank */
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
+    /* Fields after this point are preserved across CPU reset. */
+    uint64_t features;
+    uint32_t family;
+
+    uint32_t freq_hz; /* CPU frequency in hz, needed for timers. */
+    uint64_t last_clk_rtc;
+
+    void *irq[256];
+    QEMUTimer *cpu_timer[2]; /* Internal timer. */
+    QEMUTimer *cpu_rtc;      /* Internal RTC. */
+
+    /* Build AUX regs. */
+#define TIMER0_IRQ 16
+#define TIMER1_IRQ 17
+#define TB_T0  (1 << 8)
+#define TB_T1  (1 << 9)
+#define TB_RTC (1 << 10)
+#define TB_P0_MSK (0x0f0000)
+#define TB_P1_MSK (0xf00000)
+    uint32_t timer_build;   /* Timer configuration AUX register. */
+    uint32_t irq_build;     /* Interrupt Build Configuration Register. */
+    uint32_t vecbase_build; /* Interrupt Vector Base Address Configuration. */
+    uint32_t mpy_build;     /* Multiply configuration register. */
+    uint32_t isa_config;    /* Instruction Set Configuration Register. */
+
+    const struct arc_boot_info *boot_info;
+} CPUARCState;
+
+/*
+ * ArcCPU:
+ * @env: #CPUMBState
+ *
+ * An ARC CPU.
+ */
+struct ARCCPU {
+  /*< private >*/
+  CPUState parent_obj;
+
+  /*< public >*/
+
+  /* ARC Configuration Settings. */
+  struct {
+    uint32_t addr_size;
+    bool     aps_feature;
+    bool     byte_order;
+    bool     bitscan_option;
+    uint32_t br_bc_entries;
+    uint32_t br_pt_entries;
+    bool     br_bc_full_tag;
+    uint8_t  br_rs_entries;
+    uint32_t br_bc_tag_size;
+    uint8_t  br_tosq_entries;
+    uint8_t  br_fb_entries;
+    bool     code_density;
+    bool     code_protect;
+    uint8_t  dccm_mem_cycles;
+    bool     dccm_posedge;
+    uint8_t  dccm_mem_bancks;
+    uint8_t  dc_mem_cycles;
+    bool     dc_posedge;
+    bool     dmp_unaligned;
+    bool     ecc_exception;
+    uint32_t external_interrupts;
+    uint8_t  ecc_option;
+    bool     firq_option;
+    bool     fpu_dp_option;
+    bool     fpu_fma_option;
+    bool     fpu_div_option;
+    bool     has_actionpoints;
+    bool     has_fpu;
+    bool     has_interrupts;
+    bool     has_mmu;
+    bool     has_mpu;
+    bool     has_timer_0;
+    bool     has_timer_1;
+    bool     has_pct;
+    bool     has_rtt;
+    bool     has_smart;
+    uint32_t intvbase_preset;
+    uint32_t lpc_size;
+    uint8_t  mpu_num_regions;
+    uint8_t  mpy_option;
+    uint32_t mmu_page_size_sel0;
+    uint32_t mmu_page_size_sel1;
+    uint32_t mmu_pae_enabled;
+    uint32_t ntlb_num_entries;
+    uint32_t num_actionpoints;
+    uint32_t number_of_interrupts;
+    uint32_t number_of_levels;
+    uint32_t pct_counters;
+    uint32_t pct_interrupt;
+    uint32_t pc_size;
+    uint32_t rgf_num_regs;
+    uint32_t rgf_banked_regs;
+    uint32_t rgf_num_banks;
+    bool     rtc_option;
+    uint32_t rtt_feature_level;
+    bool     stack_checking;
+    bool     swap_option;
+    uint32_t smar_stack_entries;
+    uint32_t smart_implementation;
+    uint32_t stlb_num_entries;
+    uint32_t slc_size;
+    uint32_t slc_line_size;
+    uint32_t slc_ways;
+    uint32_t slc_tag_banks;
+    uint32_t slc_tram_delay;
+    uint32_t slc_dbank_width;
+    uint32_t slc_data_banks;
+    uint32_t slc_dram_delay;
+    bool     slc_mem_bus_width;
+    uint32_t slc_ecc_option;
+    bool     slc_data_halfcycle_steal;
+    bool     slc_data_add_pre_pipeline;
+    bool     uaux_option;
+    uint32_t freq_hz; /* CPU frequency in hz, needed for timers. */
+  } cfg;
+
+  CPUNegativeOffsetState neg;
+  CPUARCState env;
+};
+
+/* are we in user mode? */
+static inline bool is_user_mode(const CPUARCState *env)
+{
+    return env->stat.Uf != false;
+}
+
+static inline int arc_feature(const CPUARCState *env, int feature)
+{
+    return (env->features & (1U << feature)) != 0;
+}
+
+static inline void  arc_set_feature(CPUARCState *env, int feature)
+{
+    env->features |= (1U << feature);
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
+    return env->stat.Uf != 0 ? 1 : 0;
+}
+
+static inline void cpu_get_tb_cpu_state(CPUARCState *env, target_ulong *pc,
+                                        target_ulong *cs_base,
+                                        uint32_t *pflags)
+{
+    *pc = env->pc;
+    *cs_base = 0;
+#ifdef CONFIG_USER_ONLY
+    *pflags = TB_FLAGS_FP_ENABLE;
+#else
+    *pflags = cpu_mmu_index(env, 0);
+#endif
+}
+
+static inline int cpu_interrupts_enabled(const CPUARCState *env)
+{
+    return env->stat.IEf;
+}
+
+void arc_translate_init(void);
+
+void arc_cpu_list(void);
+int cpu_arc_exec(CPUState *cpu);
+int cpu_arc_signal_handler(int host_signum, void *pinfo, void *puc);
+bool arc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
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
+#include "exec/cpu-all.h"
+
+#endif /* !defined (CPU_ARC_H) */
diff --git a/target/arc/internals.h b/target/arc/internals.h
new file mode 100644
index 0000000000..ee054e186a
--- /dev/null
+++ b/target/arc/internals.h
@@ -0,0 +1,38 @@
+/*
+ * QEMU ARC CPU -- internal functions
+ *
+ * Copyright (c) 2019 Synopsys Inc
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
+ *
+ */
+
+/*
+ * This header shares funtions prototypes between codes in
+ * target/arc/ that must remain private to it and not to be
+ * used by QEMU itself.
+ */
+
+#ifndef TARGET_ARC_INTERNALS_H
+#define TARGET_ARC_INTERNALS_H
+
+#include "cpu.h"
+
+/* add auxiliary registers to set of supported registers for GDB */
+void arc_cpu_register_gdb_regs_for_features(ARCCPU *cpu);
+
+/* these are the helper functions used both by translation and gdbstub */
+target_ulong helper_lr(CPUARCState *env, uint32_t aux);
+void helper_sr(CPUARCState *env, uint32_t val, uint32_t aux);
+
+#endif
diff --git a/target/arc/meson.build b/target/arc/meson.build
new file mode 100644
index 0000000000..67f1e4bfa2
--- /dev/null
+++ b/target/arc/meson.build
@@ -0,0 +1,20 @@
+arc_softmmu_ss = ss.source_set()
+arc_softmmu_ss.add(files(
+  'translate.c',
+  'helper.c',
+  'cpu.c',
+  'op_helper.c',
+  'gdbstub.c',
+  'decoder.c',
+  'regs.c',
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


