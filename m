Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29876674E4C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0L-0007wj-A1; Fri, 20 Jan 2023 02:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0H-0007vc-7O
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:01 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm0F-0004qg-HE
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200399; x=1705736399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YFEhYOIOyI5zToAKjlCL4h8TbBuXrF043NOmLfxNuWk=;
 b=Zbs4MAA65KUK5UZ5ON/Cam9CQb1/JpMwVXb7UKsAtK/IXO2nyo6ptD9P
 xJMq1KdKBdLfNc04hh1jDrx2LbdYX1vzzuj+C8YG7WRDJxomuZB7W4Ic7
 RAksYzDdPTrfL4NoLhBrBfw1JPl86jfTix/R4RarA0Fu+AEG57EbvKixg
 bXBFP34RUX6wLHRoO86KOjWUXlXqXf+Q4+PNBXUKquB8jCkO0PNxzkK82
 emDDnVmRsv3V8YstGv+26DI/1PdDj/rxlIhvgguyqgT1tfgAPIe6OSnqO
 m6y0G4MAQYsjMQj7t3qtOpmGiswaWxhk3XnC09jxHY+5Si4szTH3Pi8j8 A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176701"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:48 +0800
IronPort-SDR: ccUE5byUwjWHbJWuMKKu92ZiCq5ufQjIud9GgsVKlQyMudu2N55H/ZW8078RBrM8XzvA890BQt
 vsufKQk8NpuzBEOuuesxi/Z1dkbp/8qEtG3fGciIV7NePwezWdxR5txM/L33dw0k7nQzyuVLVN
 MO4l1z8hdSuihlXqb0/j3+/vP1aMazTvVu82c4dAwHPMmJ0udqODDj8NhBnGNZXhm3NB0/rLoV
 TGi9w/KwyWOifPgZ10mn7GB+fWWegfOf/55J3jbbUQJQKEmSoz2qOb3dLtOy3rtgLiCCDrPJus
 sps=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:26 -0800
IronPort-SDR: alXZJJy5ISLJTDeDPMLljP6eTByRS7wca88EEOfLRjH2l/NC0KhTY0ysO98WzhttVSPGp3f4Gw
 9tafDP3jxBzYrEJS9BPFWa+7DNLpLCY2Ngw5qtFjUMXoybxPrba7HyhQutgZ2eArmRSmWgorPz
 Cd2CS17BWHduYWBXS4/KePpexNmzcc+IveSFNH9AjXV6eWvODaSfaePZBKQqfYp8F/sXgyKiII
 asbJsPHsopaEtDyA3UnFBksrvvEFzKCpX6IpAYtQO/+VguKdFU9tiXAlB8iFhuE+rNOE+ZZpgh
 Uqg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyrxH6vlcz1RvTr
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:47 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200387; x=1676792388; bh=YFEhYOIOyI5zToAKjl
 CL4h8TbBuXrF043NOmLfxNuWk=; b=rJ05VvVBzMkraoiL0guSLVvbJn5Myz1Odo
 OGajQqzQKJSaVp+Hd9RHQNDSrVvMba7iXtcqnJ5w+Enw2b2t08A0/Un+Kb+r9Ya0
 KCaZ4AGYGqCvBNAO0n8zy5uNK/eFPy+ALslg/K0fHYjotjZ+lznF0oXdKBiCS35d
 eAGDw1XNPBrCQ8au0y0YYTckCM54t7EixuAtRpRjyY3vlKu4g0+YsW9nPbNT7Ec5
 GOuJQaTGOZZws1VtDyTRE7HF0NimkMXfzVDLWOPQL8XNP+IfZAV4BMAPN8Pikh7r
 Rp81YR+ohXIZ+o795QHxgZuJugFkbeSSuukXRtREkYCFVtwUNMFw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id SWl5K6zJnUSf for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:47 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NyrxF5tK3z1RvTp;
 Thu, 19 Jan 2023 23:39:45 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Dongxue Zhang <elta.era@gmail.com>,
 LIU Zhiwei <zhiwe_liu@linux.alibaba.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/37] target/riscv/cpu.c: Fix elen check
Date: Fri, 20 Jan 2023 17:38:49 +1000
Message-Id: <20230120073913.1028407-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
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

From: Dongxue Zhang <elta.era@gmail.com>

The elen check should be cpu->cfg.elen in range [8, 64].

Signed-off-by: Dongxue Zhang <elta.era@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwe_liu@linux.alibaba.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <167236721596.15277.2653405273227256289-0@git.sr.ht>
[ Changes by AF:
 - Tidy up commit message
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc75ca7667..a2e6238bd7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -882,7 +882,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
                         "Vector extension ELEN must be power of 2");
                 return;
             }
-            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
+            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
                 error_setg(errp,
                         "Vector extension implementation only supports E=
LEN "
                         "in the range [8, 64]");
--=20
2.39.0


