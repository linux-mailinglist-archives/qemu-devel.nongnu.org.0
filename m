Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B1140ECF1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:54:51 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzLG-0004p2-BY
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGI-0004wH-Nb
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:42 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:30147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGF-00026z-Ny
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828979; x=1663364979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9dqhyHMYdF9AOlQecux0OsVIWEFoz2IeXGIHMuQrRc=;
 b=mU7wY73cOHyRmeAYiFDpYztC99GrX+RTtHNJyV4FP7oO7/JuiEZfnd3A
 de00Kn2wlFBHvoANbt0r9cTiGbEyRqmE8B3wGF/5c/Q3z8ElXSRLnuDMn
 jCDUdYVQrM6Z9EzgyBdR0jyWWKQzqtrEE1GD+uoZFfm9IyuXZSMWcfJuu
 Rz1KCFnC8IPUDUyKbE+hWiT4bF1iTH+O90PS83jIfnijuXAmVNYPARo0X
 KQXhPhdg+PwVzCdTg4D8T6I8OHE1Hvv4Vmn5KSFQypK3qjE3itkhU9uzi
 9cBte9ryIIq6uJQ43QtiNcGMKPoe0APfmp1eyR20JOnWllkJN/R6GXN2B Q==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="291828393"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:38 +0800
IronPort-SDR: Jfa9HXZ0YXskmGxsJuH42ZxcyBvBa+knjH6grfjTu4FIwoipTJkC5ptX5IN7HAqefwnKqxQ8uE
 OHIWhkGnA2lvLuhGNfDWb+qZarCYqJ3EQtBQclHyUTqPqdz01wSPZgvz1DPlQfD8i4vUVj/mWV
 s7BeN3XdycovWoxnzjHzaplthlAMGMg+5quL5glGDzakh7uZMLV+/VMxpYMk96aVqPi2dbrN13
 l9yvj1TF3Zbm9rVUbLuOi4AdiNbXDMyeGbi3wq6I4FHGq5ByBQNUxJhr+pfdODtfHRLh7ABd5M
 6whUZk1LfbpLc+azfITnBbkt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:59 -0700
IronPort-SDR: 5R+cIQiiRXRwq6Vni8xa5C9B35iV3LJTL6Nd/AFjTb8VUMuFJD0rDPjvMoAlQ2FYt91TSGuPAz
 2EJQZBzecnrGYLflaBQ1erSUX9s+jEbW5E8VL8wFdx0XFpD/Vx8u2FBcGvIIH2+4oh6yYqdAed
 e/36TtVVSIVBQT/GURx6XbojeM8W6iozdWy3r2sA723fvK7HWUMWCELk1xA17+kXXKG2jJO/F7
 kieh20C1h2CiREHkl8uR1pmKE8lhPgj6HIAc70z0KlSAtlMt9KLPXjEidL5Kwbq4c922GkJX30
 7rk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W2V4RbXz1Rwrx
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1631828978; x=1634420979; bh=w9dqhyH
 MYdF9AOlQecux0OsVIWEFoz2IeXGIHMuQrRc=; b=tYMkIksOH0xWRbAbzCvNkp1
 j09HzWeBE7nLnjRtuTCPw7Urn6SCd/AV701g0Un0lRwEvuVbkYS3xHfENSVC1iYJ
 qomg7iYsFS47DmhhkToclDrXU2+7osUgCBicSsSqQY0SVoxrX/MvWPFSCeUFf6kV
 tmeuSWT89NgLpyURG51Bd/a0Ag8XJPwgPjnllZoz7kw3YhVB9voxTnfVrh+53WZ0
 /AOs9xNhfLsJcO79kAZiOjFZhXCQfw/UEkKzT9vyzais4FfC0KWWRZbYXWUaWgqX
 fo203r1jwj1jt0q3Jt2oEZDeSb+ZSIrCtH7reRVLiPXmI8IDI47RFzoD7teAWVA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wyVuOvCvY7US for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:38 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W2Q2YJZz1RvlX;
 Thu, 16 Sep 2021 14:49:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/21] hw/intc: ibex_plic: Convert the PLIC to use RISC-V CPU
 GPIO lines
Date: Fri, 17 Sep 2021 07:48:48 +1000
Message-Id: <20210916214904.734206-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 0a76946981852f5bd15f0c37ab35b253371027a8.1630301632.git.alist=
air.francis@wdc.com
---
 include/hw/intc/ibex_plic.h |  2 ++
 hw/intc/ibex_plic.c         | 17 ++++++-----------
 hw/riscv/opentitan.c        |  8 ++++++++
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index 7fc495db99..d596436e06 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -60,6 +60,8 @@ struct IbexPlicState {
     uint32_t threshold_base;
=20
     uint32_t claim_base;
+
+    qemu_irq *external_irqs;
 };
=20
 #endif /* HW_IBEX_PLIC_H */
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index edf76e4f61..ff430356f8 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -27,6 +27,7 @@
 #include "target/riscv/cpu_bits.h"
 #include "target/riscv/cpu.h"
 #include "hw/intc/ibex_plic.h"
+#include "hw/irq.h"
=20
 static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
 {
@@ -92,19 +93,10 @@ static bool ibex_plic_irqs_pending(IbexPlicState *s, =
uint32_t context)
=20
 static void ibex_plic_update(IbexPlicState *s)
 {
-    CPUState *cpu;
-    int level, i;
+    int i;
=20
     for (i =3D 0; i < s->num_cpus; i++) {
-        cpu =3D qemu_get_cpu(i);
-
-        if (!cpu) {
-            continue;
-        }
-
-        level =3D ibex_plic_irqs_pending(s, 0);
-
-        riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(leve=
l));
+        qemu_set_irq(s->external_irqs[i], ibex_plic_irqs_pending(s, 0));
     }
 }
=20
@@ -268,6 +260,9 @@ static void ibex_plic_realize(DeviceState *dev, Error=
 **errp)
=20
     qdev_init_gpio_in(dev, ibex_plic_irq_request, s->num_sources);
=20
+    s->external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_cpus);
+    qdev_init_gpio_out(dev, s->external_irqs, s->num_cpus);
+
     /*
      * We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 36a41c8b5b..048aced0ec 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -118,6 +118,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     MachineState *ms =3D MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem =3D get_system_memory();
+    int i;
=20
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
@@ -149,6 +150,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0, memmap[IBEX_DEV_PLIC].b=
ase);
=20
+    for (i =3D 0; i < ms->smp.cpus; i++) {
+        CPUState *cpu =3D qemu_get_cpu(i);
+
+        qdev_connect_gpio_out(DEVICE(&s->plic), i,
+                              qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
+    }
+
     /* UART */
     qdev_prop_set_chr(DEVICE(&(s->uart)), "chardev", serial_hd(0));
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->uart), errp)) {
--=20
2.31.1


