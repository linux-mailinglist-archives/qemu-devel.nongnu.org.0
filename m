Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF1D43789E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:01:45 +0200 (CEST)
Received: from localhost ([::1]:45984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv7A-0005XL-Cj
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunO-00039A-F1
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:18 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunA-0001ji-F7
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910064; x=1666446064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aGJ3aI7BtSmdzZPh815//XcOeA+5kBpT/UXT2swWg9E=;
 b=CUa8yJKi4E0U4uAMVBTAMA8t1M52nTmMZ/o61hbm0+BiHir+cjzDSjxE
 MWcl1/KZnWz+CO2TOohtz0Y2CkA1OGMjFo7QpH0ghSxp6pNpv10hSSjA3
 ar5AiuHdRhDolvaqMKhpg3yvpD9TYPX1+GUguWhUmFe/LFblcj/C++27u
 Rl7bdKgZjRUs4Dfr+EAQvBFMmYChCvMy0JbL3bHQll4AZ7LKO9DL4fIDx
 XP/i/zlilTtLYoXzmfAkxHpWw8zsZ8+DrOVvJ7G5cy90jAyAeSbqseipt
 ATnMgYfgMAFuUnSRCJFDnJjOUdrhR6I/1orLfueGmILsE6b2nsAVdJo/Q A==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="188392204"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:41:00 +0800
IronPort-SDR: nDzT75xKaJ5YkzaZRYQT33h6jeAOKGzcFKBW0VuzFS1mV1miA+ltc035TN70VImZInDe1jhc6Q
 FbySTRoHlNcS49hMC/tGLqSLMs9h9B6B/ijXjXXSPADo83PQWULxx42B8/bY6A/kEBM37urZb+
 VWKf6aDvUwW58NBYMSv/HrYdF8ikKkvTmuA74s+JvFOzuyQewenba55JKzByFGXFADgJY7vtDW
 /JAA8emaDyPOkjem4P4l8qvboiAhTuORDh+RLUfVHTIsIqPpIj832IL7IReM+uvHvo9eNfNMB/
 N3FFPtkaEtzYlJqITtrPmlxE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:15:02 -0700
IronPort-SDR: t8oEuB+ShDP3VPJhiPw00wqgMiavX4n5RZMNCARLoFNeiadoIbrnFt1zRG1nj13c/RQvyroT6K
 RVKv8g8k7w5JaSVQ32D9a2i8YHc4Yyn5ykUdiRVTyqTew1uA1bH5uoXgmEMHYhG+E1N6FHwkq3
 kFPbMOB7YaGj0+xG3k2KrXVT5T3G0pZCA1S1ZYFyHCiqBcXylJGatALea/bO18+kBulUFvTREd
 Tgt9LgSySaJQAlFnrbeGJf4C/28Vyz5mofsP4CSHOI7rYrt4BvoG5oDXN3pMW3rpWjBPs5BXyj
 A+U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:41:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQV4254nz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:41:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910059; x=1637502060; bh=aGJ3aI7BtSmdzZPh81
 5//XcOeA+5kBpT/UXT2swWg9E=; b=jztSdakTBoP5pZT7W4HgbXI4AHAmx591UW
 s+cx9mD4bZg56DePSHin6xL8G8atO7wc+9iHeiv3YZzk+GHqneT9+PlsAdN1pQHZ
 Lgt4aEkAZT7w2Ppbo1sE3sM+DhfLsUAIugfrq1Qo1coUSJt4uKHFP9sfOK4qifBi
 418CcmVJ+8TW0AVhvETnPJ/22bAi9hDNYEqqohxA293ibKoGpVjR/DW5mhqyEOZq
 VFAGA2k68pFBnSTB14WdSASMqXhxvpVeJN6Qa9nvQS7rGeZEEnoGSHI+VFgIbrb+
 iXnwr1QBSDuVtCfn098nip7Hkc3lgEp94KJg2UJRs0Dz0QTBoxDw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5J8SWuZR8S_Z for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:59 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQTz51CDz1RtVl;
 Fri, 22 Oct 2021 06:40:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 28/33] hw/riscv: microchip_pfsoc: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Fri, 22 Oct 2021 23:38:07 +1000
Message-Id: <20211022133812.3972903-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

From: Bin Meng <bmeng.cn@gmail.com>

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20211020014112.7336-2-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/microchip_pfsoc.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e475b6d511..3fc8545562 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -463,7 +463,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
     MemoryRegion *mem_low_alias =3D g_new(MemoryRegion, 1);
     MemoryRegion *mem_high =3D g_new(MemoryRegion, 1);
     MemoryRegion *mem_high_alias =3D g_new(MemoryRegion, 1);
-    uint64_t mem_high_size;
+    uint64_t mem_low_size, mem_high_size;
     hwaddr firmware_load_addr;
     const char *firmware_name;
     bool kernel_as_payload =3D false;
@@ -485,31 +485,34 @@ static void microchip_icicle_kit_machine_init(Machi=
neState *machine)
                             TYPE_MICROCHIP_PFSOC);
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
=20
+    /* Split RAM into low and high regions using aliases to machine->ram=
 */
+    mem_low_size =3D memmap[MICROCHIP_PFSOC_DRAM_LO].size;
+    mem_high_size =3D machine->ram_size - mem_low_size;
+    memory_region_init_alias(mem_low, NULL,
+                             "microchip.icicle.kit.ram_low", machine->ra=
m,
+                             0, mem_low_size);
+    memory_region_init_alias(mem_high, NULL,
+                             "microchip.icicle.kit.ram_high", machine->r=
am,
+                             mem_low_size, mem_high_size);
+
     /* Register RAM */
-    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low"=
,
-                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
-                           &error_fatal);
-    memory_region_init_alias(mem_low_alias, NULL,
-                             "microchip.icicle.kit.ram_low.alias",
-                             mem_low, 0,
-                             memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size)=
;
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_DRAM_LO].base,
                                 mem_low);
+    memory_region_add_subregion(system_memory,
+                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
+                                mem_high);
+
+    /* Create aliases for the low and high RAM regions */
+    memory_region_init_alias(mem_low_alias, NULL,
+                             "microchip.icicle.kit.ram_low.alias",
+                             mem_low, 0, mem_low_size);
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].ba=
se,
                                 mem_low_alias);
-
-    mem_high_size =3D machine->ram_size - 1 * GiB;
-
-    memory_region_init_ram(mem_high, NULL, "microchip.icicle.kit.ram_hig=
h",
-                           mem_high_size, &error_fatal);
     memory_region_init_alias(mem_high_alias, NULL,
                              "microchip.icicle.kit.ram_high.alias",
                              mem_high, 0, mem_high_size);
-    memory_region_add_subregion(system_memory,
-                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
-                                mem_high);
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_DRAM_HI_ALIAS].ba=
se,
                                 mem_high_alias);
@@ -606,6 +609,7 @@ static void microchip_icicle_kit_machine_class_init(O=
bjectClass *oc, void *data)
                    MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
     mc->min_cpus =3D MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
     mc->default_cpus =3D mc->min_cpus;
+    mc->default_ram_id =3D "microchip.icicle.kit.ram";
=20
     /*
      * Map 513 MiB high memory, the mimimum required high memory size, b=
ecause
--=20
2.31.1


