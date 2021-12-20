Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0047A4AA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:39:25 +0100 (CET)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBOO-0003DK-4D
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:39:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlO-0001r1-6h
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:06 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAlI-0008Al-Lp
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976340; x=1671512340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0zavh7Rue8eAIjd4k2Lyw3aw2SExqfWr+6tso0QZDU=;
 b=eiVxXQrjCbhI/q4Zv4ykAOWZbuU6FYZqG9vjnR+N3RDtBoQvfJt/FkHL
 tfGLDM+qsA1jfgjrK6eyRyvKTZ+2ObCOVKwSxXZZ95bJs3Am1BQsBDeq9
 V9iEZwymvrVVxtgsQQYUcaDifNaOFh9MNfJn9PK0hDR7NPEkdH5+oJsmq
 cw41tZ+IzOEEZYYj8IWHiDNhCJHVglu+PMWwJESq6FQjMGHrjdEuaoW/Y
 97tl4qsXNK/xokMdV82obab3Z2EYujR+s1tGyr9l2/F6gxgtBXaT1KRmP
 +oYO+evgCHn4pSFllG+UAJXWSq3Lcr8aKoAHmGNW3XkNCDi6MPBh1Qyxk Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661944"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:59 +0800
IronPort-SDR: 0XMSzixXQZ4QyoPtwLqbpTLPvV0EXEC39pYlJj10GPixYhW3W4lO1qFmS9U5AK4Ou/P9DYyDYG
 IK2KEiD5pIKNo15AKXxG5IWQpn5qTivu8vncWmdYE23QHBpHHrPgDDKiZSHkk8WqCBgYUu4CBp
 JGJvM2rE0dSk91wzPHoiHCFT0AgBbR9xzXboEIbu/0MkZMMH6AJxxpyMYXjgyt6oHwmDQ53t8W
 hFMqTdtoVK+lXo+wlcLsvribO8l2b7f/5hw2Ww9WomV0MQ7QszgZnOHfFRBtXmtPK9WMcFHloV
 WjwMZzdkXBB67WCCaDO2Bk6o
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:31:48 -0800
IronPort-SDR: NVdoIqit0K5ks6vTQrL1fnyd+30xn3s1jNSDMaP4RwuP6jvKZzOXYxFLkd0dnM/X3LsUwlzUNn
 q19YSfkFo92kVWjRRfnJndKiNGtomQc57gKZaNVSMKCsMqlrZBdtH9zVO/LNHTTknep00vUZ0/
 EBScAdtNTh0FqIp0iTggtwzenP2qAH5S/nJ7FbOLumi67LEvHF9vW2yJqt/BkQfRnKBvTWkhn3
 5jKDm3iX9T8/lArp2wHKJWlLmv3/MYC652ta5/9oHD8nCmT8fYyxg3eJ2RrgQROr7w27yhvm9b
 u+M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS6W0lHyz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976337; x=1642568338; bh=Z0zavh7Rue8eAIjd4k
 2Lyw3aw2SExqfWr+6tso0QZDU=; b=YV7xGonK0Al838s6dmNZ5dS7IXwNHyIb7y
 7FMoIQLnTdg2rwmEuhAfix9e/KQniNmvA09txWSQiQ+RdLGDvRxX0uC8IOm0HGAv
 IEab+GOXgHrZK8rOE5b+YLDKFw+PH3mEoG3HvXsx3P4jr1hma21SHO1qZcpyp/3w
 36D2tznnu+Pe6+Nn/KrtYcnBfq0LP6ihKKq6+6Nrt3wM6uwic6UWf7eGzcUap+UW
 6WyJCNn3DeHY7F556SddHPSPGBNxDbJFw4BxXNaqW6Fb90RBLMkOyep4vG0pJJZF
 +1kutPZzW8AP5u4eiuhsccaINrQvAtV5Yr6AKe2OmkbPmIJqPaPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id G90p66am3h7i for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:57 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS6Q1gbjz1RvTg;
 Sun, 19 Dec 2021 20:58:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/88] target/riscv: rvv-1.0: update check functions
Date: Mon, 20 Dec 2021 14:56:00 +1000
Message-Id: <20211220045705.62174-24-alistair.francis@opensource.wdc.com>
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

