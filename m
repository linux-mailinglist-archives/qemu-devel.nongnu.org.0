Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4334514177
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:37:50 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIO5-0005zn-Nm
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIB-0005uf-HI
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:43 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkII9-0002SM-MB
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206700; x=1682742700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kNAbBdAYEKrwjI0f5ZC2O+BikUvArLNvQ/hHGvoxLgM=;
 b=LhB1f77NY5j57ZwNlSFgpCZalY9KBiTIqjgDoLy9KtWuBx2ccWFsBxiM
 EjtmW7G05D3cFcuRqGFmcsQNChWwothl0ilNba4FKbE0USjhdJYaEUGYB
 ZkGV49mxQdum3aJmBwjux+/6O9yEgeCrRwMIWwsUUK01ZQHeJXLWxvUcx
 c3GhRwTSnGEIFeEcAcOIqCY5nGkQS/UDIFKg0wqWQxs4lMDqnLhUobQ8H
 /3OJnxul8q2yx+ajiOEnTbQyR4gDfCISlnGLEzi7sqH63C+uodZi9L9ju
 1PzW3+3NIKIwwW9UseKG5D0vjuagRvczOk0oMcPSby9GbZBJ79OkCOdaJ A==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995895"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:31:38 +0800
IronPort-SDR: RshsxfR9p6AvE9+zVzMmA4gmcJChT2XD/qAWMUKWS7dKyFCThGViaiJ06nHtJnId6eh2IfoBsN
 37Afbh61wneGueSBczE1sAMPe0cMZRx4AJpTvpeEkvYPvLbtaFDVy57UdsAZXoV/1htEv9mkFV
 FbwGBxU4Njh3dAlswDZM/n2aBGGC1CJXTm+gohCm1kIBVkPVceP9pnVmRxm4ui1lO7ogVsuKmO
 PEa6VkHXxNwdeQDBGV5LhPwcYVflbxBZW+hTku/+DI8IZoZ/wS2KuSET4CCExd+0qYmlcIL2i2
 u4UdgWbt/nK4hytceBsZrIDk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:01:48 -0700
IronPort-SDR: hW4nNDN9f6Bdc6bwOJHaQA6juxuMukesZR89TpyBY0SnxApzB9zZFsv1IyPFJW/+CPZ7DIqGlq
 YfuRAuvqkmM/oRYRrJyU7ZDBjBNVzQrz+/jSCMyk6fOs9D2PFCK7A2MYiJMTQXESLgEV+edGSN
 q38PjdUSj6HKcnkn8chT8X9wrbmPH5aGLtm284V8V4cNcoyW9MQb49fWaZyzDACGCcjIz7fCk3
 r0qOMPzR91DWWGsGV+Zc6WrbnfblEvR1Y1mVqgG/+MYYeImo2iorPf0yHZ+DiodEeGItdsChrw
 LkM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:31:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKM00QJ4z1SVnx
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:31:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206699; x=1653798700; bh=kNAbBdAYEKrwjI0f5Z
 C2O+BikUvArLNvQ/hHGvoxLgM=; b=U7+BzHiKbASbNtfC7RXWHDN3CY96FQEa6p
 acXnGlzJ0rgh3I1msAqTLURrgpQkgx8GFA9Le1uqhQbbv/u7a4nyUk8Z/OnqtN2R
 qsodTowAj9+tuQi2VxD5vHEC7hGYGL1GvqABsKiPDyKEBkycMOxViLNqAIxiZEqz
 nrIa6fZNVJU+faf1jb0bny0u+5jDDZh+XomAdVXKbBCkRE2nbgX2RlK34TmTh28C
 cOVNLhGjTRRndalKZMmpx1CKI6Wi6uVzX27na7ovUExTFEpM17dPd6mRk/yGzspQ
 LZGz5BwZemL15FfLQPlGRT9YGWhLvVewfpefDhKZL+Mfku3noPpw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KNHXTuYGVqeG for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:31:39 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKLx5lLPz1Rvlc;
 Thu, 28 Apr 2022 21:31:37 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/25] hw/riscv: Don't add empty bootargs to device tree
Date: Fri, 29 Apr 2022 14:30:56 +1000
Message-Id: <20220429043119.1478881-3-alistair.francis@opensource.wdc.com>
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

From: Bin Meng <bin.meng@windriver.com>

Commit 7c28f4da20e5 ("RISC-V: Don't add NULL bootargs to device-tree")
tried to avoid adding *NULL* bootargs to device tree, but unfortunately
the changes were entirely useless, due to MachineState::kernel_cmdline
can't be NULL at all as the default value is given as an empty string.
(see hw/core/machine.c::machine_initfn()).

Note the wording of *NULL* bootargs is wrong. It can't be NULL otherwise
a segfault had already been observed by dereferencing the NULL pointer.
It should be worded as *empty" bootargs.

Fixes: 7c28f4da20e5 ("RISC-V: Don't add NULL bootargs to device-tree")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421055629.1177285-2-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/sifive_u.c        | 2 +-
 hw/riscv/spike.c           | 2 +-
 hw/riscv/virt.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index cafd1fc9ae..10a5d0e501 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -571,7 +571,7 @@ static void microchip_icicle_kit_machine_init(Machine=
State *machine)
                                   "linux,initrd-end", end);
         }
=20
-        if (machine->kernel_cmdline) {
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
             qemu_fdt_setprop_string(machine->fdt, "/chosen",
                                     "bootargs", machine->kernel_cmdline)=
;
         }
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 7fbc7dea42..cc8c7637cb 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -511,7 +511,7 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
     g_free(nodename);
=20
 update_bootargs:
-    if (cmdline) {
+    if (cmdline && *cmdline) {
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1562b000bb..068ba3493e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -177,7 +177,7 @@ static void create_fdt(SpikeState *s, const MemMapEnt=
ry *memmap,
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
=20
-    if (cmdline) {
+    if (cmdline && *cmdline) {
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 }
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b49c5361bd..643fee23f7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1004,7 +1004,7 @@ static void create_fdt(RISCVVirtState *s, const Mem=
MapEntry *memmap,
     create_fdt_flash(s, memmap);
=20
 update_bootargs:
-    if (cmdline) {
+    if (cmdline && *cmdline) {
         qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline)=
;
     }
 }
--=20
2.35.1


