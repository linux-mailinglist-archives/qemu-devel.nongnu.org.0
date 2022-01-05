Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC7485B62
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:11:47 +0100 (CET)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EVX-0004rx-1F
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:11:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5ESo-0001WN-MH
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:08:58 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5ESm-00018s-WB
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420537; x=1672956537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JNQZsgaGbrSE6vbRmN678U1im9RKfaH2hWZaf2zYz3M=;
 b=inrzK+UWfjoNlRPiZ7X4v6XTn7VfKuyng3DvPdCNV8AewgxNJBxSt+9a
 30FosEndPUueiQ/eoG2jwPYZjvpY8jFGBk0TPPqc85zVPfs9dk93n1zWt
 Mf1J3pbPl/uWW0DRWNRQ3WqE1H/FYuQQqnBhk8DsQLxY9gQjYw7h0HoyA
 ZYV8SKS5kckbFGvXXVvG6gM58UL8SdSKnueDbgiJ/cSjegP1pcv+pNabZ
 jDlxxTXbqCJKH8QPedQ3mG9o44DRrS8/lnSGbu2aiJhTs404mCY4kbKkR
 N1+BH1yKnMrS6z4ZQbdBLo9L+SU5+NgIlhYfQTLR32Il6CHvZ1xK6xo6V A==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="190799226"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:40:26 +0800
IronPort-SDR: yCPAtDCVBKIWm+Fkk0TEMsJq06Yc3UvFqdGH8dtO/WsI9fAt/Qcg4u6uj7SF9EmkB6V99zJpAv
 GoMUSudR2h8d98ktKXq2a/TFmoepvlkgJcKOKFrymc4OoS1jSWq/7e+tlQF74HwDEw0wT1MT9m
 GdqiKkAm0M76Xw7Fps+9iRduDI3HCrr15lw7kWbP79G5HsHVC4OaGtG6jKFV/OeE6Lm9KTxwLo
 kQBOQRAkz7oGVC6b6z9rfo1t+cUTiHB1EJlzjCsPvwV0V1ndr2XIrvyS9h9+2mQaPrnVFP4x/l
 l6LYt2ZHeyOmBJz0ZbduW1tk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:12:56 -0800
IronPort-SDR: Np+qUXHyrJpbdKlVbLAFG+AGq6QreJ1LZ4SqKf269CPJKHFZoOQ784Rax6HGqzUiaZZ2ifQ5N6
 Ww87x7edSlFJqUF8i2cX0oswZ9/+7ZebXXR/vQa+gfskAVpy4wgnNBrMZXZl35xNR2RF8PgsMm
 qzBZ3DFQq27mremtJvSA9461sZITo8hOyzZrfsX5WHSRCaxs936WP54k1tLV25ROQzKjJxWlep
 qkJ+8NOndLiRD3y8ndLD4bCVoGu0ey30W48iOwwn23pMxXE3AH7hGu7waClgGFNeyJJx7B/utH
 FEA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:40:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZf0gC9z1VSkk
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 13:40:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641418825; x=1644010826; bh=JNQZsgaGbrSE6vbRmN
 678U1im9RKfaH2hWZaf2zYz3M=; b=U177trUKzcCiLaMPFOn5gMwR86atH9RAXZ
 w3AsZCbdZsXOKlp+igLN7tonl0MzqfDv1PUYEaTC3rb+PfnRXUcyGva1VmCvdv22
 OpJseIyuxwG7MDeBET0UIKlHiv0YPYPUVxxl3aE/W2njxRmMUiIYZiOTG/sjTkPb
 lFp/qsfvLPiDj34O8BMWsqqcoWBkyscmD+XG1EmfIUidJKcID0nCI/c9TtYILNue
 ZFTvxAQd0SbqkzKNRtUaoJKYdYg0CHDq/PCQE+Jtv9Vdr32rlOUPfhrrvB3FfJ7C
 Y6BEb4oI4wtY1ph7fRM21xrkZLPs8QjRxK9LeUUc0zWJaB/EDIhQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jZ-GGlTtkeih for <qemu-devel@nongnu.org>;
 Wed,  5 Jan 2022 13:40:25 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjZW65zbz1VSkV;
 Wed,  5 Jan 2022 13:40:19 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 6/8] target/riscv: Enable the Hypervisor extension by
 default
Date: Thu,  6 Jan 2022 07:39:35 +1000
Message-Id: <20220105213937.1113508-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Let's enable the Hypervisor extension by default. This doesn't affect
named CPUs (such as lowrisc-ibex or sifive-u54) but does enable the
Hypervisor extensions by default for the virt machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9ea67bedd3..29749e834f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -627,7 +627,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
--=20
2.31.1


