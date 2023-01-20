Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C02674E76
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0p-0000Ox-BL; Fri, 20 Jan 2023 02:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0n-0000Om-S0
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:33 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0m-0004pU-4b
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200432; x=1705736432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlqfE8UTZByMyYH8+2PqfMLUoQlV5O1p2CVl0RQXwHI=;
 b=hHfR5bkfkIPFZD/gMW0IK/YhaaGuM+RVjfa45b/r/WPGj7hUb+ftckjL
 Tr1y2qALDAGVjWNJbkojatLU5GB6CjaUuDbzsyPPgCkwRcTvYeEbfsq9m
 vFtLqDRImdmWhWW/gDv2bp0Rz6zwnYOH945WnL0M7OvMEK51ZDiVB6W0h
 jiknkGYjFUk9nNre9VGBaPgN+anuJKPdq43kdxYd6mlb5px7OvUmRDBkO
 Nrzr7h9qp4XRWg5WmpF8/3vmm2qjHu1LrfvFYcsg0v6i0i4bnifXxm4ZK
 2LMMpYh/zQfPYw+OcVtO29otdeHGIGbjlvNkxIrpjbTF5vjDrmAryY9Xl g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176731"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:04 +0800
IronPort-SDR: v6hA+Uvyx/31ITat/5depoYx6YDScu9BKyf82EKOBvL3o0EtcPEbLmA+t6EawdaQvcdU3lJjPD
 BbZHN8pDSw8uMTTSsWaYXUvPn7xm9RN7RhH74/HEFj9e7PbUDJlzk8B7mbE5athl/FXRmNeQ5m
 S1nHTxCRAppGRVvJB6phQj0MXcWXAlDxT/nWUbiPMGfz4/VotcwuX0fVaWaTo2TszcCW+CsaRP
 N6SnemJ5/S3ewqMkv5SenOPGZIOn2oKba+bqE61WP/j6H+HPHMqmNCEdbfRcl7Bw3YmoP63jx4
 pEU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:42 -0800
IronPort-SDR: J5MGfP1qbUPMoPtKXogRtvGU1DsEK1DbDp87LZLHohdh+9h3zYqGIw4aO8QlZ/wy4zcHCeaqpm
 bgD7HDG2z8reib4ZTBSYJGMldt3Fmc9VLpM3GgpIAb6fptD6ACn33iTkFJ6B10gBhIyEjVOoxz
 AumpwUIl6noIr26WcmfYJ3o0aS9R3kMFEfC8BYAbRIKoM3ZqgWni2Mls+AR2J6KDHDEVwadSsN
 vlXlPLwBt3TC5s49FtvmdFCPCjYJLMrVbEU3TcLazq0ipTtrltDDh2nO4m7yvcwYtTsKyAf319
 aec=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:04 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxc08gGz1RvTr
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200403; x=1676792404; bh=dlqfE8U
 TZByMyYH8+2PqfMLUoQlV5O1p2CVl0RQXwHI=; b=GDdTbNYHvd4ojKpSAnEI3jO
 dENA3TK/XB9Mfl4KxAwFovGyBjcQwYd7I5U6zEtPAGBQweeGoLAXQltvPslnx4ff
 WhzT7c9otK0Y3xD42KzUQmAwzkrrsty1EUbeApeTLPvT8SWHz7sBrssKagtzI3j+
 iJP7540zlpeRdeE9wW8VKQV9unbJlCVVeatq3f6lLSIdBAWGZ+mAizTeiUJ0dtvp
 UH7KGG62BdZ7qdswxq5olfIpSrf11Eyur7MfXR7CQmExUADqsfnPlbJwMekvrZAk
 klsEvprgOf0GtsYiyWGjY6SH20vPKGI2Z1Nli7EruS0yJDFB05OjGY9TrIf224g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id f7UZ5rIF-9n3 for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:03 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxY2RTDz1RvTp;
 Thu, 19 Jan 2023 23:40:00 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/37] hw/riscv: write bootargs 'chosen' FDT after
 riscv_load_kernel()
Date: Fri, 20 Jan 2023 17:38:56 +1000
Message-Id: <20230120073913.1028407-21-alistair.francis@opensource.wdc.com>
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

The sifive_u, spike and virt machines are writing the 'bootargs' FDT
node during their respective create_fdt().

Given that bootargs is written only when '-append' is used, and this
option is only allowed with the '-kernel' option, which in turn is
already being check before executing riscv_load_kernel(), write
'bootargs' in the same code path as riscv_load_kernel().

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230102115241.25733-8-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 11 +++++------
 hw/riscv/spike.c    |  9 +++++----
 hw/riscv/virt.c     | 11 +++++------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 37f5087172..3e6df87b5b 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -117,7 +117,6 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
             error_report("load_device_tree() failed");
             exit(1);
         }
-        goto update_bootargs;
     } else {
         fdt =3D ms->fdt =3D create_device_tree(&fdt_size);
         if (!fdt) {
@@ -510,11 +509,6 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
     qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
=20
     g_free(nodename);
-
-update_bootargs:
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-    }
 }
=20
 static void sifive_u_machine_reset(void *opaque, int n, int level)
@@ -611,6 +605,11 @@ static void sifive_u_machine_init(MachineState *mach=
ine)
             riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next=
 mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 5668fe0694..60e2912be5 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -179,10 +179,6 @@ static void create_fdt(SpikeState *s, const MemMapEn=
try *memmap,
=20
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
-
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-    }
 }
=20
 static bool spike_test_elf_image(char *filename)
@@ -319,6 +315,11 @@ static void spike_board_init(MachineState *machine)
             riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next=
 mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5967b136b4..6c946b6def 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1012,7 +1012,6 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap,
             error_report("load_device_tree() failed");
             exit(1);
         }
-        goto update_bootargs;
     } else {
         mc->fdt =3D create_device_tree(&s->fdt_size);
         if (!mc->fdt) {
@@ -1050,11 +1049,6 @@ static void create_fdt(RISCVVirtState *s, const Me=
mMapEntry *memmap,
     create_fdt_fw_cfg(s, memmap);
     create_fdt_pmu(s);
=20
-update_bootargs:
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline)=
;
-    }
-
     /* Pass seed to RNG */
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
     qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rn=
g_seed));
@@ -1294,6 +1288,11 @@ static void virt_machine_done(Notifier *notifier, =
void *data)
             riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next=
 mode
--=20
2.39.0


