Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D147A53A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:59:57 +0100 (CET)
Received: from localhost ([::1]:51890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCeK-00086E-DW
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApA-0004ew-Du
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:00 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp6-0000Lx-Ry
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976576; x=1671512576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8xbk75UySlej/1fuckNQlDhIdO204+Dgle4HxlB7EvE=;
 b=I4tB5tAQfuerexpJOKmFdSKFb7xMgSlVYeTm27nir9KS2HWIdeHbHJGL
 laulXfcLBPneMMcRiWFzUKhnZgMfJQyE/vZQ/JkwFmsb0na8EGKh5//eu
 UII+TssKXGGadhc0oYmghVsYnTGyimpCQPaSnflr7U6HoWXGDeOpoXL4x
 4ScZpTlVmhShDtUGdhq6bqcR7RPupFPXG8wnUPdjoB3hiAseWEm5+Qjhp
 9P4fy1GtTQzjU73Ci6TFOLysZKuedETcWeV7H5rcpqmRzjzf4p5YcDTcl
 Gm3abBKUXvP+H8ZEOtGyGhQplsXCiKzVxie6O0xN0vNRUXfhV4Dh6brai g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662369"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:55 +0800
IronPort-SDR: Xsm+tHFmHVJ+J2z8djODGc/CNiYnd7m+6ivaKy9hwYEUtEM40QaoA+XAyGDqvOftqXKtZDr15R
 sw4NwEWCqHiMgJuzshOpaWkj6T7QlgM7IntgOXJHuUEAkQJS0M9cAEDbMZxJSmE2Bq4fk+rwFK
 oDpNEH8GBBMmKvWbjvTSLuFTLzsa9t7EAalNNMaPpOtVMYZcZYY1FCms15q/d1VWGEhoBDQ1Mh
 Eelr7fqfxOAmn4k9OwIuta9rzrxzqe9DBn9ElINLCe9aXtE8xCGGEGnnm0lJJ1zAx+smUW/yXD
 nYaWcCqSGovG4j/TOltgYW/T
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:44 -0800
IronPort-SDR: r+egw/sFp8VizMcGLC/KYInzvVD7XrqjBt4NQSfGnEWWg4BhOJIspt0l8ejzXmxNg5mjbTF1fD
 6sbcnck/pN+eWqWVgEfQ7UICafiZxcXJBVAAgCedxWPl3s97v+AtdcyHOcvQSYVJ42/2naBVjX
 aLiUpy2meTrCTdcQyxtGicyLGQnTfIFTTSgc9ZVUN7n6/KnP3aKD5M8E5/T6JVMQ/EqRlB1WUs
 1BGSgHsgjmuH7jtM2UG31BmnkCtnEB2EpGVjRxG/Fa91wBDf8KTibM3/YT3vlF/4kXKp8hntbR
 7pM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSC26chLz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976574; x=1642568575; bh=8xbk75UySlej/1fuck
 NQlDhIdO204+Dgle4HxlB7EvE=; b=UHOQtEw9Qn+QoLedoIle1JByieUcQ17grD
 0OVtfpY3G1dllpMXTGiEPIq25G12/HlMUclmT038m4OzSE8JQYdFDJzD4YvHb96p
 PH/oILPzyO8CPpfrrU0960vxxJcxUkqAalwUAmwUDYo0nffdvVmfKAgP4SrKxVy3
 F0jpf1hHQMGNMtxuMfUtzZOKI0sSR8QUXY5TZU9WszS08+JEqF/M7AF8L6TCVUX/
 b1HrZOQ7+6dPP4CbD1ORvN5gnPmPsrNhK2LV8vaANUS/zU27CM9VsN5JR85Il0vf
 IFfvP5RkYufKNbN7sRCe8FPs+SElJ5jNnOjvrqxU64Ge/6+WQteA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wsPW3ApIF-Tt for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:54 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBz6r6Mz1RtVG;
 Sun, 19 Dec 2021 21:02:51 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 85/88] target/riscv: rvv-1.0: Add ELEN checks for widening and
 narrowing instructions
