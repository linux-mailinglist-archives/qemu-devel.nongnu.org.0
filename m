Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640C65065E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:27:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jK-0008Rn-EE; Sun, 18 Dec 2022 21:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jI-0008Ra-UO
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:12 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jH-00015O-CM
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416291; x=1702952291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=icpZO5Thn7rLQmM9zLyvo4epmOEtTo4HPzPsWRyUaiM=;
 b=QohMPSvtQCBwNvtH/bWlsQynyliAmHU2Y15vuNLIQV4ospnc47d4RrmL
 G/B35JjP4J0hGoZknCRLQqbc1F5li8ohUefjzZ3sAmmR3IJs2R44ZJeB0
 N/hxcrqKp3s9H+ayftgiiEMscuc/aE9IjfhyMA73rQZc+SDlWhkBNMce2
 NWDqYsvQvNJ1zZYxupMMxlQ1GxIAwFwVtA97AunzrNR2Oo+NtwvIB9X4C
 vSRy3ycvxmfODSRrjaF3U2a9mSB6viCKsKNMVNatVyqIXMA+XfJvpdsQ4
 oVZqMTF2GbMbkbL/DPLA7dpMQQJRK8hrje/sG5FbFY2UvxqklDbkqVnDh Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199338"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:55 +0800
IronPort-SDR: /vvWmAOOFrC5Gk1pSySYcbssTCCmET7vNXhqGokC+3ZvAY083NKPiehm2HsZP5IUcpYQwAMaji
 lQCiTbmCRyRl1/zAOLHT4xghADYXo2JtMp7tyM0Qsn7ZBRYYAQvd5n+mTxePDI841vjqkpauYG
 MnwnFCDxmZl7xZN2aKHInwFxixn3HD3M3HJ9XRZ5SBLRD9F6YNw3F/SHObahxvrQpszt2ynFOw
 ibOfiAF1GA8Jqk/gC0PyZBLOa9qfgQbLuAiKLwzDTeIJ/lAbfgT1D7oZT+73m2lgwobd+Ztify
 p5w=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:28 -0800
IronPort-SDR: 76bmp/qpuGaZxx/iZOY6WO3j9c6h5dIHujIWqwaUb8RAyhP/RL7Kxus8xQjRgFxcHGfB6x+umc
 E2HYbQb5DNf/F30KWpW/iiwaGnToE1O+hPgXWEK4kCWVAgvvMtknPcPeouY90s+nvvbbTM+bmX
 aYmq+yHPZAqxFWYREtJ6nJy159VNXwf5vGo2hyXBMmaJ9M12BieNF6J52sVnrD1X+YtEDa1Z8J
 Wn7aPt79z77HR8UR24U3Vh+yutjG/RVqGTDz66wLjxdq+7aQB4dH7IPG9Cg8tXrCkngwyR7VY9
 RwI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Jg2SVWz1RvTp
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416275; x=1674008276; bh=icpZO5Thn7rLQmM9zL
 yvo4epmOEtTo4HPzPsWRyUaiM=; b=Ygjqv8T2SNROyiv/98kW6GWvX3Yl0I4UJt
 06qdLWOwk/nVbmxVhUNUyachAKX7doGYebQ99b1EJMBv2AQwEL6rSHkoYyvQjZyK
 bsOuxORK1NxLkvzONjjUX15VRwNoVWpfXmR+Q1OOwBq+rdjSsD3jR0tHqsCIO5UP
 nN/U+wK1akyUfUsBwLGZwaXrJmMAoNUeP/G/1qYhF0Pc3TsNwYDIHqmI6kFqsPvv
 1J0JNYzp3APRpP0pcm5Gg+8DY9KYnMVwNgTn77yCDnUsypjO/bgrECDy7Ldj5jyr
 i43nTLQrVe9UbmDxukuOKze87zcvTZMPnI2XCotLArWB/3zF0zgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nXwOmn1id2gU for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:55 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Jd2rmWz1Rwrq;
 Sun, 18 Dec 2022 18:17:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/45] target/riscv: Typo fix in sstc() predicate
Date: Mon, 19 Dec 2022 12:16:35 +1000
Message-Id: <20221219021703.20473-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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

From: Anup Patel <apatel@ventanamicro.com>

We should use "&&" instead of "&" when checking hcounteren.TM and
henvcfg.STCE bits.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221108125703.1463577-2-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 71236f2b5d..0db2c233e5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -940,7 +940,7 @@ static RISCVException sstc(CPURISCVState *env, int cs=
rno)
     }
=20
     if (riscv_cpu_virt_enabled(env)) {
-        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
+        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
               get_field(env->henvcfg, HENVCFG_STCE))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
--=20
2.38.1


