Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F368D06B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:17:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7n-0006lc-7D; Tue, 07 Feb 2023 02:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7l-0006lU-NZ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:41 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7j-0000FD-KR
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753839; x=1707289839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5X1pvjIpRn1GZpeFF1/+hpiBJBlOQxPfbgqreXgSQI8=;
 b=kuJ6L47oOalzoE988vLf0d3mlPyZoQLNvuCuzg8krcXoDHGMI4TO8diw
 GpruqZiJHelFWzgKo+O9ytJkROAaTp2hP8na1dgIVqw4HG8ZtSta7mLk0
 ls94GQJ6BymyJnX7WxcHefoV/MSjgTQpCV+stTKUbIZy/iYh/09A6oh1/
 sFJwnaZqtHUqz/8NXplOvlob4M6Y94hO5KWbHLethvTzxnwK0+9G166DW
 VIF0p+smI5YjVerbtbAOK0POP/RAeoWjWgK/wEp/GnQKNMlfklZGG6jid
 6HzwG3kkJThBT/j3sh3bsC4wjaRBW2On9U8ndfIWUjc0c34TgDe12MZnS g==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657504"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:16 +0800
IronPort-SDR: 815yOAhGAxgKIwpPRb95rLmioiSU+z/k3fiz2kFTipWaXdp00x03eOLJy4SEe2TYmOW3uuTuc6
 /+vURPBCRxwGK02F43ARdxERVs06dumMBJ1zDiIrw+k+wszIjZIffwEeI1wgp8HJl+s6oAXVqy
 tbRN8OZeGR1bwAgQ97n8fMVYfRp5Jg4ITPOWlRe4nGYDapznNng99TnAp6aHyZXaljqgKvuB+k
 DuX3JFqs8LG1JopKJ3i91/mAhpvmHHDeJR+9YV+MU/cXaMPjlAJD5zw1gjM64IwhdlW/fsKV7L
 /kI=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:33 -0800
IronPort-SDR: 3snTwIm1qXhIJ8vUe0JT2sjnHxUTFU30KL4yEuk1NdPx5Sybyk4Z0UKLbylSh04GOjF+0vZWZQ
 /Kz1ifKJ8mqK1T9I/DYb0HdbxhtPTc5bC9i5khr4JXoh/X42CA0kspnrT5yEzOceiprQ/8mueI
 0PpBQsaEE9bF+1hURmh3aqp7nEgT9YeBhgRH6IP0BtZ3UdpSWjV0NZA4eXZnzl5Q00MLP3vHdD
 MeHgy/2TzznqYlf2M8eTOCWMYCWhUpB3DLFrrhU1SMrn4gg2jdBGD20GEFzZv4Hb+HIoR9nDZ9
 Ep8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQw1Mmqz1RwqL
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753815; x=1678345816; bh=5X1pvjIpRn1GZpeFF1
 /+hpiBJBlOQxPfbgqreXgSQI8=; b=gKXZJ0Yz4xwHIbxaS0cCQe2mw8kO348XYQ
 pKhPVYH0UTXSiegzBC/OkUmyf/boCR0WnAFznVt+eEs5xCtbihy29rSUWCU7M3Qk
 Duu1lEgn2D+I23w7kEZ5HvuhHljskVwssBuZIY9qohddjr7JdFJDU5JHUdU28Gmx
 XlnB5iuFmQdjE4WrOEiZEIslU6Ila3Rm2JRkUDj6GU81BvRtfq4M9+fNYL1sbLA6
 ET76yNn7B4qcni4Q60VEEHIxKb5XJ57n3/lWrei05IlmaOZzRBW3o0ZWshJJQCYo
 uxymzgiqc1S/V648jJZ3gmxV/SqcYxbNgQUCzVpl9buzvDcPkTfA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 695HncyFAC3s for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:15 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQt0hf2z1RvLy;
 Mon,  6 Feb 2023 23:10:13 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/32] hw/riscv: change riscv_compute_fdt_addr() semantics
Date: Tue,  7 Feb 2023 17:09:25 +1000
Message-Id: <20230207070943.2558857-15-alistair.francis@opensource.wdc.com>
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

As it is now, riscv_compute_fdt_addr() is receiving a dram_base, a
mem_size (which is defaulted to MachineState::ram_size in all boards)
and the FDT pointer. And it makes a very important assumption: the DRAM
interval dram_base + mem_size is contiguous. This is indeed the case for
most boards that use a FDT.

The Icicle Kit board works with 2 distinct RAM banks that are separated
by a gap. We have a lower bank with 1GiB size, a gap follows, then at
64GiB the high memory starts. MachineClass::default_ram_size for this
board is set to 1.5Gb, and machine_init() is enforcing it as minimal RAM
size, meaning that there we'll always have at least 512 MiB in the Hi
RAM area.

Using riscv_compute_fdt_addr() in this board is weird because not only
the board has sparse RAM, and it's calling it using the base address of
the Lo RAM area, but it's also using a mem_size that we have guarantees
that it will go up to the Hi RAM. All the function assumptions doesn't
work for this board.

