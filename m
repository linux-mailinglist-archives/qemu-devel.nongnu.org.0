Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C606940ECF2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:55:42 +0200 (CEST)
Received: from localhost ([::1]:34108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzM5-00063V-S3
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGS-0005YG-S5
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:52 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGQ-0002Gv-2n
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828990; x=1663364990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=noZAkPAu4Fs/80GeSUVXz+CUT1DXNyW73d+zbhysISc=;
 b=nhGijVkLTOKf8wEKBzDW7sTHoblNR8/An4/Yx0XydgbABhO+PYKUtcTh
 gHAe7hEprtVoaDyf13TyO+Ek5cyQT7QaalbFFLi3hsp6qruwqN7kUooKF
 fNCGom0Y6MtgP1+w7GhFVeVOsIlE86XYXLotpQu8XV9img1nlJPQWa86y
 B+V76iltl6mG4JJrIcf7BBwtehHzmJkpfHMBCDhi6gHzcLV+bo/jVXWHO
 VAL2rvHNQXSyAqrGl/IRmt2rWWJqJPnG+po+loSZa28WCbLakkh8oR92g
 TV5IGYkpyc7tj61Tr0hnb0Lb/G2knSqlG3cXv/E2pq8clz5eOKSYDdWqF A==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="179283061"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:46 +0800
IronPort-SDR: 9UfiWtkIjv2HfJPV8dDvSa4bYG62SNk8XZbMJgftZt48OmujrFgAXNxpHmMn4cQCh3/Jiownpi
 Sh3BElfZ251/1jCCCFW9piQ6NNE4aQUG3rI35sLHsHCwcpMpn+r1gmII3fUqSXUHKE0rbVdcD0
 kIlxE4xeOiPOmutkKX51uTC/3OVDghH4E8Qffx8SAuKXmZCUPEbTICeHHb9dasmyW7viSSEW6T
 Gp3wfrjsGT+iU7DeI34FvYkg/gssoXZWKoZjBeCp2Y034aYGf0qYaN03v5f34S3kOPtON6hz+R
 vLmZnEE+PYLEDyrPXaXc1dlk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:26:06 -0700
IronPort-SDR: d1nJXBq8UYf6QUNX2Uy/HBZ9+ycOpEFQyD3ne4oUkJ0iAR9fSTt8M5X2B7Dp//xeNWGjXBhgZW
 ntOhBRQzPOmk18a98bLOV5gDKPYCvRPZB8TA2cM9eKX3MiFeOKivdsfp9zciM+OwJ+nH0j0Mi9
 fFDH12WsVnYi6Z3OXjrvZjRIVtYGwOlnZr9LB4C/j8FqRWWpr6qOsL8ecVV0o1NSBjvVkKglm5
 sc+Oe8rkGKhXQ4B6g3HfpCirlnRlh65WnW06J5xZDWF9+HH3Fka9yXEuh8VW88gv4MxFV2/AP9
 cKc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W2d20Rhz1Rws9
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1631828983; x=1634420984; bh=noZAkPA
 u4Fs/80GeSUVXz+CUT1DXNyW73d+zbhysISc=; b=WUQMermf2mh0eKVfZjANM05
 MOX52oFWEy0cXKWirudbt5hfomHPIGRM3zpybif1cJXHbrFS/RofJVedQNe0XTrY
 wBwKB63ILu7ohk6Asid7pKYUCEMqe4QLGhkjG26LO+ccPsQZGIXOVDwFqBV57wdq
 EUJfdrLY0YDq9TjPHTesbZUF0uz4q6iEbfqtrlsXjQvX6uyXxWhJfsAnujCrOj6K
 uOR/HtlkAsGHAQbhqK6HiYCup7pUjVpqzG/ZVHC6HXuh7Aae4jq+8+OWXEq4SdnV
 XunOS7wsv3KnutBCSBBxW+koSc0ZFYrM+LOaBlOrPe3v/nkFZTDgldyFQgybRrA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Jb-SyeHFA61x for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:43 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W2W0Pmfz1RvlX;
 Thu, 16 Sep 2021 14:49:38 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 06/21] hw/intc: sifive_plic: Convert the PLIC to use RISC-V CPU
 GPIO lines
Date: Fri, 17 Sep 2021 07:48:49 +1000
Message-Id: <20210916214904.734206-7-alistair.francis@opensource.wdc.com>
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
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 0364190bfa935058a845c0fa1ecf650328840ad5.1630301632.git.alist=
air.francis@wdc.com
---
 include/hw/intc/sifive_plic.h |  4 ++++
 hw/intc/sifive_plic.c         | 30 +++++++++++++++++++++++-------
 hw/riscv/microchip_pfsoc.c    |  2 +-
 hw/riscv/shakti_c.c           |  3 ++-
 hw/riscv/sifive_e.c           |  2 +-
 hw/riscv/sifive_u.c           |  2 +-
 hw/riscv/virt.c               |  2 +-
 7 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.=
h
index 1e451a270c..134cf39a96 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -72,9 +72,13 @@ struct SiFivePLICState {
     uint32_t context_base;
     uint32_t context_stride;
     uint32_t aperture_size;
+
+    qemu_irq *m_external_irqs;
+    qemu_irq *s_external_irqs;
 };
=20
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
+    uint32_t num_harts,
     uint32_t hartid_base, uint32_t num_sources,
     uint32_t num_priorities, uint32_t priority_base,
     uint32_t pending_base, uint32_t enable_base,
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 78903beb06..9ba36dc0b3 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -29,6 +29,7 @@
 #include "hw/intc/sifive_plic.h"
 #include "target/riscv/cpu.h"
 #include "migration/vmstate.h"
