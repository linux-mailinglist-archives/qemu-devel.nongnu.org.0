Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03834378AC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:06:07 +0200 (CEST)
Received: from localhost ([::1]:55808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvBO-0003ky-Rt
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mduml-0001rI-HR
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:39 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumj-0001Qs-7I
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910036; x=1666446036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dwlquLthjZX05TmT+2s13vlTEdXzJHoYR1quCMUbtY8=;
 b=K+9ukvZNOcT0Jw86KoTfq2BRPMyKqBBvHKEvYafFbMAx4XNpVtEAVxbl
 9t1Q4ZqYgNM6RuI8LZGZ+VUFXyA+CCnAqFjVEK+x0nP/NCe5X90B2ucIf
 M5glzCp5MOXxWcplcNTRfACQEPwnUSwNUa682NgbSrCjqUUGcFsK33E1c
 nIqpfD+0uvOn0LOWZnG+3VdsBUKJLARJ/Q7sq4In50d9vsZM6zMIE1CEN
 YfOfJDAvew4+qxTkK+cGTcfS/katogGIc7nhHZHZA896hnQ520wis5RAc
 YuM0ICFNXdobyFLjwi7JUvypFYSz1SYlFNMqAtF5Xt2UCD2UhvTlgja5k Q==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="183617900"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:35 +0800
IronPort-SDR: tbHUpoc90/rJXWocGQVOpGS5nvIAvkgFRjUb2ugnY+LmEh6ckPPZ+HjTSJHQcYx98g1/fm1mjb
 rrW6hiAKSMXujnzZwpIVRYRM0pOjiErIFUNSt25QxSZjbrBLZNnHKE09k2/KSgMhcLxm+8Lpsi
 de6y51TeK+xF7cs3qclAdSdQsN//5kWj6ThFD+gw9AXWz+egx/v1AtGwj1nfFKpf47+wPBfCHo
 hYJMabb2IYmoceQL1+DzZGdRvl+8Sn852hLYRcIUecjEcUgM+1LST7rsk9TZP8bWbqiEykhTLy
 5UDIeag9rOYkR9JDjHWnFAVc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:11 -0700
IronPort-SDR: dj4KRTpx8JURfM+uTVNmTL0gBCYddmQAfr6s/nsu9ZnEkPJjyHETHZC7C5ru96K4Lv3SqkE/8N
 z2RYLL2hehN0ZK+xASbhnNALzD2VaJK2wSah2KSsIk7usYud8xpeMiqk3wqVZWC8BJJuxbX2yT
 gT9IIULEaN1GG5VuNWKox/skeGBeoSzJzTVrjDMhNGQaVuY+nCUFv1LWCWpWVvhTNoakf39GUj
 HiexS8oM5Y216qyuweJPasb8ZFTkf8c9byzQnuu5ZOpKqdU2MCn1Y9gilw7ZDN3VYbkejpLWPW
 9aE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQTc1RZVz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910035; x=1637502036; bh=dwlquLthjZX05TmT+2
 s13vlTEdXzJHoYR1quCMUbtY8=; b=EeKLqG8PV3ddB1bCn8ZEzxlfQJOTe/aXUS
 6iZfCDpvS27CWH4v6dSIBNMpAT+8RWLvwHoga3ZniEJt08wS077jaYD+AIejJWfq
 qpWH0Ec98viFn6HkNCTWC0bGiDs7GKcg8C84d75qjaC+AIRV2ceu6TohadS8aqqf
 z5vZPUgkwCd9QNGN5KsiYzLPkhs1nELgVKndNro7ZnvTzjcwgzl2+5cu6s2Is8Dr
 7f7j8jL/LnTRUUgxABJaTz6Y1Bt5NLMsHRU3nev0if1z+7wi6foeImaQu3hLGWII
 8zf3bx3zpDLlqXx4bMsrHB/DWBccG4vJdrKMrJdx+kbzeBXWvIlA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UrYcejofUIyr for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:35 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQTX28MNz1RtVl;
 Fri, 22 Oct 2021 06:40:31 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 23/33] hw/riscv: opentitan: Update to the latest build
Date: Fri, 22 Oct 2021 23:38:02 +1000
Message-Id: <20211022133812.3972903-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

