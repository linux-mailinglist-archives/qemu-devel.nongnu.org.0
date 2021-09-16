Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C540ECEF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:52:39 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzJ8-0000JY-3y
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGS-0005XP-Jn
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:52 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGQ-0002Im-LL
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828990; x=1663364990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99ImnJFBOxDe61AbQqL9Ht7fJhvAnx0MQ2riekjsr3k=;
 b=AuepQ+vqvFLjPWCILQWBWTKH3SGVkZKO1QiAm9F5lxHyRuFpGfICEfEz
 gqYfVXxLzoIB2I2FozDz3t2ohpjZIMvgKLdSy6625Hf+RKTtCRrc1/WPQ
 3CDM8A2bPN0FVmL/cCTQbdOjcQu7iCyFFT30r28Yg6W9+OACNxCE012iH
 knuCOQKqJ/aB+aB/jviw2fmihrCBwHPHqGGU2VNMM1Rol5L9uaxdZ76yY
 4bWKKhsRqAaaE5+QCBQJYA2vEzbayKjHPtmLeUIPb55O0WtOGWrrM6OQO
 1LC5yHQoeu5XtfORxhoM31x8xKsWg+HvbM0Hxu6xLCbYs8NQ+Q+vUdqis A==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="179283065"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:49 +0800
IronPort-SDR: JAGypVPbaI92EUaKE+PW6pQVyaM/DPlVWMtoJ4KFgSZ4r1klc4+1e3huDY+8pFQcludDbIEzGi
 aCEaiu/HHVldA1KpWDEjo4Lp2ZuMHZGnte+/VJBlmEsVveSoudqQTuo679BC+dZunXqdWu5QPI
 Mo7R9f0CtGJta0d6MUDssGD38MiYVd+UcPXYe+yKE24fSPOzY4k5hCVnwalfJ3Ix+yijq8yWkA
 fNPjUeJ1HGv7PNEd2XjqkPQiNxJ6Ds+z729pYv0DI2EEppxkByGJvaczdY0SDMP0oBMoOnrD+p
 eXf3MPcBgrh5ZJuM6oHn6ZHm
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:26:09 -0700
IronPort-SDR: NT3sCWsZBfq0H3rUPKBVKGxyfr7J/O8ZyP9rpouLGPv4LoagyPM/Y7EY0OFeZprI8i4KnMscmj
 W02rHVKuQi+XZSaTOfDo27nfw9jEc6CGRanx8pFrmukXZOJMiw6kmqddyf95GXN3nqyA4m7dRD
 8ypVadzf7jiEHz77jwxFyp5tDboniISfvFi3aW4JcBhQRGOFhsqQlA/cDaCdM0At0Hp7vG0Y34
 2HBFHfC+DYIgMJ6cBzhwFEVJSe8XO2MYm6kJMDlbr9OuFOyVE5u7kC/AFQ712kgjiBtnBkg1LW
 NoM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W2h4zhRz1RvlV
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1631828988; x=1634420989; bh=99ImnJF
 BOxDe61AbQqL9Ht7fJhvAnx0MQ2riekjsr3k=; b=diRqNEBmVAWoE5SjRXeWVsQ
 zcqjPFPs5vZ4lxQfOOWnD36KQTAykHdIpP84oU1fRjxSt08pkKV5ty35N2lK3yw5
 0p7aj1MJiUBMqdjK0PUznPuj3kvIoJrOOXeWQxu3U5Wk5AZ5KtmwicNv0pm0+QSF
 3mRinfNnsCTdJzh3J3OKRDNq5CWbMpLTSq7noVA/zP8WzVNhNdRh90jFnR+OjGw8
 mf8T1i+Z+wfLDS4ztUIA9QYuFx/yGTt0GBla5gRtOUwFY1iX6uexSpQhT+6/yO4s
 V24TAaR1Z6hNvRUWdCT+UXL38G4mlR9HP60Zr5WIvCcRr/RyktiixUUgVkRcz+Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6PZqKBBeETKY for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:48 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W2c2FRQz1Rwrx;
 Thu, 16 Sep 2021 14:49:43 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/21] hw/intc: ibex_timer: Convert the timer to use RISC-V CPU
 GPIO lines
Date: Fri, 17 Sep 2021 07:48:50 +1000
Message-Id: <20210916214904.734206-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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


