Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F79674E93
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:46:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0i-0000Mj-ER; Fri, 20 Jan 2023 02:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0f-0000HL-KQ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:25 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0d-0004qg-OC
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200423; x=1705736423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tn29utQFVeAYdugmhcxslFftDxtVJbhVei3WGKUZ43Q=;
 b=L+qROa4rfiUjcZhu3Mz/TtmZj/yfuInbhPols20TBevAJWwStPUkePVu
 +EUecBuW2f1ToazY4WvbPwcDyK6AVmAjlOfOhWfgl2fte3fJConWVPXvb
 aqTUbp7Imy04UfWXXwIbqEAt7HkFI30iey/gXtcg+qLKw9XjSoCtZeawi
 f3d07p84AgYVaB1MYYc1w2Eb8C7xUgFmQdGkmPDSs7HWivCMNj+PmTyDS
 2IqSnVdjv0U0VnY05yX2pfl444JzCGc1PkWD2vGzzrb7MgBnCdG7UswAe
 220OLgVL6M9QCvydTPWAIpAW7D3xF55dp5PejNrMYyFEO1LzfixY86HBH w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176728"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:01 +0800
IronPort-SDR: 7jaKnKtjI0fvh3uS4CMUOqIs18Boy7Qw50ELc8D0ivbLkBIbVKKHem1QxUxs0IASShZs907c4/
 IBFUvBkCI7eeiF3qrgM7Utol692pzdADdurlsCO+hVq3zftC6ksGLAErtLF/kKhOzkU5prR4s7
 SDoqwmoVVL4N/JMKN3c36ae/11LBEdnGJlxo+tgOGoIjww2wpUFMHJP2hj+anYFnC3gx515VwT
 pzkogLvoD6fWsV3hsL+gNsE6vACeJrm7SsKgWsfhRnkCbVE3vJ/UyJbcwqMlwd9oXf+itQ0x0q
 5IY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:39 -0800
IronPort-SDR: AA4NZaWU/DSda9gAaJ/Bem7Z+ftTFoESiq4xxvAHuEaNbiyTm5uN/Uq0qt8O7haFgGGr/XdC9F
 08ARPHUqtfnSV8KIVRov2EqV1CrW0BTfboQ4QA2lwqwcwON+kUTzT70xMEyT7RrBUcmmBwjGKi
 Fm083VnPSijujK3kmyoRXD3E4C2/Cru2CFzMMaarltBU/Wk8yhW8YKAzhZ8K4n5jDTkYfdXBm+
 R8trYX6YXAg7JHjF+TmnErRTBpehXjObufit4nGgJnSPjxI2DE9jUCgvVzc4Rbo+5hWJ7URCa9
 TbI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxY4Xvbz1RvTr
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200400; x=1676792401; bh=tn29utQ
 FVeAYdugmhcxslFftDxtVJbhVei3WGKUZ43Q=; b=GSzEYkJ54u8XS1NQcocA53G
 QG8GhL1MycyT9cPy/n1ZiARE49YSZ7ElDl4cy49+0RBnQ1yHfPr+UiCj5MPIG5Hp
 ut//z1O97uqehk8fBF9/k4NoMPPRRTrr7TQSOjAoXqeRek0VCHemmLaEVd8SqQ71
 cU3zhsjRLJOz8FxY94tBIS0yubtzTZsj2brBZ3F/CwztSIy8YwuONm2ap0LS6nAc
 ns8jo19QZwbjDh+fBKa3Hkz2/pCE5yeb6tHBNJYZZG7n7I2cWeHXPVDyR9s0SK7b
 djHr0GuV3QZhLfLxE7qKRKF1SxWmGyUGIcswiWkOaH3h0wX90F/Miswr2KJgrmA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GxK3EdHFX5kB for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:00 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxV74N4z1RvLy;
 Thu, 19 Jan 2023 23:39:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/37] hw/riscv: write initrd 'chosen' FDT inside
 riscv_load_initrd()
