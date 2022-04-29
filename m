Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEADF51418D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:47:59 +0200 (CEST)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIXv-0003s9-3N
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIl-0007LK-TM
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:19 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIk-0002Vn-1u
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206736; x=1682742736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fxIYBLAGuCgNuHGkEH2oyJZIUjuICVYT4WbT6ckuK1Y=;
 b=U4HAqHDu8WtlLrZAwcIuJ96Uh8HrDlJRcSg26nIHomSYYc5M73+NOi0a
 3oO9Akw4ZgtOgk1Me7Bk+vFIRVDEclzHoSVbMgqvT3u2sRLJ92HCK06r+
 a27VmSrnwn3erqT3eR+4BCvz7njjIZLM5fd1KMsiQBtObNJQGDSr+oQY5
 q5xpgkA8ktLx82Kg3IDWiWONcXJ6jeaeCbKadzKNyIdpgZyQTlox0i6wf
 q2UxDhP7QRd/ZI7cyGgOogpEed2npnharPM2RdSana4yF0sWdWwlIh6zW
 dg3uSjcOClpFVbZpdtfeuIqDSVPn4gH8x1gtWkZBgJe4WV/8JBtUgTvNo w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995949"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:15 +0800
IronPort-SDR: Yi+6XpIDKAc7GNovb+TgovgrPKVXzh+DsS2Lc2iBFvsCeb937SaexKu7kqZ09P+U2uRN5udGL3
 CHdOHneCN86iZFgQ9+u9SbHXjpNg0NiMLLVTKDZUfmkyxXAm4BqMwNif+bv3oZW0QVm0lagBrd
 a/zEwgr2cGRPG+SxcaeI6OK+q2u5zNpNtywgwXpLo0pwhNyFKjQL1jUDBEylJsTEsWjaczRPO/
 BeCZ7cx+ojEMx7AhHlTE8VhUrS0GiWe3uaGsFJ403gHwaUOAjJRYCwH/ahMlC2fbRl3cjVoUSG
 6HH6qlr1+ZAWIupXiTy/hmEI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:24 -0700
IronPort-SDR: anmAL0f3c9JjPLXqkhrfvPhOBH1vGcblXWZltPVKfc6a5u/lq3Djs9nu0pFOoqmW3EGgPngHji
 bPohURoYvRTAuxZgxkAMsEzHGo3NHw0dpeS5ENyjYR3ueCayOJ/QIHNH3/0HbAP/M00UiiOnXi
 ENC7OcdfRQC140/JtFQGw7V0ZDinqqQAbWDdwyJlbodhanORFjBqt4t7c+V95LpQACx6Qp7JyH
 jNhyarKoWqVojqr4xu7X1wDBzb6anv0OebZ3QX6U0YoVrHWSrvBxjPDORiYpG0FjBBuwUV/eqS
 5+A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMh2ghmz1SVp1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206735; x=1653798736; bh=fxIYBLAGuCgNuHGkEH
 2oyJZIUjuICVYT4WbT6ckuK1Y=; b=WCWG7PC42uNbl7bnht6BgHHZFo6Lv8DGSg
 aEfP/en3667z+PGB2u/JEtTumRbZu84mh35GXh1zOKHizFWkWHaKqd5J5HLgzazQ
 68uvZpH7dJ75/jpM5xUoWImL8XF3Wra5wXxb3I3J+Y3M/1SRboiW3hYizssyBDN+
 jOHffQ1sWJmArQzJslda1jpMvUirykiKEWX9waWKqpcrjVCrMS6jcluQ+/ppwaD/
 PIvBoxL9rfyJcbdpvr3Uro/07De2R84r9HtHjXnDd/exGZgvwahwsud/BJ+Q1w3b
 oZhGvxhCtWBeYZ8gguB223yGeA51l2VINdBGOq5qYHxox4o1WaSw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id H1WaT1fCkIMS for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:15 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMc4jyhz1SVnx;
 Thu, 28 Apr 2022 21:32:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Zewen Ye <lustrew@foxmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/25] target/riscv: rvk: add support for sha512 related
 instructions for RV32 in zknh extension
Date: Fri, 29 Apr 2022 14:31:06 +1000
Message-Id: <20220429043119.1478881-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

 - add sha512sum0r, sha512sig0l, sha512sum1r, sha512sig1l, sha512sig0h an=