Update check functions with RVV 1.0 rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-16-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 715 +++++++++++++++++-------
 1 file changed, 507 insertions(+), 208 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index ecd4b89c6b..bef37dd888 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -19,11 +19,112 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
=20
+static inline bool is_overlapped(const int8_t astart, int8_t asize,
+                                 const int8_t bstart, int8_t bsize)
+{
+    const int8_t aend =3D astart + asize;
+    const int8_t bend =3D bstart + bsize;
+
+    return MAX(aend, bend) - MIN(astart, bstart) < asize + bsize;
+}
+
+static bool require_rvv(DisasContext *s)
+{
+    return s->mstatus_vs !=3D 0;
+}
+
+static bool require_rvf(DisasContext *s)
+{
+    if (s->mstatus_fs =3D=3D 0) {
+        return false;
+    }
+
+    switch (s->sew) {
+    case MO_16:
+    case MO_32:
+        return has_ext(s, RVF);
+    case MO_64:
+        return has_ext(s, RVD);
+    default:
+        return false;
+    }
+}
+
+static bool require_scale_rvf(DisasContext *s)
+{
+    if (s->mstatus_fs =3D=3D 0) {
+        return false;
+    }
+
+    switch (s->sew) {
+    case MO_8:
+    case MO_16:
+        return has_ext(s, RVF);
+    case MO_32:
+        return has_ext(s, RVD);
+    default:
+        return false;
+    }
+}
+
+/* Destination vector register group cannot overlap source mask register=
. */
+static bool require_vm(int vm, int vd)
+{
+    return (vm !=3D 0 || vd !=3D 0);
+}
+
+/*
+ * Vector register should aligned with the passed-in LMUL (EMUL).
+ * If LMUL < 0, i.e. fractional LMUL, any vector register is allowed.
+ */
+static bool require_align(const int8_t val, const int8_t lmul)
+{
+    return lmul <=3D 0 || extract32(val, 0, lmul) =3D=3D 0;
+}
+
+/*
+ * A destination vector register group can overlap a source vector
+ * register group only if one of the following holds:
+ *  1. The destination EEW equals the source EEW.
+ *  2. The destination EEW is smaller than the source EEW and the overla=
p
+ *     is in the lowest-numbered part of the source register group.
+ *  3. The destination EEW is greater than the source EEW, the source EM=
UL
+ *     is at least 1, and the overlap is in the highest-numbered part of
+ *     the destination register group.
+ * (Section 5.2)
+ *
+ * This function returns true if one of the following holds:
+ *  * Destination vector register group does not overlap a source vector
+ *    register group.
+ *  * Rule 3 met.
+ * For rule 1, overlap is allowed so this function doesn't need to be ca=
lled.
+ * For rule 2, (vd =3D=3D vs). Caller has to check whether: (vd !=3D vs)=
 before
+ * calling this function.
+ */
+static bool require_noover(const int8_t dst, const int8_t dst_lmul,
+                           const int8_t src, const int8_t src_lmul)
+{
+    int8_t dst_size =3D dst_lmul <=3D 0 ? 1 : 1 << dst_lmul;
+    int8_t src_size =3D src_lmul <=3D 0 ? 1 : 1 << src_lmul;
+
+    /* Destination EEW is greater than the source EEW, check rule 3. */
+    if (dst_size > src_size) {
+        if (dst < src &&
+            src_lmul >=3D 0 &&
+            is_overlapped(dst, dst_size, src, src_size) &&
+            !is_overlapped(dst, dst_size, src + src_size, src_size)) {
+            return true;
+        }
+    }
+
+    return !is_overlapped(dst, dst_size, src, src_size);
+}
+
 static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
 {
     TCGv s1, s2, dst;
=20
-    if (!has_ext(ctx, RVV)) {
+    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
         return false;
     }
=20
@@ -51,7 +152,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetv=
li *a)
 {
     TCGv s1, s2, dst;
=20
-    if (!has_ext(ctx, RVV)) {
+    if (!require_rvv(ctx) || !has_ext(ctx, RVV)) {
         return false;
     }
=20
@@ -82,6 +183,237 @@ static uint32_t vreg_ofs(DisasContext *s, int reg)
=20
 /* check functions */
=20
+static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
+{
+    return require_vm(vm, vd) &&
+        require_align(vd, s->lmul) &&
+        require_align(vs, s->lmul);
+}
+
+/*
+ * Check function for vector instruction with format:
+ * single-width result and single-width sources (SEW =3D SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ *   2. Destination vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   3. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.4.2)
+ */
+static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, in=
t vm)
+{
+    return vext_check_ss(s, vd, vs2, vm) &&
+        require_align(vs1, s->lmul);
+}
+
+static bool vext_check_ms(DisasContext *s, int vd, int vs)
+{
+    bool ret =3D require_align(vs, s->lmul);
+    if (vd !=3D vs) {
+        ret &=3D require_noover(vd, 0, vs, s->lmul);
+    }
+    return ret;
+}
+
+/*
+ * Check function for maskable vector instruction with format:
+ * single-width result and single-width sources (SEW =3D SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.4.2)
+ *   2. Destination vector register cannot overlap a source vector
+ *      register (vs2, vs1) group.
+ *      (Section 5.2)
+ *   3. The destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0),
+ *      unless the destination vector register is being written
+ *      with a mask value (e.g., comparisons) or the scalar result
+ *      of a reduction. (Section 5.3)
+ */
+static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
+{
+    bool ret =3D vext_check_ms(s, vd, vs2) &&
+        require_align(vs1, s->lmul);
+    if (vd !=3D vs1) {
+        ret &=3D require_noover(vd, 0, vs1, s->lmul);
+    }
+    return ret;
+}
+
+/*
+ * Common check function for vector widening instructions
+ * of double-width result (2*SEW).
+ *
+ * Rules to be checked here:
+ *   1. The largest vector register group used by an instruction
+ *      can not be greater than 8 vector registers (Section 5.2):
+ *      =3D> LMUL < 8.
+ *      =3D> SEW < 64.
+ *   2. Destination vector register number is multiples of 2 * LMUL.
+ *      (Section 3.4.2)
+ *   3. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_wide_check_common(DisasContext *s, int vd, int vm)
+{
+    return (s->lmul <=3D 2) &&
+           (s->sew < MO_64) &&
+           require_align(vd, s->lmul + 1) &&
+           require_vm(vm, vd);
+}
+
+/*
+ * Common check function for vector narrowing instructions
+ * of single-width result (SEW) and double-width source (2*SEW).
+ *
+ * Rules to be checked here:
+ *   1. The largest vector register group used by an instruction
+ *      can not be greater than 8 vector registers (Section 5.2):
+ *      =3D> LMUL < 8.
+ *      =3D> SEW < 64.
+ *   2. Source vector register number is multiples of 2 * LMUL.
+ *      (Section 3.4.2)
+ *   3. Destination vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   4. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ */
+static bool vext_narrow_check_common(DisasContext *s, int vd, int vs2,
+                                     int vm)
+{
+    return (s->lmul <=3D 2) &&
+           (s->sew < MO_64) &&
+           require_align(vs2, s->lmul + 1) &&
+           require_align(vd, s->lmul) &&
+           require_vm(vm, vd);
+}
+
+static bool vext_check_ds(DisasContext *s, int vd, int vs, int vm)
+{
+    return vext_wide_check_common(s, vd, vm) &&
+        require_align(vs, s->lmul) &&
+        require_noover(vd, s->lmul + 1, vs, s->lmul);
+}
+
+static bool vext_check_dd(DisasContext *s, int vd, int vs, int vm)
+{
+    return vext_wide_check_common(s, vd, vm) &&
+        require_align(vs, s->lmul + 1);
+}
+
+/*
+ * Check function for vector instruction with format:
+ * double-width result and single-width sources (2*SEW =3D SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. All rules in defined in widen common rules are applied.
+ *   2. Source (vs2, vs1) vector register number are multiples of LMUL.
+ *      (Section 3.4.2)
+ *   3. Destination vector register cannot overlap a source vector
+ *      register (vs2, vs1) group.
+ *      (Section 5.2)
+ */
+static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2, in=
t vm)
+{
+    return vext_check_ds(s, vd, vs2, vm) &&
+        require_align(vs1, s->lmul) &&
+        require_noover(vd, s->lmul + 1, vs1, s->lmul);
+}
+
+/*
+ * Check function for vector instruction with format:
+ * double-width result and double-width source1 and single-width
+ * source2 (2*SEW =3D 2*SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. All rules in defined in widen common rules are applied.
+ *   2. Source 1 (vs2) vector register number is multiples of 2 * LMUL.
+ *      (Section 3.4.2)
+ *   3. Source 2 (vs1) vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   4. Destination vector register cannot overlap a source vector
+ *      register (vs1) group.
+ *      (Section 5.2)
+ */
+static bool vext_check_dds(DisasContext *s, int vd, int vs1, int vs2, in=
t vm)
+{
+    return vext_check_ds(s, vd, vs1, vm) &&
+        require_align(vs2, s->lmul + 1);
+}
+
+static bool vext_check_sd(DisasContext *s, int vd, int vs, int vm)
+{
+    bool ret =3D vext_narrow_check_common(s, vd, vs, vm);
+    if (vd !=3D vs) {
+        ret &=3D require_noover(vd, s->lmul, vs, s->lmul + 1);
+    }
+    return ret;
+}
+
+/*
+ * Check function for vector instruction with format:
+ * single-width result and double-width source 1 and single-width
+ * source 2 (SEW =3D 2*SEW op SEW)
+ *
+ * Rules to be checked here:
+ *   1. All rules in defined in narrow common rules are applied.
+ *   2. Destination vector register cannot overlap a source vector
+ *      register (vs2) group.
+ *      (Section 5.2)
+ *   3. Source 2 (vs1) vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ */
+static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, in=
t vm)
+{
+    return vext_check_sd(s, vd, vs2, vm) &&
+        require_align(vs1, s->lmul);
+}
+
+/*
+ * Check function for vector reduction instructions.
+ *
+ * Rules to be checked here:
+ *   1. Source 1 (vs2) vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ */
+static bool vext_check_reduction(DisasContext *s, int vs2)
+{
+    return require_align(vs2, s->lmul);
+}
+
+/*
+ * Check function for vector slide instructions.
+ *
+ * Rules to be checked here:
+ *   1. Source 1 (vs2) vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   2. Destination vector register number is multiples of LMUL.
+ *      (Section 3.4.2)
+ *   3. Destination vector register group for a masked vector
+ *      instruction cannot overlap the source mask register (v0).
+ *      (Section 5.3)
+ *   4. The destination vector register group for vslideup, vslide1up,
+ *      vfslide1up, cannot overlap the source vector register (vs2) grou=
p.
+ *      (Section 5.2, 16.3.1, 16.3.3)
+ */
+static bool vext_check_slide(DisasContext *s, int vd, int vs2,
+                             int vm, bool is_over)
+{
+    bool ret =3D require_align(vs2, s->lmul) &&
+               require_align(vd, s->lmul) &&
+               require_vm(vm, vd);
+    if (is_over) {
+        ret &=3D (vd !=3D vs2);
+    }
+    return ret;
+}
+
 /*
  * In cpu_get_tb_cpu_state(), set VILL if RVV was not present.
  * So RVV is also be checked in this function.
@@ -139,6 +471,7 @@ static inline bool vext_check_overlap_group(int rd, i=
nt dlen, int rs, int slen)
 {
     return ((rd >=3D rs + slen) || (rs >=3D rd + dlen));
 }
+
 /* common translation macro */
 #define GEN_VEXT_TRANS(NAME, SEQ, ARGTYPE, OP, CHECK)      \
 static bool trans_##NAME(DisasContext *s, arg_##ARGTYPE *a)\
