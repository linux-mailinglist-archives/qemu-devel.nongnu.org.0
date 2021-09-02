Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84A33FF7D2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:26:19 +0200 (CEST)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLw66-00052T-Pw
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3x-0003al-U7
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:24:05 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:10519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw3u-00044h-TB
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630625042; x=1662161042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fX+D9NkC99giVZdE2Z7T5c65nGBj+I1+KnYy8YTXeO0=;
 b=DQ0+rIXkXt68+QjsT7/OUF22yX/KOVMXnN1Z0DL24UdvFZijl48jfIpb
 loiBsF2/1xxmR1hqUh4wwx3YhYkXmOZN4gGG8Ih2yccnffP9AwCovHpWZ
 XFXntFw0Mnf6qZ413Wos3ds93g884bOe5O01mAsXQOzZDcgSWXDsjIqBr
 6yEDsL/O1ehABUSxPxgp/JDjNtxSONd8AnhJNwlrindibuB/XsNaO8ZH7
 G/KYV/UGxLE6BNBsc7g5gjGrOKtp2WZkaXJ6Gm/xuzeb2cCJcdtBFDcdY
 V9BA90fYggt5xnIqGUJi3+O6duTuMGSiRCvLSxCkKp8Rw0gtBJxkL1kkj Q==;
X-IronPort-AV: E=Sophos;i="5.85,263,1624291200"; d="scan'208";a="179087159"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 07:23:58 +0800
IronPort-SDR: 9clR8viOES6hMBanKhg5Ni+iv+CGGXZN2/gYrJ1Z5uVDhMPZqepH7LY8rxs1wZ99UNM87fCGpR
 t0qbq6kgVI7Ilr9QqLI+vI0NaAax9ppFLAO+T1WpAuZYjomDIILY32EAy4eZqE/nWihKbcXmKu
 7ZqyJpBvlsMTTldTc7AqPAYd7Vbn+2kRwZ+qPkkRTpwho5bXvj1QzP/YHlInAMkLM1HQ7p0mIX
 RlNrh6jQD6Oay5tqvrWTj4LjQtooSR8ATBwBSRpexrPtHJpH7Y9wIgW6dmk8C6av1obEIkwULq
 m277vrV5MYZPhuV3LmwjtOoy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:00:44 -0700
IronPort-SDR: fbVQLMMHtix4LeonuvGNTxcJYAUYtloAD1uTBi5UX5KmFMxoulKGx6znKTVHQ+KHSAjDIQqOQ9
 PxXgE4Uvs2YcPyrNFprFVhb9qrpnbfvyvPu1zH8Dx1ubjLhLK9nPXAFgvZ7ftc3bkWgXhZXGII
 cCaVasMwFtvM5ehX8h1T+jzBLu6uFc6jZ/mgZkfI5YbmWOeD9wdh8tJcjsecDMI+NCacnZADol
 xjsOabzwVwwzbf8NmGQzL+t6UacpLaW86JKBriEOFyUCXrb3Dg2dCWLOYMcBp9+wdzkKVO/uaP
 +TI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:23:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0xnp6pT4z1RvlT
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 16:23:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630625038; x=1633217039; bh=fX+D9NkC99giVZdE2Z
 7T5c65nGBj+I1+KnYy8YTXeO0=; b=k+2/NpwBSHeEPRttmzSUXqID0HfWo6S+uR
 qfuCc3OHUvKHtkWBtA8y3KB/Jen9k26a1lVrIHXOm20ZSfd64Bzm2WeUgmr5V6gQ
 jaQmd6Wg0aQlBmizCYC9PoKRlMHGPni8NRqQPjmS3HGvYYruCM0w99OTWCuruasO
 MdrvWEG/DPrOzEz6d6AxUajp/zEdqlNwUHPOXmsd/IyzIEvvS6gMhIlHbrkzv9HX
 paC2s5OX+wiUQlbEZ9HC00Si5NvoVdJY2VFsZMU84LuBVIW41WVNGrmpdKDjaQvk
 Nb640oFgomvhgaHo4R2nrDMnaOoUueAf4599ehpM/Kl0xDU69Klg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Q_Izbar2dWmY for <qemu-devel@nongnu.org>;
 Thu,  2 Sep 2021 16:23:58 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.17])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0xnk4ZG7z1RvlP;
 Thu,  2 Sep 2021 16:23:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 2/2] target/riscv: Set mtval and stval support
Date: Fri,  3 Sep 2021 09:23:48 +1000
Message-Id: <968ed1af9002f5f9f42f9efe8a5db5a1ed830a09.1630624983.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630624983.git.alistair.francis@wdc.com>
References: <cover.1630624983.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6d41a16ae3..64ebb593fb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -309,6 +309,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool mtval_inst;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579..8b77526c79 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -437,6 +437,10 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         }
     }
=20
+    if (cpu->cfg.mtval_inst) {
+        set_feature(env, RISCV_FEATURE_MTVAL_INST);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
=20
     /* If only XLEN is set for misa, then set misa from properties */
@@ -600,7 +604,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-
+    DEFINE_PROP_BOOL("mtval_inst", RISCVCPU, cfg.mtval_inst, true),
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
     DEFINE_PROP_END_OF_LIST(),
 };
--=20
2.31.1


