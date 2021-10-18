Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED964430DEC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 04:41:28 +0200 (CEST)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcIae-0004vG-1u
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 22:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYX-0003Lr-4d
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:39:17 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:4191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYT-00060a-Is
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524753; x=1666060753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v20/zGFdk+aAH4HcxKseiDts7JpsX+l1bUcDwdDl2zA=;
 b=b9P6g4s+IOxmHgOgpkZzpsP+9kQ2JUyGN89rvGFn6uYwxZRj4g86dul/
 VrYsvdCk4cmXdRgRZC1jrtop48Nfg1DAzM4Lnv9r7+2YxBWxlURsb1b6r
 fj9L2bKU3qHUBePHS25s8KdZgnQAweH9UdH+o/S4fhekg5LbNWZMaUQ68
 wVuVkCcb1s1smvu6g/6gOzbXXTWQdoHiWWd1Jyz+4OUCiAcjSzz0koG+X
 K0KuIeppc5tbOrrUA15YBGek4Jf5q9kqsvfsu7kZE/6kwtBsmCdf0NjhN
 q/uHIRcA7FLTuQnX2YXtsTcFMO0q9WrIPO5lbQ5vgyHDF4VB5P+mJytEF g==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="287010110"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:39:09 +0800
IronPort-SDR: kmoCmeAW51qRcGOtq1za/1Bn3SHcatOSg76SxVyCMFb1cVT9VORACxfJer0VfRVaUpMdbOxV+p
 6ZlOq2SH6wAtqxUBbt6O1vgwoTd1iqeErPt+m8hZfdDN+dksxLNDHD33HCC2agS/xxYBFwm3Ps
 L6iMdDUw+pF6m+RHV0e/kuHgVKqSjmjmB1OsG4t59UmLbI5xPxVv/ZEhWwmJjgPblS4cy3aE52
 OSdP0ApuTFkmrPSQIw/LPbamcMhhfEFTfFazS7PvuE8yayMnxqIX2ljAYgZtnKG08IzphFiRhy
 xVl/fujqZDHROicqmFfQzcR9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:14:49 -0700
IronPort-SDR: /PyZ9qeE6a5kkB82abPGXqsiwmLVcmKxx5Ok99FDcSDOs/czmFv16UQXcKF70UfoeODKk+cRl4
 Ti2z91q/20wldyIqxZEIClXbj2FWQ78chZPh95DvpaFc3mNSn7jBU5ByCIdc7Oz27wnpFszSjP
 inWxNjMgEXlcF9AfVaJqAxOCzVjiXVKzhnpf8TmCdJftDGx1sy/qW3mvz7zHHZBqrzKk9BlcA6
 REXIpzsP14ucn+LHG5d9M7tBw699R+c63EwTuLaPM0otSoIvyPnoF+9PDzm93h/D4LMW1OFfQ2
 doE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:39:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh0F1gWHz1Rvlv
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 19:39:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524748; x=1637116749; bh=v20/zGFdk+aAH4HcxK
 seiDts7JpsX+l1bUcDwdDl2zA=; b=KBqUF380Yewmm72w7WyOBd7dhqze9wbjkF
 WZKbPfnmwD3SfyvWTXXj/5obN4pw0fEjH2WNPbSI6EUIxV53T1Uv4LXJMlXL+yF3
 wXwztsHaJEN9E3mVaiJsiOM4KVglIIxHTVKQa/uVWVmB84Ok/naP5CM3ukTOc7PR
 LShlMq01CcFdh0TKBBLh9qhdpwzEH6LdS1Co976DM9CgQkv9MlyNyQSBMXdQXJOy
 7CSzwiVn/oq8cxJMrJPPVJIqBiT1OSz97GUKJBuDKjqvuFpYMZbD9j5Exb6EN8wk
 +hFeZJLJ2B0fE6ENv88cRTaYfULFIk9DgnmkjTyFoWUnuZCTfG4w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uQwuSTCdHC_t for <qemu-devel@nongnu.org>;
 Sun, 17 Oct 2021 19:39:08 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh065zRFz1RvlJ;
 Sun, 17 Oct 2021 19:39:02 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/9] hw/intc: Remove the Ibex PLIC
Date: Mon, 18 Oct 2021 12:38:55 +1000
Message-Id: <5557935c2660c5e6281b6d21e6514e019593662e.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

The Ibex PLIC is now spec complient. Let's remove the Ibex PLIC and
instead use the SiFive PLIC.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/ibex_plic.c | 307 --------------------------------------------
 hw/intc/meson.build |   1 -
 2 files changed, 308 deletions(-)
 delete mode 100644 hw/intc/ibex_plic.c

diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
deleted file mode 100644
index ff430356f8..0000000000
--- a/hw/intc/ibex_plic.c
+++ /dev/null
@@ -1,307 +0,0 @@
-/*
- * QEMU RISC-V lowRISC Ibex PLIC
- *
- * Copyright (c) 2020 Western Digital
- *
- * Documentation avaliable: https://docs.opentitan.org/hw/ip/rv_plic/doc=
/
- *
- * This program is free software; you can redistribute it and/or modify =
it
- * under the terms and conditions of the GNU General Public License,
- * version 2 or later, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOU=
T
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
- * more details.
- *
- * You should have received a copy of the GNU General Public License alo=
ng with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/log.h"
-#include "hw/qdev-properties.h"
-#include "hw/core/cpu.h"
-#include "hw/boards.h"
-#include "hw/pci/msi.h"
-#include "target/riscv/cpu_bits.h"
-#include "target/riscv/cpu.h"
-#include "hw/intc/ibex_plic.h"
-#include "hw/irq.h"
-
-static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
-{
-    uint32_t end =3D base + (num * 0x04);
-
-    if (addr >=3D base && addr < end) {
-        return true;
-    }
-
-    return false;
-}
-
-static void ibex_plic_irqs_set_pending(IbexPlicState *s, int irq, bool l=
evel)
-{
-    int pending_num =3D irq / 32;
-
-    if (!level) {
-        /*
-         * If the level is low make sure we clear the hidden_pending.
-         */
-        s->hidden_pending[pending_num] &=3D ~(1 << (irq % 32));
-    }
-
-    if (s->claimed[pending_num] & 1 << (irq % 32)) {
-        /*
-         * The interrupt has been claimed, but not completed.
-         * The pending bit can't be set.
-         * Save the pending level for after the interrupt is completed.
-         */
-        s->hidden_pending[pending_num] |=3D level << (irq % 32);
-    } else {
-        s->pending[pending_num] |=3D level << (irq % 32);
-    }
-}
-
-static bool ibex_plic_irqs_pending(IbexPlicState *s, uint32_t context)
-{
-    int i;
-    uint32_t max_irq =3D 0;
-    uint32_t max_prio =3D s->threshold;
-
-    for (i =3D 0; i < s->pending_num; i++) {
-        uint32_t irq_num =3D ctz64(s->pending[i]) + (i * 32);
-
-        if (!(s->pending[i] & s->enable[i])) {
-            /* No pending and enabled IRQ */
-            continue;
-        }
-
-        if (s->priority[irq_num] > max_prio) {
-            max_irq =3D irq_num;
-            max_prio =3D s->priority[irq_num];
-        }
-    }
-
-    if (max_irq) {
-        s->claim =3D max_irq;
-        return true;
-    }
-
-    return false;
-}
-
-static void ibex_plic_update(IbexPlicState *s)
-{
-    int i;
-
-    for (i =3D 0; i < s->num_cpus; i++) {
-        qemu_set_irq(s->external_irqs[i], ibex_plic_irqs_pending(s, 0));
-    }
-}
-
-static void ibex_plic_reset(DeviceState *dev)
-{
-    IbexPlicState *s =3D IBEX_PLIC(dev);
-
-    s->threshold =3D 0x00000000;
-    s->claim =3D 0x00000000;
-}
-
-static uint64_t ibex_plic_read(void *opaque, hwaddr addr,
-                               unsigned int size)
-{
-    IbexPlicState *s =3D opaque;
-    int offset;
-    uint32_t ret =3D 0;
-
-    if (addr_between(addr, s->pending_base, s->pending_num)) {
-        offset =3D (addr - s->pending_base) / 4;
-        ret =3D s->pending[offset];
-    } else if (addr_between(addr, s->source_base, s->source_num)) {
-        qemu_log_mask(LOG_UNIMP,
-                      "%s: Interrupt source mode not supported\n", __fun=
c__);
-    } else if (addr_between(addr, s->priority_base, s->priority_num)) {
-        offset =3D (addr - s->priority_base) / 4;
-        ret =3D s->priority[offset];
-    } else if (addr_between(addr, s->enable_base, s->enable_num)) {
-        offset =3D (addr - s->enable_base) / 4;
-        ret =3D s->enable[offset];
-    } else if (addr_between(addr, s->threshold_base, 1)) {
-        ret =3D s->threshold;
-    } else if (addr_between(addr, s->claim_base, 1)) {
-        int pending_num =3D s->claim / 32;
-        s->pending[pending_num] &=3D ~(1 << (s->claim % 32));
-
-        /* Set the interrupt as claimed, but not completed */
-        s->claimed[pending_num] |=3D 1 << (s->claim % 32);
-
-        /* Return the current claimed interrupt */
-        ret =3D s->claim;
-
-        /* Clear the claimed interrupt */
-        s->claim =3D 0x00000000;
-
-        /* Update the interrupt status after the claim */
-        ibex_plic_update(s);
-    }
-
-    return ret;
-}
-
-static void ibex_plic_write(void *opaque, hwaddr addr,
-                            uint64_t value, unsigned int size)
-{
-    IbexPlicState *s =3D opaque;
-
-    if (addr_between(addr, s->pending_base, s->pending_num)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: Pending registers are read only\n", __func__)=
;
-    } else if (addr_between(addr, s->source_base, s->source_num)) {
-        qemu_log_mask(LOG_UNIMP,
-                      "%s: Interrupt source mode not supported\n", __fun=
c__);
-    } else if (addr_between(addr, s->priority_base, s->priority_num)) {
-        uint32_t irq =3D ((addr - s->priority_base) >> 2) + 1;
-        s->priority[irq] =3D value & 7;
-        ibex_plic_update(s);
-    } else if (addr_between(addr, s->enable_base, s->enable_num)) {
-        uint32_t enable_reg =3D (addr - s->enable_base) / 4;
-
-        s->enable[enable_reg] =3D value;
-    } else if (addr_between(addr, s->threshold_base, 1)) {
-        s->threshold =3D value & 3;
-    } else if (addr_between(addr, s->claim_base, 1)) {
-        if (s->claim =3D=3D value) {
-            /* Interrupt was completed */
-            s->claim =3D 0;
-        }
-        if (s->claimed[value / 32] & 1 << (value % 32)) {
-            int pending_num =3D value / 32;
-
-            /* This value was already claimed, clear it. */
-            s->claimed[pending_num] &=3D ~(1 << (value % 32));
-
-            if (s->hidden_pending[pending_num] & (1 << (value % 32))) {
-                /*
-                 * If the bit in hidden_pending is set then that means w=
e
-                 * received an interrupt between claiming and completing
-                 * the interrupt that hasn't since been de-asserted.
-                 * On hardware this would trigger an interrupt, so let's
-                 * trigger one here as well.
-                 */
-                s->pending[pending_num] |=3D 1 << (value % 32);
-            }
-        }
-    }
-
-    ibex_plic_update(s);
-}
-
-static const MemoryRegionOps ibex_plic_ops =3D {
-    .read =3D ibex_plic_read,
-    .write =3D ibex_plic_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
-    .valid =3D {
-        .min_access_size =3D 4,
-        .max_access_size =3D 4
-    }
-};
-
-static void ibex_plic_irq_request(void *opaque, int irq, int level)
-{
-    IbexPlicState *s =3D opaque;
-
-    ibex_plic_irqs_set_pending(s, irq, level > 0);
-    ibex_plic_update(s);
-}
-
-static Property ibex_plic_properties[] =3D {
-    DEFINE_PROP_UINT32("num-cpus", IbexPlicState, num_cpus, 1),
-    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 176),
-
-    DEFINE_PROP_UINT32("pending-base", IbexPlicState, pending_base, 0),
-    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 6),
-
-    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x18),
-    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 6),
-
-    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x=
30),
-    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 177)=
,
-
-    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x300)=
,
-    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 6),
-
-    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, =
0x318),
-
-    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x31c),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void ibex_plic_init(Object *obj)
-{
-    IbexPlicState *s =3D IBEX_PLIC(obj);
-
-    memory_region_init_io(&s->mmio, obj, &ibex_plic_ops, s,
-                          TYPE_IBEX_PLIC, 0x400);
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
-}
-
-static void ibex_plic_realize(DeviceState *dev, Error **errp)
-{
-    IbexPlicState *s =3D IBEX_PLIC(dev);
-    int i;
-
-    s->pending =3D g_new0(uint32_t, s->pending_num);
-    s->hidden_pending =3D g_new0(uint32_t, s->pending_num);
-    s->claimed =3D g_new0(uint32_t, s->pending_num);
-    s->source =3D g_new0(uint32_t, s->source_num);
-    s->priority =3D g_new0(uint32_t, s->priority_num);
-    s->enable =3D g_new0(uint32_t, s->enable_num);
-
-    qdev_init_gpio_in(dev, ibex_plic_irq_request, s->num_sources);
-
-    s->external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_cpus);
-    qdev_init_gpio_out(dev, s->external_irqs, s->num_cpus);
-
-    /*
-     * We can't allow the supervisor to control SEIP as this would allow=
 the
-     * supervisor to clear a pending external interrupt which will resul=
t in
-     * a lost interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
-     * hardware controlled when a PLIC is attached.
-     */
-    MachineState *ms =3D MACHINE(qdev_get_machine());
-    unsigned int smp_cpus =3D ms->smp.cpus;
-    for (i =3D 0; i < smp_cpus; i++) {
-        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(i));
-        if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
-            error_report("SEIP already claimed");
-            exit(1);
-        }
-    }
-
-    msi_nonbroken =3D true;
-}
-
-static void ibex_plic_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(klass);
-
-    dc->reset =3D ibex_plic_reset;
-    device_class_set_props(dc, ibex_plic_properties);
-    dc->realize =3D ibex_plic_realize;
-}
-
-static const TypeInfo ibex_plic_info =3D {
-    .name          =3D TYPE_IBEX_PLIC,
-    .parent        =3D TYPE_SYS_BUS_DEVICE,
-    .instance_size =3D sizeof(IbexPlicState),
-    .instance_init =3D ibex_plic_init,
-    .class_init    =3D ibex_plic_class_init,
-};
-
-static void ibex_plic_register_types(void)
-{
-    type_register_static(&ibex_plic_info);
-}
-
-type_init(ibex_plic_register_types)
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index a1d00aa48d..c89d2ca180 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -32,7 +32,6 @@ specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files(=
'armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'=
))
 specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c=
', 'exynos4210_combiner.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
-specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_plic.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongso=
n_liointc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
--=20
2.31.1