@@ -787,11 +1120,9 @@ GEN_VEXT_TRANS(vamomaxud_v, 17, rwdvm, amo_op, amo_=
check64)
=20
 static bool opivv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
=20
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
@@ -879,10 +1210,9 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2, uint32_t vm,
=20
 static bool opivx_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
=20
 typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t, TCGv_i64,
@@ -1073,16 +1403,9 @@ GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
 /* OPIVV with WIDEN */
 static bool opivv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
=20
 static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
@@ -1127,13 +1450,9 @@ GEN_OPIVV_WIDEN_TRANS(vwsub_vv, opivv_widen_check)
 /* OPIVX with WIDEN */
 static bool opivx_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
=20
 static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
@@ -1164,14 +1483,9 @@ GEN_OPIVX_WIDEN_TRANS(vwsub_vx)
 /* WIDEN OPIVV with WIDEN */
 static bool opiwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
=20
 static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
@@ -1214,11 +1528,9 @@ GEN_OPIWV_WIDEN_TRANS(vwsub_wv)
 /* WIDEN OPIVX with WIDEN */
 static bool opiwx_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
=20
 static bool do_opiwx_widen(DisasContext *s, arg_rmrr *a,
@@ -1280,11 +1592,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmr=
r *a)             \
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            ((a->rd !=3D 0) || (s->lmul =3D=3D 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           (a->rd !=3D 0) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
=20
 GEN_OPIVV_TRANS(vadc_vvm, opivv_vadc_check)
@@ -1296,11 +1607,9 @@ GEN_OPIVV_TRANS(vsbc_vvm, opivv_vadc_check)
  */
 static bool opivv_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2);
 }
