Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1355333A4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:47:32 +0200 (CEST)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdJL-0001u8-2A
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGd-0007OU-FO
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:43 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGb-0002Yr-Bu
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432281; x=1684968281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q3zJe42AlWYKfhGcopI+NrbknplcUCXqLBX8KqDhxZM=;
 b=eZZkv2HkPqkxSK5xAtrZsBmHKvatCqMXbFIjomfk0t3HnHU/oCV57Ctl
 T6cRHQul+BmsV7SsbYL7CeeU3IhnhddnGqX9RF/hvwQ/eZUlAxQeIF4Oj
 vpuqrg/UqnOREkgfvfLqJ03qIbUoaqAoq8WUIJ/YYqe4XidxkD5HSPcv/
 /YpiIDRiCvgmMhiEYOlpXs6sA+oe6W44oVZndGRSl8UBeb6uSgiG0oqtO
 9hq1ze+aLSsKwLTMlv7/s8aKOKJPccpGHUrc8vqLAh+Ahf5y5o+NQ69I/
 4j1cJEy8c4WAZY3LXmi/ix8d8M3C6kMF3uIM9ycWDwlxJ83zUomtEPWH4 g==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566649"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:39 +0800
IronPort-SDR: BfY2gAmlmV355Lw2+7uixlniQg9IsYnz298RxtIxYC+nuHkjjwE9wbdHp7kIrPeTxcCLtyJm0b
 NXDHsdl7yWYIUUHGGrB9HPvMt8HEDNjFT/WusJD092UQHZlRZnoOAIQEWD5MFzyipyja4dSiNi
 urhE5hgLhjj8tCy/XtP839y78ZDiEZHsvQGX2vmE9etjntMvTL2+85j8jHHIuMLoUhFItpPAGA
 wDXYuflOYCvth2CTU1d9/yOtanEC8HojQR04RI/dNrQDOgEGgBznWht7X6A3SjQcZpk/vJd7/g
 2QJIA46rFLK3qFjv0hTbPpKs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:10 -0700
IronPort-SDR: SAJ5/9/mSse21JhXIzbaC0PVlMnqje29VI42TxVQr/AOgDx1WY5k5akT3RiUSKFdqvmXmaXHt3
 gxXK9aQ4ae8gpYLTl3I9GyQHAdcrKORWfuUAzdE0Q6/805lSrHwav6y/bsaaqHL/77HRmiDI/n
 LIGhOVI8eaz8aFOXDb8COQPy6Tv8vy10QHUvEnPq+eI6Z0aSd/BGvssY7jvHwmfZpU6PaAzMmr
 Jr+v0kntK3BVLa2Ct2QL++pqJR1gIDTs5R4imnwdgBFnQBftL38mDI62+vDgvZEqV9YuzE78uI
 yzk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78QZ2yDSz1SVny
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432277; x=1656024278; bh=Q3zJe42AlWYKfhGcop
 I+NrbknplcUCXqLBX8KqDhxZM=; b=o72cYuiuSdj4pUmVaXcr0HbfVP9mDrer5L
 m+tkBRdNIQDD0BoTqW1oLC8Gf2Ev1hRH2ZCcBZ5d5E05BHVzQ2S1A88xOzdYZYQh
 cr4CKj2rA+gv8NI6aDomYGGN/HFnSDWfEDj3OR7ozRq2msxMjh7s2fQ5Es6AtgU8
 hC9EWBF+AdD/ijZAR0wTLI2btAKrnwVUE67p/7DLRnp6DFLe2gs0g+PP77OxluyQ
 RoNeNW+9h7stm+Qxm09EukPcwWb1bVWYeoQH2jTpwXvFEG1J2amPQzD+wv9aI9Dt
 ZQ2vG+N1YdwvQd0C3dSN+O836RTE22kVOSqi8eIZLapldqdd2I0A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id zdyBlbEavj7u for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:37 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78QW5hLBz1Rwrw;
 Tue, 24 May 2022 15:44:35 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Dylan Reid <dylan@rivosinc.com>,
 Dylan Reid <dgreid@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/23] target/riscv: Fix VS mode hypervisor CSR access
Date: Wed, 25 May 2022 08:44:06 +1000
Message-Id: <20220524224428.552334-2-alistair.francis@opensource.wdc.com>
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

From: Dylan Reid <dylan@rivosinc.com>

VS mode access to hypervisor CSRs should generate virtual, not illegal,
instruction exceptions.

Don't return early and indicate an illegal instruction exception when
accessing a hypervisor CSR from VS mode. Instead, fall through to the
`hmode` predicate to return the correct virtual instruction exception.

Signed-off-by: Dylan Reid <dgreid@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220506165456.297058-1-dgreid@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3500e07f92..4ea7df02c9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3141,13 +3141,13 @@ static inline RISCVException riscv_csrrw_check(CP=
URISCVState *env,
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv =3D env->priv;
=20
-    if (riscv_has_ext(env, RVH) &&
-        env->priv =3D=3D PRV_S &&
-        !riscv_cpu_virt_enabled(env)) {
+    if (riscv_has_ext(env, RVH) && env->priv =3D=3D PRV_S) {
         /*
-         * We are in S mode without virtualisation, therefore we are in =
HS Mode.
+         * We are in either HS or VS mode.
          * Add 1 to the effective privledge level to allow us to access =
the
-         * Hypervisor CSRs.
+         * Hypervisor CSRs. The `hmode` predicate will determine if acce=
ss
+         * should be allowed(HS) or if a virtual instruction exception s=
hould be
+         * raised(VS).
          */
         effective_priv++;
     }
--=20
2.35.3


