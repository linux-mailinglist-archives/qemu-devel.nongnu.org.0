Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2330547A444
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:19:23 +0100 (CET)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzB50-0005Q9-5o
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:19:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAl9-00013C-Mh
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:51 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:8708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAl7-00089p-NY
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976330; x=1671512330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1XM4WXTYYxq332fLcsFyKel5YTv9fHUEI36sIy1ANVc=;
 b=LfxQ9p852nZFbJqst6bcCjO+hvkZ58r3jjidNzitOfL7wtxnGnHIomxA
 gVxWzw3Oiw5r2hZgmzzii58gSphq8leMcyoNpXiy/0ZsQRMhROYcE3GgY
 5o1Aur3sHaUZEYyElxTSLF2aLByB9bCCcOlZNUuUdcq51Waq+H2wueqDM
 NlVG7R+AX5Xof3eW/Ceijpf93N53LJzBMi3ylBzCONfmVt6PcfGF+ZaTc
 O4McX/X63wn6wYC38ZOeh5uPv2+72DiDo0c/JamAcZjtUL+wSNqp93cDN
 g5E+OH7UGrvH92vvEbPKZh1fJCHt3idBobxSFaXlcdxvgH5mkW2SnnPyf A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680006"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:49 +0800
IronPort-SDR: f17uJkutMKVyats1VmbEG4iqCnS3oReCMAOtQDrR2/g+af398McaAWb5nSLfhel702J80FA+S1
 7CFURGmg1rc7ZK11lhdOTqkuTFZMuIAnYLAvYJBZMs13ne8tU/7yBe3JDW2fMbmghy98Utyhb9
 oiErhxbUR3a6ndc7+9jdUinplBRJNEsIu9vvHBK3ekt1Lc9DtFwAsFzIuKPqI/poO7nRNgv70R
 soKf9eEOrUlebGIIj5Gl3mBl5NCv4fw4a2sGzNjWQD/CQ9rVSrXs5xqhutXnvSY3d+W4qunsIv
 6g5hKm1+y+VEoc5RHIcC8X83
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:04 -0800
IronPort-SDR: O+FhyYrx85Tk+YKIuATJHutgAOVmTwZBz9ntZemdjybcTNnI7PPnparRNzhniU2u8LI+SP8W+m
 TINXnr0vmLcqxpqVFZY5bDJF1rugFnPS2xx97CwHnbbRkOYvOs7lznCwvvBDE3jexIQxSN5D0S
 vdrO9vy21MTgohiWerHDewYQ5GD6CvXkjUG1F8mJyOlzYciDgsZIgtlxE9h9d+jeIZfBQtp558
 NSdjeB0BA0ncLnRcCSvynumTVJqPthJ1lcZHTTmjNK+VS2GK+a6H27PIECOL1Zd9I7HbATGI/C
 SRk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS6J1lmxz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976327; x=1642568328; bh=1XM4WXTYYxq332fLcs
 FyKel5YTv9fHUEI36sIy1ANVc=; b=GXNfEMxym4Dt0PytuGb6WumYS3h2U0T92D
 v+NsT3jqehcRrDbgvId9g5Dqp9sUviaY3CswIj8koPKgJ2HVHYEDxJtnMGucZSNK
 VCZ9oD4Qa4WJHUln5vcXE5B1TF+yJ76ypnNSu+f897UUkHbzk/NuVmQ2QqTWSgHf
 vFy7W8EymdLIY1Xz/ubp6wiCOeFGTKz8r13pZ3hecikuuIvayLk+LS5/sNOwzzZA
 ihgtcJIdwux7FKJJFDRrSJWiyaZ09TgNIgV1he9Ubu8wu3GkkEEt3/bw5nANpy2z
 3lzAB7PMhYPLNX+aY8kWe+INEiEzLgOWuAnq/2yJiFpjBsYyzAJw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id j55kdGygYfTq for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:47 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6D31jjz1RvTg;
 Sun, 19 Dec 2021 20:58:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/88] target/riscv: rvv-1.0: add fractional LMUL
Date: Mon, 20 Dec 2021 14:55:58 +1000
Message-Id: <20211220045705.62174-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

Introduce the concepts of fractional LMUL for RVV 1.0.
In RVV 1.0, LMUL bits are contiguous in vtype register.

Also rearrange rvv bits in TB_FLAGS to skip MSTATUS_VS (0x600)
and MSTATUS_FS (0x6000) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-14-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           | 26 ++++++++++++++------------
 target/riscv/translate.c     | 16 ++++++++++++++--
 target/riscv/vector_helper.c | 16 ++++++++++++++--
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index eee2a2b19e..17414bfff7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -102,10 +102,10 @@ typedef struct CPURISCVState CPURISCVState;
=20
 #define RV_VLEN_MAX 256
=20
-FIELD(VTYPE, VLMUL, 0, 2)
-FIELD(VTYPE, VSEW, 2, 3)
-FIELD(VTYPE, VEDIV, 5, 2)
-FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
+FIELD(VTYPE, VLMUL, 0, 3)
+FIELD(VTYPE, VSEW, 3, 3)
+FIELD(VTYPE, VEDIV, 8, 2)
+FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
=20
 struct CPURISCVState {
@@ -403,18 +403,20 @@ typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
=20
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
-FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, LMUL, 3, 3)
 FIELD(TB_FLAGS, SEW, 6, 3)
-FIELD(TB_FLAGS, VILL, 9, 1)
+/* Skip MSTATUS_VS (0x600) bits */
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)
+FIELD(TB_FLAGS, VILL, 12, 1)
+/* Skip MSTATUS_FS (0x6000) bits */
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 10, 1)
-FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
-FIELD(TB_FLAGS, MSTATUS_HS_VS, 13, 2)
+FIELD(TB_FLAGS, HLSX, 15, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
+FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. =
*/
-FIELD(TB_FLAGS, XL, 15, 2)
+FIELD(TB_FLAGS, XL, 20, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_ENABLED, 17, 1)
+FIELD(TB_FLAGS, PM_ENABLED, 22, 1)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 17101d854b..3688e80d03 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -80,7 +80,19 @@ typedef struct DisasContext {
     bool hlsx;
     /* vector extension */
     bool vill;
-    uint8_t lmul;
+    /*
+     * Encode LMUL to lmul as follows:
+     *     LMUL    vlmul    lmul
+     *      1       000       0
+     *      2       001       1
+     *      4       010       2
+     *      8       011       3
+     *      -       100       -
+     *     1/8      101      -3
+     *     1/4      110      -2
+     *     1/2      111      -1
+     */
+    int8_t lmul;
     uint8_t sew;
     uint16_t vlen;
     bool vl_eq_vlmax;
@@ -690,7 +702,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-    ctx->lmul =3D FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
+    ctx->lmul =3D sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3)=
;
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs =3D cs;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ac6c7298bc..866bfb3571 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -86,9 +86,21 @@ static inline uint32_t vext_vm(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VM);
 }
=20
-static inline uint32_t vext_lmul(uint32_t desc)
+/*
+ * Encode LMUL to lmul as following:
+ *     LMUL    vlmul    lmul
+ *      1       000       0
+ *      2       001       1
+ *      4       010       2
+ *      8       011       3
+ *      -       100       -
+ *     1/8      101      -3
+ *     1/4      110      -2
+ *     1/2      111      -1
+ */
+static inline int32_t vext_lmul(uint32_t desc)
 {
-    return FIELD_EX32(simd_data(desc), VDATA, LMUL);
+    return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
 }
=20
 static uint32_t vext_wd(uint32_t desc)
--=20
2.31.1