Date: Fri, 20 Jan 2023 17:38:55 +1000
Message-Id: <20230120073913.1028407-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

riscv_load_initrd() returns the initrd end addr while also writing a
'start' var to mark the addr start. These informations are being used
just to write the initrd FDT node. Every existing caller of
riscv_load_initrd() is writing the FDT in the same manner.

We can simplify things by writing the FDT inside riscv_load_initrd(),
sparing callers from having to manage start/end addrs to write the FDT
themselves.

An 'if (fdt)' check is already inserted at the end of the function
because we'll end up using it later on with other boards that doesn=C2=B4=
t
have a FDT.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230102115241.25733-7-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h    |  4 ++--
 hw/riscv/boot.c            | 18 ++++++++++++------
 hw/riscv/microchip_pfsoc.c | 10 ++--------
 hw/riscv/sifive_u.c        | 10 ++--------
 hw/riscv/spike.c           | 10 ++--------
 hw/riscv/virt.c            | 10 ++--------
 6 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index b273ab22f7..e37e1d1238 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,8 +46,8 @@ target_ulong riscv_load_firmware(const char *firmware_f=
ilename,
 target_ulong riscv_load_kernel(const char *kernel_filename,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-                         uint64_t kernel_entry, hwaddr *start);
+void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                       uint64_t kernel_entry, void *fdt);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
                                hwaddr saddr,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 31aa3385a0..6b948d1c9e 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -208,9 +208,10 @@ target_ulong riscv_load_kernel(const char *kernel_fi=
lename,
     exit(1);
 }
=20
-hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
-                         uint64_t kernel_entry, hwaddr *start)
+void riscv_load_initrd(const char *filename, uint64_t mem_size,
+                       uint64_t kernel_entry, void *fdt)
 {
+    hwaddr start, end;
     ssize_t size;
=20
     g_assert(filename !=3D NULL);
@@ -226,18 +227,23 @@ hwaddr riscv_load_initrd(const char *filename, uint=
64_t mem_size,
      * halfway into RAM, and for boards with 256MB of RAM or more we put
      * the initrd at 128MB.
      */
-    *start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
+    start =3D kernel_entry + MIN(mem_size / 2, 128 * MiB);
=20
-    size =3D load_ramdisk(filename, *start, mem_size - *start);
+    size =3D load_ramdisk(filename, start, mem_size - start);
     if (size =3D=3D -1) {
-        size =3D load_image_targphys(filename, *start, mem_size - *start=
);
+        size =3D load_image_targphys(filename, start, mem_size - start);
         if (size =3D=3D -1) {
             error_report("could not load ramdisk '%s'", filename);
             exit(1);
         }
     }
=20
-    return *start + size;
+    /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
+    if (fdt) {
+        end =3D start + size;
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start", star=
t);
+        qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end", end);
+    }
 }
=20
 uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index b10321b564..593a799549 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -633,14 +633,8 @@ static void microchip_icicle_kit_machine_init(Machin=
eState *machine)
                                          kernel_start_addr, NULL);
=20
         if (machine->initrd_filename) {
-            hwaddr start;
-            hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
-                                           machine->ram_size, kernel_ent=
ry,
-                                           &start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
-                                  "linux,initrd-end", end);
+            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
+                              kernel_entry, machine->fdt);
         }
=20
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ddceb750ea..37f5087172 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -608,14 +608,8 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
                                          kernel_start_addr, NULL);
=20
         if (machine->initrd_filename) {
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
+            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 004dfb2d5b..5668fe0694 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,14 +316,8 @@ static void spike_board_init(MachineState *machine)
                                          htif_symbol_callback);
=20
         if (machine->initrd_filename) {
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
+            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 408f7a2256..5967b136b4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1291,14 +1291,8 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
                                          kernel_start_addr, NULL);
=20
         if (machine->initrd_filename) {
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
+            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
+                              kernel_entry, machine->fdt);
         }
     } else {
        /*
--=20
2.39.0


