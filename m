Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5C4CB673
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:34:21 +0100 (CET)
Received: from localhost ([::1]:52276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPe6W-00027h-Lv
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe11-0001Yj-Sz
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:40 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe0y-0000Gc-Tn
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285316; x=1677821316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ChAc2z794yrRBoihVQ4DAFFBNDmIVUhwv9znXDutxeg=;
 b=R+Qh+akO41FD+1FrCrz9ML1Gl+Y9n3tetvzuasjfTa3w7kOMtcRfBEdn
 V2enktFoFTqup+gfjmE+nFeEVUPrqtBS8dClngjiJLBdgPETL0p1A/5NH
 p21o/XLxnvkHlZmVGxfQ4lMrWjwblWFelEeXv9tTe6RtELzk6W5/VX8HE
 KQ2+XreElMSU8+c7OgGc3G0nwslTh7YJyrvFW1pWUl9thd6YMihiiFbbh
 5JdwhXljhY67JgXwH1AXvF4+qD43H247LNMJpaYuyUtggqzfHKVFVQm0X
 FG3H9rrkY3198ANGj9IC2rbR+YxpiClif9M0dCU52uF3d+7KLAhA17+Tk w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194355342"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:28:35 +0800
IronPort-SDR: bQ2SOwqDvChH/wLR2fQegswfXlX2PFFfnKFeJE7xl9yNL+EjFfpeXgPS6mJ8zyNKNoqeli/UPw
 Ok5Qt2X2ZsXsveXU1BZiO0vItc9H4CDCoFWgZdt2AOI3V62O+BnPGpcRIZ4/EIRPkEG1k7XKYE
 MCW/FrYWXVYGlsm6b7TUJjkpS1RZ6BDhJXqIRqnyY6j3tKjA+r3Th9OzlP9ni48/WMeac8ujVN
 nXJ1jf9NBv+KxOVpJeH0rBhG38d0u582kzu8mZm01ozXjmXFCRxnEDlH61akbRP1g4sgLo11Kq
 iH/z1U8mSnasaJM+4Sl7p32k
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 20:59:58 -0800
IronPort-SDR: 5tSQNAGJelj00sZl+W5POXG3N1lPcjazwMVrUrZ49DSyJWu8zPmpNLvSJLzCQ8Vyp5rdS9Pfch
 wOrBtztxuf9K91K7cfyR/h5trFbrrt+qixxjBzxCmIxhzXW40r1TWY6tExojgZHm5Lvq3sYjmL
 xIq0OTop8x/M0FpTk5aWZxsWfSeIvAnJu+lXP5RaYj4HUJfzITQB+HAqzdWma9xlKllYsJwFEX
 DEHrdyryg4U/jo1npFCHelAkBpbZKuKLEUIxk+g+4sqUMm79kFVkZQ+6wAYwxKOJnmogrMoJZj
 T/U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:28:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KJz63tzz1SVny
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:28:35 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285314; x=1648877315; bh=ChAc2z794yrRBoihVQ
 4DAFFBNDmIVUhwv9znXDutxeg=; b=sGxlU56kjTlV0ZJ3C5EWmrVAIdiqmx4JGh
 iW4SDpWX8di84xlgzXohkrdmnqa74iodKbsObz12wwukZ3eWe7yIriJu6z0iUCV2
 5eaw+JEvKrpdgVBV3qkx5VjT9aNtckUXHUtgGUysSdPl/u3LyUh2pMi4IT6mfs4l
 81z2DQgCuuUxZChyxmfyy/nUdfsCNSwHc3DneJ1tbrlkbGEgmpoejhBMKTEmTpi1
 gJxdHaR3IHWwbqvIRCGcqIfbIb17fVSiMDNLG5klFhgBh1TMuf5u0X0NmzcyCXBC
 O6LEaPula9uJTo4jLIkQ5UN2cfFLGFvnF6BXaA65mjEqu2b6XNMw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QhYIa_ZUmuTx for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:28:34 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KJt548tz1Rwrw;
 Wed,  2 Mar 2022 21:28:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/13] hw/intc: Add RISC-V AIA IMSIC device emulation
Date: Thu,  3 Mar 2022 15:27:54 +1000
Message-Id: <20220303052804.529967-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
interrupt controller for MSIs (message signal interrupts) called
IMSIC (Incoming Message Signal Interrupt Controller). The IMSIC
is per-HART device and also suppport virtualizaiton of MSIs using
dedicated VS-level guest interrupt files.

