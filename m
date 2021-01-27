Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AAC3053B1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 07:57:37 +0100 (CET)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4elk-0005sC-SB
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 01:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4eiu-0003wJ-B6
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:40 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l4eir-0000td-QZ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:54:40 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 603835807F7;
 Wed, 27 Jan 2021 01:54:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 27 Jan 2021 01:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=KF48BcL0Lkxiu
 fOczUfhrPJ/QDv9U3ZMBm/po/I0rKg=; b=Rf9XlJGLzEHRPfkLZN+dWqa4cBHJ3
 H+jhR2S6kPakE+2yQbZXsLZxvizsdHUdQJb1TLFxmjpLfuC8mC/JIob9W/qq/CbA
 rZe+YJtBaJ0CYV0KZv2Bdc7MGVrHXF9RJaYA9D3lQRM80wa7KLDIv1E9Voi0hHNu
 uibC+Aw1xXFIrhIhmmRFqHe6Zz3IfCbi1FcQXzvVBzi3tR76V7JIZWkJf1LXF5LY
 657Jcs9lWU+ehlFcn6IGdzoOwCOikQc4qVjYuobMjfYQJ2BjtyoI0OzNsn2r7/QB
 ZxBDw53xBUsbOpB0K9Weuk+0Rbu8YMXaF8lf3CYAFZMiz6cacEzHb8atQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=KF48BcL0LkxiufOczUfhrPJ/QDv9U3ZMBm/po/I0rKg=; b=lhIjlMe8
 W3c4THSRKzT9uq4isSEwHYG5oO16tVYLSrkVG1XgvHfmT3YcMlp3mIhRp1k/+lWR
 3kSKAIy6UdkF4bzFnV43DK0nQRo98WQlqGhPFMCeQVMS4Hziz8XwssdvabcENs0s
 1a2GyQPGrEGK9zWZZL+aS9hhwKLbttcTbtndoZpQM30+sFm1CiInFauJOLXoI+hG
 GhvmGeVZeacj6qhsDumBgt2l0AdAx0MB3L9ebbQi4kq0MaRGs443hqjjpoVd57jg
 2kB9N5uomi0hX5QXHBfs/UtnMn6P4N7t3M7XNlE/JanUjq9TTq6Ncnen0YGG4pEO
 NzInJoQQcPgBhw==
X-ME-Sender: <xms:LA4RYG5ZQ-bJqw_O6kL8BHcCsd2CqRs5iuC0-WfRJiceSH2sGZ7zkg>
 <xme:LA4RYP4DZKrQux9hmg_9edg5fCjQQrgbiRNv6VvWFnLpcWw_OUF2GvE8O6zdY-k5N
 nXst2-ZG0rZcp-O9oo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
 udetgfdtffeunecukfhppeduudehrdduleejrddvvdegrddvvdefnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:LA4RYFc_tFHfT4to-XYQD8iiSO8VO0AQ4a7KfLL9EtC1mB1pJLTpaA>
 <xmx:LA4RYDKOvtV5CIUjK6_JDU8mUDSxQLBuKU1CEteuHdBzNjCB9pM6qA>
 <xmx:LA4RYKI7P-R0ZNLm28BCvksUUB97voiE5elRBy0pd12lSnK1jShPMA>
 <xmx:LA4RYPE-AdISu5QehpLJtKkH2iISTtdkS7AkbuktdRGU1BbuAc0jUw>
Received: from strike.202.net.flygoat.com (unknown [115.197.224.223])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0875240066;
 Wed, 27 Jan 2021 01:54:33 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] hw/mips: Add a bootloader helper
Date: Wed, 27 Jan 2021 14:54:21 +0800
Message-Id: <20210127065424.114125-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
References: <20210127065424.114125-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a bootloader helper to generate simple bootloaders for kernel.
It can help us reduce inline hex hack and also keep MIPS release 6
compatibility easier.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 include/hw/mips/bootloader.h |  49 +++++++++++
 hw/mips/bootloader.c         | 164 +++++++++++++++++++++++++++++++++++
 hw/mips/meson.build          |   2 +-
 3 files changed, 214 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/mips/bootloader.h
 create mode 100644 hw/mips/bootloader.c

diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
new file mode 100644
index 0000000000..2a0e1a11c9
--- /dev/null
+++ b/include/hw/mips/bootloader.h
@@ -0,0 +1,49 @@
+#ifndef HW_MIPS_BOOTLOADER_H
+#define HW_MIPS_BOOTLOADER_H
+
+#include "exec/cpu-defs.h"
+
+void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
+void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
+                        target_ulong a1, target_ulong a2, target_ulong a3,
+                        target_ulong kernel_addr);
+void bl_gen_write_ulong(uint32_t **p, target_ulong val, target_ulong addr);
+void bl_gen_write_u32(uint32_t **p, uint32_t val, target_ulong addr);
+void bl_gen_write_u64(uint32_t **p, uint64_t val, target_ulong addr);
+
+typedef enum bl_reg {
+    BL_REG_ZERO = 0,
+    BL_REG_AT = 1,
+    BL_REG_V0 = 2,
+    BL_REG_V1 = 3,
+    BL_REG_A0 = 4,
+    BL_REG_A1 = 5,
+    BL_REG_A2 = 6,
+    BL_REG_A3 = 7,
+    BL_REG_T0 = 8,
+    BL_REG_T1 = 9,
+    BL_REG_T2 = 10,
+    BL_REG_T3 = 11,
+    BL_REG_T4 = 12,
+    BL_REG_T5 = 13,
+    BL_REG_T6 = 14,
+    BL_REG_T7 = 15,
+    BL_REG_S0 = 16,
+    BL_REG_S1 = 17,
+    BL_REG_S2 = 18,
+    BL_REG_S3 = 19,
+    BL_REG_S4 = 20,
+    BL_REG_S5 = 21,
+    BL_REG_S6 = 22,
+    BL_REG_S7 = 23,
+    BL_REG_T8 = 24,
+    BL_REG_T9 = 25,
+    BL_REG_K0 = 26,
+    BL_REG_K1 = 27,
+    BL_REG_GP = 28,
+    BL_REG_SP = 29,
+    BL_REG_FP = 30,
+    BL_REG_RA = 31,
+} bl_reg;
+
+#endif
diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
new file mode 100644
index 0000000000..8989db870e
--- /dev/null
+++ b/hw/mips/bootloader.c
@@ -0,0 +1,164 @@
+/*
+ * Utility for QEMU MIPS to generate it's simple bootloader
+ *
+ * Instructions used here are carefully selected to keep compatibility with
+ * MIPS Release 6.
+ *
+ * Copyright (C) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "cpu.h"
+#include "hw/mips/bootloader.h"
+
+/* Base types */
+static void bl_gen_nop(uint32_t **p)
+{
+    stl_p(*p, 0);
+    *p = *p + 1;
+}
+
+static void bl_gen_r_type(uint32_t **p, uint8_t opcode, bl_reg rs, bl_reg rt,
+                            bl_reg rd, uint8_t shift, uint8_t funct)
+{
+    uint32_t insn = 0;
+
+    insn = deposit32(insn, 26, 6, opcode);
+    insn = deposit32(insn, 21, 5, rs);
+    insn = deposit32(insn, 16, 5, rt);
+    insn = deposit32(insn, 11, 5, rd);
+    insn = deposit32(insn, 6, 5, shift);
+    insn = deposit32(insn, 0, 6, funct);
+
+    stl_p(*p, insn);
+    *p = *p + 1;
+}
+
+static void bl_gen_i_type(uint32_t **p, uint8_t opcode, bl_reg rs, bl_reg rt,
+                            uint16_t imm)
+{
+    uint32_t insn = 0;
+
+    insn = deposit32(insn, 26, 6, opcode);
+    insn = deposit32(insn, 21, 5, rs);
+    insn = deposit32(insn, 16, 5, rt);
+    insn = deposit32(insn, 0, 16, imm);
+
+    stl_p(*p, insn);
+    *p = *p + 1;
+}
+
+static bool bootcpu_supports_isa(uint64_t isa_mask)
+{
+    return cpu_supports_isa(&MIPS_CPU(first_cpu)->env, isa_mask);
+}
+
+/* Single instructions */
+static void bl_gen_dsll(uint32_t **p, bl_reg rd, bl_reg rt, uint8_t sa)
+{
+    if (bootcpu_supports_isa(ISA_MIPS3)) {
+        bl_gen_r_type(p, 0, 0, rt, rd, sa, 0x38);
+    } else {
+        g_assert_not_reached(); /* unsupported */
+    }
+}
+
+static void bl_gen_jalr(uint32_t **p, bl_reg rs)
+{
+    bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x9);
+}
+
+static void bl_gen_lui(uint32_t **p, bl_reg rt, uint16_t imm)
+{
+    /* R6: It's a alias of AUI with RS = 0 */
+    bl_gen_i_type(p, 0xf, 0, rt, imm);
+}
+
+static void bl_gen_ori(uint32_t **p, bl_reg rt, bl_reg rs, uint16_t imm)
+{
+    bl_gen_i_type(p, 0xd, rs, rt, imm);
+}
+
+static void bl_gen_sw(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
+{
+    bl_gen_i_type(p, 0x2b, base, rt, offset);
+}
+
+static void bl_gen_sd(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
+{
+    if (bootcpu_supports_isa(ISA_MIPS3)) {
+        bl_gen_i_type(p, 0x3f, base, rt, offset);
+    } else {
+        g_assert_not_reached(); /* unsupported */
+    }
+}
+
+/* Pseudo instructions */
+static void bl_gen_li(uint32_t **p, bl_reg rt, uint32_t imm)
+{
+    bl_gen_lui(p, rt, extract32(imm, 16, 16));
+    bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+}
+
+static void bl_gen_dli(uint32_t **p, bl_reg rt, uint64_t imm)
+{
+    bl_gen_li(p, rt, extract64(imm, 32, 32));
+    bl_gen_dsll(p, rt, rt, 16);
+    bl_gen_ori(p, rt, rt, extract64(imm, 16, 16));
+    bl_gen_dsll(p, rt, rt, 16);
+    bl_gen_ori(p, rt, rt, extract64(imm, 0, 16));
+}
+
+static void bl_gen_load_ulong(uint32_t **p, bl_reg rt, target_ulong imm)
+{
+    if (bootcpu_supports_isa(ISA_MIPS3)) {
+        bl_gen_dli(p, rt, imm); /* 64bit */
+    } else {
+        bl_gen_li(p, rt, imm); /* 32bit */
+    }
+}
+
+/* Helpers */
+void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr)
+{
+    bl_gen_load_ulong(p, BL_REG_T9, jump_addr);
+    bl_gen_jalr(p, BL_REG_T9);
+    bl_gen_nop(p); /* delay slot */
+}
+
+void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
+                        target_ulong a1, target_ulong a2, target_ulong a3,
+                        target_ulong kernel_addr)
+{
+    bl_gen_load_ulong(p, BL_REG_SP, sp);
+    bl_gen_load_ulong(p, BL_REG_A0, a0);
+    bl_gen_load_ulong(p, BL_REG_A1, a1);
+    bl_gen_load_ulong(p, BL_REG_A2, a2);
+    bl_gen_load_ulong(p, BL_REG_A3, a3);
+
+    bl_gen_jump_to(p, kernel_addr);
+}
+
+void bl_gen_write_ulong(uint32_t **p, target_ulong val, target_ulong addr)
+{
+    bl_gen_load_ulong(p, BL_REG_K0, val);
+    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+}
+
+void bl_gen_write_u32(uint32_t **p, uint32_t val, target_ulong addr)
+{
+    bl_gen_li(p, BL_REG_K0, val);
+    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
+}
+
+void bl_gen_write_u64(uint32_t **p, uint64_t val, target_ulong addr)
+{
+    bl_gen_dli(p, BL_REG_K0, val);
+    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+}
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index ee19cc204d..1195716dc7 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,5 +1,5 @@
 mips_ss = ss.source_set()
-mips_ss.add(files('mips_int.c'))
+mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
-- 
2.30.0


