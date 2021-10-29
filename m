Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9343F7B7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:14:45 +0200 (CEST)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgM68-0003a5-Ca
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM2z-0000yO-F0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:29 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:21725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM2x-0004tB-N1
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491488; x=1667027488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NYpkni887wsvZV9VMS0VGs5wJ2vISIuVhBmrnIJ8b4U=;
 b=ntABXTCRx9Ddh8fVPjGSI5yxbrpjtRYF65t3zlGN7Z7tL572R5l6GuYT
 MO4jcoBSkkfJQYle0rx9XFN3ntPj94fXtYCDbun9PnugkTmpHGAsFN5xd
 nccO8djKoiH4H4YOx91T+qZezQFTqcJOCKQdD6doIBEIvMM530dyN0xVO
 dT/ybSFdAYDzoPZxJr4Q6yM9uT5i4NMZInNQA4difuoeV5E77z6GEdKhK
 gz/mGPHV+46GM9fFuzVMw5jVQpND4nop/edux8Lf1Y0birjWL8JoaTG+T
 semN3/qLX7ktMcrc67JsCNAl3dwTK9ST4P7eMafAIas3jELNRIiP0zi7r Q==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="185100409"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:11:27 +0800
IronPort-SDR: Ekth/OKNxIVUFSlWkvQ3ZCHjJ6UtKMIEhftzthnq+dXc/EPRTTIhBiNnpJHY2k7UWFEuIgZbGi
 RJ9iYW/KWiLUZKpAT6t/wCDAolAt6T3Dzy8DbCQFzMmgwkZazKxV9lwbjUrJ/LcmpQZayaV+o+
 24qePvmJdy9QJqrqCkXmf6aGnT0+ZKOcO3vi3P6Nbl5t4F5rX2B5uzon0sFx5pNXdMVBp3RDhf
 Cjf5bjglnh7pwzybt5o006d22C7vojR8Jk2V3/RNKbvmQs4hLfw93WoaYrjemLSCdCG1XXh1Z0
 zL+Df/9FeXqBlTcA/575pqUN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:45:20 -0700
IronPort-SDR: caYv6BIqesltYesPz1auxS7Q7c2JE3vGQqE72Vf7g8Jdm2oyiDmLv+oZx2mBQi4SpZFw0SNN5T
 j/sk3edApy5lRQlm/NpVuQ0HfBHQk/XEFF2ZHehhbpJdlAphZVercDJMXJXf+s8hpU9SgJ5cak
 PzxlU0fyAHTDOuv9cBxNTq2RA3xty8hPxGVrR1GJ4FnbPrJdMg/SBoR5JJLxoSSOpopjLWba4m
 JQGu28JFpJT7yPmhSYw+oydrvMpicpgw3MZt1cy9QuN+L48sjH65IxbOsDC665VekiJeJ3VVpd
 ajs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:11:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYWL549Qz1RtVp
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:11:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491486; x=1638083487; bh=NYpkni887wsvZV9VMS
 0VGs5wJ2vISIuVhBmrnIJ8b4U=; b=r72wSE+nG6DL+mHWpP9TZ0DTyjcP2kT07A
 2wAjjTIAtmrEiheLJKxfJNlc8+291ADCX9dGZzWQ5uvW7Aq9ALoOinVqcZ9SQlPk
 i8RpsLIZcsDYx2y1ZCE4TToWAZ5WwNtDi7VItPojo3FuZkJCg4y5qcArsY2xGo5C
 UH2QCQnYOLAJsL8tm8P0AWfGQjZYmeFeN8+iSCw4gPcO9D73rB6cKo4TP2J/ZTMH
 7IWoIi8/nW3HtOP4OYFUz9nCb2UI/dHTyuMi2DYfiB7EzdD77YWodQDnf28DqlHT
 SHuqiSDtu/TGdVV3Y8v97YRucN0vdFaDaYl4OokEFFqwh2ZtZeSQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pQVAngp3nzcg for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:11:26 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYWH07rMz1RtVl;
 Fri, 29 Oct 2021 00:11:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 06/18] hw/riscv: opentitan: Fixup the PLIC context addresses
Date: Fri, 29 Oct 2021 17:08:05 +1000
Message-Id: <20211029070817.100529-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

Fixup the PLIC context address to correctly support the threshold and
claim register.

Fixes: ef63100648 ("hw/riscv: opentitan: Update to the latest build")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211025040657.262696-1-alistair.francis@opensource.wdc.com
---
 hw/riscv/opentitan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 83e1511f28..c531450b9f 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -161,8 +161,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200004);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 4);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
     qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
=20
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
--=20
2.31.1