This patch adds device emulation for RISC-V AIA IMSIC which
supports M-level, S-level, and VS-level MSIs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20220220085526.808674-3-anup@brainfault.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/riscv_imsic.h |  68 ++++++
 hw/intc/riscv_imsic.c         | 448 ++++++++++++++++++++++++++++++++++
 hw/intc/Kconfig               |   3 +
 hw/intc/meson.build           |   1 +
 4 files changed, 520 insertions(+)
 create mode 100644 include/hw/intc/riscv_imsic.h
 create mode 100644 hw/intc/riscv_imsic.c

diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.=
h
new file mode 100644
index 0000000000..58c2aaa8dc
--- /dev/null
+++ b/include/hw/intc/riscv_imsic.h
@@ -0,0 +1,68 @@
+/*
+ * RISC-V IMSIC (Incoming Message Signal Interrupt Controller) interface
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
+#ifndef HW_RISCV_IMSIC_H
+#define HW_RISCV_IMSIC_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_RISCV_IMSIC "riscv.imsic"
+
+typedef struct RISCVIMSICState RISCVIMSICState;
+DECLARE_INSTANCE_CHECKER(RISCVIMSICState, RISCV_IMSIC, TYPE_RISCV_IMSIC)
+
+#define IMSIC_MMIO_PAGE_SHIFT          12
+#define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
+#define IMSIC_MMIO_SIZE(__num_pages)   ((__num_pages) * IMSIC_MMIO_PAGE_=
SZ)
+
+#define IMSIC_MMIO_HART_GUEST_MAX_BTIS 6
+#define IMSIC_MMIO_GROUP_MIN_SHIFT     24
+
+#define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
+    (1U << (__guest_bits))
+#define IMSIC_HART_SIZE(__guest_bits)                 \
+    (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
+#define IMSIC_GROUP_NUM_HARTS(__hart_bits)            \
+    (1U << (__hart_bits))
+#define IMSIC_GROUP_SIZE(__hart_bits, __guest_bits)   \
+    (IMSIC_GROUP_NUM_HARTS(__hart_bits) * IMSIC_HART_SIZE(__guest_bits))
+
+struct RISCVIMSICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    qemu_irq *external_irqs;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t num_eistate;
+    uint32_t *eidelivery;
+    uint32_t *eithreshold;
+    uint32_t *eistate;
+
+    /* config */
+    bool mmode;
+    uint32_t hartid;
+    uint32_t num_pages;
+    uint32_t num_irqs;
+};
+
+DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode=
,
+                                uint32_t num_pages, uint32_t num_ids);
+
+#endif
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
new file mode 100644
index 0000000000..8615e4cc1d
--- /dev/null
+++ b/hw/intc/riscv_imsic.c
@@ -0,0 +1,448 @@
+/*
+ * RISC-V IMSIC (Incoming Message Signaled Interrupt Controller)
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
+#include "hw/intc/riscv_imsic.h"
+#include "hw/irq.h"
+#include "target/riscv/cpu.h"
+#include "target/riscv/cpu_bits.h"
+#include "sysemu/sysemu.h"
+#include "migration/vmstate.h"
+
+#define IMSIC_MMIO_PAGE_LE             0x00
+#define IMSIC_MMIO_PAGE_BE             0x04
+
+#define IMSIC_MIN_ID                   ((IMSIC_EIPx_BITS * 2) - 1)
+#define IMSIC_MAX_ID                   (IMSIC_TOPEI_IID_MASK)
+
+#define IMSIC_EISTATE_PENDING          (1U << 0)
+#define IMSIC_EISTATE_ENABLED          (1U << 1)
+#define IMSIC_EISTATE_ENPEND           (IMSIC_EISTATE_ENABLED | \
+                                        IMSIC_EISTATE_PENDING)
+
+static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page)
+{
+    uint32_t i, max_irq, base;
+
+    base =3D page * imsic->num_irqs;
+    max_irq =3D (imsic->eithreshold[page] &&
+               (imsic->eithreshold[page] <=3D imsic->num_irqs)) ?
+               imsic->eithreshold[page] : imsic->num_irqs;
+    for (i =3D 1; i < max_irq; i++) {
+        if ((imsic->eistate[base + i] & IMSIC_EISTATE_ENPEND) =3D=3D
+                IMSIC_EISTATE_ENPEND) {
+            return (i << IMSIC_TOPEI_IID_SHIFT) | i;
+        }
+    }
+
+    return 0;
+}
+
+static void riscv_imsic_update(RISCVIMSICState *imsic, uint32_t page)
+{
+    if (imsic->eidelivery[page] && riscv_imsic_topei(imsic, page)) {
+        qemu_irq_raise(imsic->external_irqs[page]);
+    } else {
+        qemu_irq_lower(imsic->external_irqs[page]);
+    }
+}
+
+static int riscv_imsic_eidelivery_rmw(RISCVIMSICState *imsic, uint32_t p=
age,
+                                      target_ulong *val,
+                                      target_ulong new_val,
+                                      target_ulong wr_mask)
+{
+    target_ulong old_val =3D imsic->eidelivery[page];
+
+    if (val) {
+        *val =3D old_val;
+    }
+
+    wr_mask &=3D 0x1;
+    imsic->eidelivery[page] =3D (old_val & ~wr_mask) | (new_val & wr_mas=
k);
+
+    riscv_imsic_update(imsic, page);
+    return 0;
+}
+
+static int riscv_imsic_eithreshold_rmw(RISCVIMSICState *imsic, uint32_t =
page,
+                                      target_ulong *val,
+                                      target_ulong new_val,
+                                      target_ulong wr_mask)
+{
+    target_ulong old_val =3D imsic->eithreshold[page];
+
+    if (val) {
+        *val =3D old_val;
+    }
+
+    wr_mask &=3D IMSIC_MAX_ID;
+    imsic->eithreshold[page] =3D (old_val & ~wr_mask) | (new_val & wr_ma=
sk);
+
+    riscv_imsic_update(imsic, page);
+    return 0;
+}
+
+static int riscv_imsic_topei_rmw(RISCVIMSICState *imsic, uint32_t page,
+                                 target_ulong *val, target_ulong new_val=
,
+                                 target_ulong wr_mask)
+{
+    uint32_t base, topei =3D riscv_imsic_topei(imsic, page);
+
+    /* Read pending and enabled interrupt with highest priority */
+    if (val) {
+        *val =3D topei;
+    }
+
+    /* Writes ignore value and clear top pending interrupt */
+    if (topei && wr_mask) {
+        topei >>=3D IMSIC_TOPEI_IID_SHIFT;
+        base =3D page * imsic->num_irqs;
+        if (topei) {
+            imsic->eistate[base + topei] &=3D ~IMSIC_EISTATE_PENDING;
+        }
+
+        riscv_imsic_update(imsic, page);
+    }
+
+    return 0;
+}
+
+static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,
+                               uint32_t xlen, uint32_t page,
+                               uint32_t num, bool pend, target_ulong *va=
l,
+                               target_ulong new_val, target_ulong wr_mas=
k)
+{
+    uint32_t i, base;
+    target_ulong mask;
+    uint32_t state =3D (pend) ? IMSIC_EISTATE_PENDING : IMSIC_EISTATE_EN=
ABLED;
+
+    if (xlen !=3D 32) {
+        if (num & 0x1) {
+            return -EINVAL;
+        }
+        num >>=3D 1;
+    }
+    if (num >=3D (imsic->num_irqs / xlen)) {
+        return -EINVAL;
+    }
+
+    base =3D (page * imsic->num_irqs) + (num * xlen);
+
+    if (val) {
+        *val =3D 0;
+        for (i =3D 0; i < xlen; i++) {
+            mask =3D (target_ulong)1 << i;
+            *val |=3D (imsic->eistate[base + i] & state) ? mask : 0;
+        }
+    }
+
+    for (i =3D 0; i < xlen; i++) {
+        /* Bit0 of eip0 and eie0 are read-only zero */
+        if (!num && !i) {
+            continue;
+        }
+
+        mask =3D (target_ulong)1 << i;
+        if (wr_mask & mask) {
+            if (new_val & mask) {
+                imsic->eistate[base + i] |=3D state;
+            } else {
+                imsic->eistate[base + i] &=3D ~state;
+            }
+        }
+    }
+
+    riscv_imsic_update(imsic, page);
+    return 0;
+}
+
+static int riscv_imsic_rmw(void *arg, target_ulong reg, target_ulong *va=
l,
+                           target_ulong new_val, target_ulong wr_mask)
+{
+    RISCVIMSICState *imsic =3D arg;
+    uint32_t isel, priv, virt, vgein, xlen, page;
+
+    priv =3D AIA_IREG_PRIV(reg);
+    virt =3D AIA_IREG_VIRT(reg);
+    isel =3D AIA_IREG_ISEL(reg);
+    vgein =3D AIA_IREG_VGEIN(reg);
+    xlen =3D AIA_IREG_XLEN(reg);
+
+    if (imsic->mmode) {
+        if (priv =3D=3D PRV_M && !virt) {
+            page =3D 0;
+        } else {
+            goto err;
+        }
+    } else {
+        if (priv =3D=3D PRV_S) {
+            if (virt) {
+                if (vgein && vgein < imsic->num_pages) {
+                    page =3D vgein;
+                } else {
+                    goto err;
+                }
+            } else {
+                page =3D 0;
+            }
+        } else {
+            goto err;
+        }
+    }
+
+    switch (isel) {
+    case ISELECT_IMSIC_EIDELIVERY:
+        return riscv_imsic_eidelivery_rmw(imsic, page, val,
+                                          new_val, wr_mask);
+    case ISELECT_IMSIC_EITHRESHOLD:
+        return riscv_imsic_eithreshold_rmw(imsic, page, val,
+                                           new_val, wr_mask);
+    case ISELECT_IMSIC_TOPEI:
+        return riscv_imsic_topei_rmw(imsic, page, val, new_val, wr_mask)=
;
+    case ISELECT_IMSIC_EIP0 ... ISELECT_IMSIC_EIP63:
+        return riscv_imsic_eix_rmw(imsic, xlen, page,
+                                   isel - ISELECT_IMSIC_EIP0,
+                                   true, val, new_val, wr_mask);
+    case ISELECT_IMSIC_EIE0 ... ISELECT_IMSIC_EIE63:
+        return riscv_imsic_eix_rmw(imsic, xlen, page,
+                                   isel - ISELECT_IMSIC_EIE0,
+                                   false, val, new_val, wr_mask);
+    default:
+        break;
+    };
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register priv=3D%d virt=3D%d isel=3D%d vg=
ein=3D%d\n",
+                  __func__, priv, virt, isel, vgein);
+    return -EINVAL;
+}
+
+static uint64_t riscv_imsic_read(void *opaque, hwaddr addr, unsigned siz=
e)
+{
+    RISCVIMSICState *imsic =3D opaque;
+
+    /* Reads must be 4 byte words */
+    if ((addr & 0x3) !=3D 0) {
+        goto err;
+    }
+
+    /* Reads cannot be out of range */
+    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
+        goto err;
+    }
+
+    return 0;
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+    return 0;
+}
+
+static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
+        unsigned size)
+{
+    RISCVIMSICState *imsic =3D opaque;
+    uint32_t page;
+
+    /* Writes must be 4 byte words */
+    if ((addr & 0x3) !=3D 0) {
+        goto err;
+    }
+
+    /* Writes cannot be out of range */
+    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
+        goto err;
+    }
+
+    /* Writes only supported for MSI little-endian registers */
+    page =3D addr >> IMSIC_MMIO_PAGE_SHIFT;
+    if ((addr & (IMSIC_MMIO_PAGE_SZ - 1)) =3D=3D IMSIC_MMIO_PAGE_LE) {
+        if (value && (value < imsic->num_irqs)) {
+            imsic->eistate[(page * imsic->num_irqs) + value] |=3D
+                                                    IMSIC_EISTATE_PENDIN=
G;
+        }
+    }
+
+    /* Update CPU external interrupt status */
+    riscv_imsic_update(imsic, page);
+
+    return;
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+}
+
+static const MemoryRegionOps riscv_imsic_ops =3D {
+    .read =3D riscv_imsic_read,
+    .write =3D riscv_imsic_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4
+    }
+};
+
+static void riscv_imsic_realize(DeviceState *dev, Error **errp)
+{
+    RISCVIMSICState *imsic =3D RISCV_IMSIC(dev);
+    RISCVCPU *rcpu =3D RISCV_CPU(qemu_get_cpu(imsic->hartid));
+    CPUState *cpu =3D qemu_get_cpu(imsic->hartid);
+    CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
+
+    imsic->num_eistate =3D imsic->num_pages * imsic->num_irqs;
+    imsic->eidelivery =3D g_new0(uint32_t, imsic->num_pages);
+    imsic->eithreshold =3D g_new0(uint32_t, imsic->num_pages);
+    imsic->eistate =3D g_new0(uint32_t, imsic->num_eistate);
+
+    memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
+                          imsic, TYPE_RISCV_IMSIC,
+                          IMSIC_MMIO_SIZE(imsic->num_pages));
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
+
+    /* Claim the CPU interrupt to be triggered by this IMSIC */
+    if (riscv_cpu_claim_interrupts(rcpu,
+            (imsic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
+        error_setg(errp, "%s already claimed",
+                   (imsic->mmode) ? "MEIP" : "SEIP");
+        return;
+    }
+
+    /* Create output IRQ lines */
+    imsic->external_irqs =3D g_malloc(sizeof(qemu_irq) * imsic->num_page=
s);
+    qdev_init_gpio_out(dev, imsic->external_irqs, imsic->num_pages);
+
+    /* Force select AIA feature and setup CSR read-modify-write callback=
 */
+    if (env) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+        if (!imsic->mmode) {
+            riscv_cpu_set_geilen(env, imsic->num_pages - 1);
+        }
+        riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_=
S,
+                                      riscv_imsic_rmw, imsic);
+    }
+
+    msi_nonbroken =3D true;
+}
+
+static Property riscv_imsic_properties[] =3D {
+    DEFINE_PROP_BOOL("mmode", RISCVIMSICState, mmode, 0),
+    DEFINE_PROP_UINT32("hartid", RISCVIMSICState, hartid, 0),
+    DEFINE_PROP_UINT32("num-pages", RISCVIMSICState, num_pages, 0),
+    DEFINE_PROP_UINT32("num-irqs", RISCVIMSICState, num_irqs, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_riscv_imsic =3D {
+    .name =3D "riscv_imsic",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+            VMSTATE_VARRAY_UINT32(eidelivery, RISCVIMSICState,
+                                  num_pages, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(eithreshold, RISCVIMSICState,
+                                  num_pages, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(eistate, RISCVIMSICState,
+                                  num_eistate, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
+static void riscv_imsic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, riscv_imsic_properties);
+    dc->realize =3D riscv_imsic_realize;
+    dc->vmsd =3D &vmstate_riscv_imsic;
+}
+
+static const TypeInfo riscv_imsic_info =3D {
+    .name          =3D TYPE_RISCV_IMSIC,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(RISCVIMSICState),
+    .class_init    =3D riscv_imsic_class_init,
+};
+
+static void riscv_imsic_register_types(void)
+{
+    type_register_static(&riscv_imsic_info);
+}
+
+type_init(riscv_imsic_register_types)
+
+/*
+ * Create IMSIC device.
+ */
+DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode=
,
+                                uint32_t num_pages, uint32_t num_ids)
+{
+    DeviceState *dev =3D qdev_new(TYPE_RISCV_IMSIC);
+    CPUState *cpu =3D qemu_get_cpu(hartid);
+    uint32_t i;
+
+    assert(!(addr & (IMSIC_MMIO_PAGE_SZ - 1)));
+    if (mmode) {
+        assert(num_pages =3D=3D 1);
+    } else {
+        assert(num_pages >=3D 1 && num_pages <=3D (IRQ_LOCAL_GUEST_MAX +=
 1));
+    }
+    assert(IMSIC_MIN_ID <=3D num_ids);
+    assert(num_ids <=3D IMSIC_MAX_ID);
+    assert((num_ids & IMSIC_MIN_ID) =3D=3D IMSIC_MIN_ID);
+
+    qdev_prop_set_bit(dev, "mmode", mmode);
+    qdev_prop_set_uint32(dev, "hartid", hartid);
+    qdev_prop_set_uint32(dev, "num-pages", num_pages);
+    qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    for (i =3D 0; i < num_pages; i++) {
+        if (!i) {
+            qdev_connect_gpio_out_named(dev, NULL, i,
+                                        qdev_get_gpio_in(DEVICE(cpu),
+                                            (mmode) ? IRQ_M_EXT : IRQ_S_=
EXT));
+        } else {
+            qdev_connect_gpio_out_named(dev, NULL, i,
+                                        qdev_get_gpio_in(DEVICE(cpu),
+                                            IRQ_LOCAL_MAX + i - 1));
+        }
+    }
+
+    return dev;
+}
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 528e77b4a6..ec8d4cec29 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -73,6 +73,9 @@ config RISCV_ACLINT
 config RISCV_APLIC
     bool
=20
+config RISCV_IMSIC
+    bool
+
 config SIFIVE_PLIC
     bool
=20
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index d953197413..81ccdb0d78 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -51,6 +51,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: =
files('s390_flic_kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclin=
t.c'))
 specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true: files('riscv_aplic.=
c'))
+specific_ss.add(when: 'CONFIG_RISCV_IMSIC', if_true: files('riscv_imsic.=
c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.=
c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c', 'xive2.c')=
)
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
--=20
2.35.1


