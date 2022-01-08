Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC404881DA
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:25:49 +0100 (CET)
Received: from localhost ([::1]:43800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65Ah-0000wX-Dn
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:25:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fX-0001eG-Li
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:35 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fV-0006wZ-9w
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621212; x=1673157212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8jNhiKga46+KXXZWiUZDyv0+t6mxHqbOiLYkr8+Sxas=;
 b=HVx4o721hzWdusVDwZrRgHkg37zc61itoQW5W0hRDv7yRaP/KlFoND/E
 yA7VGRQiVIsw2f0sE5P/TUxCqzk+JC3akjy1TtztTSfEcQbNl2Wy+FLw3
 XUs8M5tw+sUqNQcJ9H5BURJIa6oNpmFZKkocv6xocASZq5Vm72QGFIiW6
 8tinm26RkEwlO6P8CKdPf+tum1hValvIehrd/yOycL9T6ahSo/ySGk3xO
 eVSH3aPAxWfsPYstHEY0cSzC6VIQz8ZNpRTOvcWVXdpQuQ09SjZydeYxM
 4xAoUHsd//95nsxfadQjhRLzJQedSnGZeGrLw1LJ5KAurs9jUgCDKMCa8 A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984960"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:31 +0800
IronPort-SDR: hUvD9nl0ctVAacZRPYF7R2C8BQ4AApAkWGgcSZ38FOC5Io+86XwkVb7JvGjH9OHSAwDnCKNW21
 DFkaFJEFiK21mQBKsOuEuEEOLO6rrkqbrGoyq3A/WbO3rQGzN6OHKMimedKxNQP2dPnXzNLkRn
 Orib9XV5EYKo1awK4Z6ioqWGuQq2/vDvtwF9zZNiczKvvEX857o7iIlPey2oGCeHMuaNxkKSfg
 78gUNDR8dNhloRvBptsSNQ4PUUA2Yvgm6fdq9fjaGAWyfMYM0WAXDHe5yHR4hyGdFlGI2I3gNE
 9FMH8QMkOKVVjmfd56oBmkIc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:59 -0800
IronPort-SDR: GFkqTQ0aGx0O9nGJEprQk2vtHD85idRyeMRfn1jZLA6Hp2PbYIydJ63asc4hA3Uj/Zud80Cf7R
 5qidbcvUzSO94JgaEuv5ET4k/g2MN9RNx3cybBBEO9pp70dQ4Lb6MbdPFZHvRK6f826f0Yn+Iv
 DwInshimEEU/6bNjYuXyMpJYak0oQbYlnxyGc2xEy8NbZ/I6Qd721nqu05wPOCYtlH/+QT5pz0
 h5alt7JvkHSvZolVwY1A20APea3j+o8Nunugm3um3jaXJFV8WTBN9e6lrbnfk8JZNuV6pWbhOc
 aRU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Qh1ZD3z1VSkh
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621211; x=1644213212; bh=8jNhiKg
 a46+KXXZWiUZDyv0+t6mxHqbOiLYkr8+Sxas=; b=Fs8jHiJLX3La0ZeZHsFVDuX
 j1aXtyazuUi/gQAWlglfDoa++05GuNd6qRCAw8B8d1SDc9c6dVmWrLqa3sLUjRcD
 Gnqs4I7Njzo4U1HVRgeLDOzQQVkfx+9SHlsRW2bYla6DkxhR0UkIRk1RMy/vrR9A
 K0yeaPpku5HB/AJYZIR6eSWIpQG4ouASoqH4B5G7ua0xiXF+n6+2lhFoUQXUkTBS
 iCgasfh+A/2HrpvoR3nwyNECR1x0N+W0SKi5ufZyOeacCj3i3xxwx1f9plMaoYqQ
 5NKeaLznLELgRa8iTFlIuPtZyEm0Tutac3kZvq32j93ZTuaVy0JI4N/46gbOImA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 47Xvmux8UKQs for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:31 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Qb4wnbz1VSkW;
 Fri,  7 Jan 2022 21:53:27 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 33/37] target/riscv: modification of the trans_csrxx for
 128-bit support
Date: Sat,  8 Jan 2022 15:50:44 +1000
Message-Id: <20220108055048.3512645-34-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

