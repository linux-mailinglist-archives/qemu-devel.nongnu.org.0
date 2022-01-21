Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7775D495C50
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:49:30 +0100 (CET)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApbt-0004w1-HY
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:49:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1k-0000cZ-Ic
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:04:00 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1h-0004KU-MD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745037; x=1674281037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZI2frXpABrUcELOmqx8DAFsntrCSET4efSbsptjCx0=;
 b=kGqaxI1cF21ALOz2/plv7kN0dmdrs9uh7Zr7SsbPM89xQrZAaEBjwMAY
 NACa42q0o7r25hFQ333RmgeUgecPBtqaSQXSOvWBFXWyVAyVot5D2Da41
 cwX7T1iT0ELTSxX94qjvLC78zzdxsJYCqqLI9p0HGBCHrUVObe8cnKisN
 10yHOOvKOtJH6Vox8eQP+jDZBSy3hXDhX74pOTCeAX2ssYUg7rihEyG+w
 FV1mwanh2EoRJimBNWm+pWXry8j4tINMmRZUwGzKduV6lUGKcVBiXUPPC
 PYcLb3edOpVi7sFDCGOHXTy84e7crzll9tNQPrAPLajxxZu4qnpKzCRPV A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083176"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:52 +0800
IronPort-SDR: 1/+eRk2KBi0mujilovIOm/XU1O7IXrLnZY7/AbpETlbvPwl+Pgfue7m+H5E4Oeyz2DSj1bE/Cg
 7zbmxe2/wDwz/gS2OE5dtSswN0OCX2E/RZKcsLQbJigr/3LCkBg4P2mK7RLUMyR0qrj5uYsZP5
 oMYzn/LP1V+N9PkNhyrjMUhL6+oEeXf4AOgy6YkWJnSivWwOsSDqmbZ69WouSzzL+8b9UFr5gW
 +L8TL9hQUIGqvreQehVfFq6Q8URIBRS3DlGPqPOovLvG7tAaVkokQgtZImUg406uviwlPFzTjg
 2Y/8whWrwhelS7c2ovP8Sezl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:36:20 -0800
IronPort-SDR: iHAIBrFifFn/nolzWOP6yWL1xG6MKuWMb1vJP1IdRRPJc83KNHAi4FSX72uRqcn+njS1XyOogL
 kiTxCLW5yoWuacni3Gu7YO4HA56NbarjW2iYWeAsl72NxbF1AXWuIcqsz4wai0TEjOtMBJqBDo
 p5BohrYfBuvwFwte703S+KgJg6Hq4FY3CJ7MVSz2MkmYca5y2XFPyhySmIg70rIJwz+hRaaaNy
 jryKQjCd2GrgDbkMmchoE55Lgfajv1nnPPS1K7iIQ0w66aPjZ+2Zp7QOWKttmq6iZ3LZYeO17d
 vl4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg81S46pMz1SVp3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:52 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744972; x=1645336973; bh=dZI2frXpABrUcELOmq
 x8DAFsntrCSET4efSbsptjCx0=; b=jRY7n9Yfsg+df9LOUw9T5xVYHEWZuPSiMx
 rgtuMARYV9G1QUaJso6KZEaIw4XTMPSQnrkji2CH/U5Rr2X5pdOQV96TZTLJ7JzX
 h//Jk+Rb8vHnqGWvi2iJVaZipKLecUBFyzbCv3U6SrSDXNqiGbCKwqtbQ0U9WMby
 iyMuY7hcAEkKOVbHWJccGrYgApO4hFG558NE0fbVR25Ul5VbTqfXfomKCcUSuxfB
 IDZ4gxYjTt/O7fyXwaYRpa7wBgorda+sYiHWZoqUFnraabqqCqHuNQ0UNpe+PT3W
 /KKx+1aO7wrtOGW11Vmxzt0dPjzveSS8ygv/VApiSncczpzgqH/g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id MtpnbE34nkaI for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:52 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg81N4ShPz1RvlN;
 Thu, 20 Jan 2022 22:02:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 60/61] target/riscv: Enable uxl field write
