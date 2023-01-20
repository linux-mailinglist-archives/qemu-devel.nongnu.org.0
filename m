Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B74674E91
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1t-0002KO-PM; Fri, 20 Jan 2023 02:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1d-0001lE-OC
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:25 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1b-0004pU-Oc
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200483; x=1705736483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6zDRbpI+Q7JXwc0jYAFaDT8R3hpXBbhu63OtfuPQzPs=;
 b=PIZYdpSG2hciffsbWGw+NQ0eN+0epJth0VQcKJ54isbOZp3gCrGhf5WH
 Qbruqc/JwT6j3zHdJxbifMgnHNJcxD8xMSkHggr/t25qaHSSNbmq39RJL
 tRkWnLxyRS9SC84BPR18CXVR3cdhWE2b+jrC8TFgFoD7mZe7K7Q3L4loU
 GNz0h8tS2g1al9lirq6BQ8OL94K2a6z8pt6JSSH6yWsXbCFLY3A7VCucN
 IO2OMSETts6P2/4bXmL5ID1NzksldXDhQPq0PlRpGDhrGwstuSTUzh55B
 VfoKJNk9ayEVWvRsaTu3MQyzRBdK5bzaQQFGu6g17LslwMsfZ56U4gyxV A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176763"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:28 +0800
IronPort-SDR: XVxharFxMeTIltt56Wp9/fwARMXDrXV7gIGxFWYIEdZ8Vg5jCwfbK6hYnD+y1pKyegM6DYNndr
 W5dWE+7+N0BOyvDy/NX4UR/N1QYYZY+z8Phsj5CQgjQR+K89IKSby/4nfLElOIJ5tpRqVHOTfx
 RDt3QyTJAyF0PABmNWwgloz/BSzluACPVfjSpUYZzmVW2UAlrt4fEFFL8Oe8AHz91vtRbRCgaX
 CYxn2+AbjIiXCSgAWkiYjh5Ort1Dw2a2A5GU4jM+9sgXBgeYM2BwUaI1G19uzOSUxwCvOjw7li
 zKc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:06 -0800
IronPort-SDR: f+pbCCh3Jv07JQGbXX+5330CnP6XFHCIiCGOU8Wsy1JHaXcsNAWDfOHPV+NiemVyq7mz7XPGAb
 kzSVB2mqX1DAZMjb+ig/cL3rTdGt137P4aaJPdHmi28bdQiizWSqUx/9fuRWhtYo85uLV9JkLk
 PMVdhaWOI6Rb61Dl7B9vWTpHkBcW+WT20ZxTWtPJa8/+X1ydedKsF3oWqOpEi57SPWUd4ZQ2yH
 nbqPFPCWvTufL98BXrsOF8V+Ju+MaZRX9VCG3VcrZsxSPpdPpqC3JF9X+n0ykj2395PFXyhD8l
 Rb4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyry42YYXz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200427; x=1676792428; bh=6zDRbpI+Q7JXwc0jYA
 FaDT8R3hpXBbhu63OtfuPQzPs=; b=AjRJR3H9RuVxIzpmdjr/juB02D1jszT7ER
 d3xI+wH1j1eWDmCCUfhmRxleVUwofLrmkbRq2lGKQ8JfGHBa7w8dKuXHs65LVs/q
 j+VdjSL2jWZ6oY7KLaygLI1cNxTwu6JH7oBWE7RBqofZe4ZYUzQfq1Bj5SQNYdZV
 z2zG40dokCChrX0yxGAo85JOvsBBgmfgXO9VfqS3V35+vNhyXhX9H8YbdMvIWqHN
 6WR1ey7JTxWBedOwSh8z74BcivttqU4UNV7HS9PJ6W326gXchqX4pphMyiFdlOKz
 lmhYQgps5LwJR3lmcAQVYtOgvzmuWDJhEVvxJd7miHo7ZA6VOisw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id f4C88dvVWV5d for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:27 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyry24ZBLz1Rwrq;
 Thu, 19 Jan 2023 23:40:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Andrew Bresticker <abrestic@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/37] target/riscv: Fix up masking of vsip/vsie accesses