=20
 GEN_OPIVV_TRANS(vmadc_vvm, opivv_vmadc_check)
@@ -1308,10 +1617,10 @@ GEN_OPIVV_TRANS(vmsbc_vvm, opivv_vmadc_check)
=20
 static bool opivx_vadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            ((a->rd !=3D 0) || (s->lmul =3D=3D 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           (a->rd !=3D 0) &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
=20
 /* OPIVX without GVEC IR */
@@ -1334,9 +1643,9 @@ GEN_OPIVX_TRANS(vsbc_vxm, opivx_vadc_check)
=20
 static bool opivx_vmadc_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ms(s, a->rd, a->rs2);
 }
=20
 GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
@@ -1424,14 +1733,9 @@ GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
=20
 /* OPIVV with NARROW */
@@ -1466,13 +1770,9 @@ GEN_OPIVV_NARROW_TRANS(vnsrl_vv)
=20
 static bool opivx_narrow_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
=20
 /* OPIVX with NARROW */
@@ -1520,13 +1820,11 @@ GEN_OPIVI_NARROW_TRANS(vnsrl_vi, 1, vnsrl_vx)
  */
 static bool opivv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            ((vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &=
&
-              vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul)) =
||
-             (s->lmul =3D=3D 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2);
 }
+
 GEN_OPIVV_TRANS(vmseq_vv, opivv_cmp_check)
 GEN_OPIVV_TRANS(vmsne_vv, opivv_cmp_check)
 GEN_OPIVV_TRANS(vmsltu_vv, opivv_cmp_check)
