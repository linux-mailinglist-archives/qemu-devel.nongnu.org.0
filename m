Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA1351417D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:39:55 +0200 (CEST)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIQ6-0008NF-M9
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJP-0000Ro-Jx
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:59 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJN-0002Wg-FH
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206777; x=1682742777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BzDE9xtqYrtpDbljvYRCISIJGoM8IsFSfq43+fyprmE=;
 b=bWK+67l82NDkjTNZ5yXYdle+wIZ2A9BsXynlE5L9Rg+gMGQKrKwt/TKy
 utelEeHKCILJoEohepYjabWecyOpy9f5spLs47fNiecgq9a79d12bXJXn
 6APmAtwQt7TJWGmxU6O4kkohS6GPpXC/qMn3vGtZUOObX3PP+nNXk5S8o
 wbwsLr4c4NjelTQqsstfDHVcjfTC2mzcEDAZYFIloxStXj+TFoA0mlruC
 Kd7QjBZcF1e/lCUj2bu6YpliSQExuZxp87NRmgc4eMAOdrPzoaGppQEJM
 FL5razejC/0RQM9R/vjI5KtkyjeitKNBt7eAHhGbJF7AzJp3T+L5vkexZ w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995986"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:42 +0800
IronPort-SDR: mG+sWXHY2A/XlLcjFGg6FJwNZcgcmmKweMLt7onU6lU3kvaZRF9zuyDK2psezhPG/YO8K28Wzm
 Xiv7/szU0k1eSnkhyvFOGHBJaAkAoq9I/mpkdc88BvUH/h/nAqD61ygliyhQQEvKhLvW1jqWKv
 9E2bbGxzQYW7yPual5qz+LpSscwlixQqMVWDAtovyYNKjA3Qij/LYRImBiFZRurilwiGoOMKQh
 PcVg6vMqf4dMZWWQ9Iiows6r1/q2oo8MrpNfqJu/UJi5wmP2PW4Ow4Sv4jWFhDcgRMP3z6QDMk
 SzTiPtdPQC+MLSB+p2b4o9bS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:51 -0700
IronPort-SDR: q7xoPZ60jtT/9hkWSY5l+v9DKfahliR6RmdRjQf6oA1sFZYhpHulD5R1Vban3GBpI0KibZ8Rex
 Z2aeE7Pvb0hf/0Hce5f8/FfYvWL6tdYCgKd/sipQCBv2W5n2jSTVo7zpKHctclyq/EOLE/bMgg
 J+KXjGXfrPY+ib5C5/nVWyd+X3dTB4f782R/NBJv0KHuZDxlRjCN2cWZMkJn85GIuiN+N7ULxW
 QIUhHJsxKtixeGbvpHIIOPsqrGDtatbIaqdk47YxcEg0M6l/KltSa/d4IqiDBpP8fbk42KzmPT
 uEc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKNB5Hykz1SVny
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206762; x=1653798763; bh=BzDE9xtqYrtpDbljvY
 RCISIJGoM8IsFSfq43+fyprmE=; b=lL7/1GHPUtMqq8EqBpbYHTpMwkB/yvzxHl
 m1Bs1LyUH3t9Rc204Rxhn6ylW1p2P3grCyTYXOMGY3OQVLI2niAvAv/xZyCz7Fmb
 mV+Z6szv3MAi72wcIjczI3eom6K9wwRdO7KpHY9ebts+MDHHozbpUpLQ0CN6YEbj
 gx+mGoihEU8DtVtZcT1vYorgk871qtM7d1TwwHcw5AtvykhjkZIjXNRgmL5FnVI5
 JgCK+Oq0CNnQfSnfxlvipvlkoghbT+O08zaXOJ+0t5nh+y80kdtUi4bF6NizSxzi
 jAhzUpTMV5tk+pOPL+8txsmcqyou0qJ2n+axTLRfDOHlNHjD41YQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id mg__CmxQQvCd for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKN76Dcgz1Rvlc;
 Thu, 28 Apr 2022 21:32:39 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 20/25] hw/riscv: virt: Add a machine done notifier
Date: Fri, 29 Apr 2022 14:31:14 +1000
Message-Id: <20220429043119.1478881-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Move the binary and device tree loading code to the machine done
notifier. This allows us to prepare for editing the device tree as part
of the notifier.

