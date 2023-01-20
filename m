Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C284674E74
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:44:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0J-0007wC-Ho; Fri, 20 Jan 2023 02:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0G-0007vF-Ga
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:00 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0E-0004pk-Ch
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200398; x=1705736398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bn30vjVPAWSQy0gjD1ACYzE8Lg6WPT3P+Hv3PjnBeHU=;
 b=RpLZqcTBA4Et+bOS2rQNh1Xl/IPA2nc5knpITcuqdi9UgCbBkyEvOjVE
 hDTBL5evXMsqqR/mJCH066vnafMYo6xgYXX7z1EiEQAkukaI9NoFR1j1Q
 Boi2hNQDbw8iGNWCt/wCpCnpb6sl6dBG1HnjTYuIu/isXnjqfrJQmQgtQ
 l7xZ3gVSL+HVEnfXjf2s60D+QJApsrhNjEVGKZClrITv89Up35tq73GqT
 xEnwZ0YZPl5H340Iz+Skc+RnPSZuAcK3mR0tG4beEO/8ZktMdlyL4BFJe
 DZppb9WCUD8vMj0a4XpERNasvcRRrBwtJYgglUl5gE2reMVIfzjVhM2su w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176698"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:46 +0800
IronPort-SDR: xKcR2tZp8arVt5m4O99LApDOYJN2MLb15j9cwxt+JVwZFqaqY2WFAlLm6J09n4v2iPs4dogvOO
 vynjl8u56J7gtDL/Nju/fh/sOpGHiLj6bUJNashKCinEGdmSegs8T2QG5S6nyt9pJFXOrGhflT
 SRgYXCe6Abux2rfTkHJviEXA4lyhk8FIy75ETiKb1A+Nc0uIyp+QpRWALxd+m9hCmGzVOHttb1
 tPgNAK5uFi1A4VoGr3K43RkhtUelMg4r1T1brFiComnTppvmo3ONtUlrooVlqfiGPSbHLXRntN
 VDs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:24 -0800
IronPort-SDR: 4o3TB5HsJjbNRkKixwTIc1COx11M8BoYhtvOzsPS6JIX3PooghsxTsD/K+g4dkXHfn2KDPyu91
 wNDZx/JKKN0OOEBAh+IJ3kcV1I1XMdsXcnifT7d27GUYI37e+LZRvTeYcpJ6dtCF9/e/ZHvGjx
 KFBDjIHXgruqxmuPvKtAmJzMp/QfvAWjUWl4latXdYV+vhOmvb29O1HQR2RuuvqloTasETK5oq
 7vMs6n3Lowpko2g5I8fpKu96QN5mbOvhuueoHMtoBqm467LbeLdxv8tAGdaBQVjj1Ngr1otzMf
 3OA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:46 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxF6p1Cz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:45 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200385; x=1676792386; bh=Bn30vjVPAWSQy0gjD1
 ACYzE8Lg6WPT3P+Hv3PjnBeHU=; b=f/HKifnzHskHE2GpJqtnANranbXsPFGiRA
 tLdpUpr0CNRb770LBSRrgvsiSfsMdvfRNPPXhRBdI+/INSlkdu6rZEPquzUzE0ua
 nMhX1mCnJzrPy5vCZV+5XQCJBaeLtBvmd8LS4fWzKL/0kOdt0oD0uwMBceV4gUNU
 FUtwdxwkNdvFztpkHfX4EOF3tPp3bNyQBckCgunprLS89v8tOp+hM15aA2z3Axyh
 o3FZYTfxE52sSMpjCx6lNS/vpS3Q6WAgToxkWk1hBl59hLZQylNLdRwArTPpneVq
 WRdy/ZoYZcRyp3PzA7Wc5V6TXirabMs9dfOOA4YjSi2R02rQCZ1g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2t2TZMPjQ9HA for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:45 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxC5q5Qz1RvLy;
 Thu, 19 Jan 2023 23:39:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/37] hw/riscv: spike: Decouple create_fdt() dependency to ELF
 loading
Date: Fri, 20 Jan 2023 17:38:48 +1000
Message-Id: <20230120073913.1028407-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
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

From: Bin Meng <bmeng@tinylab.org>

At present create_fdt() calls htif_uses_elf_symbols() to determine
whether to insert a <reg> property for the HTIF. This unfortunately
creates a hidden dependency to riscv_load_{firmware,kernel} that
create_fdt() must be called after the ELF {firmware,kernel} image
has been loaded.

Decouple such dependency be adding a new parameter to create_fdt(),
whether custom HTIF base address is used. The flag will be set if
non ELF {firmware,kernel} image is given by user.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20221229091828.1945072-13-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/char/riscv_htif.h |  5 +--
 hw/char/riscv_htif.c         | 17 +++++-----
 hw/riscv/spike.c             | 61 ++++++++++++++++++++++++++++++------
 3 files changed, 59 insertions(+), 24 deletions(-)

diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
index 9e8ebbe017..5958c5b986 100644
--- a/include/hw/char/riscv_htif.h
+++ b/include/hw/char/riscv_htif.h
@@ -44,11 +44,8 @@ typedef struct HTIFState {
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_=
value,
     uint64_t st_size);
=20
-/* Check if HTIF uses ELF symbols */
-bool htif_uses_elf_symbols(void);
-
 /* legacy pre qom */
 HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
-                        uint64_t nonelf_base);
+                        uint64_t nonelf_base, bool custom_base);
=20
 #endif
diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
index 1477fc0090..098de50e35 100644
--- a/hw/char/riscv_htif.c
+++ b/hw/char/riscv_htif.c
@@ -52,20 +52,17 @@
 #define PK_SYS_WRITE            64
