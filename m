Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D624378AD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:06:15 +0200 (CEST)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvBW-00046V-Lu
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mduno-00048K-RR
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:44 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mduna-0001ji-RA
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910090; x=1666446090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aE7fjaVrt+fTk3k4mC1U/oRpRWRe6TR3bXJiDmVNzj8=;
 b=cojeybXhK7HKjd5bbvPKTjZfOuIpxjoyw31GYXaZmhwbn9dXS/DBLsKi
 p8oLFUFBWLu+0lWCHS9n7hk7AmKzhr4WA3+En9g+oSvbgey8N2goo2445
 LZa9/S4HKbCYaDo6xFQiZQmMLGtHsRD4BL+KSZSEuX0PfNUhVqSngSLAt
 J8hgl1VB1QovGvbvtUtCa9/UEfo/C8sYy/x3oRK8thvJg1DSGY48mi0q8
 vfA8tZctICOsPYTIGCUszhQElm+bbQYFc0pbYLUSyZGWCk/k+0bogh/6+
 gcRpn7JM109zqlf0pBeLvftQK/TBbpayFwYt89Veo/pFXxG0/mni3Su2h A==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="188392281"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:41:29 +0800
IronPort-SDR: hv93oYRH6u8KOOwbzlJzHMqDkEesdL+m76LNwCiM6b27gZUk4fIglmYFAEGTVpaJ2vNwmVFoMH
 AmpiNWXLlTSzSZRJhieMblryH1tU04a7B8viFEtMzydI8FnZYQHT5Cb2zyiZmFClHLqRPtdwtE
 5ZCCnTlERxJ/t/m6yLOrnTlNEXTDWNvF17i2TexMR/WZku3P0c6f9/9kWpGz6ZOrpSJHbED1MG
 kthc3CDYBA42/UB04KiwSU1BAZGJS5iMmg2p14w/VrXGchUqwNLD1z7WyD64+T60fmFVy+pkFv
 fvaxVhOrg3ZMxTJEUPlxrW4v
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:17:04 -0700
IronPort-SDR: INk61Zq0hudvZusD9wk9xI/3I/6LMcUjWgD8Bkj6CT8upG+iaDizOpX73KvrlDQlRZ7zVIq9Ih
 RZhawCxUcdU3onfUNIjGaYtOwt2tHXn3pI5xVwse8jO/zHnmDUPWFYb6oSHB6yLbvyVdB/Kdnj
 QH/IOctJBoOfjedPDlVaGZZJcCQle756+POktjmRAC+Aa+JbH5XfPi8+ChyFeAa/n/PmYvKN0s
 tdQxGoGJ4nqq67CKj0sIJ0bpnYWcDYBSYNYjCnj0QYEo7+lH9wl0Vh6qk2mB6NlV0jubBgAU3W
 h+o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:41:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQVd4rS6z1RtVt
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:41:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1634910089; x=1637502090; bh=aE7fjaV
 rt+fTk3k4mC1U/oRpRWRe6TR3bXJiDmVNzj8=; b=JWSzgrcgHwBAeoP964nvZpy
 d3yEy48RLme1Qf+0lDr3xpwi3vX5Z8CgYgnx0+yi+eot9v3H1AawMOJg4nhg9/Zq
 EKtEl2tjE129fBL1bP3avisCwjO3FzzaV1F+2OONe11DSggZNFQ0VMb6p55f8rrq
 FrxHP21QuexX2utVLka+/MX+S5CKf5Dts/ss/L+rpVbCsH+qZQ03kuE6SyU2M/Iz
 R8OpgDiHqe+ioeT0vJLsXttxknCkIDNZ4g0/9P5aDogt2gtJYOeWeGWPE8LGLMDD
 JUe0LIRuSX6wyQP3B49gLxGOr/dKi2/+4HOS8tJxHYVW/XC6tO9fPGnKC+096yw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2mPcicF7uZpP for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:41:29 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQVX28p7z1RtVl;
 Fri, 22 Oct 2021 06:41:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 33/33] hw/riscv: spike: Use MachineState::ram and
 MachineClass::default_ram_id
Date: Fri, 22 Oct 2021 23:38:12 +1000
Message-Id: <20211022133812.3972903-34-alistair.francis@opensource.wdc.com>
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
Message-id: 20211020014112.7336-7-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 79ae355ae2..288d69cd9f 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -180,7 +180,6 @@ static void spike_board_init(MachineState *machine)
     const MemMapEntry *memmap =3D spike_memmap;
     SpikeState *s =3D SPIKE_MACHINE(machine);
     MemoryRegion *system_memory =3D get_system_memory();
-    MemoryRegion *main_mem =3D g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
@@ -239,10 +238,8 @@ static void spike_board_init(MachineState *machine)
     }
=20
     /* register system main memory (actual RAM) */
-    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
-                           machine->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
-        main_mem);
+        machine->ram);
=20
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
@@ -326,6 +323,7 @@ static void spike_machine_class_init(ObjectClass *oc,=
 void *data)
     mc->cpu_index_to_instance_props =3D riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported =3D true;
+    mc->default_ram_id =3D "riscv.spike.ram";
 }
=20
 static const TypeInfo spike_machine_typeinfo =3D {
--=20
2.31.1


