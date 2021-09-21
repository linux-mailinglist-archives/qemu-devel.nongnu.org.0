Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D48412F24
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:14:33 +0200 (CEST)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZz6-0003kE-M0
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZhR-0000mB-TA
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:17 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZhP-0004v9-07
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207373; x=1663743373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nc1H530GQPzq8B79DKLF9sqJvYUxNOlxajGS2SZHoi4=;
 b=TxhJBeghtS+FzkMkjLW1GwfFQmEWCg8si8qONWjgXFmTd9P30bdwXTO3
 vHe2r6IGsgby0fegUTf6xYiDnUBozH0dYWcVioMXzvVddgR31QPuxTIlT
 rYjyLk87i0fuRG2Hr7RV9ciFG75JTu3y4xaS/yIjULgFFIpQ4xrHNtLTq
 YcniCa22ww+nFgPyWbGGLYCdsUeS4EsGQxINWYJBGHwqUuDv1oPvHRyEF
 wat6VyjmKD4idxKHMP1t/5HSzxg2yRpAjvt/1+jjgor+Mv2cb+Giospki
 Cji5GTne88tWaHO6ejIsUlpH6ya/kZrdAxL8SVQpfTe1JC5/p7AO6wxzR g==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="180529499"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:56:12 +0800
IronPort-SDR: oSw6WJ2IgRN94G0End+1fAqRlY1mXHQE/mjQAuPjaJYOLsb392hVPC/Md60A3zWk6bHcdvsCtw
 bXU2y9PMxLhZ9hJadNS8xWiW7PeW7iucR+TNnEkHTuA3Fv+FKaPm8hOzlPuF+YNYt/7jgUBiPk
 hHflLWgVyMLH5I/ulHx4YcQcPlARPLRgms/ut5VWJ0+P6pkjG0YY6uty5BOD8rYnH4CKpv3izR
 Fw/8XHeHc4XZNLNBdcsLtHCq3vKsvz3pyofhZrKSkA7lRRbVyRzRDTDsFPkL9NUFgPJZMyJ4sh
 3N/5oyC6vbX/L+eWWDFzJmb4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:30:55 -0700
IronPort-SDR: xtzqsnKi0jyWlO3JlGjJViGIOvf3hHKMbrJ/YWnNWodsOzPuW08CsD8CYNTJvucOSfY2HyW6hw
 QXkKm4ftAjUFiR5C4GjgYV8GoU2RXorpcOO7GY+yE2e4Niom02KBIRaroRpmUMJSV/sv3VS5FG
 HR2ppGiUJnP31FtPRxykJscVYUcJI3XMR7kN5zU/vvmYhcB4ccGBjNhP331JyPAUPUbWh5kkXO
 STZzt0M5OwJA3FO2OHLUxpUS8E992fb9b659Y9MDMtrjlmmI3pa47UChkRYHB8f9BtF3u5fNvy
 GTg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:56:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBzL0Nsqz1Rws0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:56:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207373; x=1634799374; bh=nc1H530GQPzq8B79DK
 LF9sqJvYUxNOlxajGS2SZHoi4=; b=ICJntC00c6Ts2d8JSPubnaM02+xer7kK8M
 LEuQlmEMv/Qaq0sadHvc7j5Q/JnFE0Rdki5mvAYbXdRqjC9TVOGyBLyRs5mQb+f5
 jjfD58v+cvzXvtq4H8SdAFbYZHp/bZvAWDewfnl9PSE5h2+gDywIXW3vbB/iMP0n
 yDe3M4oB3Unyxb6BGnTIoW2EcSrjjRxONL3ZT74zqvoCMAYGt2K6nXWI1OdpOz4f
 K6H28hM0tR3oQaz4w8WUXTsToB/NspBt0Sg29GLbIXMGjywiKF7VxeezpCQ8kTdY
 NBulgd5yDy04c69oNH5bkNqSgv43yONT3uEvFmZl/qIUYmzgv+Mw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id MCZraBDu0zRs for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:56:13 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBzF4yHpz1RvlH;
 Mon, 20 Sep 2021 23:56:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 19/21] target/riscv: Backup/restore mstatus.SD bit when
 virtual register swapped
Date: Tue, 21 Sep 2021 16:54:10 +1000
Message-Id: <20210921065412.312381-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

When virtual registers are swapped, mstatus.SD bit should also be
backed up/restored. Otherwise, mstatus.SD bit will be incorrectly kept
across the world switches.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210914013717.881430-1-frank.chang@sifive.com
[ Changes by AF:
 - Convert variable to a uint64_t to fix clang error
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 701858d670..d41d5cd27c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -106,9 +106,10 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
=20
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
+    uint64_t sd =3D riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_S=
D;
     uint64_t mstatus_mask =3D MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL;
+                            MSTATUS64_UXL | sd;
     bool current_virt =3D riscv_cpu_virt_enabled(env);
=20
     g_assert(riscv_has_ext(env, RVH));
--=20
2.31.1


