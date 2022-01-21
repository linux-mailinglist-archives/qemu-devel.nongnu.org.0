Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA7495CD8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:32:42 +0100 (CET)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqHh-0005s0-O0
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:32:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1j-0000Zs-9k
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:59 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1h-0004AK-Jc
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745037; x=1674281037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kTpQPSuY1qtuTV+1mq+AHYohvMuxfstaDsnFnRDkH6U=;
 b=Mi+hqSCMDpCkPypT7CUrgQ4d0eUSzKphKBnb9rLKGhbkyYqb4k97eINO
 UN4izKSfuuQ9x71rvRbm9xraV/eACm2I9qSgfwZf7+N4i9/sogET1OxBa
 7855K/XHw6J4SqIWk3nEfkhRwGCeuARxPXbYZVuhS387oLdxNGtlvopmK
 Uwf+jGyYY82XVw5Hx54s4Nib11UNon2S2LlvQX8AFoY775NIBOnO/3rAD
 eQ3I/jsmEA1eyY1K61d9vpiQWXSYVikI/iBvXftldzazeL3Sc+lUxwB/G
 VWrIML1Zdtr059TpmO+/VQdrldZ7gXE429r4ES/x3bjdKK0EjpiZSJE6l Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083178"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:56 +0800
IronPort-SDR: e+XzDLdTn3QjImg6UIvXq+tkPQOLFWku/fOdKpO2HFudht2H4e0fdt9jweOM3gLh7Vs+O8Ly4U
 z7cqppDR9W/yfeQr6cxmDN/NsLleQ4w+XlS3+HiUfjB/kRFAjVOIx+iKAQWUWEi52kAdFUkuUS
 Z/PKZol4xqynhtLSJ2FeH6CpqkqMe++ynqSIeskDfSDGMONc2QCPphj16gTShdLhbEXxzHehy+
 iHDtPZ21i4VTl+NwHopRvvQQLkNx8Q0SsK5yhGgVJZUbR/29PLQ6pT2hqsCNE9Q9vA30Yj31a/
 eklrs+DNbxm3KchABX3ISFrY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:36:23 -0800
IronPort-SDR: 2jtElZCECDwv+G1EhsjtmxgIyGmsjJo3+JLEhM9jvJZHaA5OlShYCu4V90pdKMWYRUTi/N0Dyq
 yK7l8mOUWVgUB6boXVeClx8CucSrkw5TcOXosIxo9qVT9cBM7ZbzUF92moU45N5pNWLOvpWRQD
 I9wX36I3xlYYZpvGLXJ8lZA7e2ovlj/SJ4KMGHQDK66KludXu1t4AmmCdT2HP+PNHrJlZBoWie
 GyFztG4Vlh7hIIseVVW8pORxnu72/5sSSxRGIsT1lr7INucAQ+DTho/SKBLJHkpMXt4Revvvqd
 LYI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg81X03n6z1SVp1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744975; x=1645336976; bh=kTpQPSuY1qtuTV+1mq
 +AHYohvMuxfstaDsnFnRDkH6U=; b=dT5TshaUuImWqoS9X1OrzodXoVUUaMJgzz
 0gRSs8DyTHZIcLQ0W4NxxAIhaM2ohWZtD1ub4bzAwX2+Y7LCF/7IXRsdyYLy0mM0
 SOzh4h5T7i8B+/z8+/qB+XVYkvgxePohhMl4I+NJtZsm1CyDKWPNjjbLcSLYSMtH
 M21Y5qcByS94GKCrTt9tqJV0FP99mDQTVjMypR9mXMvxhBFlajOoleMtTeJ8lE/I
 kVbITi2g5SSlbVW720yQaS6bYVIDP4iDUBhePak6WCuWcuLDQGWwcaZB5u5bzk13
 6YdXDuphF7lcf7wllL8xWoFx41yNZ4QXMgwi4BgQPWjosxccNl9A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KDIRQ0rDE8qy for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:55 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg81T0JRcz1RvlN;
 Thu, 20 Jan 2022 22:02:52 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 61/61] target/riscv: Relax UXL field for debugging
Date: Fri, 21 Jan 2022 15:58:30 +1000
Message-Id: <20220121055830.3164408-62-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-24-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 523d07a95e..e5f9d4ef93 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -584,7 +584,7 @@ static RISCVException write_mstatus(CPURISCVState *en=
v, int csrno,
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW | MSTATUS_VS;
=20
-    if (xl !=3D MXL_RV32) {
+    if (xl !=3D MXL_RV32 || env->debugger) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
          * add them to mstatush. For now, we just don't support it.
@@ -900,7 +900,7 @@ static RISCVException read_sstatus_i128(CPURISCVState=
 *env, int csrno,
 {
     uint64_t mask =3D sstatus_v1_10_mask;
     uint64_t sstatus =3D env->mstatus & mask;
-    if (env->xl !=3D MXL_RV32) {
+    if (env->xl !=3D MXL_RV32 || env->debugger) {
         mask |=3D SSTATUS64_UXL;
     }
=20
@@ -912,7 +912,7 @@ static RISCVException read_sstatus(CPURISCVState *env=
, int csrno,
                                    target_ulong *val)
 {
     target_ulong mask =3D (sstatus_v1_10_mask);
-    if (env->xl !=3D MXL_RV32) {
+    if (env->xl !=3D MXL_RV32 || env->debugger) {
         mask |=3D SSTATUS64_UXL;
     }
     /* TODO: Use SXL not MXL. */
@@ -925,7 +925,7 @@ static RISCVException write_sstatus(CPURISCVState *en=
v, int csrno,
 {
     target_ulong mask =3D (sstatus_v1_10_mask);
=20
-    if (env->xl !=3D MXL_RV32) {
+    if (env->xl !=3D MXL_RV32 || env->debugger) {
         if ((val & SSTATUS64_UXL) !=3D 0) {
             mask |=3D SSTATUS64_UXL;
         }
--=20
2.31.1


