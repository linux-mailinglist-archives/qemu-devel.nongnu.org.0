Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B235647A510
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:37:42 +0100 (CET)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCIn-0000VL-QZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:37:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp3-0004eg-4z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:19 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp0-0000GG-Mh
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976570; x=1671512570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/o0QEPqP+8Qi5bQNZpOCBHrB+NJQkCqCekcYbQxjv8s=;
 b=FaRINiHOzeCgkNuadeHr76HHEJCZcI973rpKzyU8EQuHHqAWg6hOiT1g
 miacaaYlxt9cJct604pT4uBJZJ9QFrD2LO5o7NKhnvI1R5fDSnrUE0ly+
 FKtV/VzsveEPjbAsaJ3+xfC/uqWuEqUR2l0rWeW+zG+YvgPFB8kl/j5qu
 kz9LnB/kmqbJ+nICRjtUddxLTdSVnj725f6lIoiI9qJ+qPnFxc0lNPlqz
 DO2e6WlIhiYXFi73Db0TV/g299inNdcAg7UnjSZrjSOcLrrkQaOh8r0cy
 yP1laiTJpzqLjpBL6lto1hzcIwfRWQl/aY0nGDrvY4h+Aw0bg7nM2fk42 A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662347"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:44 +0800
IronPort-SDR: 9Y9aEutI4hTkmzRCBSOSJDGWzajzNlHtMykj++WjqX2vJok19iccXtgwYmWFRH+umJ6G5PMArv
 8pwQujfdvKULfBmZ2gkr55ohCydRC64iBW15OHAp++vaFdFnsL6zj0yze4t6Ik2p6CpXQnBI8A
 EODZtMKDbfq6Dvaz6tunpE9LScsPq1LSzhb9/8iYp4NBfuV89oqPf5PHPzrY3hKN4ygnTxoTIW
 dQLMlKWCaJ/GQ9PZ+Epayf0RHTmLG5GeCHT/MDNsJN4LMMtEhqCiCoIaeNgnQSCd6y1QfdgPFf
 L8SIjTsIIwW1sa1YsaTkpqwR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:34 -0800
IronPort-SDR: bRM6/6txujQ7f+QqeP9ILXa7ygaQjYsphhnkCNNjOUl9kjnmYhTqLK+mRMEyQsh2OG0j4dqGWr
 V1yG6SBroS51iLi4AGPLoObFYcebuwpwrPPAPaWpyNKGo35B41uMZF+S+iHn/lM0CzwKvfNmPm
 Oy8XHU3Or+tFFIgv6m9GmotmFaCx473u1nRvg2poMSCbAaztvOdzzRsVaPXioTx9KzLrMz5KFm
 XP1/0oqQfbACQ2EPWGOzs50WKOyyYz1UbSCtNxZUeBz5zaoYlzTPBRODiQ2HRhacVuR9/T63C5
 /Ek=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBr4Zzgz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976564; x=1642568565; bh=/o0QEPqP+8Qi5bQNZp
 OCBHrB+NJQkCqCekcYbQxjv8s=; b=bmhjDDpdJn1qKy1viazVadEo0K67bCcCyA
 q7DlTUoev8C24DptMs2j1V8HRVEWxR94ytgvce3w9x2KhG7MK0dJOJIl4tbGYRf+
 IbM9HtndN5dX3gMy0kPo/Vbci+7gaReUPcTSuW58EfOgfgujcUjA+H5lanckucyK
 Y2qeq9Wtdoc7Ny/pbk+nA5fdX6Hw1DBEr3MD8+hRiQ32ubFT5gSG+gX6XvZVVwfk
 r1OYJZLH27PaBOr42zZFe07TUW6EJdiCiZ1CFp16Q+dsk2gEC8H/TYLWuL9iz+c6
 pZ6fgnYvVpSTr/hxTTH32+IaI5Q2kfyjT1u/PuIegtNeNBqnTteQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CfDVpLf2tfB0 for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:44 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBn2Fhbz1RtVG;
 Sun, 19 Dec 2021 21:02:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 82/88] target/riscv: rvv-1.0: add vector unit-stride mask
 load/store insns
