Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008A768D040
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7d-0006dQ-6K; Tue, 07 Feb 2023 02:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7b-0006cn-En
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:31 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7Z-0000FW-EK
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753829; x=1707289829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kUUUNdNMMHL17zYSBznj6wYoZdws8fw7JYNbeGWF5ug=;
 b=e65fZrC3ozaXfJkdynw/X3g0NJxOQybj4vTYr6Rxl24wTYB2XyHzenz6
 hmhvLjI21Vxo856qWKw4ALpMvTZU61z6tbHR4kMUJXUpD0Ni23CbkosYu
 LbSY/lf7mZTxG4/WvNtoNAIyQ0BPNe4WD4jAFb1QN9psHTB1xZI3iFb/P
 WIYd+7eZNm4fHkTeFsoKbYa6xoiM0XndlvD7ecCw734Z5xHWC/vPVopDn
 YEMcGO2+IfYl1GPK41cclF1r4gfjQvT6Cr8CXwrodjcZTAR6tUpON5UDf
 l5lA9DQA/yK1hBCzgBC7asxEMC6yzLj1GH3Mnkb/CEOKAlE223aYdmRx+ w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657501"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:14 +0800
IronPort-SDR: pZ8sOAXQ+eQRH49+9h9HHJWsRu0keRyO8p7jGUrvr5l6D2feVbJTUK3GSiz0IulCfhlif623PM
 abVc+/hKs2qowX6x0RIrNeUhGOc1VPnHOq4dMbC1wyTdtmrw5tXN+VpmRhdb+snClI/wkCiqvI
 6VAlcvh2J4Inu4rIN5ps/4dCXkQY7J5Mn9MkLcyPcyLsvYDaf7gRZygvf21g7FACSmvtFwhl/N
 8MPwiBwNoJ5G8ZCcDn46uSAvpbjZZY1qr+S7vpgFOz31FG1G4XuyER7qgrCS85aMAcjqyrwJCh
 5Pk=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:31 -0800
IronPort-SDR: sWyCaemfWc+5gBH1kURGmQkSnV9V4VwwcsF1Q+5y1+iv40PRjz9QaHCSm+sDhJESubgpkgzJKB
 +rHcJDnc4qDCBcO3VrVuCXv4Q5JS18i1wLDkO6TuIgruvoTU3h1abcQWxRz8YqvZTx4vCpxTMR
 Vzgo7JLTyUM0v8ziOUwzzONyJapRxvRewaV5fndZ5D+r0xY8+Abf6aTCUu4h08aESRv+zWqnh2
 Pfjl/aQI53x6eTC4ooRPCTBmqz27BDFuMMlk15P33BjKGvuNJtXRj83VH9X2DcW3GpCTWaV1NW
 3gE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:14 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQt2567z1RvTp
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753813; x=1678345814; bh=kUUUNdNMMHL17zYSBz
 nj6wYoZdws8fw7JYNbeGWF5ug=; b=OziAiJLRquxeFifSM5CzNDDTx1KcMdl4pv
 2ajZgX1YGg3Vf9N/ltETPb2tQ9gM36HjbnC0ZbNGto/Qd+NAr7SUpdwlTkJD004n
 zAowOIdZGLpeAU0swvTNXZknYNFZ2tjhz0OPFiLIgH0qZWse353PIuBKuNUV4fZ3
 0Hj65Cbn4KPDOVVQane55PVqPq+ObawcHzU+MKGIpbr2ZcMKfRQIK2Au2N3QlLaY
 +wnbcvzq7x+OByGynAkp0q5Zf47lZtiwwgNaXlFLMJXwkpnXrjQgQ7PfvkLsqI6T
 tWQhUK1u6r9Ebz4apOemOTI5w/MF2LZDGhkDFTfDffAfVFL79CwA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rd9eZmZUp4i9 for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:13 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQr2zGKz1Rwrq;
 Mon,  6 Feb 2023 23:10:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/32] hw/riscv: split fdt address calculation from fdt load
Date: Tue,  7 Feb 2023 17:09:24 +1000
Message-Id: <20230207070943.2558857-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
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
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

A common trend in other archs is to calculate the fdt address, which is
usually straightforward, and then calling a function that loads the
fdt/dtb by using that address.

riscv_load_fdt() is doing a bit too much in comparison. It's calculating
the fdt address via an elaborated heuristic to put the FDT at the bottom
of DRAM, and "bottom of DRAM" will vary across boards and
configurations, then it's actually loading the fdt, and finally it's
returning the fdt address used to the caller.

