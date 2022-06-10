Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C30545B61
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:55:20 +0200 (CEST)
Received: from localhost ([::1]:41320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWg3-00020P-N8
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWUV-000637-Ny
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:43:25 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWUT-0003Do-SZ
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654836200; x=1686372200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7WPF3ghQLZbHQ2RyhKfIUWZ5SFhbpcofRYp+uPaGTbE=;
 b=ESRgLZt4/vVy2pzh7lGzNveD4MHi7ezAID5JK/oluzkJZwsHx0DxvTqO
 UuWcw5pJTVWM1cEi7z3S7jOt+QLKcLWE6ojcm1U0GOZ2PG10kTEdkt5AQ
 N9Dq39/TyEra1RqqlW4FSngemWkcXuTLt/MB69TMRZj7Q2OSn1YTzFC6B
 MZS7aHDBDLg2PB7nFKA6z0Sc3lWURaE0AAWKvjo14VN2JztQ1QzrJBPxd
 r3cTPIWGowyQlFp0eornOUZs28ygfXEIIF6A/beE4ljUSNwgZspksRY8e
 8SX5eCXEhGFnQwuyMDMtn1xErDg2ukfDuxxncpGW3n/jNVXBLw6yopE8/ g==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="207619195"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:43:17 +0800
IronPort-SDR: rywf0/mGswLh6uwaVc0kCF8W1/uU/SPfQAH0adTdgNVgD/+HFFkSzsYxymvqmVz0cJePX9PF73
 gfYTmWw3GJzMliUWfXdQrj8MUtKpKm69PaYslQ3swvLJyeAskcWLfOLVfSOKHYYI0OcDbvFt3K
 zcPjLJNVzC7II0yiFgfiqCRmtFa2O/Z2Ff//0uYX3BzWXyd5H/eZf7xXKI70JOPPrfG42fVi1A
 2PdarJ6DKrgp1nJK3qVnip7Eq12wq4nTIcCkldu/i5gA+vzPEcMsrvnd/ks4MeU24yvKgCUc56
 fHshDNLJsQ8LlBMbKYYj2Xdq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:06:26 -0700
IronPort-SDR: iiPkGb6gH8ZNxHZ/jU/w+IcIg21/WqkfokwxpfG0S3eSE1iNk4qra6vs3lv+OMbiPacXZ/Lh3r
 KfBvWgyeLLF+XH4rDb4KJHBLRQUS2fCUQjk76Yl3NXBTJy6BdrzvPaHUMw2+10X3IxZrfeeMil
 Yo+1kvcv80CgLpmxJtBIOBhA9T3pugf8V6tCcfb6UJVK+FLACinNHPe81wU2G8nK13MWmcAD8+
 DjQ+0tH19tAk8jvoOrJbKUFwFho9mbfFR59rUz6X5itMVsUmwBKlOze6WZcBg6/owGwr+fZDDV
 DS4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:43:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7JQ5H58z1SVp3
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:28:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1654835334; x=1657427335; bh=7WPF3ghQLZbHQ2RyhK
 fIUWZ5SFhbpcofRYp+uPaGTbE=; b=Kl+uWEqlLnp/Sq+td3Gdgc3vwV2QYnrXNr
 uXR8ZHJ8XsGsgn4t2u9sNH1A/IGPqjvo7MC/HTvdKs62GWa3p+hBRGZdcmVt1XQG
 IXX/GywkhE9aXWweAb/80uxoCajr9YPQztyP5HPg0R6zdC5u1FD37pTw/NKE5tHV
 a7IoecjbpqgiyYNAk8OYVdzoAPpBsJuoL3EK+Al9FLPC5wutuPT2ZoOTICKGBieS
 3zc3bJq/9Be6bXMi2MA3dNp9bGSJBc5ARRt91SCa65zd9FMScMJkLQNVNpHXEBgh
 S4w0e2e8xEKPAde9215xQjWh1nE6Y51/yJ4/mc/APQnYIRTVJDdA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FSLzFEtOfZVI for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:28:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7JM2hbrz1Rvlx;
 Thu,  9 Jun 2022 21:28:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, eopXD <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/25] target/riscv: rvv: Add option 'rvv_ta_all_1s' to enable
 optional tail agnostic behavior
Date: Fri, 10 Jun 2022 14:26:53 +1000
Message-Id: <20220610042655.2021686-24-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: eopXD <eop.chen@sifive.com>

According to v-spec, tail agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of tail policies, QEMU should be able to simulate the tail
agnostic behavior as "set tail elements' bits to all 1s".

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between tail policies. Setting agnostic elements to
all 1s allows QEMU to express this.

This commit adds option 'rvv_ta_all_1s' is added to enable the
behavior, it is default as disabled.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165449614532.19704.7000832880482980398-16@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0497af45cc..e5aa1e9c1b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -918,6 +918,8 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
=20
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string,=
 false),
+
+    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false=
),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.36.1