Date: Mon, 20 Dec 2021 14:56:59 +1000
Message-Id: <20211220045705.62174-83-alistair.francis@opensource.wdc.com>
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-75-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/vector_helper.c            | 21 +++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 40 +++++++++++++++++++++++++
 4 files changed, 67 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ab283d12b7..6e58343af3 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -129,6 +129,8 @@ DEF_HELPER_5(vse8_v_mask, void, ptr, ptr, tl, env, i3=
2)
 DEF_HELPER_5(vse16_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse32_v_mask, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_5(vse64_v_mask, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vlm_v, void, ptr, ptr, tl, env, i32)
+DEF_HELPER_5(vsm_v, void, ptr, ptr, tl, env, i32)
 DEF_HELPER_6(vlse8_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse16_v, void, ptr, ptr, tl, tl, env, i32)
 DEF_HELPER_6(vlse32_v, void, ptr, ptr, tl, tl, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3b6524bad9..1a4a287146 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -305,6 +305,10 @@ vse16_v    ... 000 . 00000 ..... 101 ..... 0100111 @=
r2_nfvm
 vse32_v    ... 000 . 00000 ..... 110 ..... 0100111 @r2_nfvm
 vse64_v    ... 000 . 00000 ..... 111 ..... 0100111 @r2_nfvm
=20
+# Vector unit-stride mask load/store insns.
+vlm_v      000 000 1 01011 ..... 000 ..... 0000111 @r2
+vsm_v      000 000 1 01011 ..... 000 ..... 0100111 @r2
+
 # Vector strided insns.
 vlse8_v     ... 010 . ..... ..... 000 ..... 0000111 @r_nfvm
 vlse16_v    ... 010 . ..... ..... 101 ..... 0000111 @r_nfvm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 83373ca6fc..4c1a1310e6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -345,6 +345,27 @@ GEN_VEXT_ST_US(vse16_v, int16_t, ste_h)
 GEN_VEXT_ST_US(vse32_v, int32_t, ste_w)
 GEN_VEXT_ST_US(vse64_v, int64_t, ste_d)
=20
+/*
+ *** unit stride mask load and store, EEW =3D 1
+ */
+void HELPER(vlm_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl =3D ceil(vl/8) */
+    uint8_t evl =3D (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, lde_b,
+                 0, evl, GETPC(), MMU_DATA_LOAD);
+}
+
+void HELPER(vsm_v)(void *vd, void *v0, target_ulong base,
+                    CPURISCVState *env, uint32_t desc)
+{
+    /* evl =3D ceil(vl/8) */
+    uint8_t evl =3D (env->vl + 7) >> 3;
+    vext_ldst_us(vd, base, env, desc, ste_b,
+                 0, evl, GETPC(), MMU_DATA_STORE);
+}
+
 /*
  *** index: access vector element from indexed memory
  */
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index e540b5d33c..97b1dc1026 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -697,6 +697,46 @@ GEN_VEXT_TRANS(vse16_v, MO_16, r2nfvm, st_us_op, st_=
us_check)
 GEN_VEXT_TRANS(vse32_v, MO_32, r2nfvm, st_us_op, st_us_check)
 GEN_VEXT_TRANS(vse64_v, MO_64, r2nfvm, st_us_op, st_us_check)
=20
+/*
+ *** unit stride mask load and store
+ */
+static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
+{
+    uint32_t data =3D 0;
+    gen_helper_ldst_us *fn =3D gen_helper_vlm_v;
+
+    /* EMUL =3D 1, NFIELDS =3D 1 */
+    data =3D FIELD_DP32(data, VDATA, LMUL, 0);
+    data =3D FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
+}
+
+static bool ld_us_mask_check(DisasContext *s, arg_vlm_v *a, uint8_t eew)
+{
+    /* EMUL =3D 1, NFIELDS =3D 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
+{
+    uint32_t data =3D 0;
+    gen_helper_ldst_us *fn =3D gen_helper_vsm_v;
+
+    /* EMUL =3D 1, NFIELDS =3D 1 */
+    data =3D FIELD_DP32(data, VDATA, LMUL, 0);
+    data =3D FIELD_DP32(data, VDATA, NF, 1);
+    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
+}
+
+static bool st_us_mask_check(DisasContext *s, arg_vsm_v *a, uint8_t eew)
+{
+    /* EMUL =3D 1, NFIELDS =3D 1 */
+    return require_rvv(s) && vext_check_isa_ill(s);
+}
+
+GEN_VEXT_TRANS(vlm_v, MO_8, vlm_v, ld_us_mask_op, ld_us_mask_check)
+GEN_VEXT_TRANS(vsm_v, MO_8, vsm_v, st_us_mask_op, st_us_mask_check)
+
 /*
  *** stride load and store
  */
--=20
2.31.1