=20
 static uint64_t fromhost_addr, tohost_addr;
-static int address_symbol_set;
=20
 void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_=
value,
                           uint64_t st_size)
 {
     if (strcmp("fromhost", st_name) =3D=3D 0) {
-        address_symbol_set |=3D 1;
         fromhost_addr =3D st_value;
         if (st_size !=3D 8) {
             error_report("HTIF fromhost must be 8 bytes");
             exit(1);
         }
     } else if (strcmp("tohost", st_name) =3D=3D 0) {
-        address_symbol_set |=3D 2;
         tohost_addr =3D st_value;
         if (st_size !=3D 8) {
             error_report("HTIF tohost must be 8 bytes");
@@ -275,19 +272,19 @@ static const MemoryRegionOps htif_mm_ops =3D {
     .write =3D htif_mm_write,
 };
=20
-bool htif_uses_elf_symbols(void)
-{
-    return (address_symbol_set =3D=3D 3) ? true : false;
-}
-
 HTIFState *htif_mm_init(MemoryRegion *address_space, Chardev *chr,
-                        uint64_t nonelf_base)
+                        uint64_t nonelf_base, bool custom_base)
 {
     uint64_t base, size, tohost_offset, fromhost_offset;
=20
-    if (!htif_uses_elf_symbols()) {
+    if (custom_base) {
         fromhost_addr =3D nonelf_base;
         tohost_addr =3D nonelf_base + 8;
+    } else {
+        if (!fromhost_addr || !tohost_addr) {
+            error_report("Invalid HTIF fromhost or tohost address");
+            exit(1);
+        }
     }
=20
     base =3D MIN(tohost_addr, fromhost_addr);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 3c8a8de673..1679c325d5 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -49,7 +49,8 @@ static const MemMapEntry spike_memmap[] =3D {
 };
=20
 static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_3=
2_bit)
+                       uint64_t mem_size, const char *cmdline,
+                       bool is_32_bit, bool htif_custom_base)
 {
     void *fdt;
     uint64_t addr, size;
@@ -77,7 +78,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry=
 *memmap,
=20
     qemu_fdt_add_subnode(fdt, "/htif");
     qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
-    if (!htif_uses_elf_symbols()) {
+    if (htif_custom_base) {
         qemu_fdt_setprop_cells(fdt, "/htif", "reg",
             0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
     }
@@ -183,18 +184,33 @@ static void create_fdt(SpikeState *s, const MemMapE=
ntry *memmap,
     }
 }
=20
+static bool spike_test_elf_image(char *filename)
+{
+    Error *err =3D NULL;
+
+    load_elf_hdr(filename, NULL, NULL, &err);
+    if (err) {
+        error_free(err);
+        return false;
+    } else {
+        return true;
+    }
+}
+
 static void spike_board_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D spike_memmap;
     SpikeState *s =3D SPIKE_MACHINE(machine);
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
-    target_ulong firmware_end_addr, kernel_start_addr;
-    const char *firmware_name;
+    target_ulong firmware_end_addr =3D memmap[SPIKE_DRAM].base;
+    target_ulong kernel_start_addr;
+    char *firmware_name;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     char *soc_name;
     int i, base_hartid, hart_count;
+    bool htif_custom_base =3D false;
=20
     /* Check socket count limit */
     if (SPIKE_SOCKETS_MAX < riscv_socket_count(machine)) {
@@ -256,10 +272,34 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
=20
-    firmware_name =3D riscv_default_firmware_name(&s->soc[0]);
-    firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmware=
_name,
-                                                     memmap[SPIKE_DRAM].=
base,
-                                                     htif_symbol_callbac=
k);
+    /* Find firmware */
+    firmware_name =3D riscv_find_firmware(machine->firmware,
+                        riscv_default_firmware_name(&s->soc[0]));
+
+    /*
+     * Test the given firmware or kernel file to see if it is an ELF ima=
ge.
+     * If it is an ELF, we assume it contains the symbols required for
+     * the HTIF console, otherwise we fall back to use the custom base
+     * passed from device tree for the HTIF console.
+     */
+    if (!firmware_name && !machine->kernel_filename) {
+        htif_custom_base =3D true;
+    } else {
+        if (firmware_name) {
+            htif_custom_base =3D !spike_test_elf_image(firmware_name);
+        }
+        if (!htif_custom_base && machine->kernel_filename) {
+            htif_custom_base =3D !spike_test_elf_image(machine->kernel_f=
ilename);
+        }
+    }
+
+    /* Load firmware */
+    if (firmware_name) {
+        firmware_end_addr =3D riscv_load_firmware(firmware_name,
+                                                memmap[SPIKE_DRAM].base,
+                                                htif_symbol_callback);
+        g_free(firmware_name);
+    }
=20
     /* Load kernel */
     if (machine->kernel_filename) {
@@ -279,7 +319,7 @@ static void spike_board_init(MachineState *machine)
=20
     /* Create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+               riscv_is_32bit(&s->soc[0]), htif_custom_base);
=20
     /* Load initrd */
     if (machine->kernel_filename && machine->initrd_filename) {
@@ -307,7 +347,8 @@ static void spike_board_init(MachineState *machine)
                               fdt_load_addr);
=20
     /* initialize HTIF using symbols found in load_kernel */
-    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base);
+    htif_mm_init(system_memory, serial_hd(0), memmap[SPIKE_HTIF].base,
+                 htif_custom_base);
 }
=20
 static void spike_machine_instance_init(Object *obj)
--=20
2.39.0


