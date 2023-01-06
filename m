Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D2665FA40
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:29:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBW-00018X-Le; Thu, 05 Jan 2023 22:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBR-000179-QB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:17 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBP-00088M-SD
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974855; x=1704510855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5X9imZNc/bLBWo3EVc9mys5qr/976aXTfkxEGvPBCOk=;
 b=F1Q8rczydDH+npzMpRPFtwkIjyDBULb8Bn3fSxQx3IbtBIuEoV/V9c2w
 gXoRPfl6dFH57v20dW/SoD+6jDJXToAWaIWD7ARysP5uI06ug5jr2637L
 ua5douI+XXSSJEuFMbVc/9VDs7Dg0Ijf0BYxVtthBJ7pNBwk0KqXtAKnI
 qzvqupFExHR10E9wwHXOCnfpRyUQu1Ds9OUFctQg/JtdqxKe4qN6U1nZt
 jjSjmAarWxdrm/80GfK+DwpiJAtTnldA1sAsGqUVGKYoBGGXi7oVzRZaM
 nOkKYxH3xxXfptjLCWM52c6kPYAL+l5+N/IAaSture6MVd+7tIrpqmvC+ A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254749"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:11 +0800
IronPort-SDR: zPJo+SnHVH+kzbLTkt8fp7Igivy8htqxIUWm1njoStiH6Wzr6qp505FESEp4Da5G5kDW+LRZL/
 /jYzxaZ11v+4iDd7iYGlgKRMKTVgKMJZGbxNvFRDZw0W8IvKueWiwZnAtW+IwMf2OW7KOaHgLF
 x2h4Lk8ZpHCTeXeXteA86uSRegPh2nICY/GR7+MQStXRSpJVJbiRGcfCiO7/PkzRiHEx8DrrnF
 n9Iikm6HhKHaf1hwO5v/gsj5mu+4cT99xp0EXIzc8a/WQNi9kxHZDpHo02d4dlNrD+krm/zI5B
 3Cc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:22 -0800
IronPort-SDR: MJCcPLrc85KGKHi7yJs7x3PJk3VHwYjYXbm9NE+fpu9CBTJ3GF54QWOr5jQmCiH4TDDLM+/cvf
 1TiVV53vLjGofaVFzmT2NxfFDXmp7lthMGpxpDCVixJun35SShnGYMtq0fyY1TqnaRd5po1Cec
 OYyM6rLUZYgiicuAcJHdYCBHL5q4llc0oZkuWSwVe1Pwtfmz9aH34kDSuItioY4HdMQ5MLfN7X
 d6jTi0lt0JA6L5dzyuhoSSELxshXpPQn/u0dlozmr4aF7kyYxnQ2c4kCP2v5M/IyiL5nCJOjR5
 eSg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jH1frRz1RwtC
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974850; x=1675566851; bh=5X9imZNc/bLBWo3EVc
 9mys5qr/976aXTfkxEGvPBCOk=; b=PpdZBxYyINFu09k1XttfKIbfNbxV/cQzv1
 GvsDt0ODmwCCYow+I9m/B3jJDSYXMX/I3S6ZWhrmu0wkGhS0q2Y7WVsMTUXAwP+y
 DGgDCrYwyxrFNZhSq7vcxmJzi4H9jJsMKD8K8EeGZWrbRXMIw15ToBl/wzEOkOrw
 iElgstwu/OeDJIW1IUoAFx1dLFlEALVZIRc5Hq3ffOQDM+KQt8BhqHwgFqM2+yWB
 9RZ9tLRdSRVdrL2j/dkkpIKnoLWuU+dzc67iABt5WlVS06ypyvWUP6GhZv03Npwn
 XmzQj/BeF3689CCQ5k87L7UFqqZz1+uigxEUVfii48pU6+NvX8Dw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VpiIVPEVOJYX for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:10 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jF0QXQz1Rwrq;
 Thu,  5 Jan 2023 19:14:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 04/43] tcg/riscv: Fix base register for user-only qemu_ld/st
Date: Fri,  6 Jan 2023 13:13:18 +1000
Message-Id: <20230106031357.777790-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

When guest_base !=3D 0, we were not coordinating the usage of
TCG_REG_TMP0 as base properly, leading to a previous zero-extend
of the input address being discarded.

Shuffle the alignment check to the front, because that does not
depend on the zero-extend, and it keeps the register usage clear.
Set base after each step of the address arithmetic instead of before.

Return the base register used from tcg_out_tlb_load, so as to
keep that register choice localized to that function.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221023233337.2846860-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.c.inc | 39 +++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 2a84c57bec..e3b608034f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -923,9 +923,9 @@ static void tcg_out_goto(TCGContext *s, const tcg_ins=
n_unit *target)
     tcg_debug_assert(ok);
 }
=20
-static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
-                             TCGReg addrh, MemOpIdx oi,
-                             tcg_insn_unit **label_ptr, bool is_load)
+static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
+                               TCGReg addrh, MemOpIdx oi,
+                               tcg_insn_unit **label_ptr, bool is_load)
 {
     MemOp opc =3D get_memop(oi);
     unsigned s_bits =3D opc & MO_SIZE;
@@ -975,6 +975,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg ad=
drl,
         addrl =3D TCG_REG_TMP0;
     }
     tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
+    return TCG_REG_TMP0;
 }
=20
 static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
@@ -1177,7 +1178,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TC=
GArg *args, bool is_64)
 #else
     unsigned a_bits;
 #endif
-    TCGReg base =3D TCG_REG_TMP0;
+    TCGReg base;
=20
     data_regl =3D *args++;
     data_regh =3D (TCG_TARGET_REG_BITS =3D=3D 32 && is_64 ? *args++ : 0)=
;
@@ -1187,23 +1188,25 @@ static void tcg_out_qemu_ld(TCGContext *s, const =
TCGArg *args, bool is_64)
     opc =3D get_memop(oi);
=20
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
+    base =3D tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1)=
;
     tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
     add_qemu_ldst_label(s, 1, oi,
                         (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl =3D base;
-    }
     a_bits =3D get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_regl, a_bits);
     }
+    base =3D addr_regl;
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, base);
+        base =3D TCG_REG_TMP0;
+    }
     if (guest_base !=3D 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl)=
;
+        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, ba=
se);
+        base =3D TCG_REG_TMP0;
     }
     tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
 #endif
@@ -1249,7 +1252,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TC=
GArg *args, bool is_64)
 #else
     unsigned a_bits;
 #endif
-    TCGReg base =3D TCG_REG_TMP0;
+    TCGReg base;
=20
     data_regl =3D *args++;
     data_regh =3D (TCG_TARGET_REG_BITS =3D=3D 32 && is_64 ? *args++ : 0)=
;
@@ -1259,23 +1262,25 @@ static void tcg_out_qemu_st(TCGContext *s, const =
TCGArg *args, bool is_64)
     opc =3D get_memop(oi);
=20
 #if defined(CONFIG_SOFTMMU)
-    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
+    base =3D tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0)=
;
     tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
     add_qemu_ldst_label(s, 0, oi,
                         (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addr_regl);
-        addr_regl =3D base;
-    }
     a_bits =3D get_alignment_bits(opc);
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_regl, a_bits);
     }
+    base =3D addr_regl;
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, base);
+        base =3D TCG_REG_TMP0;
+    }
     if (guest_base !=3D 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl)=
;
+        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, ba=
se);
+        base =3D TCG_REG_TMP0;
     }
     tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
 #endif
--=20
2.39.0


