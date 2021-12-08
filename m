Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D946CDF1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 07:57:09 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muqt2-0001Qi-EC
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 01:57:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqg8-0002Lc-6I
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:48 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqg6-0006CQ-1B
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945824; x=1670481824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayBTYXwSr3LpHDfXsatQL6OmSGThM5dBa3wy7BLUtaE=;
 b=kTZwGmKTGD0bYwRgHNKEBVXC3aI++3aqLUSDFXG4YMHLlxSb4bzVWAi3
 DDzgpuwUico1u6Y9Dstzdv44YGvGzj0mYtodLp2rKoFhgE4sojg+yfJo2
 iO+jso8/ueT0nrs4Lj7g9aKJRsF/2wSwVRYuc5J1FZEHN1pshtoJaRk+L
 sRGeRH7fmycqxzmrqP1dVZNzUBYjR+kb38gEs+62rjMikJPw+IzPwq/kb
 O1SzYm3AAqcXZRxHUS05Zph7bRfTU93Uk5unxFKFlLbTTKQPpeusDbg0C
 46zluAMjc/466HJQa+tH5cynRvcCLrcOVVtDEY4NI/i9N6whyy6F8+DxB A==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="192503616"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:40 +0800
IronPort-SDR: +iZCNeXCIILP8k64GiSGjo1oqMOok1byqPeKkxs6ar13AEsJZx2DGb7F8x+A+VGgaEafzuotCq
 V+48bFv6j3g4HX0G5jAmTufx8prTMYLrFocVtsi+Blf4QTcUa1sPLxHbYPyzZrSs8tMrwqNHib
 e1mVq/rcr8p4hZQS5gtV2sSlD4xtI2dqmoI+zCDu32L114s+fJII9toCUovmt+G3CUex3VZ9rq
 SDv0yqMsF4ttw37fZfCA2eQkrmbS+warj/q0uoJXPM5pmu7daZeE57L+4qkMeRoyi6/5irbsV6
 U+xZaKwf7KB6rInqVoGAI7fE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:16:45 -0800
IronPort-SDR: Vbp17h53B2aezk+6p1YE0ZKP9V1vTuDYurWxFyiX+W3UgjmcAgotaSPIQm5GlIzCPcTgA6bMsI
 HOIIkGzdI5S2DMqG3B2+d4C1VpMnbAyRdZJoUYdQ5Y07O2uHOfqcMys6cGn3UC7LlA6M8VbG4m
 ExsMNQPRxKmlhOByLsxQXtbDKQwDD9GA21iI0jtV2cUGkw0XVwgVN/oiAa7MBym+9tVxh0nDmA
 wYjvfLVT7965P9p6cB0xyrBoEg17lDMwT+8gy0isTkQn9gkg02nhlD+naeQRS+e0ABw1THLMJB
 LG8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:41 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870r3LWtz1Rwns
 for <qemu-devel@nongnu.org>; Tue,  7 Dec 2021 22:43:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1638945820; x=1641537821; bh=ayBTYXwSr3LpHDfXsa
 tQL6OmSGThM5dBa3wy7BLUtaE=; b=fIHOfkVT13kC52vFjXAtAFaiwbir4Ow5D1
 3Jo885/ISxbbBMYPxwQAz7Ne1QrlPQz5TTHL5dhTE6DrjNJZagTXuAW4+BySwVvf
 C0z7T6x7q+fhz+75H82hdvewj/86M0/qAVV54y7DZJS7q+olhCAq9U+Mi19GZ8Gc
 bTV5BmQlMowOpaUCWwwu4XXxd5iMLieN1xfQhJUMyCx5PfoA1UOjntjUPP7YQSwu
 /Ci756ddpO8EMPZVidPYUTGQFdsdOQ8t/A1WonPG46x0/OoxqQljKyIdX8pvvA5u
 BvX4FCrG28JwCg6ZAFmbv1Cyhdvk4NR6SWmmEozWO59A+24DxTXA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Q96MstHryiPl for <qemu-devel@nongnu.org>;
 Tue,  7 Dec 2021 22:43:40 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870l3VZ6z1RtVG;
 Tue,  7 Dec 2021 22:43:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 5/7] target/riscv: Mark the Hypervisor extension as non
 experimental
Date: Wed,  8 Dec 2021 16:42:50 +1000
Message-Id: <20211208064252.375360-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
References: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The Hypervisor spec is now frozen, so remove the experimental tag.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..1edb2771b4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -639,7 +640,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
--=20
2.31.1