@@ -1536,10 +1834,9 @@ GEN_OPIVV_TRANS(vmsle_vv, opivv_cmp_check)
=20
 static bool opivx_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul) ||
-             (s->lmul =3D=3D 0)));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ms(s, a->rd, a->rs2);
 }
=20
 GEN_OPIVX_TRANS(vmseq_vx, opivx_cmp_check)
@@ -1618,10 +1915,10 @@ GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
 /* Vector Integer Merge and Move Instructions */
 static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_reg(s, a->rs1, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.v has rs2 =3D 0 and vm =3D 1 */
+        vext_check_sss(s, a->rd, a->rs1, 0, 1)) {
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
                              vreg_ofs(s, a->rs1),
@@ -1649,9 +1946,10 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv=
_v_v *a)
 typedef void gen_helper_vmv_vx(TCGv_ptr, TCGv_i64, TCGv_env, TCGv_i32);
 static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.x has rs2 =3D 0 and vm =3D 1 */
+        vext_check_ss(s, a->rd, 0, 1)) {
         TCGv s1;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -1689,9 +1987,10 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv=
_v_x *a)
=20
 static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false)) {
-
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        /* vmv.v.i has rs2 =3D 0 and vm =3D 1 */
+        vext_check_ss(s, a->rd, 0, 1)) {
         int64_t simm =3D sextract64(a->rs1, 0, 5);
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
@@ -1791,12 +2090,10 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
  */
 static bool opfvv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            (s->sew !=3D 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_sss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
=20
 /* OPFVV without GVEC IR */
@@ -1861,17 +2158,16 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1=
, uint32_t vs2,
     return true;
 }
=20
-static bool opfvf_check(DisasContext *s, arg_rmrr *a)
-{
 /*
  * If the current SEW does not correspond to a supported IEEE floating-p=
oint
  * type, an illegal instruction exception is raised
  */
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew !=3D 0));
+static bool opfvf_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
=20
 /* OPFVF without GVEC IR */