Date: Mon, 20 Dec 2021 14:57:02 +1000
Message-Id: <20211220045705.62174-86-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

SEW has the limitation which cannot exceed ELEN.

Widening instructions have a destination group with EEW =3D 2*SEW
and narrowing instructions have a source operand with EEW =3D 2*SEW.
Both of the instructions have the limitation of: 2*SEW <=3D ELEN.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-78-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c                |  2 ++
 target/riscv/insn_trans/trans_rvv.c.inc | 17 +++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 68edaaf6ac..5df6c0d800 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -96,6 +96,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint16_t vlen;
+    uint16_t elen;
     target_ulong vstart;
     bool vl_eq_vlmax;
     uint8_t ntemp;
@@ -705,6 +706,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->ext_zfh =3D cpu->cfg.ext_zfh;
     ctx->ext_zfhmin =3D cpu->cfg.ext_zfhmin;
     ctx->vlen =3D cpu->cfg.vlen;
+    ctx->elen =3D cpu->cfg.elen;
     ctx->mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS)=
;
     ctx->mstatus_hs_vs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS)=
;
     ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 47eb3119cb..5e3f7fdb77 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -386,9 +386,10 @@ static bool vext_check_mss(DisasContext *s, int vd, =
int vs1, int vs2)
  *      can not be greater than 8 vector registers (Section 5.2):
  *      =3D> LMUL < 8.
  *      =3D> SEW < 64.
- *   2. Destination vector register number is multiples of 2 * LMUL.
+ *   2. Double-width SEW cannot greater than ELEN.
+ *   3. Destination vector register number is multiples of 2 * LMUL.
  *      (Section 3.4.2)
- *   3. Destination vector register group for a masked vector
+ *   4. Destination vector register group for a masked vector
  *      instruction cannot overlap the source mask register (v0).
  *      (Section 5.3)
  */
@@ -396,6 +397,7 @@ static bool vext_wide_check_common(DisasContext *s, i=
nt vd, int vm)
 {
     return (s->lmul <=3D 2) &&
            (s->sew < MO_64) &&
+           ((s->sew + 1) <=3D (s->elen >> 4)) &&
            require_align(vd, s->lmul + 1) &&
            require_vm(vm, vd);
 }
@@ -409,11 +411,12 @@ static bool vext_wide_check_common(DisasContext *s,=
 int vd, int vm)
  *      can not be greater than 8 vector registers (Section 5.2):
  *      =3D> LMUL < 8.
  *      =3D> SEW < 64.
- *   2. Source vector register number is multiples of 2 * LMUL.
+ *   2. Double-width SEW cannot greater than ELEN.
+ *   3. Source vector register number is multiples of 2 * LMUL.
  *      (Section 3.4.2)
- *   3. Destination vector register number is multiples of LMUL.
+ *   4. Destination vector register number is multiples of LMUL.
  *      (Section 3.4.2)
- *   4. Destination vector register group for a masked vector
+ *   5. Destination vector register group for a masked vector
  *      instruction cannot overlap the source mask register (v0).
  *      (Section 5.3)
  */
@@ -422,6 +425,7 @@ static bool vext_narrow_check_common(DisasContext *s,=
 int vd, int vs2,
 {
     return (s->lmul <=3D 2) &&
            (s->sew < MO_64) &&
+           ((s->sew + 1) <=3D (s->elen >> 4)) &&
            require_align(vs2, s->lmul + 1) &&
            require_align(vd, s->lmul) &&
            require_vm(vm, vd);
@@ -2806,7 +2810,8 @@ GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
 /* Vector Widening Integer Reduction Instructions */
 static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return reduction_check(s, a) && (s->sew < MO_64);
+    return reduction_check(s, a) && (s->sew < MO_64) &&
+           ((s->sew + 1) <=3D (s->elen >> 4));
 }
=20
 GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
--=20
2.31.1


