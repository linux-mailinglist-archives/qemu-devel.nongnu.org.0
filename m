Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE85333A6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:48:01 +0200 (CEST)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdJo-0002Hv-6y
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGx-0007oT-QE
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:04 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGu-0002Yx-Ly
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432300; x=1684968300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+i4hduJB6I+gwmGjd7ffF1PSWj338oxgyF4MGrnGrFY=;
 b=pffUfQDzfwgLUzALuQQf0MoF04yth7OzIkHo/soZi9WRzKopu+PxTmpr
 zRt9Th1Zzs0+rxldxxTjf1uFuqLyIMUMuBPp9LHUbx8n9heoUjWSGOI6M
 1vKv10/tGjsa5fLYvZnudVLV/MiwtDpWPdP3WJvToPfBUi2Yv17yCM6Bh
 WcnBa79Ov6BSyEIw/OJ+/nuRJDKr4MTGAZORwDR0Frr9b6POBESDlWtCt
 BH0FYrZNtIBJ3qpPX2wlosjRS8AUqDDDO3SibD9vleKplJoPSBpiNQfvG
 aBlegVKME6FmPN7K6oyjoDRvdfL09OuoLOHwDtjuLkg3JR5AAdrX6UAAQ Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566669"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:59 +0800
IronPort-SDR: eM1WjFcnhSzV77oD5HkkZEReHAKmNEAGBnAViEfX17wTatFzgpesd6psrbTGtDHOm7YLTBDpDA
 TcGKK8L/+D/ftCLse6b/fZywFuIPm1KQqm17xjzFfKfyIq68smvlsYGjYmVm/f2DUPLuB1hlxg
 vlm1/WfSH3FQuM3XSao9bZQq7VvXKx+RdlGNl2DSShq+pSUbv9XaLSWJbj+0mTofeSiIwy42NA
 +GRXdxwXldXlUeuUyYhX4bSXhBbINfA4hMzGoRm2/kIBe9gmlkopyB2MLatrAEvLSdYRKWlbVk
 B8VhrzuztkCydOK6tTkikkla
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:31 -0700
IronPort-SDR: XjQR8G/NQR2BBua4X8T5rOcLhw7iqIKciY3buW+6zOYQep1QSb7ElnR1wDIqLgdWXCLUq0dHVX
 H7nO+lue7jefwWcg3gS/G15r2v62O6xHsuPa517QmJLjmJ6JXeGHEMzDdmaV9rB0wQoW6ejJOX
 SDNvQVdKMnmjQJrA+o+VaI4ZWi2cwr9Co7dMtG0Uo6FiCUK6wBlnj5vifuZmYCGAK3NaTycR3y
 8JdPP8g1Thkcw8uFu+FkkzxkP1c00wJQaLPrLt1rdlTBkqFzTD+I7fYykLc00KILjyhtSCbikb
 oHU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Qz4lmCz1SHwl
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432299; x=1656024300; bh=+i4hduJB6I+gwmGjd7
 ffF1PSWj338oxgyF4MGrnGrFY=; b=SmD1BFXRhS5DQO6Kx8AgvrAaS9pnqLMyH6
 7gEEFmz257YYRzeHHbreMk0h+qVQvWBtAsV7JP6sj7qn4Hdk7ozK9gsghuvU41Ab
 iFwsIUIXRFyVT6YH9c3kdu39hukbHusPW419YwF35xusPdAjagFQpYHGashhW2Y7
 V5ZdnkXYq04rqfpjMVIk2iB0cguucVRsDx5Ue4MY8ekVmOGlSqfPhTHaIRbE0L55
 dfUkoAdFqUqJMZl6qBN2JdL57jfhlXpU9evp/hGrkLFVvmmZy7SamEcBkF2Ojtzo
 ZXgl9S29nY5saskAl53XMtjrP0HwkjdTPO9/0ix6SzgZy6/1nf4Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rb1KlC3z2JLT for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:59 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Qx3W7Bz1Rvlc;
 Tue, 24 May 2022 15:44:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/23] target/riscv: Disable "G" by default
Date: Wed, 25 May 2022 08:44:14 +1000
Message-Id: <20220524224428.552334-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Because "G" virtual extension expands to "IMAFD", we cannot separately
disable extensions like "F" or "D" without disabling "G".  Because all
"IMAFD" are enabled by default, it's harmless to disable "G" by default.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <cab7205f1d7668f642fa242386543334af6bc1bd.1652583332.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e439716337..1fb76b4295 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -812,7 +812,7 @@ static Property riscv_cpu_properties[] =3D {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
-    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
+    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
--=20
2.35.3