Update the OpenTitan machine model to match the latest OpenTitan FPGA
design.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alist=
air.francis@wdc.com
---
 include/hw/riscv/opentitan.h |  6 +++---
 hw/riscv/opentitan.c         | 22 +++++++++++++++++-----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 9f93bebdac..eac35ef590 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -20,7 +20,7 @@
 #define HW_OPENTITAN_H
=20
 #include "hw/riscv/riscv_hart.h"
-#include "hw/intc/ibex_plic.h"
+#include "hw/intc/sifive_plic.h"
 #include "hw/char/ibex_uart.h"
 #include "hw/timer/ibex_timer.h"
 #include "qom/object.h"
@@ -34,7 +34,7 @@ struct LowRISCIbexSoCState {
=20
     /*< public >*/
     RISCVHartArrayState cpus;
-    IbexPlicState plic;
+    SiFivePLICState plic;
     IbexUartState uart;
     IbexTimerState timer;
=20
@@ -87,7 +87,7 @@ enum {
 };
=20
 enum {
-    IBEX_TIMER_TIMEREXPIRED0_0 =3D 125,
+    IBEX_TIMER_TIMEREXPIRED0_0 =3D 126,
     IBEX_UART0_RX_PARITY_ERR_IRQ =3D 8,
     IBEX_UART0_RX_TIMEOUT_IRQ =3D 7,
     IBEX_UART0_RX_BREAK_ERR_IRQ =3D 6,
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 9803ae6d70..601f8deebe 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -46,19 +46,19 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
     [IBEX_DEV_PADCTRL] =3D        {  0x40470000,  0x1000  },
     [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
-    [IBEX_DEV_PLIC] =3D           {  0x41010000,  0x1000  },
     [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
     [IBEX_DEV_HMAC] =3D           {  0x41110000,  0x1000  },
     [IBEX_DEV_KMAC] =3D           {  0x41120000,  0x1000  },
-    [IBEX_DEV_KEYMGR] =3D         {  0x41130000,  0x1000  },
+    [IBEX_DEV_OTBN] =3D           {  0x41130000,  0x10000 },
+    [IBEX_DEV_KEYMGR] =3D         {  0x41140000,  0x1000  },
     [IBEX_DEV_CSRNG] =3D          {  0x41150000,  0x1000  },
     [IBEX_DEV_ENTROPY] =3D        {  0x41160000,  0x1000  },
     [IBEX_DEV_EDNO] =3D           {  0x41170000,  0x1000  },
     [IBEX_DEV_EDN1] =3D           {  0x41180000,  0x1000  },
     [IBEX_DEV_ALERT_HANDLER] =3D  {  0x411b0000,  0x1000  },
     [IBEX_DEV_NMI_GEN] =3D        {  0x411c0000,  0x1000  },
-    [IBEX_DEV_OTBN] =3D           {  0x411d0000,  0x10000 },
     [IBEX_DEV_PERI] =3D           {  0x411f0000,  0x10000 },
+    [IBEX_DEV_PLIC] =3D           {  0x48000000,  0x4005000  },
     [IBEX_DEV_FLASH_VIRTUAL] =3D  {  0x80000000,  0x80000 },
 };
=20
@@ -105,7 +105,7 @@ static void lowrisc_ibex_soc_init(Object *obj)
=20
     object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY=
);
=20
-    object_initialize_child(obj, "plic", &s->plic, TYPE_IBEX_PLIC);
+    object_initialize_child(obj, "plic", &s->plic, TYPE_SIFIVE_PLIC);
=20
     object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
=20
@@ -145,6 +145,18 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
                                 &s->flash_alias);
=20
     /* PLIC */
+    qdev_prop_set_string(DEVICE(&s->plic), "hart-config", "M");
+    qdev_prop_set_uint32(DEVICE(&s->plic), "hartid-base", 0);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "num-sources", 180);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "num-priorities", 3);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200004);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 4);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
+
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
         return;
     }
@@ -153,7 +165,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     for (i =3D 0; i < ms->smp.cpus; i++) {
         CPUState *cpu =3D qemu_get_cpu(i);
=20
-        qdev_connect_gpio_out(DEVICE(&s->plic), i,
+        qdev_connect_gpio_out(DEVICE(&s->plic), ms->smp.cpus + i,
                               qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
     }
=20
--=20
2.31.1