In fact, what makes the function works at all in this case is a
coincidence. Commit 1a475d39ef54 introduced a 3GB boundary for the FDT,
down from 4Gb, that is enforced if dram_base is lower than 3072 MiB. For
the Icicle Kit board, memmap[MICROCHIP_PFSOC_DRAM_LO].base is 0x80000000
(2 Gb) and it has a 1Gb size, so it will fall in the conditions to put
the FDT under a 3Gb address, which happens to be exactly at the end of
DRAM_LO. If the base address of the Lo area started later than 3Gb this
function would be unusable by the board. Changing any assumptions inside
riscv_compute_fdt_addr() can also break it by accident as well.

Let's change riscv_compute_fdt_addr() semantics to be appropriate to the
Icicle Kit board and for future boards that might have sparse RAM
topologies to worry about:

- relieve the condition that the dram_base + mem_size area is contiguous,
since this is already not the case today;

- receive an extra 'dram_size' size attribute that refers to a contiguous
RAM block that the board wants the FDT to reside on.

Together with 'mem_size' and 'fdt', which are now now being consumed by a
MachineState pointer, we're able to make clear assumptions based on the
DRAM block and total mem_size available to ensure that the FDT will be pu=
t
in a valid RAM address.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230201171212.1219375-4-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h    |  2 +-
 hw/riscv/boot.c            | 35 +++++++++++++++++++++++------------
 hw/riscv/microchip_pfsoc.c |  3 ++-
 hw/riscv/sifive_u.c        |  3 ++-
 hw/riscv/spike.c           |  3 ++-
 hw/riscv/virt.c            |  3 ++-
 6 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 46de4ec46b..511390f60e 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -48,7 +48,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
-                                void *fdt);
+                                MachineState *ms);
 void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
                                hwaddr saddr,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2e53494b08..c7e0e50bd8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -250,33 +250,44 @@ void riscv_load_initrd(MachineState *machine, uint6=
4_t kernel_entry)
 }
=20
 /*
- * The FDT should be put at the farthest point possible to
- * avoid overwriting it with the kernel/initrd.
+ * This function makes an assumption that the DRAM interval
+ * 'dram_base' + 'dram_size' is contiguous.
  *
- * This function makes an assumption that the DRAM is
- * contiguous. It also cares about 32-bit systems and
- * will limit fdt_addr to be addressable by them even for
- * 64-bit CPUs.
+ * Considering that 'dram_end' is the lowest value between
+ * the end of the DRAM block and MachineState->ram_size, the
+ * FDT location will vary according to 'dram_base':
+ *
+ * - if 'dram_base' is less that 3072 MiB, the FDT will be
+ * put at the lowest value between 3072 MiB and 'dram_end';
+ *
+ * - if 'dram_base' is higher than 3072 MiB, the FDT will be
+ * put at 'dram_end'.
  *
  * The FDT is fdt_packed() during the calculation.
  */
-uint64_t riscv_compute_fdt_addr(hwaddr dram_base, uint64_t mem_size,
-                                void *fdt)
+uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
+                                MachineState *ms)
 {
-    uint64_t temp;
-    hwaddr dram_end =3D dram_base + mem_size;
-    int ret =3D fdt_pack(fdt);
+    int ret =3D fdt_pack(ms->fdt);
+    hwaddr dram_end, temp;
     int fdtsize;
=20
     /* Should only fail if we've built a corrupted tree */
     g_assert(ret =3D=3D 0);
=20
-    fdtsize =3D fdt_totalsize(fdt);
+    fdtsize =3D fdt_totalsize(ms->fdt);
     if (fdtsize <=3D 0) {
         error_report("invalid device-tree");
         exit(1);
     }
=20
+    /*
+     * A dram_size =3D=3D 0, usually from a MemMapEntry[].size element,
+     * means that the DRAM block goes all the way to ms->ram_size.
+     */
+    dram_end =3D dram_base;
+    dram_end +=3D dram_size ? MIN(ms->ram_size, dram_size) : ms->ram_siz=
e;
+
     /*
      * We should put fdt as far as possible to avoid kernel/initrd overw=
riting
      * its content. But it should be addressable by 32 bit system as wel=
l.
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 17499d4152..2b91e49561 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -642,7 +642,8 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
=20
         /* Compute the fdt load address in dram */
         fdt_load_addr =3D riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_=
DRAM_LO].base,
-                                               machine->ram_size, machin=
e->fdt);
+                                               memmap[MICROCHIP_PFSOC_DR=
AM_LO].size,
+                                               machine);
         riscv_load_fdt(fdt_load_addr, machine->fdt);
=20
         /* Load the reset vector */
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 626d4dc2f3..d3ab7a9cda 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -617,7 +617,8 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
     }
=20
     fdt_load_addr =3D riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM].b=
ase,
-                                           machine->ram_size, machine->f=
dt);
+                                           memmap[SIFIVE_U_DEV_DRAM].siz=
e,
+                                           machine);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
=20
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index f1114f2c71..cc3f6dac17 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -325,7 +325,8 @@ static void spike_board_init(MachineState *machine)
     }
=20
     fdt_load_addr =3D riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
-                                           machine->ram_size, machine->f=
dt);
+                                           memmap[SPIKE_DRAM].size,
+                                           machine);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
=20
     /* load the reset vector */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2e0a0cdb17..a061151a6f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1304,7 +1304,8 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
     }
=20
     fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
-                                           machine->ram_size, machine->f=
dt);
+                                           memmap[VIRT_DRAM].size,
+                                           machine);
     riscv_load_fdt(fdt_load_addr, machine->fdt);
=20
     /* load the reset vector */
--=20
2.39.1


