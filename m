Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFF45B006F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:28:51 +0200 (CEST)
Received: from localhost ([::1]:48420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrMX-00027Y-TK
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4m-0004tF-I3
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4k-0004Ud-Ow
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537982; x=1694073982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MA2LfVINk9IYuTZL9JRG9N/HLHW/PdzNjIJnCagRaDs=;
 b=L0HLGHchzs0m5hm0TYVrgVtm33B/vtY2GyueO/7tMw14c0/Kx0xJIy/W
 VrlJ7k50IuyYxHDa8JNQQBxkGNUQ56QNtemBxu+j9bp60ZA4RmZVV3IBg
 aw1IsEl7fY7Ct23YF6JYMFJxOjZ8l56BvrhYAPFnBoxL89BinIMFbHYVh
 yRP+mgXSfFRRTthwlT/IJrNyJ4akyAMtDRHJU0CBKtsGwamlR796Wq/+U
 suO1fYh5RiJFs+yG6BxO8pnrBC/TK630PMyGDkQ+iY4QY0ooW/2wPVk7I
 oQ7N5VlgeXr9uYLN/7lxfYndxnKypXNAD+AggDXltFDnDZJxNV1VtlBKD A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715093"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:11 +0800
IronPort-SDR: WL7CxmtzrMg8Lwc2pdBiS1Z49rcLDYDI3OQlOvFq6CDgCkK81AZ2svk06pGfhl7LZWxGbvQ7Sh
 3JzXqQmIz56aOoSKnscGo602Yrx53Ha+NVyTL4/dwY0C8XegWKY4Sy4NSKOgMuKOiknfvETfNO
 McZkRxehM0SduCL3T9/o4TIEwEZe3gaXWvClBcVtqMSHnOxS+VvcbGQvi/v1/W9GYzmeo/ThVM
 +Q5GDXB6ZqzDj9QnoJlb1+CWVnvHjgXt0doHjLwDFncW9a+c/mXzSBGIJ0uGzKYx+EnY5xSHLK
 Nod33iP6D3Y7jqc+9BaO8Ex+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:09 -0700
IronPort-SDR: ClevdwTE/jaYDqFHn8cDpD2VZONiAiYcNzJeOQOgtKFnOoShGBXrpUP1htKBVcOt3dmGjANGm8
 w2Wbudlsz3LLx/0ZN0dGET6H5++fTHn6Fzj1OvEHUznTO4ChJthqtBUgnPwoB7U37LfBSON0Mz
 1plS4/T6j/AEYkRLJPpHXsSG0Mw0BYS5zuxh9yjEjc1GkSj642B6bxelE6SQy2a/oDobRpTD4+
 0dOI++sfAtzcJZD1l6ana5wfzZxEkHpARujrx5yNooOJ7LHaVRXPMUCUrLFeXM1Vlfy3BWnmgC
 1Fw=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:11 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 31/44] hw/riscv: virt: fix uart node name
Date: Wed,  7 Sep 2022 10:03:40 +0200
Message-Id: <20220907080353.111926-32-alistair.francis@wdc.com>
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

"uart" is not a node name that complies with the dt-schema.
Change the node name to "serial" to ix warnings seen during
dt-validate on a dtbdump of the virt machine such as:
/stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
        From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml

Reported-by: Rob Herring <robh@kernel.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Message-id: 20220810184612.157317-2-mail@conchuod.ie
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c1e8e0fcaf..9d36133b74 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -918,7 +918,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name;
     MachineState *mc = MACHINE(s);
 
-    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
+    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-- 
2.37.2