+#include "hw/irq.h"
=20
 #define RISCV_DEBUG_PLIC 0
=20
@@ -139,18 +140,14 @@ static void sifive_plic_update(SiFivePLICState *pli=
c)
     for (addrid =3D 0; addrid < plic->num_addrs; addrid++) {
         uint32_t hartid =3D plic->addr_config[addrid].hartid;
         PLICMode mode =3D plic->addr_config[addrid].mode;
-        CPUState *cpu =3D qemu_get_cpu(hartid);
-        CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
-        if (!env) {
-            continue;
-        }
         int level =3D sifive_plic_irqs_pending(plic, addrid);
+
         switch (mode) {
         case PLICMode_M:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(=
level));
+            qemu_set_irq(plic->m_external_irqs[hartid - plic->hartid_bas=
e], level);
             break;
         case PLICMode_S:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(=
level));
+            qemu_set_irq(plic->s_external_irqs[hartid - plic->hartid_bas=
e], level);
             break;
         default:
             break;
@@ -456,6 +453,12 @@ static void sifive_plic_realize(DeviceState *dev, Er=
ror **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &plic->mmio);
     qdev_init_gpio_in(dev, sifive_plic_irq_request, plic->num_sources);
=20
+    plic->s_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
+    qdev_init_gpio_out(dev, plic->s_external_irqs, plic->num_harts);
+
+    plic->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * plic->num_hart=
s);
+    qdev_init_gpio_out(dev, plic->m_external_irqs, plic->num_harts);
+
     /* We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
@@ -520,6 +523,7 @@ type_init(sifive_plic_register_types)
  * Create PLIC device.
  */
 DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
+    uint32_t num_harts,
     uint32_t hartid_base, uint32_t num_sources,
     uint32_t num_priorities, uint32_t priority_base,
     uint32_t pending_base, uint32_t enable_base,
@@ -527,6 +531,8 @@ DeviceState *sifive_plic_create(hwaddr addr, char *ha=
rt_config,
     uint32_t context_stride, uint32_t aperture_size)
 {
     DeviceState *dev =3D qdev_new(TYPE_SIFIVE_PLIC);
+    int i;
+
     assert(enable_stride =3D=3D (enable_stride & -enable_stride));
     assert(context_stride =3D=3D (context_stride & -context_stride));
     qdev_prop_set_string(dev, "hart-config", hart_config);
@@ -542,5 +548,15 @@ DeviceState *sifive_plic_create(hwaddr addr, char *h=
art_config,
     qdev_prop_set_uint32(dev, "aperture-size", aperture_size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    for (i =3D 0; i < num_harts; i++) {
+        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
+
+        qdev_connect_gpio_out(dev, i,
+                              qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EXT));
+        qdev_connect_gpio_out(dev, num_harts + i,
+                              qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
+    }
+
     return dev;
 }
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eb8e79e0a1..eef55f69fd 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -274,7 +274,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
=20
     /* PLIC */
     s->plic =3D sifive_plic_create(memmap[MICROCHIP_PFSOC_PLIC].base,
-        plic_hart_config, 0,
+        plic_hart_config, ms->smp.cpus, 0,
         MICROCHIP_PFSOC_PLIC_NUM_SOURCES,
         MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES,
         MICROCHIP_PFSOC_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 18f70fadaa..09d4e1433e 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -106,13 +106,14 @@ type_init(shakti_c_machine_type_info_register)
=20
 static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms =3D MACHINE(qdev_get_machine());
     ShaktiCSoCState *sss =3D RISCV_SHAKTI_SOC(dev);
     MemoryRegion *system_memory =3D get_system_memory();
=20
     sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
=20
     sss->plic =3D sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base=
,
-        (char *)SHAKTI_C_PLIC_HART_CONFIG, 0,
+        (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
         SHAKTI_C_PLIC_NUM_SOURCES,
         SHAKTI_C_PLIC_NUM_PRIORITIES,
         SHAKTI_C_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 5b7b245e1f..04265c5640 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -197,7 +197,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Er=
ror **errp)
=20
     /* MMIO */
     s->plic =3D sifive_plic_create(memmap[SIFIVE_E_DEV_PLIC].base,
-        (char *)SIFIVE_E_PLIC_HART_CONFIG, 0,
+        (char *)SIFIVE_E_PLIC_HART_CONFIG, ms->smp.cpus, 0,
         SIFIVE_E_PLIC_NUM_SOURCES,
         SIFIVE_E_PLIC_NUM_PRIORITIES,
         SIFIVE_E_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6cc1a62b0f..6766edc1d0 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -832,7 +832,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Er=
ror **errp)
=20
     /* MMIO */
     s->plic =3D sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
-        plic_hart_config, 0,
+        plic_hart_config, ms->smp.cpus, 0,
         SIFIVE_U_PLIC_NUM_SOURCES,
         SIFIVE_U_PLIC_NUM_PRIORITIES,
         SIFIVE_U_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5624adda58..47f1beb473 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -625,7 +625,7 @@ static void virt_machine_init(MachineState *machine)
         /* Per-socket PLIC */
         s->plic[i] =3D sifive_plic_create(
             memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
-            plic_hart_config, base_hartid,
+            plic_hart_config, hart_count, base_hartid,
             VIRT_PLIC_NUM_SOURCES,
             VIRT_PLIC_NUM_PRIORITIES,
             VIRT_PLIC_PRIORITY_BASE,
--=20
2.31.1


