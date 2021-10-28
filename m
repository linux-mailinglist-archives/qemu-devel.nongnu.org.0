Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2E43DA9A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:57:36 +0200 (CEST)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxTr-0008PH-Kz
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHn-0000jZ-M0
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:09 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHk-0005Bg-EH
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396304; x=1666932304;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7MDnK/8FcSTvs8XMDX1+mff0lWevalZQvp/ZJL03XgA=;
 b=a4rRpbA0EpyVxsDD/AUnpQl0z7k1Hq1td9Ih+FiXUwwLuEJJ/fWpmpmI
 48YTu+veQWB4U08DhnklERMkyQZegyyqRWdG8Pid3uLYvesXjgpo7b/7G
 Ln6mzI1PBn3lyytMY4wGIRDA5hOo/Sw6lQmS6/1N77WOGXfPcInW+a4Td
 kOMO3puoMIiT0e+sTUaoCS6s4zIWATEz2u9/sp4azNXDqNGg9bZL/1TfU
 OrI1ir4fHg29+oQxfy+KIhnoxqzbIHTRsdbh4fGUZSWn91MRD3Y1Qfq5z
 QMGB17e7Th1OJq0rp74Ssdhalutul7MQSlzwNttOO2N522RxUKtm7fNU/ g==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="183044163"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:45:03 +0800
IronPort-SDR: 0viTEZ/o2VoQB805WklYgy49Zom6876r+vqkiCScrCWZccCrS3IcF5c9x9bA46Q4yr4/W7fELy
 numNTuDpedbrz6LhZFMlfFRPECkZtqteA863WUBiQR11gK2EwTlM2Li/DM78jYP2TZUjPIStn5
 B4Sgfxe9g2kdN8lW4kpqrq48M0OJC0X+3n6PoTs4ZT4iOi3cRPNpq2O4LUIwvhkoJJc8MogBN/
 tggLYAVhw6cA9pPjF67WT5LmGVs0rdmeWp5tX/9hJa/Q2yf9JanbbqNQKQupGZ3ov5FTFsIajA
 7no9cEIIc5esRq6ER751RCay
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:58 -0700
IronPort-SDR: tVlWWjsX2H0lj7LGf7fA/xUUp36ocx6FnmxG+4sBqnmOKqd0QlMl3CqImXG5qR4locFYcbcmRP
 uTavVN4b01Oio+fHnTb0hNfit3mNPFj2Osr7G50fR0Dv4uaBQxAW7/8IiapFjMW0sbroENPz/K
 QdX4lnVH2XJsAlXR87Ny+ceuvvD+gvF1Jjttw+o0/G6WbybYwpzDX4R2v6OUQnsYl1W9nEx1Kl
 CCuXPqY6YfxkCHi5LyaSUG3GIfuBasidtoUxt6H1yYZTUHUqrPKsovgMm63y7t02MXLkDjuAlL
 g1c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:45:03 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJt6BXJz1RtVm
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:45:02 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396302; x=1637988303; bh=7MDnK/8FcSTvs8XMDX
 1+mff0lWevalZQvp/ZJL03XgA=; b=HQNafoWBJJdcjhNduoUNnGQaIG36f4vvNm
 mRiottWp0yhacVopN4WIVJXKQRIrXz7t1ywC7ZBHkbFal7918Edp/sJ4kkBlfC+t
 /t06G/0cdAp8l8A9hYzReXP73PCpLUIBXvCBdg5BmkU4uPKdus7v0GTRI4ZP7etw
 EPisPVwHQhKlh0t9V2YMUyUjo3SSAZg0yHVoi+zzEPJKQcGD4b9SSCEzBhCwFZWy
 GQVBFcr/J763s309SRIGGuAyLaDsoJO2XzgbfgoMX15YLrdvyXWV5jBv3DSFD+lY
 E8aQQHlTpXrXAqypGGKuPleEXlxS0ns7QXyg+qssgd4LlSjxNVKg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Im7FpBelvQ1R for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:45:02 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftJp1B56z1RtVl;
 Wed, 27 Oct 2021 21:44:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/18] target/riscv: Allow experimental J-ext to be turned on
Date: Thu, 28 Oct 2021 14:43:38 +1000
Message-Id: <20211028044342.3070385-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211025173609.2724490-9-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16fac64806..7d53125dbc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -562,6 +562,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_j) {
+            ext |=3D RVJ;
+        }
=20
         set_misa(env, env->misa_mxl, ext);
     }
@@ -637,6 +640,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
--=20
2.31.1


