Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D63565FA48
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:30:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdEV-0003Nu-Hb; Thu, 05 Jan 2023 22:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDV-0002qd-BS
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:26 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDQ-00088M-JK
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974980; x=1704510980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VjlyiFGHjcei8+QKMbhE17ewOiIIFRcNPQRqq+Ddv4g=;
 b=TiB4zMNQcg3APTmZh0YfgA50/Q1n98vpeeBGTJ76aLMCupyc0a04k+FN
 eHLuJE1b8+fJOXixFXxJEEVYoHzZojHO3qDbxc6sDSAww8CtdYoZCfDPS
 yOc8UjdQ1X0bLDGeEVJyHwxJHeoRlHLfMK9ezjbXba2w4VRo9taG9xmDB
 RynlAqlcduKJKCPL+zQ/ZkDxVut3V8ctBV+qHnElAXt+g6BNnuk4aVlvb
 qOdIiuJJZ+ihc6J9JdW+yRSoXslTCw3d9jhAHqWfS62xiAEk3+gA6M86H
 UHxRKsT7mf6U9DEDSeInxwlz1N5BSQLHxMRWkdfTgYlfvtu12galhzqqX g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254844"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:13 +0800
IronPort-SDR: lyZZHCGWR6We/MQ5fgd0hyItLBl6HOlQPvFBkLUIodACPnGq0swbUKGp22T8oshgDp1cnty1DN
 ObrppqND8jaMaQUNvdlLT8GpmE0BDGQqNSpJFFNaOIXRqsFGnosxiH3oBOeG0TzNGMgWFdqkDp
 GUXJ4dvairqRO89RSOc/FokklnXCdGernCWfhlrYaPzJy+QqPI+QoXKpmwI1C9W9lweHiMZ9D/
 SMAqZHB2ZUyTkEstxxtIgIcGOpTQG+4SDjxzko6UHZB2XB9pQ8fnXK/zyKsQ8cHrYSmXV9BNJz
 FpI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:24 -0800
IronPort-SDR: B91vcgP+m1VXgKKvA9ozq5QdxcGEtVY8aKnw82E5fZYFvPp2xU0z2qVhH0n4dsuprDNRjzCNoZ
 kB6JzZ7Ua/w6NdeVNVrNrkDhFhbZ2cBVql487m2l21MHS7c5T+LQt/Y24VPVXjkX5jO79Z+HBh
 y+k6CAm8IBRYJLLOEXnNDSiEaeQ76bnYUyYkwDzjewg6WBp63zAmFQNLyHg3UeYDM2Bfdt6n2Z
 0Vd2+q34jirDLmmoOcQkO2rvD9rzEOWdqsiMpqwgx5CoOs1UCusOUPPldCvOzy94Z/qj3YDcT2
 i3o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kT4psgz1RvLy
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974913; x=1675566914; bh=VjlyiFGHjcei8+QKMb
 hE17ewOiIIFRcNPQRqq+Ddv4g=; b=H8Hr9ErkNPOzTqsSj/amNaiAq1i92lFKCI
 M7z8RQybo5gDiigizAeYLICtaOy//6sC7gXomIxDHkZO/4LyzFQEdN/e3Gmh6w6Z
 5yz1Cf1HJvPCa4RdvTjMvGYTIMJrjLIm/r7p8vwNHvdlN5v/SDxH3oEKVtziQLeo
 xe4AJDvAzTQP0jMUydei5k3v4gijMwP1pjz977Qo4pDs56K37Gccdk1qyr+5M+xv
 TMp60Fuf+k6RwOkzXIS8/27TKwihvOnkt1gse+Q0IVSKH1FsQUTUDOf2Ci0fsrAV
 h9d5TOYWBknZsCfcDDnrgrdyaj8/zuyjQciWkZkh87yTcY+QJ6QA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2OdPyjkYsmLV for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:13 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kR6r5yz1RvTp;
 Thu,  5 Jan 2023 19:15:11 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 39/43] hw/riscv: sifive_u: Avoid using magic number for
 "riscv, ndev"
Date: Fri,  6 Jan 2023 13:13:53 +1000
Message-Id: <20230106031357.777790-40-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Bin Meng <bmeng@tinylab.org>

At present magic number is used to create "riscv,ndev" property
in the dtb. Let's use the macro SIFIVE_U_PLIC_NUM_SOURCES that
is used to instantiate the PLIC model instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-12-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b139824aab..b40a4767e2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -287,7 +287,8 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_DEV_PLIC].base,
         0x0, memmap[SIFIVE_U_DEV_PLIC].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
+    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
+                          SIFIVE_U_PLIC_NUM_SOURCES - 1);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
--=20
2.39.0