As opposed to the gen_arith and gen_shift generation helpers, the csr ins=
ns
do not have a common prototype, so the choice to generate 32/64 or 128-bi=
t
helper calls is done in the trans_csrxx functions.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-18-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 201 +++++++++++++++++++-----
 1 file changed, 158 insertions(+), 43 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index ca354130ec..3a0ae28fef 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -881,20 +881,78 @@ static bool do_csrrw(DisasContext *ctx, int rd, int=
 rc, TCGv src, TCGv mask)
     return do_csr_post(ctx);
 }
=20
-static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
+static bool do_csrr_i128(DisasContext *ctx, int rd, int rc)
 {
-    TCGv src =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv destl =3D dest_gpr(ctx, rd);
+    TCGv desth =3D dest_gprh(ctx, rd);
+    TCGv_i32 csr =3D tcg_constant_i32(rc);
=20
-    /*
-     * If rd =3D=3D 0, the insn shall not read the csr, nor cause any of=
 the
-     * side effects that might occur on a csr read.
-     */
-    if (a->rd =3D=3D 0) {
-        return do_csrw(ctx, a->csr, src);
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
     }
+    gen_helper_csrr_i128(destl, cpu_env, csr);
+    tcg_gen_ld_tl(desth, cpu_env, offsetof(CPURISCVState, retxh));
+    gen_set_gpr128(ctx, rd, destl, desth);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrw_i128(DisasContext *ctx, int rc, TCGv srcl, TCGv srch=
)
+{
+    TCGv_i32 csr =3D tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrw_i128(cpu_env, csr, srcl, srch);
+    return do_csr_post(ctx);
+}
=20
-    TCGv mask =3D tcg_constant_tl(-1);
-    return do_csrrw(ctx, a->rd, a->csr, src, mask);
+static bool do_csrrw_i128(DisasContext *ctx, int rd, int rc,
+                          TCGv srcl, TCGv srch, TCGv maskl, TCGv maskh)
+{
+    TCGv destl =3D dest_gpr(ctx, rd);
+    TCGv desth =3D dest_gprh(ctx, rd);
+    TCGv_i32 csr =3D tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrrw_i128(destl, cpu_env, csr, srcl, srch, maskl, maskh)=
;
+    tcg_gen_ld_tl(desth, cpu_env, offsetof(CPURISCVState, retxh));
+    gen_set_gpr128(ctx, rd, destl, desth);
+    return do_csr_post(ctx);
+}
+
+static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
+{
+    if (get_xl(ctx) < MXL_RV128) {
+        TCGv src =3D get_gpr(ctx, a->rs1, EXT_NONE);
+
+        /*
+         * If rd =3D=3D 0, the insn shall not read the csr, nor cause an=
y of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd =3D=3D 0) {
+            return do_csrw(ctx, a->csr, src);
+        }
+
+        TCGv mask =3D tcg_constant_tl(-1);
+        return do_csrrw(ctx, a->rd, a->csr, src, mask);
+    } else {
+        TCGv srcl =3D get_gpr(ctx, a->rs1, EXT_NONE);
+        TCGv srch =3D get_gprh(ctx, a->rs1);
+
+        /*
+         * If rd =3D=3D 0, the insn shall not read the csr, nor cause an=
y of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd =3D=3D 0) {
+            return do_csrw_i128(ctx, a->csr, srcl, srch);
+        }
+
+        TCGv mask =3D tcg_constant_tl(-1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, srcl, srch, mask, mask)=
;
+    }
 }
=20
 static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
@@ -906,13 +964,24 @@ static bool trans_csrrs(DisasContext *ctx, arg_csrr=
s *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 =3D=3D 0) {
-        return do_csrr(ctx, a->rd, a->csr);
-    }
+    if (get_xl(ctx) < MXL_RV128) {
+        if (a->rs1 =3D=3D 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
=20
-    TCGv ones =3D tcg_constant_tl(-1);
-    TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
-    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
+        TCGv ones =3D tcg_constant_tl(-1);
+        TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+        return do_csrrw(ctx, a->rd, a->csr, ones, mask);
+    } else {
+        if (a->rs1 =3D=3D 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones =3D tcg_constant_tl(-1);
+        TCGv maskl =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+        TCGv maskh =3D get_gprh(ctx, a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, ones, ones, maskl, mask=
h);
+    }
 }
=20
 static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
@@ -924,28 +993,54 @@ static bool trans_csrrc(DisasContext *ctx, arg_csrr=
c *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 =3D=3D 0) {
-        return do_csrr(ctx, a->rd, a->csr);
-    }
+    if (get_xl(ctx) < MXL_RV128) {
+        if (a->rs1 =3D=3D 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
=20
-    TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
-    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
+        TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+        return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
+    } else {
+        if (a->rs1 =3D=3D 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv maskl =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+        TCGv maskh =3D get_gprh(ctx, a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr,
+                             ctx->zero, ctx->zero, maskl, maskh);
+    }
 }
=20
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
-    TCGv src =3D tcg_constant_tl(a->rs1);
+    if (get_xl(ctx) < MXL_RV128) {
+        TCGv src =3D tcg_constant_tl(a->rs1);
=20
-    /*
-     * If rd =3D=3D 0, the insn shall not read the csr, nor cause any of=
 the
-     * side effects that might occur on a csr read.
-     */
-    if (a->rd =3D=3D 0) {
-        return do_csrw(ctx, a->csr, src);
-    }
+        /*
+         * If rd =3D=3D 0, the insn shall not read the csr, nor cause an=
y of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd =3D=3D 0) {
+            return do_csrw(ctx, a->csr, src);
+        }
=20
-    TCGv mask =3D tcg_constant_tl(-1);
-    return do_csrrw(ctx, a->rd, a->csr, src, mask);
+        TCGv mask =3D tcg_constant_tl(-1);
+        return do_csrrw(ctx, a->rd, a->csr, src, mask);
+    } else {
+        TCGv src =3D tcg_constant_tl(a->rs1);
+
+        /*
+         * If rd =3D=3D 0, the insn shall not read the csr, nor cause an=
y of the
+         * side effects that might occur on a csr read.
+         */
+        if (a->rd =3D=3D 0) {
+            return do_csrw_i128(ctx, a->csr, src, ctx->zero);
+        }
+
+        TCGv mask =3D tcg_constant_tl(-1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, src, ctx->zero, mask, m=
ask);
+    }
 }
=20
 static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
@@ -957,16 +1052,26 @@ static bool trans_csrrsi(DisasContext *ctx, arg_cs=
rrsi *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 =3D=3D 0) {
-        return do_csrr(ctx, a->rd, a->csr);
-    }
+    if (get_xl(ctx) < MXL_RV128) {
+        if (a->rs1 =3D=3D 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
+
+        TCGv ones =3D tcg_constant_tl(-1);
+        TCGv mask =3D tcg_constant_tl(a->rs1);
+        return do_csrrw(ctx, a->rd, a->csr, ones, mask);
+    } else {
+        if (a->rs1 =3D=3D 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
=20
-    TCGv ones =3D tcg_constant_tl(-1);
-    TCGv mask =3D tcg_constant_tl(a->rs1);
-    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
+        TCGv ones =3D tcg_constant_tl(-1);
+        TCGv mask =3D tcg_constant_tl(a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr, ones, ones, mask, ctx->=
zero);
+    }
 }
=20
-static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
+static bool trans_csrrci(DisasContext *ctx, arg_csrrci * a)
 {
     /*
      * If rs1 =3D=3D 0, the insn shall not write to the csr at all, nor
@@ -975,10 +1080,20 @@ static bool trans_csrrci(DisasContext *ctx, arg_cs=
rrci *a)
      * a zero value, the instruction will still attempt to write the
      * unmodified value back to the csr and will cause side effects.
      */
-    if (a->rs1 =3D=3D 0) {
-        return do_csrr(ctx, a->rd, a->csr);
-    }
+    if (get_xl(ctx) < MXL_RV128) {
+        if (a->rs1 =3D=3D 0) {
+            return do_csrr(ctx, a->rd, a->csr);
+        }
=20
-    TCGv mask =3D tcg_constant_tl(a->rs1);
-    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
+        TCGv mask =3D tcg_constant_tl(a->rs1);
+        return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
+    } else {
+        if (a->rs1 =3D=3D 0) {
+            return do_csrr_i128(ctx, a->rd, a->csr);
+        }
+
+        TCGv mask =3D tcg_constant_tl(a->rs1);
+        return do_csrrw_i128(ctx, a->rd, a->csr,
+                             ctx->zero, ctx->zero, mask, ctx->zero);
+    }
 }
--=20
2.31.1


