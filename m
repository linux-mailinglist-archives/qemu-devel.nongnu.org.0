Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8754B4AE98D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 06:54:16 +0100 (CET)
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHfvj-0005Js-4V
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 00:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0329bc3a9=alistair.francis@opensource.wdc.com>)
 id 1nHfqu-0003dZ-P8
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 00:49:16 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:56781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0329bc3a9=alistair.francis@opensource.wdc.com>)
 id 1nHfqZ-0006cw-CI
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 00:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644385734; x=1675921734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QMhN77C0h/Icz7f7QIrT5UFY3MNMDGn0byqXhmz0QEA=;
 b=LV79ogAgJrtrnKOZASk7o0wm1fUUOQmhGfb3G0l/Z/aUZKYZiiAuK4yi
 VzmJBopn2eTNJ5Yv5JaLL8OHy3dAnh2gPyv+hLmwvv4l4F2hneajlExCT
 tvGekqUoyNNgRe1gmUgLuUACfPXKiY9IQ8WPZJpwNfUUg7JxZW+oHVQop
 0U4fzVR2UtrvB96MpjbAP5vYbfPLr3HWhu+vHptsQvuo0bhmGOI0/LcgZ
 DatIhFTG5uQlM58yzV7aR00QErrd8SgRHYGF3KBW6CtXG2n3sTxmVW4yu
 KVKeH13WUr13OE54Xt/jU9CaFH4MtEP+52vRZpuYE7qLC+0BhO1k7fbaY A==;
X-IronPort-AV: E=Sophos;i="5.88,354,1635177600"; d="scan'208";a="192479033"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2022 13:48:37 +0800
IronPort-SDR: YsTIoHrPZKyIkLRPA/K810zgIFzamafkUfln3nAGUE98gIJ37eYhZ1Jmtk9HEdSR28y8JOxYIr
 Wp/3pWFavPqlIUvaAWRfU4UdTpkSLbvFiBzhgMLLqPPFfrFRoX4iP+MHmjji80nOfTwmkyNBMO
 6WvY8pEw+SrcBFGbZ80Ipl/k7YzEdlia4useDECnzYQb/Do6epldSrbYd2BH3JKpeEld1iqSjW
 2R10Vcm8HFFy+cry0DNVKCKFCWRaH2CIuD8wtRUxx0Y3QQgGcc/PBeBCkJQDGChgPRRaTvBhDv
 qMXwStEv0sI/IZZyolpcPG/A
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 21:20:27 -0800
IronPort-SDR: rN6Hh+Oj8R/XXJ2pQpomOaLJhqD9jNQx0yi9qOjCkxilXrV4Qn0Yjd/IQFz8PsHi86HDICyfn4
 /J69dKNC3A7R7AgNq5ApUO+ixgNWupO/sdvFPlW0HSHaTGK0T2GigT+9O4l/WtNKAmIxG/Rtls
 SFt/7dSF4q6xT+vXNWRV2Dzl7Dyt5i03vfyYebuA75xiJqCeYH0708hvn+A43HGPN8hrXeHjTI
 +Fvl7Rqft0HKEJ/mliOKLgMh7upFoH6ami34fNrV1vuvFNXylmnpf5ccgekZkTcQHUyT+JgPti
 UMU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 21:48:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JtppF3qPXz1SVp4
 for <qemu-devel@nongnu.org>; Tue,  8 Feb 2022 21:48:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1644385716;
 x=1646977717; bh=QMhN77C0h/Icz7f7QIrT5UFY3MNMDGn0byqXhmz0QEA=; b=
 IonTVa7SAAhChuy5wvrsnldGMLfybENqnU2G44hHL8Ao61DaGU/IqsSdHzDCbB0g
 p/nzEyZTZO1ZOXbIq8iuHrOxmo9Sdl0bhl3tjuWi995s6VEBQYq9YJD5GNCJHx4c
 cJaBJyKqQO54eUh2VR1C4ibDIMkhHkKLieHtDMl18hXG0xkaICw+9DaNKQTvmOfH
 E8/atnISKZSl5e3QVq1vDrY7cozhX6GLI42dHDGjBxY4Glq/4Jwzr3XX+gpj89g4
 uvPy26N9fzOWPS1kxLg7j49Y82BTejcZppWyJQgw9BaOuuZP3LSjo6HUXPzxnO7l
 0CPQPw+uW41NS/uZuXYlqA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id W5MLmggRDwEq for <qemu-devel@nongnu.org>;
 Tue,  8 Feb 2022 21:48:36 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.95])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jtpp81Zjgz1Rwrw;
 Tue,  8 Feb 2022 21:48:31 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 bmeng.cn@gmail.com, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] target/riscv: Call probe_write() before atomic operations
