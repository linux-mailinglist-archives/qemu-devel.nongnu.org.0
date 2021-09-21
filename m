Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EA0412EF6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:02:34 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZnV-0007rG-Cg
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZgM-0007yl-Im
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:10 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:30721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZgJ-000449-F0
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207306; x=1663743306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99ImnJFBOxDe61AbQqL9Ht7fJhvAnx0MQ2riekjsr3k=;
 b=e/GtYarGa14SoxRN+q1Q0sLEMtCfgMvsu3k+r/KYxhRXdx1pm1W+XKc6
 BKvH3BArBDPk5yyBcrWBjGbXOmCgMXxywB/fFRyooeMZffDXCAeWWFgTP
 XNl8x4LpfyxrL1xO+hjNS/qM7jIYhWKUoL3DzLLo1KO65LZ22gUCKskck
 pf/uUmi1G+hWpRkpl6AzRfqrE3GZHD/JThkTY3CjNu6NJIRqoEr41vqB6
 LERS71g4pjQ3vtqu/R4MOxCbNexTPP1uoSw/khR1PWp4In96u7HPrWlP/
 Gen/PoMGFrlg6ETMIfPum+Nv78x4nWy/ihTiFdsHfEDr2LqzmjXFIBRsq g==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="185304873"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:55:03 +0800
IronPort-SDR: y2posg3Y118uSYzJPQNfRqM3AyA7hvx1i6Qbaqhcvb4mjrKB5kixziuyKLr/e4zjigPXQa1AXS
 NsEn7jfwfB6VUY+Ul7PIjG6wLKOW5ileeb/k5kXvlpJfC3uKNlsZysgD5Bwl29TtBLs+pJBpic
 /RqkICrGbTTv3Ds1/JgXqkvLFz2luKKciaLSa3njeX9jScTMaCn5oOXC2DyANk928rJqR47+x2
 SdgHjX5xGoV3/Hm1PNrAlEjoWizsMI/bxgG/NvJ9/owFPGPhDpyK5Gf6Xlrr+Rcju+voolZ9jX
 NWMWLsiRvfKADnzB7As9t1Nt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:31:18 -0700
IronPort-SDR: MzE5RiZRUvFFHG4tr5MU3L4CU5ouqb5nSYYn2KyhIYIfwL+t3I/KjVsrHXi37d7HtTVY69oih0
 uh3pbq6Ve0yxCnqdF6ph6gggRXPgwnyTB7P4WSkyPyA8S26IY/4Hvn1MGBQ5au89jsGPHwiOyu
 f7DfbwguDb8dnR6GLjOGbwGsDdYPYme9C6R0oSklK0ZXZUI5ZrnI86fnB546MQk8Lp/sXxWqfs
 xLd9Qpt42Bds8peveCMpNOnscJkaLUcPoSQCwp3Mcgu72AiwIg60HfoogiNCy5EbWXZ9pveqND
 VqM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:55:05 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBy02BJfz1Rwry
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:55:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1632207303; x=1634799304; bh=99ImnJF
 BOxDe61AbQqL9Ht7fJhvAnx0MQ2riekjsr3k=; b=ZtxSpeViSzGO7Py/NJhl1DA
 Axax/dz1NO//eO8nwddjTaf5SP5MuE0tuGNIyn5D5Ay3f7mxPiNMXb2JrN6WYzWG
 hmHawvmgJy+c2tnwL1bwPmrkPmJzCwH1SWnxUN8EUEKMEVh912purh3OxMEPnome
 BrBfDK52M32gLyn9OolM/zBcXKpzkjFxSm0B9JsTufydWg+qBKtaSUNDiSrEuVJz
 hXzcR7DvzQhwuXabBZpUQMVh2jOzyY/KPU9ZiBaCvM3buY2SjVnc3AD2+9XPtGmP
 X2IrfXUNM3HNQwqWr5dzG+X0L0BXCo+R8BJaQ8bfGuZHGsSDSGRnFZBWJHS1UAQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1in5tGBIN5n7 for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:55:03 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBxt6wKZz1RvlH;
 Mon, 20 Sep 2021 23:54:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 07/21] hw/intc: ibex_timer: Convert the timer to use RISC-V
 CPU GPIO lines
Date: Tue, 21 Sep 2021 16:53:58 +1000
Message-Id: <20210921065412.312381-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the timer MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 84d5b1d5783d2e79eee69a2f7ac480cc0c070db3.1630301632.git.alist=
air.francis@wdc.com
---
 include/hw/timer/ibex_timer.h |  2 ++
 hw/riscv/opentitan.c          |  3 +++
 hw/timer/ibex_timer.c         | 17 ++++++++++++-----
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.=
h
index 6a43537003..b6f69b38ee 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -48,5 +48,7 @@ struct IbexTimerState {
     uint32_t timebase_freq;
=20
     qemu_irq irq;
+
+    qemu_irq m_timer_irq;
 };
 #endif /* HW_IBEX_TIMER_H */
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 048aced0ec..f7cfcf1c3a 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -183,6 +183,9 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
                        0, qdev_get_gpio_in(DEVICE(&s->plic),
                        IBEX_TIMER_TIMEREXPIRED0_0));
+    qdev_connect_gpio_out(DEVICE(&s->timer), 0,
+                          qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
+                                           IRQ_M_TIMER));
=20
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 5befb53506..66e1f8e48c 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -77,7 +77,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
-        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+        qemu_irq_raise(s->m_timer_irq);
         if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
             s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
             qemu_set_irq(s->irq, true);
@@ -86,7 +86,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     }
=20
     /* Setup a timer to trigger the interrupt in the future */
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
=20
     diff =3D cpu->env.timecmp - now;
@@ -106,10 +106,8 @@ static void ibex_timer_update_irqs(IbexTimerState *s=
)
 static void ibex_timer_cb(void *opaque)
 {
     IbexTimerState *s =3D opaque;
-    CPUState *cs =3D qemu_get_cpu(0);
-    RISCVCPU *cpu =3D RISCV_CPU(cs);
=20
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+    qemu_irq_raise(s->m_timer_irq);
     if (s->timer_intr_enable & R_INTR_ENABLE_IE_0_MASK) {
         s->timer_intr_state |=3D R_INTR_STATE_IS_0_MASK;
         qemu_set_irq(s->irq, true);
@@ -280,12 +278,21 @@ static void ibex_timer_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 }
=20
+static void ibex_timer_realize(DeviceState *dev, Error **errp)
+{
+    IbexTimerState *s =3D IBEX_TIMER(dev);
+
+    qdev_init_gpio_out(dev, &s->m_timer_irq, 1);
+}
+
+
 static void ibex_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->reset =3D ibex_timer_reset;
     dc->vmsd =3D &vmstate_ibex_timer;
+    dc->realize =3D ibex_timer_realize;
     device_class_set_props(dc, ibex_timer_properties);
 }
=20
--=20
2.31.1