This is based on similar code in the ARM virt machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220427234146.1130752-2-alistair.francis@opensource.wdc.com=
>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h |   1 +
 hw/riscv/virt.c         | 191 +++++++++++++++++++++-------------------
 2 files changed, 102 insertions(+), 90 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 78b058ec86..8b8db3fb7c 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -45,6 +45,7 @@ struct RISCVVirtState {
     MachineState parent;
=20
     /*< public >*/
+    Notifier machine_done;
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 643fee23f7..f849052c75 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1162,6 +1162,100 @@ static DeviceState *virt_create_aia(RISCVVirtAIAT=
ype aia_type, int aia_guests,
     return aplic_m;
 }
=20
+static void virt_machine_done(Notifier *notifier, void *data)
+{
+    RISCVVirtState *s =3D container_of(notifier, RISCVVirtState,
+                                     machine_done);
+    const MemMapEntry *memmap =3D virt_memmap;
+    MachineState *machine =3D MACHINE(s);
+    target_ulong start_addr =3D memmap[VIRT_DRAM].base;
+    target_ulong firmware_end_addr, kernel_start_addr;
+    uint32_t fdt_load_addr;
+    uint64_t kernel_entry;
+
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * so the "-bios" parameter is not supported when KVM is enabled.
+     */
+    if (kvm_enabled()) {
+        if (machine->firmware) {
+            if (strcmp(machine->firmware, "none")) {
+                error_report("Machine mode firmware is not supported in =
"
+                             "combination with KVM.");
+                exit(1);
+            }
+        } else {
+            machine->firmware =3D g_strdup("none");
+        }
+    }
+
+    if (riscv_is_32bit(&s->soc[0])) {
+        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
+                                    RISCV32_BIOS_BIN, start_addr, NULL);
+    } else {
+        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
+                                    RISCV64_BIOS_BIN, start_addr, NULL);
+    }
+
+    if (machine->kernel_filename) {
+        kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
+                                                         firmware_end_ad=
dr);
+
+        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
+                                         kernel_start_addr, NULL);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_ent=
ry,
+                                           &start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
+                                  end);
+        }
+    } else {
+       /*
+        * If dynamic firmware is used, it doesn't know where is the next=
 mode
+        * if kernel argument is not set.
+        */
+        kernel_entry =3D 0;
+    }
+
+    if (drive_get(IF_PFLASH, 0, 0)) {
+        /*
+         * Pflash was supplied, let's overwrite the address we jump to a=
fter
+         * reset to the base of the flash.
+         */
+        start_addr =3D virt_memmap[VIRT_FLASH].base;
+    }
+
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg =3D create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
+    /* Compute the fdt load address in dram */
+    fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
+                                   machine->ram_size, machine->fdt);
+    /* load the reset vector */
+    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
+                              virt_memmap[VIRT_MROM].base,
+                              virt_memmap[VIRT_MROM].size, kernel_entry,
+                              fdt_load_addr, machine->fdt);
+
+    /*
+     * Only direct boot kernel is currently supported for KVM VM,
+     * So here setup kernel start address and fdt address.
+     * TODO:Support firmware loading and integrate to TCG start
+     */
+    if (kvm_enabled()) {
+        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
+    }
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap =3D virt_memmap;
@@ -1169,10 +1263,6 @@ static void virt_machine_init(MachineState *machin=
e)
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     char *soc_name;
-    target_ulong start_addr =3D memmap[VIRT_DRAM].base;
-    target_ulong firmware_end_addr, kernel_start_addr;
-    uint32_t fdt_load_addr;
-    uint64_t kernel_entry;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
=20
@@ -1302,98 +1392,12 @@ static void virt_machine_init(MachineState *machi=
ne)
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
         machine->ram);
=20
-    /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
-
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
                            memmap[VIRT_MROM].size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
=20
-    /*
-     * Only direct boot kernel is currently supported for KVM VM,
-     * so the "-bios" parameter is not supported when KVM is enabled.
-     */
-    if (kvm_enabled()) {
-        if (machine->firmware) {
-            if (strcmp(machine->firmware, "none")) {
-                error_report("Machine mode firmware is not supported in =
"
-                             "combination with KVM.");
-                exit(1);
-            }
-        } else {
-            machine->firmware =3D g_strdup("none");
-        }
-    }
-
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
-
-    if (machine->kernel_filename) {
-        kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
-                                                         firmware_end_ad=
dr);
-
-        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
-
-        if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_ent=
ry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
-                                  end);
-        }
-    } else {
-       /*
-        * If dynamic firmware is used, it doesn't know where is the next=
 mode
-        * if kernel argument is not set.
-        */
-        kernel_entry =3D 0;
-    }
-
-    if (drive_get(IF_PFLASH, 0, 0)) {
-        /*
-         * Pflash was supplied, let's overwrite the address we jump to a=
fter
-         * reset to the base of the flash.
-         */
-        start_addr =3D virt_memmap[VIRT_FLASH].base;
-    }
-
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg =3D create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
-    /* Compute the fdt load address in dram */
-    fdt_load_addr =3D riscv_load_fdt(memmap[VIRT_DRAM].base,
-                                   machine->ram_size, machine->fdt);
-    /* load the reset vector */
-    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
-                              virt_memmap[VIRT_MROM].base,
-                              virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, machine->fdt);
-
-    /*
-     * Only direct boot kernel is currently supported for KVM VM,
-     * So here setup kernel start address and fdt address.
-     * TODO:Support firmware loading and integrate to TCG start
-     */
-    if (kvm_enabled()) {
-        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
-    }
-
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
=20
@@ -1429,6 +1433,13 @@ static void virt_machine_init(MachineState *machin=
e)
                                   drive_get(IF_PFLASH, 0, i));
     }
     virt_flash_map(s, system_memory);
+
+    /* create device tree */
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               riscv_is_32bit(&s->soc[0]));
+
+    s->machine_done.notify =3D virt_machine_done;
+    qemu_add_machine_init_done_notifier(&s->machine_done);
 }
=20
 static void virt_machine_instance_init(Object *obj)
--=20
2.35.1