@@ -1901,16 +2197,10 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
 /* Vector Widening Floating-Point Add/Subtract Instructions */
 static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew !=3D 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
=20
 /* OPFVV with WIDEN */
@@ -1945,13 +2235,10 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_chec=
k)
=20
 static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew !=3D 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
=20
 /* OPFVF with WIDEN */
@@ -1977,14 +2264,10 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
=20
 static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs1,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew !=3D 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
=20
 /* WIDEN OPFVV with WIDEN */
@@ -2019,11 +2302,10 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
=20
 static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, true) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew !=3D 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
=20
 /* WIDEN OPFVF with WIDEN */
@@ -2094,11 +2376,11 @@ GEN_OPFVF_WIDEN_TRANS(vfwnmsac_vf)
  */
 static bool opfv_check(DisasContext *s, arg_rmr *a)
 {
-   return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew !=3D 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV instructions ignore vs1 check */
+           vext_check_ss(s, a->rd, a->rs2, a->vm);
 }
=20
 #define GEN_OPFV_TRANS(NAME, CHECK)                                \
@@ -2147,13 +2429,10 @@ GEN_OPFVF_TRANS(vfsgnjx_vf, opfvf_check)
 /* Vector Floating-Point Compare Instructions */
 static bool opfvv_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            (s->sew !=3D 0) &&
-            ((vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &=
&
-              vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul)) =
||
-             (s->lmul =3D=3D 0)));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_mss(s, a->rd, a->rs1, a->rs2);
 }
=20
 GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
@@ -2164,11 +2443,10 @@ GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
=20
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (s->sew !=3D 0) &&
-            (vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul) ||
-             (s->lmul =3D=3D 0)));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ms(s, a->rd, a->rs2);
 }
=20
 GEN_OPFVF_TRANS(vmfeq_vf, opfvf_cmp_check)
@@ -2187,10 +2465,10 @@ GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
=20
 static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        (s->sew !=3D 0)) {
-
+    if (require_rvv(s) &&
+        require_rvf(s) &&
+        vext_check_isa_ill(s) &&
+        require_align(a->rd, s->lmul)) {
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
@@ -2235,13 +2513,11 @@ GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
  */
 static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, true) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 2 << s->lmul, a->rs2,
-                                     1 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew !=3D 0));
+    return require_rvv(s) &&
+           require_scale_rvf(s) &&
+           (s->sew !=3D MO_8) &&
+           vext_check_isa_ill(s) &&
+           vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
=20
 #define GEN_OPFV_WIDEN_TRANS(NAME)                                 \
@@ -2284,13 +2560,12 @@ GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v)
  */
 static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, true) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2,
-                                     2 << s->lmul) &&
-            (s->lmul < 0x3) && (s->sew < 0x3) && (s->sew !=3D 0));
+    return require_rvv(s) &&
+           require_rvf(s) &&
+           (s->sew !=3D MO_64) &&
+           vext_check_isa_ill(s) &&
+           /* OPFV narrowing instructions ignore vs1 check */
+           vext_check_sd(s, a->rd, a->rs2, a->vm);
 }
=20
 #define GEN_OPFV_NARROW_TRANS(NAME)                                \
@@ -2331,7 +2606,9 @@ GEN_OPFV_NARROW_TRANS(vfncvt_f_f_v)
 /* Vector Single-Width Integer Reduction Instructions */
 static bool reduction_check(DisasContext *s, arg_rmrr *a)
 {
-    return vext_check_isa_ill(s) && vext_check_reg(s, a->rs2, false);
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_reduction(s, a->rs2);
 }
=20
 GEN_OPIVV_TRANS(vredsum_vs, reduction_check)
@@ -2344,8 +2621,13 @@ GEN_OPIVV_TRANS(vredor_vs, reduction_check)
 GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
