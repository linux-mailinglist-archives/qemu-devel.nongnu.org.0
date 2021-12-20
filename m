Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EED47A4BC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:54:45 +0100 (CET)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBdE-00046C-JF
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmv-0004Fd-OS
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:43 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmm-0008G0-G0
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976433; x=1671512433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NLr/KpyKN/D/OBAYEsJ/jfMTxAQiBjmiamIONAK7+vo=;
 b=kAN9b6ehk55XPIEClPiHH71gGysYpMD3gngFkkiuXxFrfG6WivS2ZjOK
 RpB2JC999qUkVSCmsygNQso3L8lmst5pIrYqMiKxXBczdKKoGhnYXSe3c
 XBJmhgWmGUh1tbGDDOGaSgFSVXgy+9Dhwrn5BjZfqjO8HtsQoBj/iTkaM
 9sg5kQOkchUtIJPpGkJvd+SeKWaF109e5AjEDOepQa1Jw3+aC+24HqZRz
 BYoOmM6tnJgGMf6KTfc+0meIIu6hjhOndWJiUUUiD4J1RaJbuBS39URRg
 WsJRTNIeBpUlF6ZkQGNypbpg5wKOEOH6wFYjetomUT762X+NpzleJEUYl w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680100"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:20 +0800
IronPort-SDR: RX8iO/rIjQ7NYXeCClLo3u1lk7VCIKUClWsU97tqOdZI2AhEMvTtBpe+Lp6FJ/vo20X8nWiSjm
 KJC7bU2GiIhX4lLVkWV7A2YHVM4SZkO1n+onR1zDrQ4Qy2KjzePOaEeC4XqOqbWU+/7Kx/llcq
 olb4G3YDGUapDJFYznFFY+5pL3PeqPerdE3Re8kSajeY+NhzCWIXtusKA2jOjiqWrSrk+p8K09
 Hv0NRGdq7Xk/9XNSkX670fERqxl7lmFVaWU1ho6Oys/30T+/IrH/hBHn4geS6rW07uyJzN5aC1
 NukR227wgse2U8OVVab82epn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:09 -0800
IronPort-SDR: UzI2l4M6nntjtQceim2HQOqv1g0obgw9/8YkT3fyidbSAnFnud3NLsAc0QJsDZJwFIch3HawHF
 mpH9Sq5v7nt3uhJSwqq6+EPtQ5UurCAdM+QZMy4PZKhO5XjCd4xeYhAt4Fv9SiD5C8qF1rlR+g
 BqLfW2V/NFcxuNOg9WsjqLINLdxpLFa9CYshmgdFGldKTX//kaCl9UPtE3d1SyRJz5PlEcGJ8x
 eygyrYjjmzPLDgMpmHLv6dAXuUeCA3rsbLw9817OouP1vgzhpNBA9D7f1+35apDxdcoMq7Aiqn
 n4g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:21 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS833zxcz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976418; x=1642568419; bh=NLr/KpyKN/D/OBAYEs
 J/jfMTxAQiBjmiamIONAK7+vo=; b=NZlWbZYu25KU/94jOVepBAubn0TqGmnOfV
 30C/NM8bpECqC5uQMCaxukK5Y3hXvCcLUEWjeOFdLA3QVMARFBKzD6Ikbvi9tRvY
 0egOBUG1bmi5sRtWtvCy+dAfJ7YL1D467FS9DXFiZo7uZt3rWsw64T0oxQ5pEA+T
 SoIK1lYOjQdyrmdkk/9acFhLQShtajhSWNgiyXpG4799Car7OoKXLrd+a5RrscNe
 NZQR9j92C7+YkHWdDoxnxcdb4aMTjXnAvPBfbGfsVx7Z2bw+Kzz7otAUlkqp1k0i
 55tsoMLdGwkAwDEinqFGow7kRJU/0qIzm6S7V/U6SPz1iZeCkdpw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id c14B-ftUoJch for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:18 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7z6D41z1RtVG;
 Sun, 19 Dec 2021 21:00:15 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 44/88] target/riscv: rvv-1.0: integer scalar move instructions
Date: Mon, 20 Dec 2021 14:56:21 +1000
Message-Id: <20211220045705.62174-45-alistair.francis@opensource.wdc.com>
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

* Remove "vmv.s.x: dothing if rs1 =3D=3D 0" constraint.
* Add vmv.x.s instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-37-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  3 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 43 ++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4653a9679e..e33ec82fdf 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -634,8 +634,9 @@ vmsif_m         010100 . ..... 00011 010 ..... 101011=
1 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
+vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
+vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
-vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 322fc5c4aa..c250943dde 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2978,27 +2978,54 @@ static void vec_element_storei(DisasContext *s, i=
nt vreg,
     store_element(val, cpu_env, endian_ofs(s, vreg, idx), s->sew);
 }
=20
+/* vmv.x.s rd, vs2 # x[rd] =3D vs2[0] */
+static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
+{
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
+        TCGv_i64 t1;
+        TCGv dest;
+
+        t1 =3D tcg_temp_new_i64();
+        dest =3D tcg_temp_new();
+        /*
+         * load vreg and sign-extend to 64 bits,
+         * then truncate to XLEN bits before storing to gpr.
+         */
+        vec_element_loadi(s, t1, a->rs2, 0, true);
+        tcg_gen_trunc_i64_tl(dest, t1);
+        gen_set_gpr(s, a->rd, dest);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free(dest);
+
+        return true;
+    }
+    return false;
+}
+
 /* vmv.s.x vd, rs1 # vd[0] =3D rs1 */
 static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         /* This instruction ignores LMUL and vector register groups */
-        int maxsz =3D s->vlen >> 3;
         TCGv_i64 t1;
+        TCGv s1;
         TCGLabel *over =3D gen_new_label();
=20
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
-        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), maxsz, maxsz, 0)=
;
-        if (a->rs1 =3D=3D 0) {
-            goto done;
-        }
=20
         t1 =3D tcg_temp_new_i64();
-        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
+
+        /*
+         * load gpr and sign-extend to 64 bits,
+         * then truncate to SEW bits when storing to vreg.
+         */
+        s1 =3D get_gpr(s, a->rs1, EXT_NONE);
+        tcg_gen_ext_tl_i64(t1, s1);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
         mark_vs_dirty(s);
-    done:
         gen_set_label(over);
         return true;
     }
--=20
2.31.1