Reduce the existing complexity of riscv_load_fdt() by splitting its code
into a new function, riscv_compute_fdt_addr(), that will take care of
all fdt address logic. riscv_load_fdt() can then be a simple function
that just loads a fdt at the given fdt address.

We're also taken the opportunity to clarify the intentions and
assumptions made by these functions. riscv_load_fdt() is now receiving a
hwaddr as fdt_addr because there is no restriction of having to load the
fdt in higher addresses that doesn't fit in an uint32_t.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230201171212.1219375-3-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h    |  4 +++-
 hw/riscv/boot.c            | 30 +++++++++++++++++++++++++-----
 hw/riscv/microchip_pfsoc.c |  6 ++++--
 hw/riscv/sifive_u.c        |  7 ++++---
 hw/riscv/spike.c           |  6 +++---
 hw/riscv/virt.c            |  7 ++++---
 6 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f94653a09b..46de4ec46b 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -47,7 +47,9 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
-uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
+uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
+                                void *fdt);
+void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2d03a9a921..2e53494b08 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -249,9 +249,21 @@ void riscv_load_initrd(MachineState *machine, uint64=
_t kernel_entry)
     }
 }
=20
-uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
+/*
+ * The FDT should be put at the farthest point possible to
+ * avoid overwriting it with the kernel/initrd.
+ *
+ * This function makes an assumption that the DRAM is
+ * contiguous. It also cares about 32-bit systems and
+ * will limit fdt_addr to be addressable by them even for
+ * 64-bit CPUs.
+ *
+ * The FDT is fdt_packed() during the calculation.
+ */
+uint64_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
+                                void *fdt)
 {
-    uint64_t temp, fdt_addr;
+    uint64_t temp;
     hwaddr dram_end =3D dram_base + mem_size;
     int ret =3D fdt_pack(fdt);
     int fdtsize;
@@ -272,7 +284,17 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t m=
em_size, void *fdt)
      * end of dram or 3GB whichever is lesser.
      */
     temp =3D (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram=
_end;
-    fdt_addr =3D QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+
+    return QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+}
+
+/*
+ * 'fdt_addr' is received as hwaddr because boards might put
+ * the FDT beyond 32-bit addressing boundary.
+ */
+void riscv_load_fdt(hwaddr fdt_addr, void *fdt)
+{
+    uint32_t fdtsize =3D fdt_totalsize(fdt);
=20
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
@@ -281,8 +303,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t me=
m_size, void *fdt)
                           &address_space_memory);
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                         rom_ptr_for_as(&address_space_memory, fdt_addr, =
fdtsize));
-
-    return fdt_addr;
 }
=20
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base=
,
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82ae5e7023..17499d4152 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -641,8 +641,10 @@ static void microchip_icicle_kit_machine_init(Machin=
eState *machine)
         }
=20
         /* Compute the fdt load address in dram */
-        fdt_load_addr =3D riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO]=
.base,
-                                       machine->ram_size, machine->fdt);
+        fdt_load_addr =3D riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_=
DRAM_LO].base,
+                                               machine->ram_size, machin=
e->fdt);
+        riscv_load_fdt(fdt_load_addr, machine->fdt);
+
         /* Load the reset vector */
         riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load=
_addr,
                                   memmap[MICROCHIP_PFSOC_ENVM_DATA].base=
,
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2fb6ee231f..626d4dc2f3 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -616,9 +616,10 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
         kernel_entry =3D 0;
     }
=20
-    /* Compute the fdt load address in dram */
-    fdt_load_addr =3D riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr =3D riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].b=
ase,
+                                           machine->ram_size, machine->f=
dt);
+    riscv_load_fdt(fdt_load_addr, machine->fdt);
+
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
         start_addr_hi32 =3D (uint64_t)start_addr >> 32;
     }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 04d236296b..f1114f2c71 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -324,9 +324,9 @@ static void spike_board_init(MachineState *machine)
         kernel_entry =3D 0;
     }
=20
-    /* Compute the fdt load address in dram */
-    fdt_load_addr =3D riscv_load_fdt(memmap[SPIKE_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr =3D riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
+                                           machine->ram_size, machine->f=
dt);
+    riscv_load_fdt(fdt_load_addr, machine->fdt);
=20
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].ba=
se,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e420254de2..2e0a0cdb17 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1303,9 +1303,10 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
         start_addr =3D virt_memmap[VIRT_FLASH].base;
     }
=20
-    /* Compute the fdt load address in dram */
-    fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, machine->fdt);
+    fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
+                                           machine->ram_size, machine->f=
dt);
+    riscv_load_fdt(fdt_load_addr, machine->fdt);
+
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
--=20
2.39.1