=20
 /* Vector Widening Integer Reduction Instructions */
-GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_check)
-GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_check)
+static bool reduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_check(s, a) && (s->sew < MO_64);
+}
+
+GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen_check)
+GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
=20
 /* Vector Single-Width Floating-Point Reduction Instructions */
 GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
@@ -2393,7 +2675,8 @@ GEN_MM_TRANS(vmxnor_mm)
 /* Vector mask population count vmpopc */
 static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2422,7 +2705,8 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr=
 *a)
 /* vmfirst find-first-set mask bit */
 static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         TCGv_ptr src2, mask;
         TCGv dst;
         TCGv_i32 desc;
@@ -2480,10 +2764,11 @@ GEN_M_TRANS(vmsof_m)
 /* Vector Iota Instruction */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs2, 1) &&
-        (a->vm !=3D 0 || a->rd !=3D 0)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        require_noover(a->rd, s->lmul, a->rs2, 0) &&
+        require_vm(a->vm, a->rd) &&
+        require_align(a->rd, s->lmul)) {
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2507,9 +2792,10 @@ static bool trans_viota_m(DisasContext *s, arg_vio=
ta_m *a)
 /* Vector Element Index Instruction */
 static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
 {
-    if (vext_check_isa_ill(s) &&
-        vext_check_reg(s, a->rd, false) &&
-        vext_check_overlap_mask(s, a->rd, a->vm, false)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s) &&
+        require_align(a->rd, s->lmul) &&
+        require_vm(a->vm, a->rd)) {
         uint32_t data =3D 0;
         TCGLabel *over =3D gen_new_label();
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2758,41 +3044,48 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_v=
fmv_s_f *a)
 /* Vector Slide Instructions */
 static bool slideup_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd !=3D a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_slide(s, a->rd, a->rs2, a->vm, true);
 }
=20
 GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
 GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
 GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
=20
-GEN_OPIVX_TRANS(vslidedown_vx, opivx_check)
-GEN_OPIVX_TRANS(vslide1down_vx, opivx_check)
-GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, opivx_check)
+static bool slidedown_check(DisasContext *s, arg_rmrr *a)
+{
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           vext_check_slide(s, a->rd, a->rs2, a->vm, false);
+}
+
+GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
+GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
+GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, slidedown_check)
=20
 /* Vector Register Gather Instruction */
 static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs1, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd !=3D a->rs2) && (a->rd !=3D a->rs1));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs1, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           (a->rd !=3D a->rs2 && a->rd !=3D a->rs1) &&
+           require_vm(a->vm, a->rd);
 }
=20
 GEN_OPIVV_TRANS(vrgather_vv, vrgather_vv_check)
=20
 static bool vrgather_vx_check(DisasContext *s, arg_rmrr *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_overlap_mask(s, a->rd, a->vm, true) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            (a->rd !=3D a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           (a->rd !=3D a->rs2) &&
+           require_vm(a->vm, a->rd);
 }
=20
 /* vrgather.vx vd, vs2, rs1, vm # vd[i] =3D (x[rs1] >=3D VLMAX) ? 0 : vs=
2[rs1] */
@@ -2853,14 +3146,20 @@ static bool trans_vrgather_vi(DisasContext *s, ar=
g_rmrr *a)
     return true;
 }
=20
-/* Vector Compress Instruction */
+/*
+ * Vector Compress Instruction
+ *
+ * The destination vector register group cannot overlap the
+ * source vector register group or the source mask register.
+ */
 static bool vcompress_vm_check(DisasContext *s, arg_r *a)
 {
-    return (vext_check_isa_ill(s) &&
-            vext_check_reg(s, a->rd, false) &&
-            vext_check_reg(s, a->rs2, false) &&
-            vext_check_overlap_group(a->rd, 1 << s->lmul, a->rs1, 1) &&
-            (a->rd !=3D a->rs2));
+    return require_rvv(s) &&
+           vext_check_isa_ill(s) &&
+           require_align(a->rd, s->lmul) &&
+           require_align(a->rs2, s->lmul) &&
+           (a->rd !=3D a->rs2) &&
+           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1);
 }
=20
 static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
--=20
2.31.1



