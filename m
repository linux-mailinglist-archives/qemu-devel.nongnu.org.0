Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C63FD154
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:28:57 +0200 (CEST)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFzk-0002hk-HD
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkO-0007ul-Ic
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:09 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkE-0000pL-Dn
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462374; x=1661998374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sWmBwJwLtxFRNIwO20RvmCwHJuEQv09yP0QcAYcSYqE=;
 b=bBH32zqG/lMdJsDCHW4WSdpERyX7IXZuBVUTKsk6DoSGb6Z/ZFqPZCZ/
 vRd5PrYKGLXirH+S3aKf9c2U8mEsXfZptxw/ABVF3Gn5mlEVEEqHwpAwF
 UrxKfraw1iULSBrngZ+4Raez7oZA+FgnkI/N6MIciNR1+LtUVh2ii5WRh
 P4iIneGbfLW/oozrdEksQxmuI61vj0hGhElxZEn0E6LJozuqLgpFdIi6w
 IDE5NYlQVgPnn7YSzju6GDVxEpt4hNfafJ75wTw3xkQvm+a0EDrxLrloi
 ftdb0Chq0YIlzJ9WL37CTBiYhbm+l1SB5uUX6umpgO/NDvvL84DOtU5QC g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011787"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:53 +0800
IronPort-SDR: dWpt+OK7JDknIjStekfjXR7SuycKnYl2Emea1x1x2asciNXtqepCAweXAxGirh8XDX0yAkQ2+M
 mYHqzm6eDC7jHlepkLyokYvTd83Rvra4LNlq3Kr5q/5XPsthmA1LpdXRT6WG9QlPbOoc4Mgz9P
 MaoabBuwBv38/0xtjP0CiH5zghw8KNxaxt8MucT5ry/EedyyyRVu0fdX3EgyUI2utbC//y8G+r
 BVORL06OCzVoUPTehy1MVQ5I4L5VrEYIN+Va1PhiHb4hxBhk47aLdlG3q2mK/xkN9C3nLz05M0
 qUmNnmb2h93U/XjFUE1PhihM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:49:41 -0700
IronPort-SDR: bUWAYH/72Dv4SpFXk/brxjrVX7OHpGKus8VBMhlmR5d3r9fH8AbtDAaztWi/cA1rFsxZWoOm8B
 ySo3nnJy9sbGudZlLE6mmKfw1DojUA1WoyFYP5n00guTPSRAvMgphfJxZmak5n5D5j0Wt3y9RN
 u+0hUQ9GSraEewSc/trBSzUf0D06rgm53yDll/egYidUEmn/EW6u2Cg8BE5EcOcekZ2CHxtlDS
 ZoRmT86fadi/N4vrltPYEWbZebVDcnTbsbruKvBjYwYfWszPIDqjtB/RVoygt5tuhZIyNbqxKe
 k60=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gzndd2ltBz1RvmL
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462368; x=1633054369; bh=sWmBwJwLtxFRNIwO20
 RvmCwHJuEQv09yP0QcAYcSYqE=; b=qwiMhJP3OgWhUTOuPw8L3Y97W0gj3xnQqU
 Xh4PT6tAVlkUTQoIBdr1NDRoN3LIxh0jlZcCOMCQ4LwRvKfrrBQ/NRR7YFxXc2kR
 vEk3ZrEVNs092EUOwVta99DaXVfE5IJfB36TyhP7X1i7etVdpkI5Kq3qUaFmHVq6
 QR0Kx5KvrKlAjW2rC2TBAaOANKt7mUtwSC8hoyOwQnDfZMs05+prF5VY5YUiJGcM
 d1ldset9+q5CSR58klOCw+sfHA4JjQwz9VtqW136GQ+gfef15RUW3sGSo04eLmNy
 6xoBtiFdsK+p/6DMjOS4z3clvag5Z9o9mhKXV6TmGnVMVYeVtrPg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HzQMbHkvK2Dz for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:48 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GzndS21wbz1RvlZ;
 Tue, 31 Aug 2021 19:12:43 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 28/33] target/riscv: Use {get,dest}_gpr for RVA
Date: Wed,  1 Sep 2021 12:09:53 +1000
Message-Id: <20210901020958.458454-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-20-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rva.c.inc | 47 ++++++++++---------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_=
trans/trans_rva.c.inc
index 3cc3c3b073..6ea07d89b0 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -18,11 +18,10 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
=20
-static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
+static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 =3D tcg_temp_new();
-    /* Put addr in load_res, data in load_val.  */
-    gen_get_gpr(ctx, src1, a->rs1);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
@@ -30,33 +29,33 @@ static inline bool gen_lr(DisasContext *ctx, arg_atom=
ic *a, MemOp mop)
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
+
+    /* Put addr in load_res, data in load_val.  */
     tcg_gen_mov_tl(load_res, src1);
     gen_set_gpr(ctx, a->rd, load_val);
=20
-    tcg_temp_free(src1);
     return true;
 }
=20
-static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
+static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 =3D tcg_temp_new();
-    TCGv src2 =3D tcg_temp_new();
-    TCGv dat =3D tcg_temp_new();
+    TCGv dest, src1, src2;
     TCGLabel *l1 =3D gen_new_label();
     TCGLabel *l2 =3D gen_new_label();
=20
-    gen_get_gpr(ctx, src1, a->rs1);
+    src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
=20
-    gen_get_gpr(ctx, src2, a->rs2);
     /*
      * Note that the TCG atomic primitives are SC,
      * so we can ignore AQ/RL along this path.
      */
-    tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
+    dest =3D dest_gpr(ctx, a->rd);
+    src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
+    tcg_gen_atomic_cmpxchg_tl(dest, load_res, load_val, src2,
                               ctx->mem_idx, mop);
-    tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
-    gen_set_gpr(ctx, a->rd, dat);
+    tcg_gen_setcond_tl(TCG_COND_NE, dest, dest, load_val);
+    gen_set_gpr(ctx, a->rd, dest);
     tcg_gen_br(l2);
=20
     gen_set_label(l1);
@@ -65,8 +64,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic=
 *a, MemOp mop)
      * provide the memory barrier implied by AQ/RL.
      */
     tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL)=
;
-    tcg_gen_movi_tl(dat, 1);
-    gen_set_gpr(ctx, a->rd, dat);
+    gen_set_gpr(ctx, a->rd, tcg_constant_tl(1));
=20
     gen_set_label(l2);
     /*
@@ -75,9 +73,6 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic=
 *a, MemOp mop)
      */
     tcg_gen_movi_tl(load_res, -1);
=20
-    tcg_temp_free(dat);
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
     return true;
 }
=20
@@ -85,17 +80,13 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
                     MemOp mop)
 {
-    TCGv src1 =3D tcg_temp_new();
-    TCGv src2 =3D tcg_temp_new();
-
-    gen_get_gpr(ctx, src1, a->rs1);
-    gen_get_gpr(ctx, src2, a->rs2);
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
=20
-    (*func)(src2, src1, src2, ctx->mem_idx, mop);
+    func(dest, src1, src2, ctx->mem_idx, mop);
=20
-    gen_set_gpr(ctx, a->rd, src2);
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
=20
--=20
2.31.1


