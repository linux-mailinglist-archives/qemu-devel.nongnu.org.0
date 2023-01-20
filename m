Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FAC674E97
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:47:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0u-0000hE-EZ; Fri, 20 Jan 2023 02:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0r-0000ZS-SH
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:37 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0p-0004qg-Ty
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200435; x=1705736435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vdf5BHz2p/olUyMSeiSnuNYCzgkQaqMpc0wgM242sb0=;
 b=rUbWcaefaC49zLA5xLUa0TdctaXW7lz4FP3QXdvYyZ3FRIrBZSMIJek+
 KZzDUz/nByHzcCwutJwb44cm9xhpCGXAEXqGp87+bSwIlgeeHlHgTp76P
 sVFcQU2pJt7TbWg94HvCXcNgfVSdioX8QLnohGXZoe2dM0x0p4GOC969F
 96s9FkxtvRHZN413Tsri0+neZoZZKhTy/qAhBpBkZZ0o3YZtVC+AC1Mt+
 az7tV9j0RNc5o8sIFL24elVuv+Dj5LjATMzHYj4E2A3nXOpA08Ix2JUl+
 VMv430hb8Qvafn8ZmUOqUA6gu7lsZgvPuWGgLyclCNLOkXBt0HXyIihBw Q==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176739"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:09 +0800
IronPort-SDR: eSZV+9eGavKSXme9HIykppuUOTv7cOC2Kgsfo9XUUXoX58xe6LESAgacgZI8O3w5vZmeGZzQgA
 YzGAA+vTF33po0xVWo63ppRsGVzsH1c6gPO+vX7CPJqBcETDGqirlq7m8q6nJX88Ab6qv3b8AD
 Zll6KZOeirglvYRHreh3ljPCmGYRYL5eybGP/aQT726AFqu4ZSWtSk8Keqw6z0Rbql2DbthPUS
 DzJUJTnwzAEPDbj3Wmz5zco7UEEmECa59oC7t5vZfdk56wdfPKbKN+BdN8PCTFTYcspEMloJsA
 fgE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:47 -0800
IronPort-SDR: ehs0hqAlVsIMjLEwc2eUc9AHK7TjKWSrXOJpw1q19mykxEbdnSCM6P/gkoRckeWuKEqhZT7hZa
 qdxrGp7q/3tHLrq67T970Gl9TJd12schsjBFL5uCfAeT+wZqsIt+TMlUqbPmMaLa0U5mDFvEhK
 4ujuXW6/Nn2Ou6exuKuukG30uWxA00PKPlj72MAzM9lXrPFwWoQw2LVmxbivHxlRq5laDD43zM
 wKp6hxI4HeLEI75/EtJck89jf9RuY13JXikrvHGcTVHwWwm0gdrBlKf6cnXWlUnOow6CkQlNuq
 cEk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxh6Fsgz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200408; x=1676792409; bh=Vdf5BHz
 2p/olUyMSeiSnuNYCzgkQaqMpc0wgM242sb0=; b=iCkxXR9e88xhF7GoN/3BSmb
 irWrAX7D6XeT31JC6+jfsPFHNfNUL8j7hi0rQr/Lfh9/6QybiMFWEZMqIlkAc9vx
 qMHGVcVAV7KVatfpGjCyxH/NROiX6RbyjCuVV7R2HqeuvGmiQnt4zXQLRkBIhZ6M
 FNpqT149MjphuPEuKQYkkStmLWFPtle05kY2x//SYbPa7844im9Fiy7V+lkyBCgF
 IzGoO8psiyzYGXT7Mw6XVfTO7vTuQQSgGcz+zokDyzBRvGh8VjoTCijeY/sFyafl
 q4J77/3J7/k3PCWnxHwO2uq8S003wFN3A0t6DMzoKvOA+EUiK2gKqPcVZleEzhg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ovVhzjDxaBvT for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:08 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxf2f5zz1RvTp;
 Thu, 19 Jan 2023 23:40:06 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/37] hw/riscv/boot.c: use MachineState in riscv_load_kernel()
Date: Fri, 20 Jan 2023 17:38:58 +1000
Message-Id: <20230120073913.1028407-23-alistair.francis@opensource.wdc.com>
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

All callers are using kernel_filename as machine->kernel_filename.

This will also simplify the changes in riscv_load_kernel() that we're
going to do next.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230102115241.25733-10-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h    | 2 +-
 hw/riscv/boot.c            | 3 ++-
 hw/riscv/microchip_pfsoc.c | 3 +--
 hw/riscv/opentitan.c       | 3 +--
 hw/riscv/sifive_e.c        | 3 +--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 8 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index cfd72ecabf..f94653a09b 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -43,7 +43,7 @@ char *riscv_find_firmware(const char *firmware_filename=
,
 target_ulong riscv_load_firmware(const char *firmware_filename,
                                  hwaddr firmware_load_addr,
                                  symbol_fn_t sym_cb);
-target_ulong riscv_load_kernel(const char *kernel_filename,
+target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
 void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d3e780c3b6..2594276223 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -173,10 +173,11 @@ target_ulong riscv_load_firmware(const char *firmwa=
re_filename,
     exit(1);
 }
=20
-target_ulong riscv_load_kernel(const char *kernel_filename,
+target_ulong riscv_load_kernel(MachineState *machine,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
+    const char *kernel_filename =3D machine->kernel_filename;
     uint64_t kernel_load_base, kernel_entry;
=20
     g_assert(kernel_filename !=3D NULL);
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 1e9b0a420e..82ae5e7023 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -629,8 +629,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
                                                          firmware_end_ad=
dr);
=20
-        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
=20
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 85ffdac5be..64d5d435b9 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,8 +101,7 @@ static void opentitan_board_init(MachineState *machin=
e)
     }
=20
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename,
-                          memmap[IBEX_DEV_RAM].base, NULL);
+        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
     }
 }
=20
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index d65d2fd869..3e3f4b0088 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -114,8 +114,7 @@ static void sifive_e_machine_init(MachineState *machi=
ne)
                           memmap[SIFIVE_E_DEV_MROM].base, &address_space=
_memory);
=20
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename,
-                          memmap[SIFIVE_E_DEV_DTIM].base, NULL);
+        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL)=
;
     }
 }
=20
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index c40885ed5c..bac394c959 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -598,8 +598,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc.u_cpu=
s,
                                                          firmware_end_ad=
dr);
=20
-        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
=20
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 99dec74fe8..bff9475686 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -307,8 +307,7 @@ static void spike_board_init(MachineState *machine)
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_ad=
dr);
=20
-        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr,
+        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr,
                                          htif_symbol_callback);
=20
         if (machine->initrd_filename) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 02f1369843..c8e35f861e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1281,8 +1281,7 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
         kernel_start_addr =3D riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_ad=
dr);
=20
-        kernel_entry =3D riscv_load_kernel(machine->kernel_filename,
-                                         kernel_start_addr, NULL);
+        kernel_entry =3D riscv_load_kernel(machine, kernel_start_addr, N=
ULL);
=20
         if (machine->initrd_filename) {
             riscv_load_initrd(machine, kernel_entry);
--=20
2.39.0


