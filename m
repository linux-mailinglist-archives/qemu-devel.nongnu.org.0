Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7B150AD00
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:57:42 +0200 (CEST)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhcD-0005Eh-SF
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhKN-0000sT-C4
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:39:15 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhKL-0005V8-HD
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587953; x=1682123953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsRVPpzc9qGQj9ZSOUzc3fWN20bwbvrPR37zlV2IJ5Y=;
 b=DXTtKgga+1IlczbYbK8EnQpzu23WnsFUwXPW7iBlvDHOAF5QLVtWU45P
 NEoh+E+pt/D4VIUALkA+lxAjV75IbXFqWeeoc++3tDJT6H3Agv3xsLCI2
 zyVmFfAWNdt8mVbzReGC9mqk36GLgRGouh4ionA0q4ns2hu1ORIct/5g4
 /PZ+1BpdnXAelb+PH6eqMH+vgWpzE62dBxUnGF+OTaGhhdv/7Uss9cSWa
 Kr4Ud6/Vj2SwAJqN9ki0S+wsHrqTmPDPV/bjFR9br0oQuncKu1TvBtH6T
 N2ic0uSU8FtL/i4xPn3bTwiy4Aghh98ogZ/6+1zRwxJUAUeNL33s6kjkE A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483466"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:49 +0800
IronPort-SDR: 0D+TvYfA0IiVfWyoKrVxzygmgI4KOT+IJON/+DFJh8cr++H+BJqNI6clD2B1di/WL1KZRC7V2d
 q5vVaJcILU0lx02ayXpBHsGTfQt3fpTyqGGKR0LwEpHET3Ipytyjyy43X9t05UF6z59O1qrJ5M
 id8+c2bUaN8uOlc0IKvYvrW4bYycz4xu60XQXG4oW9ibuR+ib5LKZCVvMZdhWfO5MMLkpCFDBb
 9d3w48WzqqS4ueDPoqWCybbDtluQM3cwmZvDuXk51CZ0euJ3msIhZxYF6zI86LMdUtrxFkO74Z
 jNK+XQJz/1P/3R8rHa449T0s
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:09:06 -0700
IronPort-SDR: X7OCs13NvsibvqeCwjxPhYHppcIo1+pjaYtIRS8EZNJJh4asucLiiiXfDlXLKUCAs/8IJxjJPR
 kYnvXgXHMDs8dTSHAo0H9lDJfNI8HJdGe8NJB5a5hhsmsFDZUd0Yj/Pf+z6sNCitvSheEMl2Qb
 UcHGvmes4fbK+AodyXvbi/IkAcUxgCt2w+61l+RhXi+1FTaKoKfQz06btufxDvxPOqyz1XMODo
 kZPbXRX2tJrRXLyEVRRnWEiraLf10P13m7cMvvq105SBwu2yMm5kdxBpSF6a5A9wZV100kon5C
 qdc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwWY1Clvz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587928; x=1653179929; bh=XsRVPpzc9qGQj9ZSOU
 zc3fWN20bwbvrPR37zlV2IJ5Y=; b=mow94bpjk3lJ9F0BIxFvd57/LBRILT45BO
 Ko6K1/Y5a68OQQBkNfQPDPXxKG8Ymp2FfX76W1T3RfGAi6NlfqZsQMw2sXTsMigu
 6mxovEOTeie+n3Gdg6476W+d8sgnbzKC88OLigxXo6Gdg+5Gn2DrNfp3q8OnLLdX
 NDoH4RvY2JooVJVrvftybhjXpafQekXcZaQIBGtAlhrUyURSrHGO2oNV20b962RH
 qSD4xdczRgt2l6SFH+rZK3KUgVPhnfwQwoFryqDmWJXJVZ+4+x4p0vtc/SS69jDS
 3+X1VdxUabvj0Cr9uqlbSd6s5eAecGmhLSggORSw8sNQ5re95H2w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id S2XG6c5OkOUX for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:48 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwWV3TRjz1Rvlx;
 Thu, 21 Apr 2022 17:38:46 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Dylan Jhong <dylan@andestech.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 31/31] hw/riscv: boot: Support 64bit fdt address.
Date: Fri, 22 Apr 2022 10:36:56 +1000
Message-Id: <20220422003656.1648121-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Dylan Jhong <dylan@andestech.com>

The current riscv_load_fdt() forces fdt_load_addr to be placed at a dram =
address within 3GB,
but not all platforms have dram_base within 3GB.

This patch adds an exception for dram base not within 3GB,
which will place fdt at dram_end align 16MB.

riscv_setup_rom_reset_vec() also needs to be modified

Signed-off-by: Dylan Jhong <dylan@andestech.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220419115945.37945-1-dylan@andestech.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h |  4 ++--
 hw/riscv/boot.c         | 12 +++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index d937c5c224..d2db29721a 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -46,12 +46,12 @@ target_ulong riscv_load_kernel(const char *kernel_fil=
ename,
                                symbol_fn_t sym_cb);
 hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
                          uint64_t kernel_entry, hwaddr *start);
-uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
+uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt=
);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayStat=
e *harts,
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint32_t fdt_load_addr, void *fdt);
+                               uint64_t fdt_load_addr, void *fdt);
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base=
,
                                   hwaddr rom_size,
                                   uint32_t reset_vec_size,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 0f179d3601..57a41df8e9 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -212,9 +212,9 @@ hwaddr riscv_load_initrd(const char *filename, uint64=
_t mem_size,
     return *start + size;
 }
=20
-uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
+uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
-    uint32_t temp, fdt_addr;
+    uint64_t temp, fdt_addr;
     hwaddr dram_end =3D dram_base + mem_size;
     int ret, fdtsize =3D fdt_totalsize(fdt);
=20
@@ -229,7 +229,7 @@ uint32_t riscv_load_fdt(hwaddr dram_base, uint64_t me=
m_size, void *fdt)
      * Thus, put it at an 16MB aligned address that less than fdt size f=
rom the
      * end of dram or 3GB whichever is lesser.
      */
-    temp =3D MIN(dram_end, 3072 * MiB);
+    temp =3D (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram=
_end;
     fdt_addr =3D QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
=20
     ret =3D fdt_pack(fdt);
@@ -285,13 +285,15 @@ void riscv_setup_rom_reset_vec(MachineState *machin=
e, RISCVHartArrayState *harts
                                hwaddr start_addr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint32_t fdt_load_addr, void *fdt)
+                               uint64_t fdt_load_addr, void *fdt)
 {
     int i;
     uint32_t start_addr_hi32 =3D 0x00000000;
+    uint32_t fdt_load_addr_hi32 =3D 0x00000000;
=20
     if (!riscv_is_32bit(harts)) {
         start_addr_hi32 =3D start_addr >> 32;
+        fdt_load_addr_hi32 =3D fdt_load_addr >> 32;
     }
     /* reset vector */
     uint32_t reset_vec[10] =3D {
@@ -304,7 +306,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine,=
 RISCVHartArrayState *harts
         start_addr,                  /* start: .dword */
         start_addr_hi32,
         fdt_load_addr,               /* fdt_laddr: .dword */
-        0x00000000,
+        fdt_load_addr_hi32,
                                      /* fw_dyn: */
     };
     if (riscv_is_32bit(harts)) {
--=20
2.35.1


