Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CF35AFFDA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:06:06 +0200 (CEST)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVr0X-0000h3-9u
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4s-0004tj-Eg
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:33 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4q-0004Ol-1I
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537987; x=1694073987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kvj0kBiwedWOTcCYKAPwBI4+j920wEbwGu194I7ybvU=;
 b=dqKrjkJEivzkg0fd9sk9GbVUERPyG+JjanuQvltOr+k22s3y9MJNH5m/
 xe5viIMwUQq2UbyvkLB7EaxRFntQZlN3ZBVi2N7YbJnzPQP2dZfyR/1Tl
 nHxqN5t7FXStihIvO3UFuRjfQVSwggqh7uVRYoDkEqv4yCXZ5HOmHLQqC
 N9AJnwBqP+wVCBzrpLg/DTF0ljM9GbDOF2hGkWAjD3wFUESMBe6P8gh5t
 r9qmrn4q5VsidfCXqL2XajcwbUO9tdu4QgXas2MsSmEdBMzoPWj6bVKz7
 IEsYE4rENxcFD9YDrv+Kc01uxJ3AmQji8Sbw4JtcvZ0tViZLsCa0kORC8 A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715104"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:14 +0800
IronPort-SDR: WsU1qtCfA303H0vnJ6NNbPGmsPaamoKyfFCuMMOpdQ6uUihFu5KswgeH/EYHS2Pqm1/H5W+Ow0
 CCh/h6++RrAFxZS6fe3nRI2kl63ddmM2tNeSXMiWDgBudjlAIX1/eiSPfzzCCGltC4RiOQ+8t4
 TGeeEW1oh8B0dWioETVGZp3c+1JcfNuaObpyf2LT59l/evxnvcPKCvflCOvebvlFZIrg8cK1Q5
 2nv4G5DgYgol1UwAt5WK50/B1XrKj08+TXSEHKOZ0fAcxHoINRlccIMUxw34dD7RKetndlXClG
 gZz40bam47eIdT/Zs/8sqvkS
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:13 -0700
IronPort-SDR: XoB2DkVEZikcWnfz/yW0IVxUdyDVwO0cEPPUHqbOEyHinf+JZpE+OnApl2jMQCTABRQocfxn7y
 lc6OlcyNyT7+dAfQMSgFW5Mgk38NM/s0l0gdOTtRfntyA99a3ZA8BsGoYwoRm0OG0egOwWEqKe
 qiDqR46vxX6SsWyR4eKp5PTzw3KYqdB+vt8yH/CLIXuxR5O4ofb3HFuU9UBVnWMoOkZ/6ZOnX2
 ebYj9K4cPENo3ccrP7UvdxQSN9zzmHd/trM9Of/LIkrIQYMUlPMyV/Sba+2QODCcmYad9/QoUN
 MD4=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:15 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh@kernel.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 33/44] hw/riscv: virt: fix syscon subnode paths
Date: Wed,  7 Sep 2022 10:03:42 +0200
Message-Id: <20220907080353.111926-34-alistair.francis@wdc.com>
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

The reset and poweroff features of the syscon were originally added to
top level, which is a valid path for a syscon subnode. Subsequently a
reorganisation was carried out while implementing NUMA in which the
subnodes were moved into the /soc node. As /soc is a "simple-bus", this
path is invalid, and so dt-validate produces the following warnings:

/stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
/stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

Move the syscon subnodes back to the top level and silence the warnings.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220810184612.157317-4-mail@conchuod.ie
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index f19758e1df..686341a0e2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -897,7 +897,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
 
-    name = g_strdup_printf("/soc/reboot");
+    name = g_strdup_printf("/reboot");
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
@@ -905,7 +905,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
 
-    name = g_strdup_printf("/soc/poweroff");
+    name = g_strdup_printf("/poweroff");
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-- 
2.37.2