d sha512sig1h instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220423023510.30794-10-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |   6 ++
 target/riscv/insn_trans/trans_rvk.c.inc | 100 ++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index db28ecdd2b..02a0c71890 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -862,3 +862,9 @@ sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r=
2
 sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
 sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
 sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
+sha512sum0r 01 01000 ..... ..... 000 ..... 0110011 @r
+sha512sum1r 01 01001 ..... ..... 000 ..... 0110011 @r
+sha512sig0l 01 01010 ..... ..... 000 ..... 0110011 @r
+sha512sig0h 01 01110 ..... ..... 000 ..... 0110011 @r
+sha512sig1l 01 01011 ..... ..... 000 ..... 0110011 @r
+sha512sig1h 01 01111 ..... ..... 000 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_=
trans/trans_rvk.c.inc
index 531e2c7cb3..9ed057a153 100644
--- a/target/riscv/insn_trans/trans_rvk.c.inc
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -178,3 +178,103 @@ static bool trans_sha256sum1(DisasContext *ctx, arg=
_sha256sum1 *a)
     REQUIRE_ZKNH(ctx);
     return gen_sha256(ctx, a, EXT_NONE, tcg_gen_rotri_i32, 6, 11, 25);
 }
+
+static bool gen_sha512_rv32(DisasContext *ctx, arg_r *a, DisasExtend ext=
,
+                            void (*func1)(TCGv_i64, TCGv_i64, int64_t),
+                            void (*func2)(TCGv_i64, TCGv_i64, int64_t),
+                            int64_t num1, int64_t num2, int64_t num3)
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, ext);
+    TCGv_i64 t0 =3D tcg_temp_new_i64();
+    TCGv_i64 t1 =3D tcg_temp_new_i64();
+    TCGv_i64 t2 =3D tcg_temp_new_i64();
+
+    tcg_gen_concat_tl_i64(t0, src1, src2);
+    func1(t1, t0, num1);
+    func2(t2, t0, num2);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_rotri_i64(t2, t0, num3);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_trunc_i64_tl(dest, t1);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+    return true;
+}
+
+static bool trans_sha512sum0r(DisasContext *ctx, arg_sha512sum0r *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
+                           tcg_gen_rotli_i64, 25, 30, 28);
+}
+
+static bool trans_sha512sum1r(DisasContext *ctx, arg_sha512sum1r *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
+                           tcg_gen_rotri_i64, 23, 14, 18);
+}
+
+static bool trans_sha512sig0l(DisasContext *ctx, arg_sha512sig0l *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotri_i64,
+                           tcg_gen_rotri_i64, 1, 7, 8);
+}
+
+static bool trans_sha512sig1l(DisasContext *ctx, arg_sha512sig1l *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64,
+                           tcg_gen_rotri_i64, 3, 6, 19);
+}
+
+static bool gen_sha512h_rv32(DisasContext *ctx, arg_r *a, DisasExtend ex=
t,
+                             void (*func)(TCGv_i64, TCGv_i64, int64_t),
+                             int64_t num1, int64_t num2, int64_t num3)
+{
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, ext);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, ext);
+    TCGv_i64 t0 =3D tcg_temp_new_i64();
+    TCGv_i64 t1 =3D tcg_temp_new_i64();
+    TCGv_i64 t2 =3D tcg_temp_new_i64();
+
+    tcg_gen_concat_tl_i64(t0, src1, src2);
+    func(t1, t0, num1);
+    tcg_gen_ext32u_i64(t2, t0);
+    tcg_gen_shri_i64(t2, t2, num2);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_rotri_i64(t2, t0, num3);
+    tcg_gen_xor_i64(t1, t1, t2);
+    tcg_gen_trunc_i64_tl(dest, t1);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t2);
+    return true;
+}
+
+static bool trans_sha512sig0h(DisasContext *ctx, arg_sha512sig0h *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotri_i64, 1, 7, 8=
);
+}
+
+static bool trans_sha512sig1h(DisasContext *ctx, arg_sha512sig1h *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+    return gen_sha512h_rv32(ctx, a, EXT_NONE, tcg_gen_rotli_i64, 3, 6, 1=
9);
+}
--=20
2.35.1


