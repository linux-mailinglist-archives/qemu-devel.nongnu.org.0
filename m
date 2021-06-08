Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5639EAB9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:32:43 +0200 (CEST)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPfd-0002wG-KH
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdL-0000AW-53
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:19 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPdI-0004Cd-CG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112214; x=1654648214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TbbGhddR3mfCqe87e4buPgKpdgIxwYMuWTSafOwiEJc=;
 b=Orq3p31mMmrVHkGNpUFenudxRZu8FbSQrfUVPqzaR956EiSkGhaejdoG
 9D2Tp3YEwGQx3QpKfK28htifA/f5ACihboDcKhG4eHackAfqjQ3oombNa
 C2AOePxQB5BACDMEx2KUnH9exDVyPDd3380SMjECekhOIb9USTz9iEYs7
 yv0BFg90KVmtDCYXFffTTwaWMWcW3x56SRFSV85dGAC0jl3Y6h0aOS+8A
 jZxkd5qXiPniqVgM9zGTs3fOPoqy855wZYXEPBO9ZchJOwqXG8qIu5kj9
 HhkWmVzic2jjjJ+eJVvvHW1RXBRWO6f11EseRNwnmqqdXW312G0uOE4fk g==;
IronPort-SDR: lqxEMZadK59WKux+D1WrZx/yhXG0xghsFtseTknyAmOKJl6EulRyVzJDY6+WamytpPDXeDURp0
 ShRtILcOpW0XsdP5VnyZ1ANNZCiJkrSeB/iXxZK2tAbqhZYjc8h0qJ3MhblLAQ4rdDXbH/QMz3
 3ku/k1T/DJqsh7A+KkY+VD2DPBmDO763lk6xHDxOCyr9Y53IepdwDo55mi6Jz1tZVg1PLpxj6z
 gROfWKLfz7ljMrLKnt3dVvdQVFaf2jgKa8ph+ejTh9V5fV8k3+4i+GD85tnc5jjrdD8a8+qqdm
 +34=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087330"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:30:12 +0800
IronPort-SDR: //Pe9QlUXyxt/CXX3xNBfrVH6uujXGxqoGePxV2B9+8Lw0eudjJFsgYhUuN1yVGBbpxa28xegH
 82xFNWqOkpCdsIaVuTzQ8eUe/ptHco35AjOgaKqpags+lfI1VmKF5utoGR6EWjEHoNgaWW62eg
 oysHuPKjVZE3BrmCuSezAH61f638O9tXd+P6xAJ5zRvzZQnX9KbrghTchbSgkV1l/AAz2vyS1D
 /j2Ew+83Andy4dQJwQ3I4O7+QuxQWea1LiXUv1aREq2ukAYRj5Uz01+zAvDBPMzF1D12NJc0GN
 8FlGerldkqW0fwSA1KIN4GZH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:09:20 -0700
IronPort-SDR: +X+wvx6HAOHhDWk4byyRyZDxO5x0P3WXlYvobAfXApf/sXL/+xThsoCyJcMMAkWzqcEdpCw9dT
 vwsSCq1koAgGnDyOpfbIAnRdNHrO4ltBnqKX02qQ0bGn3AcuzzXnsY8Py/EpXMdh634V9TTCFk
 t299r8iujSZz+ChxKX1HHjA+3WJLQXOnmGQem4PJx+0wEldjsHmKTJomNEsgOhmSq47bmVZxEW
 oLOHK5Ko0tP5/AXLXaVQJcuS9FUUv1flJ+yyGUA9j9i/R3PeFnJhZT+fko9711Yd3tDoE0naaN
 qvk=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:30:11 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 01/32] hw/riscv: sifive_u: Switch to use
 qemu_fdt_setprop_string_array() helper
Date: Tue,  8 Jun 2021 10:29:16 +1000
Message-Id: <20210608002947.1649775-2-alistair.francis@wdc.com>
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

Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
we can use the new helper to set the clock name for the ethernet
controller node.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210430071302.1489082-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 698637e8e1..89cccd7fd5 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -95,9 +95,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    char ethclk_names[] = "pclk\0hclk";
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
     uint32_t hfclk_phandle, rtcclk_phandle, phy_phandle;
+    static const char * const ethclk_names[2] = { "pclk", "hclk" };
 
     if (ms->dtb) {
         fdt = s->fdt = load_device_tree(ms->dtb, &s->fdt_size);
@@ -412,8 +412,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
-    qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
-        sizeof(ethclk_names));
+    qemu_fdt_setprop_string_array(fdt, nodename, "clock-names",
+        (char **)&ethclk_names, ARRAY_SIZE(ethclk_names));
     qemu_fdt_setprop(fdt, nodename, "local-mac-address",
         s->soc.gem.conf.macaddr.a, ETH_ALEN);
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
-- 
2.31.1


