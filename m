Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCC4674E3E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0C-0007q9-HO; Fri, 20 Jan 2023 02:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm01-0007hO-KI
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:45 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzz-0004pk-PI
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200383; x=1705736383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=94cjWS/JRpFzc8QyOmlgNZLD1Ef6wv9Z0i19VVCZzzQ=;
 b=M1H9QJ0qnq0Pum78psvvo8NCi5MuOmHoZR75uYyjBV3ybU40CiQ6na5H
 iJdT0KJ9VEJtZ8U4bkznQCxGlr1fhz0WxsOrLp2Jio4kzc0+OSfLsfCh5
 zv5hEILW3fm3KmkPJPonC8jPI2dxi8oemJ2kJmhfbHCY7pCxh38gz5nLO
 xypBibeZe9x4mSErJKPfAPqkTw30N7SVljh0xm7o/hYuRlTxyUYwRrLLj
 wLr9VCeZXRYDO9PmnnUeUqcwmrZt0/aiSLnpPRpymZSo4uDNOZMUYdYv6
 m5inaVo+sUbPjU4Iohb7TY0ADWigUnswcXXNFM8GCW++Zi6Zl5qCdUhNA A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176693"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:42 +0800
IronPort-SDR: gluZfgsPxvuv9aopuXp+59wrW+zaACD1qdH+RoQ2nE+yE/H5jUvOiEZPzfrvUYWENo1NGrkBYr
 80S4mQ+pBW+E1GrvH0/SYRLVq5liWQwNPMoPR7qsC8+JVDt2gXXve3GZz2BwILwDk0e4NvkLB4
 5Fu1ky7iF5ugMNbBH7g8YVOehye45pZCwQGdSh9kklTFRW2lc7yWg8r5haIt0MMZLjIW6LjRjt
 vpU6cYXk+UsVceNaqL3avKv5glvQvnwaWpBzSPgb8nj82NyX+llkQ2l3Uj+AHkkMPiRuZSBAbz
 oAc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:20 -0800
IronPort-SDR: N5pKs++3M26AX8Yl9YjegpKmGeqhcvvyZ79uuXu2lkXrSwmVPjkRoy9H5zbkSAMoGnhfGV3HFi
 KL3W9WKrvgFBANBjWp7KZKEawkPsy32YKDU4smMDn1j/EgeqjzrkpDCC+1I9UJmtLcUCzjx7OC
 qzuKfaazLTlCWLYOVLL892A41tO94JElyCys+GVLV2fYBNCSCG4H8vSmiRX0UUeQLQvBrxbHV1
 cViAJKBunLSYd8341wOUXY8lAJ5H+RWB3u+WPyXDVOGDxGm0jwWQD1MMXTjMo3JZYGTo0de+9c
 d2c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxB28xPz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200381; x=1676792382; bh=94cjWS/JRpFzc8QyOm
 lgNZLD1Ef6wv9Z0i19VVCZzzQ=; b=eZKF9NBf85nRRCmdLYnCJxpIWgoJk3sJT3
 esazImGlEiwa253py7pVQ2cHTTwTKE7+Hi+r1QXMve1DSfJjDFlbTx5CtD/rdnqk
 tLGtty4uHpAcSP3pZg56I++cT+CGAJkelQX16GioYu3UAiefuDMnJxlBw9ILfFPK
 QRD8lX+UFM4hLRgCLDZ2JubaUlrliKM2dYnQDbmqh0YeXCgxUq0TgOnx823Czenl
 rQ4p9LGLLWlcvTkDEz4GzkekjZ2QVazB1ReZtEEOzTcC0dgLze6bvfoEw0vP5bzK
 HJvGKw3PW9nzTARtLpG1FRwuX1EbHqj8NezA6RMI7jRqmM9KDTgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rtSMlvMJLLQv for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:41 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrx762FZz1RvLy;
 Thu, 19 Jan 2023 23:39:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PULL 10/37] hw/riscv/boot.c: introduce riscv_default_firmware_name()