Date: Fri, 20 Jan 2023 17:39:08 +1000
Message-Id: <20230120073913.1028407-33-alistair.francis@opensource.wdc.com>
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

From: Andrew Bresticker <abrestic@rivosinc.com>

The current logic attempts to shift the VS-level bits into their correct
position in mip while leaving the remaining bits in-tact. This is both
pointless and likely incorrect since one would expect that any new, futur=
e
VS-level interrupts will get their own position in mip rather than sharin=
g
with their (H)S-level equivalent. Fix this, and make the logic more
readable, by just making off the VS-level bits and shifting them into
position.

This also fixes reads of vsip, which would only ever report vsip.VSSIP
since the non-writable bits got masked off as well.

Fixes: d028ac7512f1 ("arget/riscv: Implement AIA CSRs for 64 local interr=
upts on RV32")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221215224541.1423431-1-abrestic@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0db2c233e5..270de7b1a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2305,22 +2305,15 @@ static RISCVException rmw_vsie64(CPURISCVState *e=
nv, int csrno,
                                  uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t rval, vsbits, mask =3D env->hideleg & VS_MODE_INTERRUPTS;
+    uint64_t rval, mask =3D env->hideleg & VS_MODE_INTERRUPTS;
=20
     /* Bring VS-level bits to correct position */
-    vsbits =3D new_val & (VS_MODE_INTERRUPTS >> 1);
-    new_val &=3D ~(VS_MODE_INTERRUPTS >> 1);
-    new_val |=3D vsbits << 1;
-    vsbits =3D wr_mask & (VS_MODE_INTERRUPTS >> 1);
-    wr_mask &=3D ~(VS_MODE_INTERRUPTS >> 1);
-    wr_mask |=3D vsbits << 1;
+    new_val =3D (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
+    wr_mask =3D (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
=20
     ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
     if (ret_val) {
-        rval &=3D mask;
-        vsbits =3D rval & VS_MODE_INTERRUPTS;
-        rval &=3D ~VS_MODE_INTERRUPTS;
-        *ret_val =3D rval | (vsbits >> 1);
+        *ret_val =3D (rval & mask) >> 1;
     }
=20
     return ret;
@@ -2521,22 +2514,16 @@ static RISCVException rmw_vsip64(CPURISCVState *e=
nv, int csrno,
                                  uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t rval, vsbits, mask =3D env->hideleg & vsip_writable_mask;
+    uint64_t rval, mask =3D env->hideleg & VS_MODE_INTERRUPTS;
=20
     /* Bring VS-level bits to correct position */
-    vsbits =3D new_val & (VS_MODE_INTERRUPTS >> 1);
-    new_val &=3D ~(VS_MODE_INTERRUPTS >> 1);
-    new_val |=3D vsbits << 1;
-    vsbits =3D wr_mask & (VS_MODE_INTERRUPTS >> 1);
-    wr_mask &=3D ~(VS_MODE_INTERRUPTS >> 1);
-    wr_mask |=3D vsbits << 1;
-
-    ret =3D rmw_mip64(env, csrno, &rval, new_val, wr_mask & mask);
+    new_val =3D (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
+    wr_mask =3D (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
+
+    ret =3D rmw_mip64(env, csrno, &rval, new_val,
+                    wr_mask & mask & vsip_writable_mask);
     if (ret_val) {
-        rval &=3D mask;
-        vsbits =3D rval & VS_MODE_INTERRUPTS;
-        rval &=3D ~VS_MODE_INTERRUPTS;
-        *ret_val =3D rval | (vsbits >> 1);
+        *ret_val =3D (rval & mask) >> 1;
     }
=20
     return ret;
--=20
2.39.0


