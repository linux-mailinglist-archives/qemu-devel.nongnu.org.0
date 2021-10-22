Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3EE4378B7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:07:57 +0200 (CEST)
Received: from localhost ([::1]:60070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvD7-0006ff-Un
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunZ-0003jC-Ko
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:30 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunV-0001ji-Ao
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910084; x=1666446084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cKiPzn9XfyE4z6ZkvhnZQVtENZ+U0d4S4Ry0tMgp2TQ=;
 b=CcMW0MlQy8VfOyaN/yJOejP1SVM3YZ+lQNaB6CAIGNuGrHQVoHSV6f6z
 e4CzzepXo3gbGyYW1DV+sknUoEIrwj7d4Mrt5HOe2Q+ACnRG46ov4bBqC
 Gkz/8eDXT6Rzb9uA+paxq88pCh3A+oA4R2gRfICjsnpVa7upyXA6UFLv1
 9tLLmekk3W448UyplcGB86Rmvk42Ual/RPvY3VSdBnstI2QbAzAtyXRSg
 CZGtn7/nEkw8En+oX20T6dm3UDMHwd2V2R41+/BxiD9W/x90G/uDTHNbj
 5ikC49HexwzBHbX+/VvRc0f3AIRU4wQcuJzbbv0davaREOLFysf3lUVqa Q==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="188392271"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:41:24 +0800
IronPort-SDR: IoUfJ/G9P7Cv2aAv0qZrkl4pIaEE6vxV3k+Ziz+20db6/e/qBU5OqKpvWYjShJWLNomsLukRhb
 OZJmSuwMY93V2XzBdpNar6MH+FW29JOBWiVZKL9JUzqwQAHq/NvSRk1tsRHarJQYEt9KGKB9wK
 Kr1P8RW8DemNe3TGMmOpjgK0NIF5fa14LSlL0u4Sa6/yVeokCiox48Y41fLri8ZKURXCAxwgys
 OYxYMRDIB1arX0hxorY5b5/BX7iaIPBs6InVWz7lSAkEgasjaZ+allhzJBqCJFPIkZ5F1+gSOY
 jbUwGX9KdpWsv5v/GwFN5FMU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:59 -0700
IronPort-SDR: rWsxN0vNkTs8MqnugBPUcDywv7clZkp606ekjbZhowcG5XXUAIIhgwbCSINzxZjp7mEdMWAmru
 gA0MLcPNslCCXasfzjBvsDVmNKG2OojMORLpbLhOjeG0yydeCwaSXv7iaHbENxuPL7cGDM0Lks
 6UzwI2Ov1ESVZsMOYN7prlhCXwheNGTKdnZ04yHXnQ86VHdTMFP0jDVq8z0wbhMuKNpvb4jHJ8
 lI4cSQIMqNh57fg6ffL7NUfLk1ZjiKUs9PCfg/UHqp9zsZr/AlM2oSAzcGtOpDTicUVvw3sJIa
 7lI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:41:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQVW5GTSz1RtVw
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:41:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1634910083; x=1637502084; bh=cKiPzn9
 XfyE4z6ZkvhnZQVtENZ+U0d4S4Ry0tMgp2TQ=; b=jWeEGMOhXq1fFeEqD68utQv
 lSuUYwZLIOOQPw4WcLynW4JfA4DVYyo42yw1PAjM+jJ1fzicOB0DP0AkzwF4Ljoi
 cwWn7YElXZ6ouSU/iMrEeVTa3l8CLTBYQk7rni/+aLFoJXzK2LXS0vzkSEldPd5g
 bUwkvjOBTywmS7r2NN0b4GX7LkSYJLUWOjq9DyL/bGOIQgs0VF0JP9JlfTsk/OA1
 jpDlTjnyds/B+4cNr4XnpJpe9Ak4xVWk7zMAkISifS6chKpMvh8jOYVSUNF56bwJ
 /+UpdBUcupzg8GBFAe8ePA9L6icoCMTHCQ47TSDV2elSbLn0JQ1kx5qGiHIWEzA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id j0yrwlch-N3c for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:41:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQVQ2XBpz1RtVl;
 Fri, 22 Oct 2021 06:41:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/33] hw/riscv: sifive_u: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Fri, 22 Oct 2021 23:38:11 +1000
Message-Id: <20211022133812.3972903-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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

From: Bin Meng <bmeng.cn@gmail.com>

Using memory_region_init_ram(), which can't possibly handle vhost-user,
and can't work as expected with '-numa node,memdev' options.

Use MachineState::ram instead of manually initializing RAM memory
region, as well as by providing MachineClass::default_ram_id to
opt in to memdev scheme.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211020014112.7336-6-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index fc5790b8ce..0217006c27 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -528,7 +528,6 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
     const MemMapEntry *memmap =3D sifive_u_memmap;
     SiFiveUState *s =3D RISCV_U_MACHINE(machine);
     MemoryRegion *system_memory =3D get_system_memory();
-    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
     MemoryRegion *flash0 =3D g_new(MemoryRegion, 1);
     target_ulong start_addr =3D memmap[SIFIVE_U_DEV_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
@@ -549,10 +548,8 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
=20
     /* register RAM */
-    memory_region_init_ram(main_mem, NULL, "riscv.sifive.u.ram",
-                           machine->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DEV_DRAM]=
.base,
-                                main_mem);
+                                machine->ram);
=20
     /* register QSPI0 Flash */
     memory_region_init_ram(flash0, NULL, "riscv.sifive.u.flash0",
@@ -748,6 +745,7 @@ static void sifive_u_machine_class_init(ObjectClass *=
oc, void *data)
     mc->min_cpus =3D SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
     mc->default_cpu_type =3D SIFIVE_U_CPU;
     mc->default_cpus =3D mc->min_cpus;
+    mc->default_ram_id =3D "riscv.sifive.u.ram";
=20
     object_class_property_add_bool(oc, "start-in-flash",
                                    sifive_u_machine_get_start_in_flash,
--=20
2.31.1


