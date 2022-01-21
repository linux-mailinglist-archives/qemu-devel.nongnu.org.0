Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE492495C51
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:49:31 +0100 (CET)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApbu-0004y0-S8
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:49:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0V-00088M-M6
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:43 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0T-0004AK-Gp
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744961; x=1674280961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gkK7yxRVaKcGF1cY2nL8A+mBLviOERSUKiQGtnIgUKg=;
 b=Q48azDfNFkKWp095KYsmckXDyh5MIIMHwKi4TgHlAYLQn6pkoMJlKXGG
 o5uOZ8YRZbpwAe3lIhfQauY7IPNbzu9ec/JyTPh8nkfvNQga98pTKvWHe
 U3EOCfUKSZxmATduTZn0TBu/btu5TL6yLbZT95Lu+nuPKCGkh0fcjm0zE
 BECLEmpEiW/ySuxI3yf2JW6rlxfVZtHlZsjpTvbZrOM9YyRvO7tPaSLOu
 f4pYFxj+iaJORQC1QYsk8iNcfdOcOaWYazYUerXhNsbZo9ckEqHY1QC6H
 9gPq/OOytjqu76w1ch+3r8rv7SuabV2M6Slrv7VL2JgeM2jOtbW7cbx/K A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083025"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:12 +0800
IronPort-SDR: rO4vy7JJqyqKu97WE0iyyoEAN4/NLhSYbjhpoE/puU5CFTm73YYp2tctWB+4jFQfKRRMEnb8Jl
 ZYcRp7KRTSUNpKFt6Ob+sBC1PHBoINOKlrN+vIj2bVHHBzjpxzJrJYcsyl4dCNajYZ/cRYhoxX
 aDX4LgUchp2OnnlGxGotW2oGZeWAtP3vViL0qIJxLkp+pnE4d1VSfAcms+Veyodmm/Q9gp2hgf
 LlH+uNoOsQdwn1JRVjE2iirc4EdpP4KzJroC76/Pty/7Tv1FDYzNCMYv9jIP1C7n2IbGQyG+rl
 ooW5kEokjEWwSzwUXWV202iY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:39 -0800
IronPort-SDR: L1S+vvApVnYL9dbmzu3S13FjIBZRlz2vJawFalF3vsZJ62JDftiPyoSW/u1/gb6apW9up1cn1Y
 T+INn4mwQrrIWG5411TdbCXx2B2CIeCzoU6Pir3AITXzoryQxMcvfau1GaaE2ACkKCZPly3Y4c
 Z7oIUmw5mEDNg1LFPly4+M77I2OrLi5bSH05mz6mgy02yvf3ll6ZEOWL7Ha+vWkDktn5CtQbxv
 qoVaMvRjwlMFAucroDEi/IfX3dTxuaMON3pSRKIfAqVRvf+7PVQOJUdgcx37fY0yP+pqED2E4f
 C4Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zX1B34z1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744871; x=1645336872; bh=gkK7yxRVaKcGF1cY2n
 L8A+mBLviOERSUKiQGtnIgUKg=; b=gEs0R74/d1ZzbGHUO1A81WJAdwUNRV7yhU
 G+moDfmyFi652XTAdjt2IyE59DBtYaglk5VdHBgpLR2B/mJ6DgmcKdHcskwuk80t
 V8QCFsSjxMnOX+0JxDpeW2M35rZDFl9sKs6/VLqKljpYjoCjDVdNduKOWII3u9/q
 oU8z+lN0aM6WU5LMqM8UxYtcz4p6zsl9O3qHzyNEe3oJG4sbID3IDCKw/F5dxqOW
 GqsFmJayIhQfWUQPPMP0HmbYnrn4/pivu4xCChy38lusJKnns8lY9L0r6QvCF3M/
 FKQ0BBnzbr/DQN2p+sugl46SUuxSIvgVECqaeXtbQ8sc/9rcHmDA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id c_4MSvXTeKHH for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:11 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zS0Hqrz1RvlN;
 Thu, 20 Jan 2022 22:01:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 36/61] hw/riscv: spike: Allow using binary firmware as bios
Date: Fri, 21 Jan 2022 15:58:05 +1000
Message-Id: <20220121055830.3164408-37-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <apatel@ventanamicro.com>

Currently, we have to use OpenSBI firmware ELF as bios for the spike
machine because the HTIF console requires ELF for parsing "fromhost"
and "tohost" symbols.

The latest OpenSBI can now optionally pick-up HTIF register address
from HTIF DT node so using this feature spike machine can now use
OpenSBI firmware BIN as bios.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/riscv_htif.h |  5 ++++-
 include/hw/riscv/spike.h     |  1 +
 hw/char/riscv_htif.c         | 33 +++++++++++++++++++----------
 hw/riscv/spike.c             | 41 ++++++++++++++++++++++--------------
 4 files changed, 52 insertions(+), 28 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index fb9452cf51..f888ac1b30 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -52,8 +52,11 @@ extern const MemoryRegionOps htif_io_ops;
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_=
value,
     uint64_t st_size);
=20
+/* Check if HTIF uses ELF symbols */
+bool htif_uses_elf_symbols(void);
+
 /* legacy pre qom */
 HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_=