Date: Wed,  9 Feb 2022 15:48:25 +1000
Message-Id: <20220209054825.345376-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=0329bc3a9=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

If an atomic operation fails on RISC-V we want to generate a store/amo
fault and not a load fault.

Currently if we have no permissions to access the memory location the
atomic operation will sometimes fail with a load fault (depending on the
path taken in tcg/tcg-op.c) as the atomic helpers perform a load then a
store.

By performing a probe_write() on the memory first, we can ensure we have
permissions to perform the atomic operation. As RISC-V doesn't have
write only pages this should be pretty robust (PMP might be the
exception).

Note that this only fixes the fault for memory regions. I/O and
non-existant regions will still trigger a load fault.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 +
 target/riscv/op_helper.c                |  6 +++
 target/riscv/insn_trans/trans_rva.c.inc | 59 +++++++++++++++++--------
 3 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 72cc2582f4..afc8dcc1a0 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -106,6 +106,8 @@ DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 #endif
=20
+DEF_HELPER_4(atomic_check, void, env, tl, int, int)
+
 /* Hypervisor functions */
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(hyp_tlb_flush, void, env)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1a75ba11e6..d883609f4f 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -114,6 +114,12 @@ target_ulong helper_csrrw_i128(CPURISCVState *env, i=
nt csr,
     return int128_getlo(rv);
 }
=20
+void helper_atomic_check(CPURISCVState *env, target_ulong address,
+                         int width, int mmu_idx)
+{
+    probe_write(env, address, width, mmu_idx, GETPC());
+}
+
 #ifndef CONFIG_USER_ONLY
=20
 target_ulong helper_sret(CPURISCVState *env)
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
index 45db82c9be..003a7d0b84 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -78,11 +78,14 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, =
MemOp mop)
=20
 static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
-                    MemOp mop)
+                    TCGv_i32 width, MemOp mop)
 {
     TCGv dest =3D dest_gpr(ctx, a->rd);
     TCGv src1 =3D get_address(ctx, a->rs1, 0);
     TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv_i32 mem_idx =3D tcg_constant_i32(ctx->mem_idx);
+
+    gen_helper_atomic_check(cpu_env, src1, width, mem_idx);
=20
     func(dest, src1, src2, ctx->mem_idx, mop);
=20
@@ -105,55 +108,64 @@ static bool trans_sc_w(DisasContext *ctx, arg_sc_w =
*a)
 static bool trans_amoswap_w(DisasContext *ctx, arg_amoswap_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TESL)=
);
+    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, tcg_constant_i32(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_amoadd_w(DisasContext *ctx, arg_amoadd_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_=
TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, tcg_constant_i3=
2(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_amoxor_w(DisasContext *ctx, arg_amoxor_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_=
TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, tcg_constant_i3=
2(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_amoand_w(DisasContext *ctx, arg_amoand_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_=
TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, tcg_constant_i3=
2(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_amoor_w(DisasContext *ctx, arg_amoor_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_T=
ESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, tcg_constant_i32=
(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_amomin_w(DisasContext *ctx, arg_amomin_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO=
_TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, tcg_constant_i=
32(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_amomax_w(DisasContext *ctx, arg_amomax_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO=
_TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, tcg_constant_i=
32(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_amominu_w(DisasContext *ctx, arg_amominu_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO=
_TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, tcg_constant_i=
32(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
 {
     REQUIRE_EXT(ctx, RVA);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO=
_TESL));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, tcg_constant_i=
32(4),
+                   (MO_ALIGN | MO_TESL));
 }
=20
 static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
@@ -171,53 +183,62 @@ static bool trans_sc_d(DisasContext *ctx, arg_sc_d =
*a)
 static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEUQ)=
);
+    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, tcg_constant_i32(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
=20
 static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_=
TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, tcg_constant_i3=
2(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
=20
 static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_=
TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, tcg_constant_i3=
2(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
=20
 static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_=
TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, tcg_constant_i3=
2(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
=20
 static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_T=
EUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, tcg_constant_i32=
(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
=20
 static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO=
_TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, tcg_constant_i=
32(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
=20
 static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO=
_TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, tcg_constant_i=
32(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
=20
 static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO=
_TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, tcg_constant_i=
32(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
=20
 static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
 {
     REQUIRE_64BIT(ctx);
-    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO=
_TEUQ));
+    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, tcg_constant_i=
32(8),
+                   (MO_ALIGN | MO_TEUQ));
 }
--=20
2.34.1


