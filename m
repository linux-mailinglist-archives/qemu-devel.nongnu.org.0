Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A05098BB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:20:27 +0200 (CEST)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhR74-0004fV-FL
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQT0-0006Ve-LS
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:39:06 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSw-0007xw-PI
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523138; x=1682059138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsRVPpzc9qGQj9ZSOUzc3fWN20bwbvrPR37zlV2IJ5Y=;
 b=X1Cr2cP7DaQUL6V4ig3iPYjC+AVaWoIhMLF+irwergKR8CZkR4Hs2nJC
 RQ0b3FGe0dfHOEe/esvBETIjIcPNGcyT0z6983Yk1xBIhAJt/wYPos6n9
 9bs8zd+9scYWP5FWBoxq4VswWVQWoiEj7jVwH1a55Zhvs5LF0bFOlCC1p
 mBCeKVslm0nxDJlR8UTVh0sYXHGom9sTHv8OsYSGnY416QCSAHgiMjz66
 CC96emMSXYzbo1zrVAkoOoSSUdccNoDU0UCvkEAak3BRX0kxlQKn4o/wI
 om4UQNMLUj4BlwywQdfPDSC0tGWGFQw63DQL1luoYiS81V6FFgC5rK8rh w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640050"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:38:22 +0800
IronPort-SDR: uyo4q2v7WSQwsYd36Tk0hbPUQ94kjGdSApz9JJEZcuLD10yKlSGQiu3P6sxGoQ5ZkzlRCyV/3z
 eCpotBUUgN002iUSejQl85oIQa9mEN+11YNDPVwBO3E88fVUse5vx9M+ZUSDiZN9lmgxf/MwnK
 oGpEF5IMDqE2xCGJzGDFLfI95vCtzahBPoYuCdmdU6GX8A7ppSJcqfogcnoIZwXe6yzJKe+ZTy
 9CbkRDQzSMjkC3xZltGFsp2/SHzEkw3u5wfCHh7ZfkYGgCUegjJv/A7CWrzRmh51e6IPJfeezg
 aQb/P6k7n7MXHqomR0nY5X9o
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:09:24 -0700
IronPort-SDR: UOs6jC/qj1M4xZ3R3pvQVXUF/VDyYRYijD41JJ29zi12Bgo3gey31WWbaqgS21Dd02nAEEVaNx
 7PPSsNVTjH8ivFk02nrXkCoQ1CMsX5dXeU/Q/qRWs5ADkBdFOL0YhReAPKM07hxVYaSd3sUCdH
 AWpdCQmXMTtTwo8EDH264ad+Wg4ykj6IqGh1+nU5jDsr0NoedqxZSzUVqFh61iReTTaXoJID1N
 b5CifNNi2mVMNXT1vu/++A0YANzqZnky3gEfR6jxYUBYzDISZ/tUugd73DZNBH8mB4FXBTJgPK
 m34=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:38:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXs4hjYz1SVp0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:38:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523101; x=1653115102; bh=XsRVPpzc9qGQj9ZSOU
 zc3fWN20bwbvrPR37zlV2IJ5Y=; b=NvZTajpsNKo2y/CT/OZaFdjHoqz1r/a2Xs
 rMzJdYgBJFPgJ/O/iD17XJ9M7gz9JyW7irhuLcSZWv+gkIgvNURue5d/URQiDNci
 3pUm8IfWbH/QljHBttbqZC3Az7pu08xjRkqhZYQVjo5K077Pz/r+fnKeG02v56a4
 u8412AbKQSk3WYpWsHE19Rc/vCo03hWKGhJn8/y/326YLwaPnx509SB5XdBpJJkl
 1TIzGlTyfRNdi1sgRFZh8qEuDg825UOrYo+fUmyIFWFIVlQdgeiZc5RSf++I3ts4
 x0OTG83lITzlbPkWWl+1uTjV4wQJ2/rtnJuZ8E68V+3YXQ0Pv+IQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id e4fL1wSjwABt for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:38:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXq0Z9Qz1Rvlx;
 Wed, 20 Apr 2022 23:38:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Dylan Jhong <dylan@andestech.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 31/31] hw/riscv: boot: Support 64bit fdt address.
Date: Thu, 21 Apr 2022 16:36:30 +1000
Message-Id: <20220421063630.1033608-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