mem,
-    CPURISCVState *env, Chardev *chr);
+    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
=20
 #endif
diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index cdd1a13011..73d69234de 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -43,6 +43,7 @@ struct SpikeState {
=20
 enum {
     SPIKE_MROM,
+    SPIKE_HTIF,
     SPIKE_CLINT,
     SPIKE_DRAM
 };
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index ddae738d56..729edbf968 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -228,13 +228,25 @@ static const MemoryRegionOps htif_mm_ops =3D {
     .write =3D htif_mm_write,
 };
=20
+bool htif_uses_elf_symbols(void)
+{
+    return (address_symbol_set =3D=3D 3) ? true : false;
+}
+
 HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_=
mem,
-    CPURISCVState *env, Chardev *chr)
+    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
 {
-    uint64_t base =3D MIN(tohost_addr, fromhost_addr);
-    uint64_t size =3D MAX(tohost_addr + 8, fromhost_addr + 8) - base;
-    uint64_t tohost_offset =3D tohost_addr - base;
-    uint64_t fromhost_offset =3D fromhost_addr - base;
+    uint64_t base, size, tohost_offset, fromhost_offset;
+
+    if (!htif_uses_elf_symbols()) {
+        fromhost_addr =3D nonelf_base;
+        tohost_addr =3D nonelf_base + 8;
+    }
+
+    base =3D MIN(tohost_addr, fromhost_addr);
+    size =3D MAX(tohost_addr + 8, fromhost_addr + 8) - base;
+    tohost_offset =3D tohost_addr - base;
+    fromhost_offset =3D fromhost_addr - base;
=20
     HTIFState *s =3D g_malloc0(sizeof(HTIFState));
     s->address_space =3D address_space;
@@ -249,12 +261,11 @@ HTIFState *htif_mm_init(MemoryRegion *address_space=
, MemoryRegion *main_mem,
     qemu_chr_fe_init(&s->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&s->chr, htif_can_recv, htif_recv, htif_eve=
nt,
         htif_be_change, s, NULL, true);
-    if (address_symbol_set =3D=3D 3) {
-        memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
-                              TYPE_HTIF_UART, size);
-        memory_region_add_subregion_overlap(address_space, base,
-                                            &s->mmio, 1);
-    }
+
+    memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
+                          TYPE_HTIF_UART, size);
+    memory_region_add_subregion_overlap(address_space, base,
+                                        &s->mmio, 1);
=20
     return s;
 }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 288d69cd9f..597df4c288 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -42,6 +42,7 @@
=20
 static const MemMapEntry spike_memmap[] =3D {
     [SPIKE_MROM] =3D     {     0x1000,     0xf000 },
+    [SPIKE_HTIF] =3D     {  0x1000000,     0x1000 },
     [SPIKE_CLINT] =3D    {  0x2000000,    0x10000 },
     [SPIKE_DRAM] =3D     { 0x80000000,        0x0 },
 };
@@ -75,6 +76,10 @@ static void create_fdt(SpikeState *s, const MemMapEntr=
y *memmap,
=20
     qemu_fdt_add_subnode(fdt, "/htif");
     qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
+    if (!htif_uses_elf_symbols()) {
+        qemu_fdt_setprop_cells(fdt, "/htif", "reg",
+            0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
+    }
=20
     qemu_fdt_add_subnode(fdt, "/soc");
     qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
@@ -172,6 +177,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
     if (cmdline) {
         qemu_fdt_add_subnode(fdt, "/chosen");
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
+        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
     }
 }
=20
@@ -241,10 +247,6 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
         machine->ram);
=20
-    /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
-
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
                            memmap[SPIKE_MROM].size, &error_fatal);
@@ -266,6 +268,7 @@ static void spike_board_init(MachineState *machine)
                                     htif_symbol_callback);
     }
=20
+    /* Load kernel */
     if (machine->kernel_filename) {
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_ad=
dr);
@@ -273,17 +276,6 @@ static void spike_board_init(MachineState *machine)
         kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
                                          kernel_start_addr,
                                          htif_symbol_callback);
-
-        if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_ent=
ry,
-                                           &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
-                                  end);
-        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next=
 mode
@@ -292,6 +284,22 @@ static void spike_board_init(MachineState *machine)
         kernel_entry =3D 0;
     }
=20
+    /* Create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
+    /* Load initrd */
+    if (machine->kernel_filename && machine->initrd_filename) {
+        hwaddr start;
+        hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
+                                       machine->ram_size, kernel_entry,
+                                       &start);
+        qemu_fdt_setprop_cell(s->fdt, "/chosen",
+                              "linux,initrd-start", start);
+        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+                              end);
+    }
+
     /* Compute the fdt load address in dram */
     fdt_load_addr =3D riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
@@ -303,7 +311,8 @@ static void spike_board_init(MachineState *machine)
=20
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom,
-                 &s->soc[0].harts[0].env, serial_hd(0));
+                 &s->soc[0].harts[0].env, serial_hd(0),
+                 memmap[SPIKE_HTIF].base);
 }
=20
 static void spike_machine_instance_init(Object *obj)
--=20
2.31.1


