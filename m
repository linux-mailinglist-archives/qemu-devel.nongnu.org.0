Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CA5AFF15
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:35:48 +0200 (CEST)
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqXE-0006Xp-1q
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4p-0004tL-Sd
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4o-0004UV-0I
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537985; x=1694073985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W2OXsaXRwFwaKoi0Zy/FqKkPnlxS7Iy2LGZA5zBtT3A=;
 b=FrfNryj29wogvLMX5CkuQdmGDSXTIBnvdENIMWbwX2iD2CzmfQoSZBj0
 pD1GQt0xn/LXj2Qo9Yg0Y9jZFhU0CEMj13UnXbje02gNq4WL1FRuYjXn7
 /iLgEmHkReep4HExF5dG2DWZM3ZvsHEyl4BBIvPpSL0q43Zebe6KW5qrR
 NE7BzjlmE346ieG16ts6O6ILL0X2zSXCMTx64zVSpPG1bswtlVePL9fLZ
 PXDmrgMDtdSdNgAkWijqQHw881976Gm84S6QAQYFPSwbXopZRc5PuciU/
 4c/HCqGUVGraGTkIq4zDcwgM1dOlv+6NjG28BjkNuMJcyt8JIb3jJ1a4/ g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715100"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:12 +0800
IronPort-SDR: p6q0mB+LqEWsAJVIXm+tLyYckORYo7k6iWE0uYD+F7oDDQAKyvDXIStEiovZfzwGaQOoYWm2xv
 JMzBbxpo1Iah1/cNyPtwvuTx1z5Uio++nXyFA0cJnAzhHcUPtcDcvjo7aMuCgrWKbBqTCixmH6
 VxYVNbcdxqJNdfSHO359xb9/E0NAchRqeXBZGj9Kvi7d0GxaX+TMPO/UbBnTzUt33UW8HW/Kk0
 6NWDezOcCDhwnXz7w1rZaiNsS6gMknGKKe6OKm/IXWGz2dnSzWeQgdLbk4R2Myn/Gmg96NOjyw
 P6tkzOXDLiGpc/7dle7ZBnMa
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:11 -0700
IronPort-SDR: ZfFDRtysyXaSNG9d1zye7GXYODlWOWOgqjZdF3bXkvlWnikEmqSmf7ns0UWRFeuRZxTUahUgIy
 E8WKeUkrFd6pRK0ok6FEh2VA1ywPpfQvodNhEx0EfV50w5TULG6mjK2kJiQasA/e9/tG8cUafV
 Jr48nkwHvyNsAHeSzg+WyR9u13E2xHtCkdCKKSsKmxxM12wa/GnvJed3rot+jCEJ8q5x56YoC7
 HSvEr0eFdfXNx2xehfHNCtysbwGtYclyz25B1yHX9olLcDYqbVixeTwPMazFPOP/8lMB5fTQiW
 mD0=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:13 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/44] hw/riscv: virt: fix the plic's address cells
Date: Wed,  7 Sep 2022 10:03:41 +0200
Message-Id: <20220907080353.111926-33-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Conor Dooley <conor.dooley@microchip.com>

When optional AIA PLIC support was added the to the virt machine, the
address cells property was removed leading the issues with dt-validate
on a dump from the virt machine:
/stuff/qemu/qemu.dtb: plic@c000000: '#address-cells' is a required property
        From schema: /stuff/linux/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
Add back the property to suppress the warning.

Reported-by: Rob Herring <robh@kernel.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Message-id: 20220810184612.157317-3-mail@conchuod.ie
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: e6faee6585 ("hw/riscv: virt: Add optional AIA APLIC support to virt machine")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h | 1 +
 hw/riscv/virt.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 984e55c77f..be4ab8fe7f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -111,6 +111,7 @@ enum {
 
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
+#define FDT_PLIC_ADDR_CELLS   0
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
 #define FDT_IMSIC_INT_CELLS   0
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 9d36133b74..f19758e1df 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -466,6 +466,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     qemu_fdt_add_subnode(mc->fdt, plic_name);
     qemu_fdt_setprop_cell(mc->fdt, plic_name,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#address-cells", FDT_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
                                   (char **)&plic_compat,
                                   ARRAY_SIZE(plic_compat));
-- 
2.37.2


