Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEAB39EAC2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:35:30 +0200 (CEST)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPiL-0000GR-Ax
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdS-0000Gj-6R
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:26 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdQ-0004Fk-5E
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112222; x=1654648222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RreVgW0TwsYnHpKkFHDGAsuxA+rYze7M9JgF6cjSdPc=;
 b=mSe5xW1zMH2Lbv8pStDdYpQqvZG0Yf+VLZXEpYk+S9t11HDrHa0msX57
 m413sgRGfSlFmiXyZvYDDaMY+F0A7gbDllpxTjytjl+r3mjLLnt4ik0LX
 cR0/cRru0X8yQf+/e9b6eEwhMzPoWohUaLDmeWtdTlEd731/w+/IDT9ll
 Zj97R5oEBzVyFknrirGSmm4HIomMcpV1eXWy2Ut13Q/s/vRxmk2wb6PkM
 VEppsS7MDsjRv+o7V7aEULzevGOEuUzsyuZIPaVWKYmEW8HpnVfBGabUg
 cV0w6xkjPkiXgGdN8btMVuvO4A63a9t48YRSVpq6KkIslYZxZwrOA8djo A==;
IronPort-SDR: IjeZcuNjBnQGcProEhYwu61kXHoytAJUnjCaCRyBvTSSmcCOEWiLAREwYwTdqg6k2xAWbWi6Fk
 LkxVwuLY+QPDN0XjyzYcCJW+fnrzYYbEPWkaqQFxhTcD8Q/JrZCVBg5EmcYm0S44q+CODRm5Ve
 wlmHVRkgy1UQDDWO9ixdaMo9kte62hWQfia3WBYQaRzEJcNv+KOLPp9aDqApFrPXl0BsTkW/GX
 bjz394UQSwewtemDUdDk2SDZXr2rejE3fvfYckyLL7ZH5CTBWeugoq32V22ncdcvsiCDeviAri
 nZI=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087348"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:21 +0800
IronPort-SDR: ucltHIMc7cRpsu6WtJerWeADkSKKeSAp9flKf0EWUWehXzEKyXizZP0BVlgrvnoD/tLb9X45y/
 qqoHgZHcotLSqbnQ/hbFhWsVoMQXNkE8gTy/KlRqR2/Pe/Zdcb2sqY3/rqf5upEppNkzOm3PiU
 VfnVPQxTKYuObQj7Lz+kGx+IOEJ9jDvBUk4SsK31t/MMfZnJ6U0eiailecgD9SYSkrzlt2UHKc
 l+zlCKpJJbBFDMejjpeSF3g+nM2/rq/7XMK9/dMxx18EQP10tIRQJaP6/6LecawXZDY7HR6ENA
 MP5lVyWV/eeDxHvdlkv/p4/j
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:29 -0700
IronPort-SDR: KaAtt9xKgzBFzbcvdNkdExNXNx6pZPSAC8HNz1Wu2kOAyinxCcCf2HzzcEAMfjg2MAe8GRNYYz
 FUutIJLkuClkwIvs604tVDTwln8t1lzXjsm5goJvu3U9+m/fC447WqD+LcM7CCqCWySkvXHnZe
 /V/RydyNVW+f4+ohLgmdy4b9PO2EVkkboeczphSd9I8pjzgqNQzaxygr12/n8qC/wEtreiddnj
 GeFIab7tKzUBd2vRaKAtVO4b7Np8jdfOzpMGFsSU9V7d49COg8Bu91OoLx8KLDLhwFE9sLl0N0
 f+k=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:20 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 04/32] hw/riscv: Support the official PLIC DT bindings
Date: Tue,  8 Jun 2021 10:29:19 +1000
Message-Id: <20210608002947.1649775-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The official DT bindings of PLIC uses "sifive,plic-1.0.0" as the
compatible string in the upstream Linux kernel. "riscv,plic0" is
now legacy and has to be kept for backward compatibility of legacy
systems.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210430071302.1489082-4-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 6 +++++-
 hw/riscv/virt.c     | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d3828dc880..a32a95d58f 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -101,6 +101,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     static const char * const clint_compat[2] = {
         "sifive,clint0", "riscv,clint0"
     };
+    static const char * const plic_compat[2] = {
+        "sifive,plic-1.0.0", "riscv,plic0"
+    };
 
     if (ms->dtb) {
         fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
@@ -270,7 +273,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         (long)memmap[SIFIVE_U_DEV_PLIC].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv,plic0");
+    qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
+        (char **)&plic_compat, ARRAY_SIZE(plic_compat));
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
         cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5159e7e020..560216d217 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -197,6 +197,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     static const char * const clint_compat[2] = {
         "sifive,clint0", "riscv,clint0"
     };
+    static const char * const plic_compat[2] = {
+        "sifive,plic-1.0.0", "riscv,plic0"
+    };
 
     if (mc->dtb) {
         fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
@@ -319,7 +322,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             "#address-cells", FDT_PLIC_ADDR_CELLS);
         qemu_fdt_setprop_cell(fdt, plic_name,
             "#interrupt-cells", FDT_PLIC_INT_CELLS);
-        qemu_fdt_setprop_string(fdt, plic_name, "compatible", "riscv,plic0");
+        qemu_fdt_setprop_string_array(fdt, plic_name, "compatible",
+            (char **)&plic_compat, ARRAY_SIZE(plic_compat));
         qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
             plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-- 
2.31.1


