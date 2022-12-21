Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1B653910
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:54:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87ll-0007OM-Cc; Wed, 21 Dec 2022 17:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lj-0007Nl-2T
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:59 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87lc-0000Xf-1W
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662451; x=1703198451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wLon510VHyvWrBnIFxTDZasif/XairXPaP+olplQ0og=;
 b=F8EXDoUffAEBrwmSnkq36QwEOjxilHV4YFj7HdCzl9cnzPZbb+6iNqfx
 ybcWPea9ApCOM6Z5Z6W8uJH98Ni2JC81/VuytTJsh9dQPuMvv+fcF6Uxn
 5xw2VVHzvJ+ii3pxz50Yss13if/8gqDTaQgp72jjftPAtM53zMfE6l0/k
 EmvWRTX3hmLpGqapMwD30LuFd47aSAg7IZpZNDeMsPUQ7EWH8PSDRSGId
 34hCYJy/LdL2J8nUXDVmUP3aVO2OmgAKddVeNbl16cXrC1+S7f5VhGv7W
 ijobtgKDzH1CiOnN0yRklvZeV5fWoeOQGFWo2V4Yod1ezKlHsx0DD//2M w==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561283"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:41 +0800
IronPort-SDR: jo66Iu3gIRbvwbIrQMB5p1dn4VaTwxSup9YUcxrwyONx7Me+7J+K4gBTSUKGzyDMfLuMg+QGM3
 XBf6a7f8YOU3xXzBVhjyd/Z9CtccbOfNYpgN+kMtdEHpUkYyOXRX34fdxkDSUWgc045JYiMydh
 vpf8YHaCBACB6G3mXmJ5Sj5czM4G1XsqAtMqv4Kcdguyo2SgfWuKTsqFn9mcxXnmINMCaHO7vq
 6Sf+i83y1WmAAZl86c35cXsjXHWT9T0hvjoAuJLWSM3etAbsILObeD0os8cPGMLgVNSGI+2C9w
 aog=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:10 -0800
IronPort-SDR: wGb2i3jAk1HcJiVNPn9J50lRT/JwzLPJQN5QE7HzWiIUlk0vUWCQn19dpz/CI4qZrnBZpG3lMu
 3NyWvhHxbSrM4MYPCXbJvvCLXiecX1lddGdG1TNffhU1SFYieCGSxG6XgeNm0juWuCu47/yiM1
 Z3dUs+OcM6fCJv/44k7RDuXNkGRfGA4gYxbhoJTpgCP8tKNjA3notdEuUxwUNHDCAD3w4avMV9
 6KPUHNQv061PAGw6XSBRNoIW4L4j2O2Kurl8dD2Hubx6nqUoK5E5YRTD0rYhOfv/RQbA2jL9vc
 R38=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLd5F0nz1Rwt8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:41 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662441; x=1674254442; bh=wLon510VHyvWrBnIFx
 TDZasif/XairXPaP+olplQ0og=; b=TqcX/z1wwwRPinwpR4Gh0up30R23mCQHPF
 +N1aNyJKqXkHMiG/zF6yk19gtSz1flUscb5oBn9qtNrQOtks1ina3d/CL6EblKzo
 IOriRmw1d/7wxS/nDiHOtvWYOQqw2Hk4wx3+PJs65zV0Zggl/WN7D5hWeuY6SBcz
 7PxNXwMI8a4VnaE2ATV+nUGrUhD7cIfcQlzNk9kHjMJ8lyiRh0IIUKmjj7fYB609
 nhmad5r+SkMegUI5NCryMsa+7HZdywZxwrqhyOfIaENJC+cUkddqApl2JigxRFf2
 OuDA6Gqm/kuz9M1Rn+BXoi+n20U6zOuYox6EAhWp2N5sGUNLR1Dg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HNsGv5D0rwSx for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:41 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLb3MF3z1Rwrq;
 Wed, 21 Dec 2022 14:40:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 06/45] tcg/riscv: Fix base register for user-only qemu_ld/st
Date: Thu, 22 Dec 2022 08:39:43 +1000
Message-Id: <20221221224022.425831-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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
2.38.1


