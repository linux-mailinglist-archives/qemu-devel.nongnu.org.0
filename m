Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C15674E45
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:42:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0U-00080n-ND; Fri, 20 Jan 2023 02:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0T-0007yv-Cx
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:13 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0R-0004qg-Im
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200411; x=1705736411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xVaa9JYNmmkdEbD+oVQeErPcR9zJk0gv+SPzAgaeL0k=;
 b=Kmwr475gMttCdmHOXPBRY9d8w/0duBm0+v5OWnZQ6Iik+aWWfrifRSKh
 DcaTxba8pHMN0aMipBvrDImA8E+rPhDrkqTUE7GUpqlxcepmW6mWHkNke
 yXBREhUhymglQE0f2vaYuaELvzJFX47Zg8OXscGSVsRKdyf0AtmXGN8oX
 TWfYUzDVrS74UfoKeYtR2UJ+PXcGqaI0VbqsUWiTDfiNz1KvV+4IhU6Ct
 8IFrBEMu0a+JpMkE5B4u5CrGgvLl0qvhlk+FSvJ0q9V0BmPXpIjFvlhW+
 QU3n0rUEjfqesK/SGgxOfzyJcxFc6VQ14zL10T9jvwJX8Lze38ux2SrpS Q==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176714"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:55 +0800
IronPort-SDR: mhOMJ0ykkgH9+xUvkVP9Ze4wXfUwYLu2SGJMokWrnl+YqxmAk8MoUK+WhElSNXSOaUwvHYLz2M
 hInL2ubvcYKRZaZ5/lUwhVgFoI1z4tAzKdpi/wbLkbAvrfuCkoLpLuN+W5Stt/vJwQdw6s4S54
 QVbnC19AcX5R/dF0GutdabMMeVWf4NFlPQu/Nyv7mvpTMUxVE7ohIxotQpo+X7kQCiYq57Tuy3
 n+rnJ7t44hj+vb+aawZnoUvV/pNNwSUblV54ZENvwN5mPIW77ivuF9iBEFpTC1eDCLo8lAtX1y
 WQE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:33 -0800
IronPort-SDR: Q5cVTEjt/KFRRb/eFJ3Ou69yjtdYpfFyIyC4sB/79UgJC/Byn75qu5OI1weUyhtDwtvaZx22f2
 bhX/RWbArJcy7eMsHKxAidTf+Y0+m2NyFCE5brAPad30nDGvC7cr9cszuNmrWEjSjkdyJy1thA
 Yogs/d4lJKK/4mAVuQ/LHkRblXMqSXSsgBOqx7DtmsQfv3aNw+KgAol7FjvN17WlQ+mYBJIYTL
 rcPeyG2qcyGmyuVVk1zuAd21lc9leKbAKvoQhXcTH+RWTOvfYxeyyG9pSupi8FDEigr829Nkpa
 SiM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxR0nfwz1Rwtm
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1674200394; x=1676792395; bh=xVaa9JY
 NmmkdEbD+oVQeErPcR9zJk0gv+SPzAgaeL0k=; b=qH1uyp7hA04FPV+woZxs4/N
 Rk5ZN9wLJIp6jQx6KerfVVAQy/dgacXKjjbvT/PrNOMzdAqqdFbESWjXVZs0utTI
 ZNvsBgFEi0u2EhLQYuS/vPlBa+A+7MmCFZD4kK0CTQlRgJlGP8yWJA66ic2M6dSp
 DNj9yFuWpFL1OsCpA5bt2XnTj92xLJC067SJjXrFQ+Eh1yzLa3X/8I/UQuP97A3p
 3DKlwo2aw+Z3Lv+wUbbst9f8Nw/h82Ma3HhUXfeidXObgGCYQmKFYtvBr0YIoEi5
 mkhkQ6sDa2OXo1DBuHr2YNzorNoxp9KalCf7bZb5RX+wcwgmO8ccG/44qeGo0sQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id W2SOokSYzzQi for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:54 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxN54fVz1RvTp;
 Thu, 19 Jan 2023 23:39:52 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PULL 16/37] hw/riscv/sifive_u: use 'fdt' from MachineState
Date: Fri, 20 Jan 2023 17:38:52 +1000
Message-Id: <20230120073913.1028407-17-alistair.francis@opensource.wdc.com>
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

The MachineState object provides a 'fdt' pointer that is already being
used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
command.

Remove the 'fdt' pointer from SiFiveUState and use MachineState::fdt
instead.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20230102115241.25733-4-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h |  3 ---
 hw/riscv/sifive_u.c         | 15 ++++++---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index a67328f7ad..65af306963 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -69,9 +69,6 @@ typedef struct SiFiveUState {
     /*< public >*/
     SiFiveUSoCState soc;
=20
-    void *fdt;
-    int fdt_size;
-
     bool start_in_flash;
     uint32_t msel;
     uint32_t serial;
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a58ddb36ac..ddceb750ea 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -98,7 +98,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEnt=
ry *memmap,
 {
     MachineState *ms =3D MACHINE(qdev_get_machine());
     void *fdt;
-    int cpu;
+    int cpu, fdt_size;
     uint32_t *cells;
     char *nodename;
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle =3D 1;
@@ -112,14 +112,14 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
     };
=20
     if (ms->dtb) {
-        fdt =3D s->fdt =3D load_device_tree(ms->dtb, &s->fdt_size);
+        fdt =3D ms->fdt =3D load_device_tree(ms->dtb, &fdt_size);
         if (!fdt) {
             error_report("load_device_tree() failed");
             exit(1);
         }
         goto update_bootargs;
     } else {
-        fdt =3D s->fdt =3D create_device_tree(&s->fdt_size);
+        fdt =3D ms->fdt =3D create_device_tree(&fdt_size);
         if (!fdt) {
             error_report("create_device_tree() failed");
             exit(1);
@@ -612,9 +612,9 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
             hwaddr end =3D riscv_load_initrd(machine->initrd_filename,
                                            machine->ram_size, kernel_ent=
ry,
                                            &start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
                                   "linux,initrd-start", start);
-            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd=
-end",
                                   end);
         }
     } else {
@@ -627,14 +627,11 @@ static void sifive_u_machine_init(MachineState *mac=
hine)
=20
     /* Compute the fdt load address in dram */
     fdt_load_addr =3D riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
-                                   machine->ram_size, s->fdt);
+                                   machine->ram_size, machine->fdt);
     if (!riscv_is_32bit(&s->soc.u_cpus)) {
         start_addr_hi32 =3D (uint64_t)start_addr >> 32;
     }
=20
-    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
-    machine->fdt =3D s->fdt;
-
     /* reset vector */
     uint32_t reset_vec[12] =3D {
         s->msel,                       /* MSEL pin state */
--=20
2.39.0


