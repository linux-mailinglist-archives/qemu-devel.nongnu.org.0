Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F1B48A879
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 08:34:55 +0100 (CET)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Bg9-0006C0-Md
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 02:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=003f2f281=alistair.francis@opensource.wdc.com>)
 id 1n7BJ0-0006D8-3T
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:10:54 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:55781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=003f2f281=alistair.francis@opensource.wdc.com>)
 id 1n7BIx-00082V-Dq
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 02:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641885051; x=1673421051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KbA4NsaFTKCS2zH6cIeIsGpzB1o7JYDGM1FCOlrMKVw=;
 b=LeHy5XWBDPJtnkZ+q556ybMbTOwzBxF/3VtfVWTFJrxntKy2Abjs6O5x
 UhswLTyL9U6DtS+mgBy6ZA+P9+TZugA+VdLlni3Ff+OR5PgniGaJ949Mx
 7/ILgdGCro8g31n0xWtjS2UYMaO37DqtTal/mLq0bUbJa6QD3ytLD4cB+
 QZz+y/cwEqVVtL95K3fS7yQLcadLhIB38kmy/CATasvgV5fiKfDPlbq8+
 yMbiGsY9Tsom2ARJdXfEswBXdRkWpnipE0tUWQUkfQnh7pM5Cx37L/VTZ
 hTxR73ZaAVHXihHmJqASSCBllzawgaGh6vbo/jmt2RcM95XPgdJujLyi/ g==;
X-IronPort-AV: E=Sophos;i="5.88,279,1635177600"; d="scan'208";a="191178596"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jan 2022 15:10:48 +0800
IronPort-SDR: azjvqLnhzQP9ukgtYdA1JOe4X4PoPiO7aJUKTaI8+S/3eoFVATyL/ZGP/igK3ulaQLpibLFRRO
 V55bYcK/Gl39TC3X+8EI2fqtXPo9jybHIhFGUmfKI8mYK925tZldTxqvKFN4i7rX81983Q4yJm
 GXT6+aw4mKjzwtZIbXJ7DXdSIiMR9ez1P5x0a9FJioZdSTEsNGxGf5sZSQqubQN9JVujNqxt4i
 yvXSCyEfck6zRN5km0YNbxdXX9H54q+0WDLJYWqVmwhIfYyxYHGhmk4zxGvLRH1QpZ5IAqtuoN
 xvezpflAI7EwS5E7fTwyUG4x
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 22:43:11 -0800
IronPort-SDR: b/3qGxj06BrWWqzTXCTKjipkeD4XPqdlZ0cNRTJw1ocj6prh/molVzaKG4TyUinSjTSAbPelQ/
 ElWGfRmzenojAqWp/lV/88FCPkP5wxgI3us5eGlEMGCXrVp/gSEiswIehE7nl8mmKqacGxWNI5
 Sx/LLchbC1AtSNSq71oNhQf2iRWgozJJs9gzFgwvFyaSlM+6J7Z2SKvu07QFdSTUGnsfDFfNb6
 pXS47kBip4fdvbcAaKCBCYcdT+G3vY1TpBMdnjI3QJo7U8cVDzBqFFL+48f2G/nOSxfvfHNZIw
 Xm0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 23:10:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JY20R5xH8z1VSkZ
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 23:10:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1641885046;
 x=1644477047; bh=KbA4NsaFTKCS2zH6cIeIsGpzB1o7JYDGM1FCOlrMKVw=; b=
 eaoILHEcYx02Hmp8+gCo50FViQE88jzhbUBBUw2xqr7IVhUfabxdzdhvrLg7dF1W
 N9QEARnNsW3/jyX0mnmmTNtnC8C5i8qtKwsYqFK9inF9gMuNbaSeb9qNRX/UAKRh
 gbQHnqky68B23EfFesJVuBl5/BGxc1L0TaOJ+bZR/lU6yBOSFhtrJIC/Q2KarYbR
 ZwdbHcxa6ouiUbFZ9la7NH9pM5Ug70KofUsjHVFYHVxMz4Ss/4lal0RNbc2wgrZu
 JxJEoktwPqWGqkKQWF66v3qEmBYLk3CabK82FYtJO9TP5JhHdo6UK68YsBsQ7Scx
 UScVrbf1FJxrmjahtUdnLQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YcbPMZzBbXJ1 for <qemu-devel@nongnu.org>;
 Mon, 10 Jan 2022 23:10:46 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JY20L2CNBz1VSkV;
 Mon, 10 Jan 2022 23:10:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, wilfred.mallawa@wdc.com
Subject: [PATCH v2 1/2] riscv: opentitan: fixup plic stride len
Date: Tue, 11 Jan 2022 17:10:24 +1000
Message-Id: <20220111071025.4169189-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=003f2f281=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The following change was made to rectify incorrectly set stride length
on the PLIC [1]. Where it should be 32bit and not 24bit (0x18). This was
discovered whilst attempting to fix a bug where a timer_interrupt was
not serviced on TockOS-OpenTitan.

[1] https://docs.opentitan.org/hw/top_earlgrey/ip_autogen/rv_plic/doc/

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index c531450b9f..5144845567 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -160,7 +160,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
     qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
     qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
--=20
2.34.1