Date: Fri, 20 Jan 2023 17:38:46 +1000
Message-Id: <20230120073913.1028407-11-alistair.francis@opensource.wdc.com>
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Some boards are duplicating the 'riscv_find_and_load_firmware' call
because the 32 and 64 bits images have different names. Create
a function to handle this detail instead of hardcoding it in the boards.

Ideally we would bake this logic inside riscv_find_and_load_firmware(),
or even create a riscv_load_default_firmware(), but at this moment we
cannot infer whether the machine is running 32 or 64 bits without
accessing RISCVHartArrayState, which in turn can't be accessed via the
common code from boot.c. In the end we would exchange 'firmware_name'
for a flag with riscv_is_32bit(), which isn't much better than what we
already have today.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20221221182300.307900-6-dbarboza@ventanamicro.com>
Message-Id: <20221229091828.1945072-11-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h |  1 +
 hw/riscv/boot.c         |  9 +++++++++
 hw/riscv/sifive_u.c     | 11 ++++-------
 hw/riscv/spike.c        | 14 +++++---------
 hw/riscv/virt.c         | 10 +++-------
 5 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index c03e4e74c5..60cf320c88 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -37,6 +37,7 @@ target_ulong riscv_find_and_load_firmware(MachineState =
*machine,
                                           const char *default_machine_fi=
rmware,
                                           hwaddr firmware_load_addr,
                                           symbol_fn_t sym_cb);
+const char *riscv_default_firmware_name(RISCVHartArrayState *harts);
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 7361d5c0d8..e1a544b1d9 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -75,6 +75,15 @@ target_ulong riscv_calc_kernel_start_addr(RISCVHartArr=
ayState *harts,
     }
 }
=20
+const char *riscv_default_firmware_name(RISCVHartArrayState *harts)
+{
+    if (riscv_is_32bit(harts)) {
+        return RISCV32_BIOS_BIN;
+    }
+
+    return RISCV64_BIOS_BIN;
+}
+
 static char *riscv_find_firmware(const char *firmware_filename)
 {
     char *filename;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b40a4767e2..a58ddb36ac 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -533,6 +533,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
     MemoryRegion *flash0 =3D g_new(MemoryRegion, 1);
     target_ulong start_addr =3D memmap[SIFIVE_U_DEV_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name;
     uint32_t start_addr_hi32 =3D 0x00000000;
     int i;
     uint32_t fdt_load_addr;
@@ -595,13 +596,9 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
         break;
     }
=20
-    if (riscv_is_32bit(&s->soc.u_cpus)) {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
+    firmware_name =3D riscv_default_firmware_name(&s->soc.u_cpus);
+    firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmware=
_name,
+                                                     start_addr, NULL);
=20
     if (machine->kernel_filename) {
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index df9f070707..3c8a8de673 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -190,6 +190,7 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *system_memory =3D get_system_memory();
     MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     char *soc_name;
@@ -255,15 +256,10 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
=20
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, memmap[SPIKE_DRAM]=
.base,
-                                    htif_symbol_callback);
-    } else {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, memmap[SPIKE_DRAM]=
.base,
-                                    htif_symbol_callback);
-    }
+    firmware_name =3D riscv_default_firmware_name(&s->soc[0]);
+    firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmware=
_name,
+                                                     memmap[SPIKE_DRAM].=
base,
+                                                     htif_symbol_callbac=
k);
=20
     /* Load kernel */
     if (machine->kernel_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 94ff2a1584..408f7a2256 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1237,6 +1237,7 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
     MachineState *machine =3D MACHINE(s);
     target_ulong start_addr =3D memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
+    const char *firmware_name =3D riscv_default_firmware_name(&s->soc[0]=
);
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
=20
@@ -1256,13 +1257,8 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
         }
     }
=20
-    if (riscv_is_32bit(&s->soc[0])) {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_BIN, start_addr, NULL);
-    } else {
-        firmware_end_addr =3D riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_BIN, start_addr, NULL);
-    }
+    firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmware=
_name,
+                                                     start_addr, NULL);
=20
     /*
      * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the d=
evice
--=20
2.39.0


