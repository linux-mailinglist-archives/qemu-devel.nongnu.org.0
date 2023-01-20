Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A68674E9C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:47:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0t-0000eK-PJ; Fri, 20 Jan 2023 02:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0r-0000VZ-0J
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:37 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0p-0004pk-4E
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200435; x=1705736435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KKw2hOambB31lcakp0JSBvCoz5OfdQijlPxzoRckMTk=;
 b=RcLgd28EsvPealRWzIgqALouuVop31LTbLngsoHKOFTWjhzbrog4O1Rx
 a0YUQOSeSGhrPF0U4e4d5gmNXdLJ2wADPxAL+CqV5ttc4Z5LNPGa2u4hH
 abBMk3Odd84X4hl6Sj+Qp2J2Op/21xY/mC+BwpjEAkvx2jLpa9OV640d4
 /yAtsgW9PQBpGrL6krXM9wRwDiS7wRAi+dh0tN/2nFEfh1DIHxmipIaL4
 lQnHG5yppkulHk3kl9Y9tvznh+a3WRwIKEOiRtI+5gjNWpsvtEXqQ2qCG
 72p2s7btk9ky18A+RjNCWkpvlE/C5K1MwFWTq0lLobISLR5NK5sxM85+j A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176737"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:07 +0800
IronPort-SDR: QUvr9Oy1F4dRiCywwLBd6zHjNpulULppnhD0km21s8ETkNCMelDeTkFUGGkeEnsrI9tIDIwGjh
 Qt7uX27i3nnJ8McNamL0UTtS5nGkdgOs21Xuy/USxkCIFhf6NsVu1VSwEjpvSXbkK62dWoX7kF
 puPGYvHcfc7LG0AMV4fRFH6kD66FxLiys75dXeWUzfX/hgAwRTmtFZ5kPjGfI2agoUp18bdFML
 4z/74vKi1efCywBIe0nGu85oRMQ9+tX83YAg/jPYxv5RljVMsVtmglBvMJcfh1hVumIhxpXwGy
 8ok=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:44 -0800
IronPort-SDR: GohFjP0g6O1Lfo4qoAntMf05evztgGfLxHVSwk4rk6XDxW3aJeq76iKToKaW3RdqZ0I+rkCPKg
 v5y8ASYVEcUXdgyhL4IKqWTlbZGoW2ELrvvr2IQEvsbh/RuuMobL77tUpW1TqICagpGzjoz6Fd
 LqNRWx4+cIG7ITUjxSba4EG+/4mu12Q219R0urKig/p2IeDs/sR/lndSrdn+Ge2L9mx3ssnixl
 yrPjNdMFKcFwp99i3l23xuFI9dYaZ/CIs/bz2ViCK9Q+pbtpApyYe4TRD2V9+dlBi7TOtBPuTs
 AgA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrxf4G1jz1RwtC
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200405; x=1676792406; bh=KKw2hOa
 mbB31lcakp0JSBvCoz5OfdQijlPxzoRckMTk=; b=ZX+XULCP8I9xP0q+Eps4oNX
 zw99nuFYTTQu88oxg66jyIpDwBAuegmtbIDcUEwWcq/W2RwSJ6oug6o0Tns5fe4p
 FQsb2n5ANa4fcauY3Ix1UKs+j7T4HavLhbnqJAqo+B2+u1X61y9FdyUXyjLRo5R7
 4PTkAu+AMEnCN/Zumh8JJJN9dszGDOOJudB6R8Ix4Ule8DNL4CWUfhAqK+cN1Gdi
 CbfwsL8WS6eoNzgNHi97MI4belaw9EWe+NNdVM5YkOAQPEv397S0WklWl/xIzr9u
 MQ6IPa91LPpUpDu40Fof0VdeBiNSqNnwcZVUVzF74zP0YY2G9L4Ur3iv6ZA0XcA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IET6QJNo56ks for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:05 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrxb6qhPz1RvLy;
 Thu, 19 Jan 2023 23:40:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/37] hw/riscv/boot.c: use MachineState in riscv_load_initrd()
Date: Fri, 20 Jan 2023 17:38:57 +1000
Message-Id: <20230120073913.1028407-22-alistair.francis@opensource.wdc.com>
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

'filename', 'mem_size' and 'fdt' from riscv_load_initrd() can all be
retrieved by the MachineState object for all callers.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230102115241.25733-9-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h    | 3 +--
 hw/riscv/boot.c            | 6 ++++--
 hw/riscv/microchip_pfsoc.c | 3 +--
 hw/riscv/sifive_u.c        | 3 +--
 hw/riscv/spike.c           | 3 +--
 hw/riscv/virt.c            | 3 +--
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index e37e1d1238..cfd72ecabf 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,8 +46,7 @@ target_ulong riscv_load_firmware(const char *firmware_f=
ilename,
 target_ulong riscv_load_kernel(const char *kernel_filename,
                                target_ulong firmware_end_addr,
                                symbol_fn_t sym_cb);
-void riscv_load_initrd(const char *filename, uint64_t mem_size,
-                       uint64_t kernel_entry, void *fdt);
+void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
 uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
                                hwaddr saddr,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 6b948d1c9e..d3e780c3b6 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -208,9 +208,11 @@ target_ulong riscv_load_kernel(const char *kernel_fi=
lename,
     exit(1);
 }
=20
-void riscv_load_initrd(const char *filename, uint64_t mem_size,
-                       uint64_t kernel_entry, void *fdt)
+void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
 {
+    const char *filename =3D machine->initrd_filename;
+    uint64_t mem_size =3D machine->ram_size;
+    void *fdt =3D machine->fdt;
     hwaddr start, end;
     ssize_t size;
=20
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 593a799549..1e9b0a420e 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -633,8 +633,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
                                          kernel_start_addr, NULL);
=20
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
=20
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3e6df87b5b..c40885ed5c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -602,8 +602,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
                                          kernel_start_addr, NULL);
=20
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
=20
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 60e2912be5..99dec74fe8 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -312,8 +312,7 @@ static void spike_board_init(MachineState *machine)
                                          htif_symbol_callback);
=20
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
=20
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6c946b6def..02f1369843 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1285,8 +1285,7 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
                                          kernel_start_addr, NULL);
=20
         if (machine->initrd_filename) {
-            riscv_load_initrd(machine->initrd_filename, machine->ram_siz=
e,
-                              kernel_entry, machine->fdt);
+            riscv_load_initrd(machine, kernel_entry);
         }
=20
         if (machine->kernel_cmdline && *machine->kernel_cmdline) {
--=20
2.39.0


