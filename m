Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97297424D90
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:56:36 +0200 (CEST)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNKV-0003jr-KI
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDB-0003a9-JC
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:36035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYND9-0004gx-Fk
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589339; x=1665125339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WsOJICK/03juKskqEIrXcCjG3ioOPbKay0Lb2704cvg=;
 b=StaPv7rlmI56Zt6Aj3IixtG9G94SS2fZYGL16Xcbm1Rhlgm9RPMKIb4p
 t9CfziRn8Ed7izWDfRaY72DziAzGPVPIu42bT3yFki+1Y61B5In//ZcZr
 Gp78Nf+pcHIDMchxbxGH8L8lUayXGxbC1Yx0WntOWhOsgRqoQIfGSSVKH
 CG3vZO5el924hC6p0pkE1Ta2GfC+Hct4Ga/s1QnW7Hhm8xnUfPmFpa4xF
 NhYG4BWQbfbkNXc5R4aJQWtvolcQ+51aNjxkqNtSXq3KZMgT4r3OgoN54
 0fajDf6iR+NwT0EmO2tdxayWQ9pTob7CafNe5ceoKL+WqN1O3jxQThfl0 w==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="285950690"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:58 +0800
IronPort-SDR: sa3U2mPmaigxC2hsOY9/GnY1p1AWZdd5q1jVbLqNMevJdyDsKS86ZMsJb/aKa+n5TJ3XhEeZt4
 f6jFh03DaYsCyB4Y96rHgf5kWYpPC75U10rk+NrdA2aQxDAZVdRxrmsohhJcCOAG8BDWFCxaQn
 ziYZ6HzuV+Iig0YoMEKC0jURO8wLEFWSeVNfPXvCkvs6TBbYwwRMY+m/z7JrhR/4NgEUyBnqLN
 TUNfbhRuogUwjHQBtSWOJXOH9jAG25BAYLgkB+Sb3H5v6hhpZcj+pZxQUq9bXdkCb6H5JV/pt1
 Z/X0n/LYfS18ToGiVHDtLS7l
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:24:52 -0700
IronPort-SDR: YfKf0yFpScOLae3qtoDiAkJdgb2B2hdxmENG1EwdfTjwPlY7pVFw/okI4RKY/CLVfxw9Pzu1u+
 Jux65y78rdNJyDnIuz64/I3Ei1GFUg+bA/9McvrdGzl/ezw8r6wU8/nxUZI0fSxXq4OWkJ5EOo
 C7/HxibAIssB8ViCX1KdJeoUybZWsD5b8IgcPt4er2nJ2j3LU14NyA7rklwcHMp0rt5sGMDVGa
 zm79wzfONtXzagQvKuE+A4eryNkGNB91oYp01uETUyeRtgaf6E7aCaaUy+TEUOSdeiKVtzAdMw
 rb0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ23Z44MRz1RvmH
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589337; x=1636181338; bh=WsOJICK/03juKskqEI
 rXcCjG3ioOPbKay0Lb2704cvg=; b=rjjwsEP6AsKalgD8vNtbjsJT7JDuJzNbnN
 9QMnBeq2tDFfkayntNjovTCn5g2LU7x/WLX+Ok5K/bM9oholKYgOkOEJpDi0kFZu
 J2PhkWYj+my9Ja0+XZa3FI6StGauvOAs8FkgpGpaLq8lJw6DDFpLTaYVVF5j/jeS
 I7/T1rJvg8KDQObJXahGaXWNTvuSi5/VzgNk+bCrvRyDYFwDz06hQfDngJxGmkr8
 J5NF2wkrWaPhAgd2z8lwz9BU6nUWktkAdtkUflK2qUl0MaHRcYOnvyqitSGHKfRn
 XRu6gKLuydlKN1NHITO6n/YD95RSNMqlCIp45Dfcj2aqZ22u591A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id icc_tOsUNTWr for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:57 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ23V1K5cz1RvTg;
 Wed,  6 Oct 2021 23:48:53 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/26] target/riscv: Add instructions of the Zbc-extension
Date: Thu,  7 Oct 2021 16:47:34 +1000
Message-Id: <20211007064751.608580-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
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
X-Mailman-Version: 2.1.23
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The following instructions are part of Zbc:
 - clmul
 - clmulh
 - clmulr

Note that these instructions were already defined in the pre-0.93 and
the 0.93 draft-B proposals, but had not been omitted in the earlier
addition of draft-B to QEmu.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210911140016.834071-10-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  5 ++++
 target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 32 ++++++++++++++++++++++++-
 4 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 460eee9988..8a318a2dbc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -63,6 +63,8 @@ DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl=
)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
=20
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 35a3563ff4..1658bb4217 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -714,6 +714,11 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
=20
+# *** RV32 Zbc Standard Extension ***
+clmul      0000101 .......... 001 ..... 0110011 @r
+clmulh     0000101 .......... 011 ..... 0110011 @r
+clmulr     0000101 .......... 010 ..... 0110011 @r
+
 # *** RV32 Zbs Standard Extension ***
 bclr       0100100 .......... 001 ..... 0110011 @r
 bclri      01001. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helpe=
r.c
index 5b2f795d03..73be5a81c7 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -3,6 +3,7 @@
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
  *
  * This program is free software; you can redistribute it and/or modify =
it
  * under the terms and conditions of the GNU General Public License,
@@ -88,3 +89,29 @@ target_ulong HELPER(gorcw)(target_ulong rs1, target_ul=
ong rs2)
 {
     return do_gorc(rs1, rs2, 32);
 }
+
+target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
+{
+    target_ulong result =3D 0;
+
+    for (int i =3D 0; i < TARGET_LONG_BITS; i++) {
+        if ((rs2 >> i) & 1) {
+            result ^=3D (rs1 << i);
+        }
+    }
+
+    return result;
+}
+
+target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
+{
+    target_ulong result =3D 0;
+
+    for (int i =3D 0; i < TARGET_LONG_BITS; i++) {
+        if ((rs2 >> i) & 1) {
+            result ^=3D (rs1 >> (TARGET_LONG_BITS - i - 1));
+        }
+    }
+
+    return result;
+}
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 861364e3e5..2eb5fa3640 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the RVB draft Zb[as] Standard Extensi=
on.
+ * RISC-V translation routines for the Zb[acs] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -24,6 +24,12 @@
     }                                            \
 } while (0)
=20
+#define REQUIRE_ZBC(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_ZBS(ctx) do {                    \
     if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
         return false;                            \
@@ -535,3 +541,27 @@ static bool trans_slli_uw(DisasContext *ctx, arg_sll=
i_uw *a)
     REQUIRE_ZBA(ctx);
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
+
+static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul);
+}
+
+static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
+{
+     gen_helper_clmulr(dst, src1, src2);
+     tcg_gen_shri_tl(dst, dst, 1);
+}
+
+static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_clmulh);
+}
+
+static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
+{
+    REQUIRE_ZBC(ctx);
+    return gen_arith(ctx, a, EXT_NONE, gen_helper_clmulr);
+}
--=20
2.31.1


