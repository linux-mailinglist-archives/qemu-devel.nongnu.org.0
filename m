Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640B4B8323
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:42:59 +0100 (CET)
Received: from localhost ([::1]:33286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFto-0006hD-VM
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:42:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqs-0007Ih-JC
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:47 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:31690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqo-0006sh-36
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993102; x=1676529102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EiyvgfbagJ6HRNgqUAOH8zrdTRnY4SzBgJ0HFiL3b7o=;
 b=WbFGsZS+O5goUZ6kRjjC4SR/0xmo9jld4TO+Pmsv/tkgIRF00swi26lu
 QshFZCVOaF9yrOYzmoNFmd2FJBqn7iIHF5JHXevM5cZaUXAUmOPlxYlvD
 N7dDWc0pxFrzGDUWpggaY2p90rF+ZLrlSonEPuXiJZymkjFvYF6MHXflX
 AzP1++mviw/xenG/f1mbnFB7aTVpopl2Tx0j9Im4wD1Ee9n5JecOEdsjJ
 IU0xW6DJZXaeCNAyZKZLDDm861ylzd8VSw40NY9ueT1Y/ooy/w9lKSZ8U
 Yvk9m9sciqZZYI7WQTKoPk3CW0/+q5WD9Xe+UgprYCYrsFxILdhsDBGkH g==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="304974648"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:40 +0800
IronPort-SDR: k0FhRUukTsbYShRE9iRFYkvYjtwePLDd60Q5Mm8vBy6uBvww6bPRachJOCnjE9k+08efWHgIV8
 91Wfe6umKUjPt0A5Ldpgjb8EOuixiBe+B3MrAgvGyejku3xgmcfNeLVy37VMqFiM0VAM9UHjsd
 m8IuTdxDwOVLaqYmqrXKNW8t6YGcV3gY6NrMUyeOgv5sEtlX0OngyNoA9cMg9ezMnM95aVleNn
 JBBmo3FDEDfFJVP9L+gzfHQAfQ4sRzm7FBTxs8q8IeZWsziqvtAJqIG7CHAfos3X4E4x61Q605
 HpC9NMtAlbFbaE60y7pkQZHe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:20 -0800
IronPort-SDR: 76513R7Jm07WFuVmauOOQ04Ck2X4k9pzdNpYhyHUIn6YKOdXTvh+16xXdwCyDVW84aJTdtweNI
 WtPP51Hd6x3unxGliDTVqtLE2HxaZ0RFnNmrzFVc6afyBEh/xcQ+EZcUYhH0da6IZSxct3Kh9T
 5/s2kJWf7GLs3RW4bqBYfYadjb3Na+KiZPLKGHJVq1bZBBZnJWyJlFO5jmjq2v2IiMDaD9PEyM
 9qLsNesjoQVk1zsuBK0brXwpqORIllcIQYWyZF1YYjxiRt92L5B7AxaLo7LpOI8r2HKC7gl7/Z
 2r0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Qh0tH1z1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993097; x=1647585098; bh=EiyvgfbagJ6HRNgqUA
 OH8zrdTRnY4SzBgJ0HFiL3b7o=; b=esMzKMqNW2yPDY4vjhxORGSb8YAINsofGi
 h2Fh3yL/E6NR1H27faUY3H0UhdmJkMupdyriBOBDm47GebL5xjRoVgMZY83yDrbb
 99KGZK7FI3EqIDwjXd3L5nsDp+H8ONpa2uTH3fFp7AmntDCuHb4xrzkA5tjPlqa/
 Ak4fm/aBHf74FG2sv+jQuApGkKPbPO6lYU7J5FC22WAy4yWdCEl2B9eWexCb8ibn
 OOaY+/A4BRFFcyi/i9Ygjj9DhGLW5Sl2oAZTgJyFtvxoCz9UMfLzp4eeJloz8jR9
 V790OcUK3K5yYG2RZn3gE/eopRovq60NcpWoZmaGSk8+6sVXEPMw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BC68kJQ7DlZN for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:37 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7QX6QPdz1Rwrw;
 Tue, 15 Feb 2022 22:31:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 29/35] hw/intc: Add RISC-V AIA APLIC device emulation
Date: Wed, 16 Feb 2022 16:29:06 +1000
Message-Id: <20220216062912.319738-30-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Anup Patel <anup.patel@wdc.com>

The RISC-V AIA (Advanced Interrupt Architecture) defines a new
interrupt controller for wired interrupts called APLIC (Advanced
Platform Level Interrupt Controller). The APLIC is capabable of
forwarding wired interupts to RISC-V HARTs directly or as MSIs
(Message Signaled Interupts).

This patch adds device emulation for RISC-V AIA APLIC.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-19-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/riscv_aplic.h |  79 +++
 hw/intc/riscv_aplic.c         | 978 ++++++++++++++++++++++++++++++++++
 hw/intc/Kconfig               |   3 +
 hw/intc/meson.build           |   1 +
 4 files changed, 1061 insertions(+)
 create mode 100644 include/hw/intc/riscv_aplic.h
 create mode 100644 hw/intc/riscv_aplic.c

diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.=
h
new file mode 100644
index 0000000000..de8532fbc3
--- /dev/null
+++ b/include/hw/intc/riscv_aplic.h
@@ -0,0 +1,79 @@
+/*
+ * RISC-V APLIC (Advanced Platform Level Interrupt Controller) interface
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RISCV_APLIC_H
+#define HW_RISCV_APLIC_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_RISCV_APLIC "riscv.aplic"
+
+typedef struct RISCVAPLICState RISCVAPLICState;
+DECLARE_INSTANCE_CHECKER(RISCVAPLICState, RISCV_APLIC, TYPE_RISCV_APLIC)
+
+#define APLIC_MIN_SIZE            0x4000
+#define APLIC_SIZE_ALIGN(__x)     (((__x) + (APLIC_MIN_SIZE - 1)) & \
+                                   ~(APLIC_MIN_SIZE - 1))
+#define APLIC_SIZE(__num_harts)   (APLIC_MIN_SIZE + \
+                                   APLIC_SIZE_ALIGN(32 * (__num_harts)))
+
+struct RISCVAPLICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    qemu_irq *external_irqs;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t bitfield_words;
+    uint32_t domaincfg;
+    uint32_t mmsicfgaddr;
+    uint32_t mmsicfgaddrH;
+    uint32_t smsicfgaddr;
+    uint32_t smsicfgaddrH;
+    uint32_t genmsi;
+    uint32_t *sourcecfg;
+    uint32_t *state;
+    uint32_t *target;
+    uint32_t *idelivery;
+    uint32_t *iforce;
+    uint32_t *ithreshold;
+
+    /* topology */
+#define QEMU_APLIC_MAX_CHILDREN        16
+    struct RISCVAPLICState *parent;
+    struct RISCVAPLICState *children[QEMU_APLIC_MAX_CHILDREN];
+    uint16_t num_children;
+
+    /* config */
+    uint32_t aperture_size;
+    uint32_t hartid_base;
+    uint32_t num_harts;
+    uint32_t iprio_mask;
+    uint32_t num_irqs;
+    bool msimode;
+    bool mmode;
+};
+
+void riscv_aplic_add_child(DeviceState *parent, DeviceState *child);
+
+DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
+    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent);
+
+#endif
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
new file mode 100644
index 0000000000..e7809fb6b2
--- /dev/null
+++ b/hw/intc/riscv_aplic.c
@@ -0,0 +1,978 @@
+/*
+ * RISC-V APLIC (Advanced Platform Level Interrupt Controller)
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/error-report.h"
+#include "qemu/bswap.h"
+#include "exec/address-spaces.h"
+#include "hw/sysbus.h"
+#include "hw/pci/msi.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "hw/intc/riscv_aplic.h"
+#include "hw/irq.h"
+#include "target/riscv/cpu.h"
+#include "sysemu/sysemu.h"
+#include "migration/vmstate.h"
+
+#define APLIC_MAX_IDC                  (1UL << 14)
+#define APLIC_MAX_SOURCE               1024
+#define APLIC_MIN_IPRIO_BITS           1
+#define APLIC_MAX_IPRIO_BITS           8
+#define APLIC_MAX_CHILDREN             1024
+
+#define APLIC_DOMAINCFG                0x0000
+#define APLIC_DOMAINCFG_RDONLY         0x80000000
+#define APLIC_DOMAINCFG_IE             (1 << 8)
+#define APLIC_DOMAINCFG_DM             (1 << 2)
+#define APLIC_DOMAINCFG_BE             (1 << 0)
+
+#define APLIC_SOURCECFG_BASE           0x0004
+#define APLIC_SOURCECFG_D              (1 << 10)
+#define APLIC_SOURCECFG_CHILDIDX_MASK  0x000003ff
+#define APLIC_SOURCECFG_SM_MASK        0x00000007
+#define APLIC_SOURCECFG_SM_INACTIVE    0x0
+#define APLIC_SOURCECFG_SM_DETACH      0x1
+#define APLIC_SOURCECFG_SM_EDGE_RISE   0x4
+#define APLIC_SOURCECFG_SM_EDGE_FALL   0x5
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH  0x6
+#define APLIC_SOURCECFG_SM_LEVEL_LOW   0x7
+
+#define APLIC_MMSICFGADDR              0x1bc0
+#define APLIC_MMSICFGADDRH             0x1bc4
+#define APLIC_SMSICFGADDR              0x1bc8
+#define APLIC_SMSICFGADDRH             0x1bcc
+
+#define APLIC_xMSICFGADDRH_L           (1UL << 31)
+#define APLIC_xMSICFGADDRH_HHXS_MASK   0x1f
+#define APLIC_xMSICFGADDRH_HHXS_SHIFT  24
+#define APLIC_xMSICFGADDRH_LHXS_MASK   0x7
+#define APLIC_xMSICFGADDRH_LHXS_SHIFT  20
+#define APLIC_xMSICFGADDRH_HHXW_MASK   0x7
+#define APLIC_xMSICFGADDRH_HHXW_SHIFT  16
+#define APLIC_xMSICFGADDRH_LHXW_MASK   0xf
+#define APLIC_xMSICFGADDRH_LHXW_SHIFT  12
+#define APLIC_xMSICFGADDRH_BAPPN_MASK  0xfff
+
+#define APLIC_xMSICFGADDR_PPN_SHIFT    12
+
+#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
+    ((1UL << (__lhxs)) - 1)
+
+#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
+    ((1UL << (__lhxw)) - 1)
+#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
+    ((__lhxs))
+#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
+    (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
+     APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
+
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
+    ((1UL << (__hhxw)) - 1)
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
+    ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
+#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
+    (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
+     APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
+
+#define APLIC_xMSICFGADDRH_VALID_MASK   \
+    (APLIC_xMSICFGADDRH_L | \
+     (APLIC_xMSICFGADDRH_HHXS_MASK << APLIC_xMSICFGADDRH_HHXS_SHIFT) | \
+     (APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
+     (APLIC_xMSICFGADDRH_HHXW_MASK << APLIC_xMSICFGADDRH_HHXW_SHIFT) | \
+     (APLIC_xMSICFGADDRH_LHXW_MASK << APLIC_xMSICFGADDRH_LHXW_SHIFT) | \
+     APLIC_xMSICFGADDRH_BAPPN_MASK)
+
+#define APLIC_SETIP_BASE               0x1c00
+#define APLIC_SETIPNUM                 0x1cdc
+
+#define APLIC_CLRIP_BASE               0x1d00
+#define APLIC_CLRIPNUM                 0x1ddc
+
+#define APLIC_SETIE_BASE               0x1e00
+#define APLIC_SETIENUM                 0x1edc
+
+#define APLIC_CLRIE_BASE               0x1f00
+#define APLIC_CLRIENUM                 0x1fdc
+
+#define APLIC_SETIPNUM_LE              0x2000
+#define APLIC_SETIPNUM_BE              0x2004
+
+#define APLIC_ISTATE_PENDING           (1U << 0)
+#define APLIC_ISTATE_ENABLED           (1U << 1)
+#define APLIC_ISTATE_ENPEND            (APLIC_ISTATE_ENABLED | \
+                                        APLIC_ISTATE_PENDING)
+#define APLIC_ISTATE_INPUT             (1U << 8)
+
+#define APLIC_GENMSI                   0x3000
+
+#define APLIC_TARGET_BASE              0x3004
+#define APLIC_TARGET_HART_IDX_SHIFT    18
+#define APLIC_TARGET_HART_IDX_MASK     0x3fff
+#define APLIC_TARGET_GUEST_IDX_SHIFT   12
+#define APLIC_TARGET_GUEST_IDX_MASK    0x3f
+#define APLIC_TARGET_IPRIO_MASK        0xff
+#define APLIC_TARGET_EIID_MASK         0x7ff
+
+#define APLIC_IDC_BASE                 0x4000
+#define APLIC_IDC_SIZE                 32
+
+#define APLIC_IDC_IDELIVERY            0x00
+
+#define APLIC_IDC_IFORCE               0x04
+
+#define APLIC_IDC_ITHRESHOLD           0x08
+
+#define APLIC_IDC_TOPI                 0x18
+#define APLIC_IDC_TOPI_ID_SHIFT        16
+#define APLIC_IDC_TOPI_ID_MASK         0x3ff
+#define APLIC_IDC_TOPI_PRIO_MASK       0xff
+
+#define APLIC_IDC_CLAIMI               0x1c
+
+static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
+                                            uint32_t word)
+{
+    uint32_t i, irq, ret =3D 0;
+
+    for (i =3D 0; i < 32; i++) {
+        irq =3D word * 32 + i;
+        if (!irq || aplic->num_irqs <=3D irq) {
+            continue;
+        }
+
+        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0) << i=
;
+    }
+
+    return ret;
+}
+
+static uint32_t riscv_aplic_read_pending_word(RISCVAPLICState *aplic,
+                                              uint32_t word)
+{
+    uint32_t i, irq, ret =3D 0;
+
+    for (i =3D 0; i < 32; i++) {
+        irq =3D word * 32 + i;
+        if (!irq || aplic->num_irqs <=3D irq) {
+            continue;
+        }
+
+        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_PENDING) ? 1 : 0) <<=
 i;
+    }
+
+    return ret;
+}
+
+static void riscv_aplic_set_pending_raw(RISCVAPLICState *aplic,
+                                        uint32_t irq, bool pending)
+{
+    if (pending) {
+        aplic->state[irq] |=3D APLIC_ISTATE_PENDING;
+    } else {
+        aplic->state[irq] &=3D ~APLIC_ISTATE_PENDING;
+    }
+}
+
+static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
+                                    uint32_t irq, bool pending)
+{
+    uint32_t sourcecfg, sm;
+
+    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
+        return;
+    }
+
+    sourcecfg =3D aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        return;
+    }
+
+    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
+    if ((sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) ||
+        ((!aplic->msimode || (aplic->msimode && !pending)) &&
+         ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
+          (sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW)))) {
+        return;
+    }
+
+    riscv_aplic_set_pending_raw(aplic, irq, pending);
+}
+
+static void riscv_aplic_set_pending_word(RISCVAPLICState *aplic,
+                                         uint32_t word, uint32_t value,
+                                         bool pending)
+{
+    uint32_t i, irq;
+
+    for (i =3D 0; i < 32; i++) {
+        irq =3D word * 32 + i;
+        if (!irq || aplic->num_irqs <=3D irq) {
+            continue;
+        }
+
+        if (value & (1U << i)) {
+            riscv_aplic_set_pending(aplic, irq, pending);
+        }
+    }
+}
+
+static uint32_t riscv_aplic_read_enabled_word(RISCVAPLICState *aplic,
+                                              int word)
+{
+    uint32_t i, irq, ret =3D 0;
+
+    for (i =3D 0; i < 32; i++) {
+        irq =3D word * 32 + i;
+        if (!irq || aplic->num_irqs <=3D irq) {
+            continue;
+        }
+
+        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_ENABLED) ? 1 : 0) <<=
 i;
+    }
+
+    return ret;
+}
+
+static void riscv_aplic_set_enabled_raw(RISCVAPLICState *aplic,
+                                        uint32_t irq, bool enabled)
+{
+    if (enabled) {
+        aplic->state[irq] |=3D APLIC_ISTATE_ENABLED;
+    } else {
+        aplic->state[irq] &=3D ~APLIC_ISTATE_ENABLED;
+    }
+}
+
+static void riscv_aplic_set_enabled(RISCVAPLICState *aplic,
+                                    uint32_t irq, bool enabled)
+{
+    uint32_t sourcecfg, sm;
+
+    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
+        return;
+    }
+
+    sourcecfg =3D aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        return;
+    }
+
+    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
+    if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {
+        return;
+    }
+
+    riscv_aplic_set_enabled_raw(aplic, irq, enabled);
+}
+
+static void riscv_aplic_set_enabled_word(RISCVAPLICState *aplic,
+                                         uint32_t word, uint32_t value,
+                                         bool enabled)
+{
+    uint32_t i, irq;
+
+    for (i =3D 0; i < 32; i++) {
+        irq =3D word * 32 + i;
+        if (!irq || aplic->num_irqs <=3D irq) {
+            continue;
+        }
+
+        if (value & (1U << i)) {
+            riscv_aplic_set_enabled(aplic, irq, enabled);
+        }
+    }
+}
+
+static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
+                                 uint32_t hart_idx, uint32_t guest_idx,
+                                 uint32_t eiid)
+{
+    uint64_t addr;
+    MemTxResult result;
+    RISCVAPLICState *aplic_m;
+    uint32_t lhxs, lhxw, hhxs, hhxw, group_idx, msicfgaddr, msicfgaddrH;
+
+    aplic_m =3D aplic;
+    while (aplic_m && !aplic_m->mmode) {
+        aplic_m =3D aplic_m->parent;
+    }
+    if (!aplic_m) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: m-level APLIC not found\n",
+                      __func__);
+        return;
+    }
+
+    if (aplic->mmode) {
+        msicfgaddr =3D aplic_m->mmsicfgaddr;
+        msicfgaddrH =3D aplic_m->mmsicfgaddrH;
+    } else {
+        msicfgaddr =3D aplic_m->smsicfgaddr;
+        msicfgaddrH =3D aplic_m->smsicfgaddrH;
+    }
+
+    lhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
+            APLIC_xMSICFGADDRH_LHXS_MASK;
+    lhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXW_SHIFT) &
+            APLIC_xMSICFGADDRH_LHXW_MASK;
+    hhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXS_SHIFT) &
+            APLIC_xMSICFGADDRH_HHXS_MASK;
+    hhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
+            APLIC_xMSICFGADDRH_HHXW_MASK;
+
+    group_idx =3D hart_idx >> lhxw;
+    hart_idx &=3D APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
+
+    addr =3D msicfgaddr;
+    addr |=3D ((uint64_t)(msicfgaddrH & APLIC_xMSICFGADDRH_BAPPN_MASK)) =
<< 32;
+    addr |=3D ((uint64_t)(group_idx & APLIC_xMSICFGADDR_PPN_HHX_MASK(hhx=
w))) <<
+             APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs);
+    addr |=3D ((uint64_t)(hart_idx & APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw=
))) <<
+             APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs);
+    addr |=3D (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs));
+    addr <<=3D APLIC_xMSICFGADDR_PPN_SHIFT;
+
+    address_space_stl_le(&address_space_memory, addr,
+                         eiid, MEMTXATTRS_UNSPECIFIED, &result);
+    if (result !=3D MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: MSI write failed for "
+                      "hart_index=3D%d guest_index=3D%d eiid=3D%d\n",
+                      __func__, hart_idx, guest_idx, eiid);
+    }
+}
+
+static void riscv_aplic_msi_irq_update(RISCVAPLICState *aplic, uint32_t =
irq)
+{
+    uint32_t hart_idx, guest_idx, eiid;
+
+    if (!aplic->msimode || (aplic->num_irqs <=3D irq) ||
+        !(aplic->domaincfg & APLIC_DOMAINCFG_IE)) {
+        return;
+    }
+
+    if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=3D APLIC_ISTATE_ENPE=
ND) {
+        return;
+    }
+
+    riscv_aplic_set_pending_raw(aplic, irq, false);
+
+    hart_idx =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+    hart_idx &=3D APLIC_TARGET_HART_IDX_MASK;
+    if (aplic->mmode) {
+        /* M-level APLIC ignores guest_index */
+        guest_idx =3D 0;
+    } else {
+        guest_idx =3D aplic->target[irq] >> APLIC_TARGET_GUEST_IDX_SHIFT=
;
+        guest_idx &=3D APLIC_TARGET_GUEST_IDX_MASK;
+    }
+    eiid =3D aplic->target[irq] & APLIC_TARGET_EIID_MASK;
+    riscv_aplic_msi_send(aplic, hart_idx, guest_idx, eiid);
+}
+
+static uint32_t riscv_aplic_idc_topi(RISCVAPLICState *aplic, uint32_t id=
c)
+{
+    uint32_t best_irq, best_iprio;
+    uint32_t irq, iprio, ihartidx, ithres;
+
+    if (aplic->num_harts <=3D idc) {
+        return 0;
+    }
+
+    ithres =3D aplic->ithreshold[idc];
+    best_irq =3D best_iprio =3D UINT32_MAX;
+    for (irq =3D 1; irq < aplic->num_irqs; irq++) {
+        if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=3D
+            APLIC_ISTATE_ENPEND) {
+            continue;
+        }
+
+        ihartidx =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+        ihartidx &=3D APLIC_TARGET_HART_IDX_MASK;
+        if (ihartidx !=3D idc) {
+            continue;
+        }
+
+        iprio =3D aplic->target[irq] & aplic->iprio_mask;
+        if (ithres && iprio >=3D ithres) {
+            continue;
+        }
+
+        if (iprio < best_iprio) {
+            best_irq =3D irq;
+            best_iprio =3D iprio;
+        }
+    }
+
+    if (best_irq < aplic->num_irqs && best_iprio <=3D aplic->iprio_mask)=
 {
+        return (best_irq << APLIC_IDC_TOPI_ID_SHIFT) | best_iprio;
+    }
+
+    return 0;
+}
+
+static void riscv_aplic_idc_update(RISCVAPLICState *aplic, uint32_t idc)
+{
+    uint32_t topi;
+
+    if (aplic->msimode || aplic->num_harts <=3D idc) {
+        return;
+    }
+
+    topi =3D riscv_aplic_idc_topi(aplic, idc);
+    if ((aplic->domaincfg & APLIC_DOMAINCFG_IE) &&
+        aplic->idelivery[idc] &&
+        (aplic->iforce[idc] || topi)) {
+        qemu_irq_raise(aplic->external_irqs[idc]);
+    } else {
+        qemu_irq_lower(aplic->external_irqs[idc]);
+    }
+}
+
+static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t =
idc)
+{
+    uint32_t irq, state, sm, topi =3D riscv_aplic_idc_topi(aplic, idc);
+
+    if (!topi) {
+        aplic->iforce[idc] =3D 0;
+        return 0;
+    }
+
+    irq =3D (topi >> APLIC_IDC_TOPI_ID_SHIFT) & APLIC_IDC_TOPI_ID_MASK;
+    sm =3D aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
+    state =3D aplic->state[irq];
+    riscv_aplic_set_pending_raw(aplic, irq, false);
+    if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) &&
+        (state & APLIC_ISTATE_INPUT)) {
+        riscv_aplic_set_pending_raw(aplic, irq, true);
+    } else if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW) &&
+               !(state & APLIC_ISTATE_INPUT)) {
+        riscv_aplic_set_pending_raw(aplic, irq, true);
+    }
+    riscv_aplic_idc_update(aplic, idc);
+
+    return topi;
+}
+
+static void riscv_aplic_request(void *opaque, int irq, int level)
+{
+    bool update =3D false;
+    RISCVAPLICState *aplic =3D opaque;
+    uint32_t sourcecfg, childidx, state, idc;
+
+    assert((0 < irq) && (irq < aplic->num_irqs));
+
+    sourcecfg =3D aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        childidx =3D sourcecfg & APLIC_SOURCECFG_CHILDIDX_MASK;
+        if (childidx < aplic->num_children) {
+            riscv_aplic_request(aplic->children[childidx], irq, level);
+        }
+        return;
+    }
+
+    state =3D aplic->state[irq];
+    switch (sourcecfg & APLIC_SOURCECFG_SM_MASK) {
+    case APLIC_SOURCECFG_SM_EDGE_RISE:
+        if ((level > 0) && !(state & APLIC_ISTATE_INPUT) &&
+            !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update =3D true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_EDGE_FALL:
+        if ((level <=3D 0) && (state & APLIC_ISTATE_INPUT) &&
+            !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update =3D true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_LEVEL_HIGH:
+        if ((level > 0) && !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update =3D true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_LEVEL_LOW:
+        if ((level <=3D 0) && !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update =3D true;
+        }
+        break;
+    default:
+        break;
+    }
+
+    if (level <=3D 0) {
+        aplic->state[irq] &=3D ~APLIC_ISTATE_INPUT;
+    } else {
+        aplic->state[irq] |=3D APLIC_ISTATE_INPUT;
+    }
+
+    if (update) {
+        if (aplic->msimode) {
+            riscv_aplic_msi_irq_update(aplic, irq);
+        } else {
+            idc =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+            idc &=3D APLIC_TARGET_HART_IDX_MASK;
+            riscv_aplic_idc_update(aplic, idc);
+        }
+    }
+}
+
+static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned siz=
e)
+{
+    uint32_t irq, word, idc;
+    RISCVAPLICState *aplic =3D opaque;
+
+    /* Reads must be 4 byte words */
+    if ((addr & 0x3) !=3D 0) {
+        goto err;
+    }
+
+    if (addr =3D=3D APLIC_DOMAINCFG) {
+        return APLIC_DOMAINCFG_RDONLY | aplic->domaincfg |
+               (aplic->msimode ? APLIC_DOMAINCFG_DM : 0);
+    } else if ((APLIC_SOURCECFG_BASE <=3D addr) &&
+            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * 4)))=
 {
+        irq  =3D ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
+        return aplic->sourcecfg[irq];
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr =3D=3D APLIC_MMSICFGADDR)) {
+        return aplic->mmsicfgaddr;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr =3D=3D APLIC_MMSICFGADDRH)) {
+        return aplic->mmsicfgaddrH;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr =3D=3D APLIC_SMSICFGADDR)) {
+        /*
+         * Registers SMSICFGADDR and SMSICFGADDRH are implemented only i=
f:
+         * (a) the interrupt domain is at machine level
+         * (b) the domain's harts implement supervisor mode
+         * (c) the domain has one or more child supervisor-level domains
+         *     that support MSI delivery mode (domaincfg.DM is not read-
+         *     only zero in at least one of the supervisor-level child
+         * domains).
+         */
+        return (aplic->num_children) ? aplic->smsicfgaddr : 0;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr =3D=3D APLIC_SMSICFGADDRH)) {
+        return (aplic->num_children) ? aplic->smsicfgaddrH : 0;
+    } else if ((APLIC_SETIP_BASE <=3D addr) &&
+            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
+        word =3D (addr - APLIC_SETIP_BASE) >> 2;
+        return riscv_aplic_read_pending_word(aplic, word);
+    } else if (addr =3D=3D APLIC_SETIPNUM) {
+        return 0;
+    } else if ((APLIC_CLRIP_BASE <=3D addr) &&
+            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4))) {
+        word =3D (addr - APLIC_CLRIP_BASE) >> 2;
+        return riscv_aplic_read_input_word(aplic, word);
+    } else if (addr =3D=3D APLIC_CLRIPNUM) {
+        return 0;
+    } else if ((APLIC_SETIE_BASE <=3D addr) &&
+            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4))) {
+        word =3D (addr - APLIC_SETIE_BASE) >> 2;
+        return riscv_aplic_read_enabled_word(aplic, word);
+    } else if (addr =3D=3D APLIC_SETIENUM) {
+        return 0;
+    } else if ((APLIC_CLRIE_BASE <=3D addr) &&
+            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4))) {
+        return 0;
+    } else if (addr =3D=3D APLIC_CLRIENUM) {
+        return 0;
+    } else if (addr =3D=3D APLIC_SETIPNUM_LE) {
+        return 0;
+    } else if (addr =3D=3D APLIC_SETIPNUM_BE) {
+        return 0;
+    } else if (addr =3D=3D APLIC_GENMSI) {
+        return (aplic->msimode) ? aplic->genmsi : 0;
+    } else if ((APLIC_TARGET_BASE <=3D addr) &&
+            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq =3D ((addr - APLIC_TARGET_BASE) >> 2) + 1;
+        return aplic->target[irq];
+    } else if (!aplic->msimode && (APLIC_IDC_BASE <=3D addr) &&
+            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_SIZE)=
)) {
+        idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
+        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
+        case APLIC_IDC_IDELIVERY:
+            return aplic->idelivery[idc];
+        case APLIC_IDC_IFORCE:
+            return aplic->iforce[idc];
+        case APLIC_IDC_ITHRESHOLD:
+            return aplic->ithreshold[idc];
+        case APLIC_IDC_TOPI:
+            return riscv_aplic_idc_topi(aplic, idc);
+        case APLIC_IDC_CLAIMI:
+            return riscv_aplic_idc_claimi(aplic, idc);
+        default:
+            goto err;
+        };
+    }
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+    return 0;
+}
+
+static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
+        unsigned size)
+{
+    RISCVAPLICState *aplic =3D opaque;
+    uint32_t irq, word, idc =3D UINT32_MAX;
+
+    /* Writes must be 4 byte words */
+    if ((addr & 0x3) !=3D 0) {
+        goto err;
+    }
+
+    if (addr =3D=3D APLIC_DOMAINCFG) {
+        /* Only IE bit writeable at the moment */
+        value &=3D APLIC_DOMAINCFG_IE;
+        aplic->domaincfg =3D value;
+    } else if ((APLIC_SOURCECFG_BASE <=3D addr) &&
+            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * 4)))=
 {
+        irq  =3D ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
+        if (!aplic->num_children && (value & APLIC_SOURCECFG_D)) {
+            value =3D 0;
+        }
+        if (value & APLIC_SOURCECFG_D) {
+            value &=3D (APLIC_SOURCECFG_D | APLIC_SOURCECFG_CHILDIDX_MAS=
K);
+        } else {
+            value &=3D (APLIC_SOURCECFG_D | APLIC_SOURCECFG_SM_MASK);
+        }
+        aplic->sourcecfg[irq] =3D value;
+        if ((aplic->sourcecfg[irq] & APLIC_SOURCECFG_D) ||
+            (aplic->sourcecfg[irq] =3D=3D 0)) {
+            riscv_aplic_set_pending_raw(aplic, irq, false);
+            riscv_aplic_set_enabled_raw(aplic, irq, false);
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr =3D=3D APLIC_MMSICFGADDR)) {
+        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->mmsicfgaddr =3D value;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr =3D=3D APLIC_MMSICFGADDRH)) {
+        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->mmsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID_MAS=
K;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr =3D=3D APLIC_SMSICFGADDR)) {
+        /*
+         * Registers SMSICFGADDR and SMSICFGADDRH are implemented only i=
f:
+         * (a) the interrupt domain is at machine level
+         * (b) the domain's harts implement supervisor mode
+         * (c) the domain has one or more child supervisor-level domains
+         *     that support MSI delivery mode (domaincfg.DM is not read-
+         *     only zero in at least one of the supervisor-level child
+         * domains).
+         */
+        if (aplic->num_children &&
+            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->smsicfgaddr =3D value;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr =3D=3D APLIC_SMSICFGADDRH)) {
+        if (aplic->num_children &&
+            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->smsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID_MAS=
K;
+        }
+    } else if ((APLIC_SETIP_BASE <=3D addr) &&
+            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
+        word =3D (addr - APLIC_SETIP_BASE) >> 2;
+        riscv_aplic_set_pending_word(aplic, word, value, true);
+    } else if (addr =3D=3D APLIC_SETIPNUM) {
+        riscv_aplic_set_pending(aplic, value, true);
+    } else if ((APLIC_CLRIP_BASE <=3D addr) &&
+            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4))) {
+        word =3D (addr - APLIC_CLRIP_BASE) >> 2;
+        riscv_aplic_set_pending_word(aplic, word, value, false);
+    } else if (addr =3D=3D APLIC_CLRIPNUM) {
+        riscv_aplic_set_pending(aplic, value, false);
+    } else if ((APLIC_SETIE_BASE <=3D addr) &&
+            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4))) {
+        word =3D (addr - APLIC_SETIE_BASE) >> 2;
+        riscv_aplic_set_enabled_word(aplic, word, value, true);
+    } else if (addr =3D=3D APLIC_SETIENUM) {
+        riscv_aplic_set_enabled(aplic, value, true);
+    } else if ((APLIC_CLRIE_BASE <=3D addr) &&
+            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4))) {
+        word =3D (addr - APLIC_CLRIE_BASE) >> 2;
+        riscv_aplic_set_enabled_word(aplic, word, value, false);
+    } else if (addr =3D=3D APLIC_CLRIENUM) {
+        riscv_aplic_set_enabled(aplic, value, false);
+    } else if (addr =3D=3D APLIC_SETIPNUM_LE) {
+        riscv_aplic_set_pending(aplic, value, true);
+    } else if (addr =3D=3D APLIC_SETIPNUM_BE) {
+        riscv_aplic_set_pending(aplic, bswap32(value), true);
+    } else if (addr =3D=3D APLIC_GENMSI) {
+        if (aplic->msimode) {
+            aplic->genmsi =3D value & ~(APLIC_TARGET_GUEST_IDX_MASK <<
+                                      APLIC_TARGET_GUEST_IDX_SHIFT);
+            riscv_aplic_msi_send(aplic,
+                                 value >> APLIC_TARGET_HART_IDX_SHIFT,
+                                 0,
+                                 value & APLIC_TARGET_EIID_MASK);
+        }
+    } else if ((APLIC_TARGET_BASE <=3D addr) &&
+            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq =3D ((addr - APLIC_TARGET_BASE) >> 2) + 1;
+        if (aplic->msimode) {
+            aplic->target[irq] =3D value;
+        } else {
+            aplic->target[irq] =3D (value & ~APLIC_TARGET_IPRIO_MASK) |
+                                 ((value & aplic->iprio_mask) ?
+                                  (value & aplic->iprio_mask) : 1);
+        }
+    } else if (!aplic->msimode && (APLIC_IDC_BASE <=3D addr) &&
+            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_SIZE)=
)) {
+        idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
+        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
+        case APLIC_IDC_IDELIVERY:
+            aplic->idelivery[idc] =3D value & 0x1;
+            break;
+        case APLIC_IDC_IFORCE:
+            aplic->iforce[idc] =3D value & 0x1;
+            break;
+        case APLIC_IDC_ITHRESHOLD:
+            aplic->ithreshold[idc] =3D value & aplic->iprio_mask;
+            break;
+        default:
+            goto err;
+        };
+    } else {
+        goto err;
+    }
+
+    if (aplic->msimode) {
+        for (irq =3D 1; irq < aplic->num_irqs; irq++) {
+            riscv_aplic_msi_irq_update(aplic, irq);
+        }
+    } else {
+        if (idc =3D=3D UINT32_MAX) {
+            for (idc =3D 0; idc < aplic->num_harts; idc++) {
+                riscv_aplic_idc_update(aplic, idc);
+            }
+        } else {
+            riscv_aplic_idc_update(aplic, idc);
+        }
+    }
+
+    return;
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+}
+
+static const MemoryRegionOps riscv_aplic_ops =3D {
+    .read =3D riscv_aplic_read,
+    .write =3D riscv_aplic_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4
+    }
+};
+
+static void riscv_aplic_realize(DeviceState *dev, Error **errp)
+{
+    uint32_t i;
+    RISCVAPLICState *aplic =3D RISCV_APLIC(dev);
+
+    aplic->bitfield_words =3D (aplic->num_irqs + 31) >> 5;
+    aplic->sourcecfg =3D g_new0(uint32_t, aplic->num_irqs);
+    aplic->state =3D g_new(uint32_t, aplic->num_irqs);
+    aplic->target =3D g_new0(uint32_t, aplic->num_irqs);
+    if (!aplic->msimode) {
+        for (i =3D 0; i < aplic->num_irqs; i++) {
+            aplic->target[i] =3D 1;
+        }
+    }
+    aplic->idelivery =3D g_new0(uint32_t, aplic->num_harts);
+    aplic->iforce =3D g_new0(uint32_t, aplic->num_harts);
+    aplic->ithreshold =3D g_new0(uint32_t, aplic->num_harts);
+
+    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops, a=
plic,
+                          TYPE_RISCV_APLIC, aplic->aperture_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+
+    /*
+     * Only root APLICs have hardware IRQ lines. All non-root APLICs
+     * have IRQ lines delegated by their parent APLIC.
+     */
+    if (!aplic->parent) {
+        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
+    }
+
+    /* Create output IRQ lines for non-MSI mode */
+    if (!aplic->msimode) {
+        aplic->external_irqs =3D g_malloc(sizeof(qemu_irq) * aplic->num_=
harts);
+        qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
+
+        /* Claim the CPU interrupt to be triggered by this APLIC */
+        for (i =3D 0; i < aplic->num_harts; i++) {
+            RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(aplic->hartid_base =
+ i));
+            if (riscv_cpu_claim_interrupts(cpu,
+                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
+                error_report("%s already claimed",
+                             (aplic->mmode) ? "MEIP" : "SEIP");
+                exit(1);
+            }
+        }
+    }
+
+    msi_nonbroken =3D true;
+}
+
+static Property riscv_aplic_properties[] =3D {
+    DEFINE_PROP_UINT32("aperture-size", RISCVAPLICState, aperture_size, =
0),
+    DEFINE_PROP_UINT32("hartid-base", RISCVAPLICState, hartid_base, 0),
+    DEFINE_PROP_UINT32("num-harts", RISCVAPLICState, num_harts, 0),
+    DEFINE_PROP_UINT32("iprio-mask", RISCVAPLICState, iprio_mask, 0),
+    DEFINE_PROP_UINT32("num-irqs", RISCVAPLICState, num_irqs, 0),
+    DEFINE_PROP_BOOL("msimode", RISCVAPLICState, msimode, 0),
+    DEFINE_PROP_BOOL("mmode", RISCVAPLICState, mmode, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_riscv_aplic =3D {
+    .name =3D "riscv_aplic",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+            VMSTATE_UINT32(domaincfg, RISCVAPLICState),
+            VMSTATE_UINT32(mmsicfgaddr, RISCVAPLICState),
+            VMSTATE_UINT32(mmsicfgaddrH, RISCVAPLICState),
+            VMSTATE_UINT32(smsicfgaddr, RISCVAPLICState),
+            VMSTATE_UINT32(smsicfgaddrH, RISCVAPLICState),
+            VMSTATE_UINT32(genmsi, RISCVAPLICState),
+            VMSTATE_VARRAY_UINT32(sourcecfg, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(state, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(target, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(idelivery, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(iforce, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(ithreshold, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
+static void riscv_aplic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, riscv_aplic_properties);
+    dc->realize =3D riscv_aplic_realize;
+    dc->vmsd =3D &vmstate_riscv_aplic;
+}
+
+static const TypeInfo riscv_aplic_info =3D {
+    .name          =3D TYPE_RISCV_APLIC,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(RISCVAPLICState),
+    .class_init    =3D riscv_aplic_class_init,
+};
+
+static void riscv_aplic_register_types(void)
+{
+    type_register_static(&riscv_aplic_info);
+}
+
+type_init(riscv_aplic_register_types)
+
+/*
+ * Add a APLIC device to another APLIC device as child for
+ * interrupt delegation.
+ */
+void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
+{
+    RISCVAPLICState *caplic, *paplic;
+
+    assert(parent && child);
+    caplic =3D RISCV_APLIC(child);
+    paplic =3D RISCV_APLIC(parent);
+
+    assert(paplic->num_irqs =3D=3D caplic->num_irqs);
+    assert(paplic->num_children <=3D QEMU_APLIC_MAX_CHILDREN);
+
+    caplic->parent =3D paplic;
+    paplic->children[paplic->num_children] =3D caplic;
+    paplic->num_children++;
+}
+
+/*
+ * Create APLIC device.
+ */
+DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
+    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
+{
+    DeviceState *dev =3D qdev_new(TYPE_RISCV_APLIC);
+    uint32_t i;
+
+    assert(num_harts < APLIC_MAX_IDC);
+    assert((APLIC_IDC_BASE + (num_harts * APLIC_IDC_SIZE)) <=3D size);
+    assert(num_sources < APLIC_MAX_SOURCE);
+    assert(APLIC_MIN_IPRIO_BITS <=3D iprio_bits);
+    assert(iprio_bits <=3D APLIC_MAX_IPRIO_BITS);
+
+    qdev_prop_set_uint32(dev, "aperture-size", size);
+    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "iprio-mask", ((1U << iprio_bits) - 1));
+    qdev_prop_set_uint32(dev, "num-irqs", num_sources + 1);
+    qdev_prop_set_bit(dev, "msimode", msimode);
+    qdev_prop_set_bit(dev, "mmode", mmode);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    if (parent) {
+        riscv_aplic_add_child(parent, dev);
+    }
+
+    if (!msimode) {
+        for (i =3D 0; i < num_harts; i++) {
+            CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
+
+            qdev_connect_gpio_out_named(dev, NULL, i,
+                                        qdev_get_gpio_in(DEVICE(cpu),
+                                            (mmode) ? IRQ_M_EXT : IRQ_S_=
EXT));
+        }
+    }
+
+    return dev;
+}
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 010ded7eae..528e77b4a6 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -70,6 +70,9 @@ config LOONGSON_LIOINTC
 config RISCV_ACLINT
     bool
=20
+config RISCV_APLIC
+    bool
+
 config SIFIVE_PLIC
     bool
=20
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 70080bc161..7466024402 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -50,6 +50,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: file=
s('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_=
kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclin=
t.c'))
+specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true: files('riscv_aplic.=
c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.=
c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
--=20
2.34.1



