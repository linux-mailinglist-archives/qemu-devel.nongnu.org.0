Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68CF65FA14
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:21:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdEo-0003We-4k; Thu, 05 Jan 2023 22:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDf-0002xx-UM
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:36 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDe-000892-Bg
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974994; x=1704510994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b/kkGmWtHKUYnnYVKiF8gRaKqeKXrGwDms4h8L5NjnY=;
 b=JA+9JA8lRdd0VUiNi4+t4t15Ww6P13BrIe25HvKcbmgri9iBbLpvt3yt
 7Fcko1j0+6Wd8SoLHMQ0KTr49DcYbJC6+wuhv1K3tbLl+uib+qvLAlUeC
 872bYAImXK/pmvYlW6EO9LOUaGN229pJXBGT48GKoASCBkiHCow/C0Tm5
 lOZKsMdeVqIySXIB5KsulHCJz3/kgefxBU8Q3LtRi1focf0DhbSvbA0lC
 11y/HUpB/piiJOgEJeVj1IRCsROi+rjRMqLeIIdej+rV+vd96gd8X4SHn
 LoHasHSXoGYzh+wKtwM/wuDzDRqLc9O1iNH4yFjrCYy6qdz5uPzSpwFo5 Q==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254849"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:19 +0800
IronPort-SDR: ViHkNK8OZgNKufim8N7Y+R2b4OqBw/+GFaU5rR4VpV69tCR0c2VrqZd3Hr37xWdHC5PY5A9NRR
 PoP92IC//70pBtOKG1kAn6G5ZEm6pVsOcpaE1HZGns/zXEwlaJAdqDjLzl/tqGMKmhF64SjvKp
 GMwYggwv80yBu6n2+vaxrcXOPWO7fj8ETVmd5eGrxYo65vKp6cqo6ujdNsVEVZ8bMhNubTKkn1
 KwXxCdZ1Aqm6kqzqr2DOAhwnsB4IJHpY5Ilwt7PhwJg0P5SnaVkpSE7BK2njiolcYtSfyO3oez
 Zz8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:30 -0800
IronPort-SDR: 8NGy8ILdkbInXSPPejRQo2RPO1BlIYF01N68+WS73ryKwIvTwkP0iPrnoRWtRhAuTEyJUa6WFy
 81EKMaPB3xzPNbyS3eAk3HSkX9Yu/xnU5YUussL/dwNlHv97jDQp9u6DdFp3QW7eDJA6mMz9x4
 m0qU7QBnyqX2GqErFO6DA/h4eb8OV1catUPoe80S/2yyVmKJqA0ftMYKace2RhGGxGUj3GBQBy
 w1xiq3cuEcINaXRHxbheoJibR5bfrG0rNSTZHz2jg3uH/nycz9tySUKLEez/nfEB/OoVF++UD7
 7oQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kZ6nLTz1Rwt8
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:18 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974918; x=1675566919; bh=b/kkGmWtHKUYnnYVKi
 F8gRaKqeKXrGwDms4h8L5NjnY=; b=QgY0gbdffKNYHBciWv3mpXUrC9qJGgJzyA
 H7jL3lKKpqdhjLjRKyxN5C+XicDbQY/9B/y2uU5O1JgBemGtFz/rntFtd7vW5+3e
 jKMwixvPM2gwTyJMeOl8wmxqcVoWpNpzPu9LOk2xTajka/wLWqSUAxn3rksRp3ZC
 4DJOqCblZHdaOAJ02195ALm6cDnb7ITH2m/MB5HNEWHim2kNbcp6HJXTVTzfuQJi
 g5g6BrwhnW8OqqaIIoW2A49APDqRBfZCvMs0b6ctAKEUBjrT1inbItGeaoPEklOB
 LNjP6eJxudgTKqVjuKAK4U8lPX6Ma47Z4oENAGBA/XdOaDccbpxA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vDhmK9s-jUE2 for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kY19P8z1RvLy;
 Thu,  5 Jan 2023 19:15:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 42/43] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
Date: Fri,  6 Jan 2023 13:13:56 +1000
Message-Id: <20230106031357.777790-43-alistair.francis@opensource.wdc.com>
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

"hartid-base" and "priority-base" are zero by default. There is no
need to initialize them to zero again.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-15-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 78f895d773..85ffdac5be 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -173,10 +173,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
=20
     /* PLIC */
     qdev_prop_set_string(DEVICE(&s->plic), "hart-config", "M");
-    qdev_prop_set_uint32(DEVICE(&s->plic), "hartid-base", 0);
     qdev_prop_set_uint32(DEVICE(&s->plic), "num-sources", 180);
     qdev_prop_set_uint32(DEVICE(&s->plic), "num-priorities", 3);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
--=20
2.39.0