Date: Fri, 21 Jan 2022 15:58:29 +1000
Message-Id: <20220121055830.3164408-61-alistair.francis@opensource.wdc.com>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-23-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      | 28 ++++++++++++++++++++++------
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5a6d49aa64..7c87433645 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -449,6 +449,9 @@ typedef enum {
 #define COUNTEREN_IR         (1 << 2)
 #define COUNTEREN_HPM3       (1 << 3)
=20
+/* vsstatus CSR bits */
+#define VSSTATUS64_UXL       0x0000000300000000ULL
+
 /* Privilege modes */
 #define PRV_U 0
 #define PRV_S 1
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b11d92b51b..523d07a95e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -496,7 +496,7 @@ static const target_ulong vs_delegable_excps =3D DELE=
GABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS_S=
PIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS | (target_ulong)SSTATUS64_UXL=
;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
 static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MI=
P_UEIP;
 static const target_ulong hip_writable_mask =3D MIP_VSSIP;
 static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP |=
 MIP_VSEIP;
@@ -572,6 +572,7 @@ static RISCVException write_mstatus(CPURISCVState *en=
v, int csrno,
 {
     uint64_t mstatus =3D env->mstatus;
     uint64_t mask =3D 0;
+    RISCVMXL xl =3D riscv_cpu_mxl(env);
=20
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
@@ -583,21 +584,22 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW | MSTATUS_VS;
=20
-    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
+    if (xl !=3D MXL_RV32) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
          * add them to mstatush. For now, we just don't support it.
          */
         mask |=3D MSTATUS_MPV | MSTATUS_GVA;
+        if ((val & MSTATUS64_UXL) !=3D 0) {
+            mask |=3D MSTATUS64_UXL;
+        }
     }
=20
     mstatus =3D (mstatus & ~mask) | (val & mask);
=20
-    RISCVMXL xl =3D riscv_cpu_mxl(env);
     if (xl > MXL_RV32) {
-        /* SXL and UXL fields are for now read only */
+        /* SXL field is for now read only */
         mstatus =3D set_field(mstatus, MSTATUS64_SXL, xl);
-        mstatus =3D set_field(mstatus, MSTATUS64_UXL, xl);
     }
     env->mstatus =3D mstatus;
     env->xl =3D cpu_recompute_xl(env);
@@ -898,6 +900,9 @@ static RISCVException read_sstatus_i128(CPURISCVState=
 *env, int csrno,
 {
     uint64_t mask =3D sstatus_v1_10_mask;
     uint64_t sstatus =3D env->mstatus & mask;
+    if (env->xl !=3D MXL_RV32) {
+        mask |=3D SSTATUS64_UXL;
+    }
=20
     *val =3D int128_make128(sstatus, add_status_sd(MXL_RV128, sstatus));
     return RISCV_EXCP_NONE;
@@ -907,7 +912,9 @@ static RISCVException read_sstatus(CPURISCVState *env=
, int csrno,
                                    target_ulong *val)
 {
     target_ulong mask =3D (sstatus_v1_10_mask);
-
+    if (env->xl !=3D MXL_RV32) {
+        mask |=3D SSTATUS64_UXL;
+    }
     /* TODO: Use SXL not MXL. */
     *val =3D add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
     return RISCV_EXCP_NONE;
@@ -917,6 +924,12 @@ static RISCVException write_sstatus(CPURISCVState *e=
nv, int csrno,
                                     target_ulong val)
 {
     target_ulong mask =3D (sstatus_v1_10_mask);
+
+    if (env->xl !=3D MXL_RV32) {
+        if ((val & SSTATUS64_UXL) !=3D 0) {
+            mask |=3D SSTATUS64_UXL;
+        }
+    }
     target_ulong newval =3D (env->mstatus & ~mask) | (val & mask);
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
@@ -1380,6 +1393,9 @@ static RISCVException write_vsstatus(CPURISCVState =
*env, int csrno,
                                      target_ulong val)
 {
     uint64_t mask =3D (target_ulong)-1;
+    if ((val & VSSTATUS64_UXL) =3D=3D 0) {
+        mask &=3D ~VSSTATUS64_UXL;
+    }
     env->vsstatus =3D (env->vsstatus & ~mask) | (uint64_t)val;
     return RISCV_EXCP_NONE;
 }
--=20
2.31.1


