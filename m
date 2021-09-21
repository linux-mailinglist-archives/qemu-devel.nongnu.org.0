Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27F412EE1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:58:08 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZjD-0001zS-Di
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZg0-0007ds-Lo
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:49 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZfx-0003lr-B3
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207284; x=1663743284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CBsfhYFKjqvmOlHyimgBj0IVZ6vQo4ThlAu38+MgGcM=;
 b=M03kdqhvGfwyxiXigWpafMx1TE/EbTyZGAOfJTcjZKj6pPW/Pathv2iw
 /8f5Tv2TRdSLd3/TtI13Bpw2pdh7+ZnjSa3y+4R4L7w9MOnOhC230u2+0
 xfoEB/PHM2pOEnlWQ7Gng6sJvBCHThPuq0cdKInPW7GWLdFC53D5h8CKY
 5pofCa/mVYMHWWFgQ2GtityUAAwU0RcZsCOWfzx8eX92hkL9r5XbkkhUu
 Yg+46Mc8+NDiRdn+j2/7PhVr3VbPHopAgnztsBpQJ5Y5eS6xvSXUdNAdM
 nzC8BI3/qTpJqUErb0I+jDHoW5VIFo4jVsUtBjBUE1ungq4/ucPaj2UrY g==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="180529380"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:54:41 +0800
IronPort-SDR: 101vi6M8YGqts5m/GcxgjUjuzJ62bSi828ODoaGfaiE578pc4WaZif44Ifjt87ZoIGp61/GHHt
 FiFEBPnwlYSoCZ9t72bpDC+LIkSmrKKE3ay2rRdi0B+jIIV3dZt9saYqt08L+BVu9pAnRtMUsa
 IbDUVrKCEhHrPA7UwTy5wQyrI0qpISpZHzboABgPk+Z4UkfGy81KfQJbit8aNJBSX/L8sUXdGZ
 QtjLKjI2A4Rx+BBv+FZQc4Syy77metZTYLE31QlY9TcPaVk/BmtuW15U4WnAwQ0G75cEtDuZRk
 XpGX2e1xpuCiuOtYx60bl+Nt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:29:23 -0700
IronPort-SDR: PzGqEbNLQy8AsnnNqRAYNqsJAi7wL2w6ta8QvIfV9a+KudHmmu1JSd138T7KvX9CvWkXJHKtXA
 N5b1/YUB9QEB7Hx83NZQlaFOAr+32c5yn60bDEuS665DCzQaH9HH0BIK3cYPwTqq0y+gY76ej3
 T10PnmzcnVuCS7mDxAqqTEiwJ2CWNU4x6/96k08hAZ9MffrLFZ6PGTWJcSLnclGt0a37lOxNOo
 Z/Tdwh54Y7r6HRR1lzBpdfG31Q5B5pR2wFFKAH/q+6dGlV3pCZm2jZ6WwURJhS2n/gxafu6CFf
 e2Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:54:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBxY4qXSz1Rws7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:54:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1632207281; x=1634799282; bh=CBsfhYF
 KjqvmOlHyimgBj0IVZ6vQo4ThlAu38+MgGcM=; b=iXTZk4fqIq9dLaO2Y2AF8d5
 wsSeVHRNd0LXivEjclLNFHBtPK7GNunFgwNSOF5uCd0Ozr6y+E5oglr+wpkZG740
 njJ0hSgcRnN9KgpQf/Xavs4ebpYWNYsTQhtvXEiZ3QYN8mkOVSxvF2inRG8YzZN6
 XIJVi2Qad2As3jiqSiIgey+SEia5hPN3gdzQRttX8voRIXJDuDTHCdfQoAeVWYKx
 dJiQywcQ04tp89Z5YHXjFVk4ldEF3QNrTEylUttWB7Yvx7F6fOug/+k4DdVD7rpB
 W7DtTjU635z8e3ITE6YUKQsPjxpjPuOKcN8lvpditl8CsVMD3TYCKrUMDOD+wyA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DlUr4DWgcR5D for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:54:41 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBxR5lgMz1RvlH;
 Mon, 20 Sep 2021 23:54:35 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 03/21] target/riscv: Expose interrupt pending bits as GPIO
 lines
Date: Tue, 21 Sep 2021 16:53:54 +1000
Message-Id: <20210921065412.312381-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
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

Expose the 12 interrupt pending bits in MIP as GPIO lines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alist=
air.francis@wdc.com
---
 target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d4d5961807..7c626d89cd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -567,11 +567,41 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
     mcc->parent_realize(dev, errp);
 }
=20
+#ifndef CONFIG_USER_ONLY
+static void riscv_cpu_set_irq(void *opaque, int irq, int level)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(opaque);
+
+    switch (irq) {
+    case IRQ_U_SOFT:
+    case IRQ_S_SOFT:
+    case IRQ_VS_SOFT:
+    case IRQ_M_SOFT:
+    case IRQ_U_TIMER:
+    case IRQ_S_TIMER:
+    case IRQ_VS_TIMER:
+    case IRQ_M_TIMER:
+    case IRQ_U_EXT:
+    case IRQ_S_EXT:
+    case IRQ_VS_EXT:
+    case IRQ_M_EXT:
+        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+#endif /* CONFIG_USER_ONLY */
+
 static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     cpu_set_cpustate_pointers(cpu);
+
+#ifndef CONFIG_USER_ONLY
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+#endif /* CONFIG_USER_ONLY */
 }
=20
 static Property riscv_cpu_properties[] =3D {
--=20
2.31.1


