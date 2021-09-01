Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563583FD122
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:17:40 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFop-0004Z1-Bk
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFht-0004pQ-En
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:29 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:3841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFhr-0007dn-Ow
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462226; x=1661998226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gre89S+a81XQEJ08b8fsC/oOWYrA8yqgQv2vZI/fekM=;
 b=IhwP7g/yu7ggNYd9F+pDbEHPGqAlLiLTm0qHVtn8wCVc+tdcBbl9RoJl
 d2fX1kgCgS6AcT1La0Ak+UcnGeIdFsk3WolbjdwlA5Yu8YlK9VuGdJpAu
 gTgJUvNDeJbTbu57qt177yOBI38oArxNrero7ZdLhqjNNOHbFipTEHs0Y
 qOpESodqMVaQSSP/3N3L8/zH5F9qYkLfXgW648NnnG9y7GeQi9+6+jtjG
 uPbVtYbRi/3DqbINkP2RqZxj43dYBF5tPA8OyQU+4s4lJf5yFMMR0Lm++
 b/F2dIvnb4AIl7+yAzHia2+t3qzzJRlCkqkKDboh+NiJaKa/HYND/LTM6 w==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178910715"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:22 +0800
IronPort-SDR: NBjdJr1OM75lHsONPsnYpZCDsNimLMD4/KZRZtpIFsU4qy1CwsgSve+MOZ/TO7g5iGgjIVakKS
 L8lRnxEPh9aU77Jt9bbUsp0Ff5mvUyFrbY/vNER/uS61nUViJIBjgS1TsJo27cPy7GwHMD4Mza
 X8oDk6xmt/XCzI05kuYByEpZqFVsXf1Z3qLXZ/mrGHdjhV8GP6BqBGM9UwUMxHFe13C4UNcPRw
 6qjxL6imNUDgFq/Dw0A4iz1+wbzCLsKWJiyRgmQ2yHGmFEoiLEVit97b7bf4ew4r/d4T86LhIQ
 wndO4nzA/3ASvteg2vK/SNYC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:11 -0700
IronPort-SDR: JAXasRyLt08f6pOigIuZ9h2MGs8V3PVcc5cZmHUAQrbJdo9rGGxlPCrbwCd9TcS5FImaZilqBk
 i2wx/AV1ZOIfamhjJkYAsUcw8uBEtZzF4mRb6pdCXOouCHfgn6Lp0mkSDE0/Hexr1I/DHRnW6B
 i1BCJHhtqb+OgPohSTiHJDf3b/PUOeK2/KNghyymzfSgeUU+y84d8u2iUHBYNgZXRgaL12PJBk
 DJM10WQbdeUYtJyQNxK99O0rdVsyfOa0+pmmcDe0mqyd3ztpeOVXfMnkJj8DEdPEWjjqLW97p2
 GEg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GznZk2mHsz1RvmF
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630462221; x=1633054222; bh=gre89S+
 a81XQEJ08b8fsC/oOWYrA8yqgQv2vZI/fekM=; b=bBsAEo71IOCnbVj3vN1XP5s
 HpCl7z31X+6p7OlpbU3BKnGyYympi6lsYehoV52lw638CCrPg1Dz1EfWYMcWpD4h
 TYNj+iS8ysdexavUl2bl6qdZxPj1ZV/IfDLmlOop0kyztihdmS7dZnScF1r6v7GV
 snCTJsSt7GThrWFglL/5WSeJOROovqL7Gs2AufGrEcMZEJot1tstwLD08R1++JAu
 8mtB6MgvkpIK68nISDdCwVZoT1JlvTs49e3uUUoVxXrZlSpUc8bi9qiUi0vqwA/i
 Y1XQns6HSt7vulADg9eV5cieCmNZkE0gZeRcsKKvk20ghfVW5+gHmPSICudCsHQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id p_WCWRwG4awz for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:21 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznZd68Bbz1Rvl9;
 Tue, 31 Aug 2021 19:10:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/33] hw/riscv: virt: Move flash node to root
Date: Wed,  1 Sep 2021 12:09:27 +1000
Message-Id: <20210901020958.458454-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

The flash is not inside the SoC, so it's inappropriate to put it
under the /soc node. Move it to root instead.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210807035641.22449-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0e55411045..aa279c1bb6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -454,7 +454,7 @@ static void create_fdt(RISCVVirtState *s, const MemMa=
pEntry *memmap,
     qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
     g_free(name);
=20
-    name =3D g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
+    name =3D g_strdup_printf("/flash@%" PRIx64, flashbase);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
--=20
2.31.1


