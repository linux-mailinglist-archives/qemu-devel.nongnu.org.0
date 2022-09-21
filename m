Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14AD5BFEC0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:14:13 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazYK-0006Po-NY
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oaz3R-00013P-EY
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:42:19 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oaz3L-0004cM-Tt
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:42:15 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A303532005D8;
 Wed, 21 Sep 2022 08:41:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 21 Sep 2022 08:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1663764105; x=1663850505; bh=d+
 LjkiAfgacH3tsiShIBiIkdBeIpKthkGtVUtdrd/LQ=; b=CM/OFTVGKrNx4oDMJ9
 j4pDe1Y0YtWYSWZObZvgKCQjH9bSHkpmaZcZenPh7OjXORT7BkgoSYQnBM3pjbB8
 6RYowP9FfOyrDlMfRYHJlSFmam0TXivJ/DG3rzu8K1GcLFwJsqMfuirw0tw/YEoq
 OWnhf1FDLNvFCNNE7yet6+ygt69FpJZ2Wmq7KPBsyDEctJdtJWvQWbiV6niAYXBN
 a6X7uM1gYf2lPqg9qDkUyOYFWfGnajlwib7xbvyUGFVfG/IVeh5PDtg/u+VMchcT
 L1Mdy8ZJBnDaZqAL/y+SNvcFvNnxzwUkZ+Ej9OODB+095BlaAmEaQeUYzSLq7E6H
 xPUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1663764105; x=1663850505; bh=d+LjkiAfgacH3
 tsiShIBiIkdBeIpKthkGtVUtdrd/LQ=; b=agkLehu9V5FiWAkLFTFkxxVPWQhpZ
 tYMTbJCdpJjG24EMWR4X1yPww7PQyWJhXNGx+zAiqbkDE9UCQggoZadeDtK/uVQl
 wD8pPiDWrTdCcOvfiyzpSARcTXsQspmOnyJmohgNbnFnLZgz6WtzBKV15I829uz2
 MBhwfTs+Q9QRqLeWkQXriG0SPL/uOjA5ky23zKQFU2bi0KqvI/wluJ74ZJs4NBKs
 QkIjnzJwMbSKXS96TDUie70nnAO16FydzA5JC7FO0Amsvw8OsANWbc7G5B98OB4d
 p1XT3s4kOAOkFIfOinWhMTT20A0rFy/BPCGs/gM7cf5djbVr3R0nX0/Cw==
X-ME-Sender: <xms:iAYrY3gnQP4IYpjyQ1hLJTuqIP955ALSTC-iB_gR1v-WHzhY5qNEJA>
 <xme:iAYrY0C6XJ_lmm0XoNr16f-log9MCc-xDgWiNUDNqOf4Lasj-bmhq3zGzpsW_ABG9
 NSK2NmHldkQPIGO0xI>
X-ME-Received: <xmr:iAYrY3ElMVQyuZrr55AJLNxLSSAnTuJJWZi70I8xzX5jnqTDu4ldGPRcuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
 dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:iQYrY0Tjn8f6FrdzhZRBN-QAViz2ptRte1MEbAe768SFO0ye46yKSQ>
 <xmx:iQYrY0ygNlwWMAGffADCfySNpsX_IpPTakaibtEH6bqzBbaIKHOqtw>
 <xmx:iQYrY64kPYYQTyIDA_hrknANCxy2NwsccD68ghgURMlidAccht1QRg>
 <xmx:iQYrY__qYOz3ZC3_Ehd_chtBQMPC4t7RgXmSx-R855ejEEWmJhW0HQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Sep 2022 08:41:44 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, richard.henderson@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 2/3] target/mips: Convert legacy arithmatic instructions
 to decodetree
Date: Wed, 21 Sep 2022 13:41:04 +0100
Message-Id: <20220921124105.3824962-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921124105.3824962-1-jiaxun.yang@flygoat.com>
References: <20220921124105.3824962-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

Mostly copy paste from translate.c, with some simplification
based on newly introduced register access functions.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/tcg/insn_trans/trans_arith.c.inc | 352 +++++++++++++++++++
 target/mips/tcg/legacy.decode                |  62 ++++
 target/mips/tcg/meson.build                  |   1 +
 target/mips/tcg/translate.c                  |  20 +-
 4 files changed, 425 insertions(+), 10 deletions(-)
 create mode 100644 target/mips/tcg/insn_trans/trans_arith.c.inc
 create mode 100644 target/mips/tcg/legacy.decode

diff --git a/target/mips/tcg/insn_trans/trans_arith.c.inc b/target/mips/tcg/insn_trans/trans_arith.c.inc
new file mode 100644
index 0000000000..3de9722939
--- /dev/null
+++ b/target/mips/tcg/insn_trans/trans_arith.c.inc
@@ -0,0 +1,352 @@
+static bool gen_arith_notrap(DisasContext *ctx, arg_r *a,
+                             DisasExtend ext, void (*func)(TCGv, TCGv, TCGv))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs, ext);
+    TCGv src2 = get_gpr(ctx, a->rt, ext);
+
+    func(dest, src1, src2);
+    gen_set_gpr(a->rd, dest, ext);
+
+    return true;
+}
+
+static bool gen_add(DisasContext *ctx, arg_r *a, DisasExtend ext)
+{
+    TCGv t0 = tcg_temp_local_new();
+    TCGv t1 = get_gpr(ctx, a->rs, ext);
+    TCGv t2 = get_gpr(ctx, a->rt, ext);
+    TCGLabel *l1 = gen_new_label();
+
+    tcg_gen_add_tl(t0, t1, t2);
+    gen_extend(t0, t0, ext);
+    tcg_gen_xor_tl(t1, t1, t2);
+    tcg_gen_xor_tl(t2, t0, t2);
+    tcg_gen_andc_tl(t1, t2, t1);
+    tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
+    /* operands of same sign, result different sign */
+    generate_exception(ctx, EXCP_OVERFLOW);
+    gen_set_label(l1);
+    gen_store_gpr(t0, a->rd);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool gen_sub(DisasContext *ctx, arg_r *a, DisasExtend ext)
+{
+    TCGv src1 = get_gpr(ctx, a->rs, ext);
+    TCGv src2 = get_gpr(ctx, a->rt, ext);
+    TCGv t0 = tcg_temp_local_new();
+    TCGv t1 = tcg_temp_local_new();
+    TCGv t2 = tcg_temp_local_new();
+    TCGLabel *l1 = gen_new_label();
+
+    tcg_gen_sub_tl(t0, src1, src2);
+    gen_extend(t0, t0, ext);
+    tcg_gen_xor_tl(t2, src1, src2);
+    tcg_gen_xor_tl(t1, t0, src1);
+    tcg_gen_and_tl(t1, t1, t2);
+    tcg_temp_free(t2);
+    tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
+    tcg_temp_free(t1);
+    /*
+     * operands of different sign, first operand and the result
+     * of different sign
+     */
+    generate_exception(ctx, EXCP_OVERFLOW);
+    gen_set_label(l1);
+    gen_store_gpr(t0, a->rd);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool gen_arith_imm_notrap(DisasContext *ctx, arg_i *a, DisasExtend ext,
+                             void (*func)(TCGv, TCGv, target_long))
+{
+    TCGv dest = dest_gpr(ctx, a->rt);
+    TCGv src1 = get_gpr(ctx, a->rs, ext);
+
+    func(dest, src1, a->imm);
+    gen_set_gpr(a->rt, dest, ext);
+
+    return true;
+}
+
+static bool gen_add_imm(DisasContext *ctx, arg_i *a, DisasExtend ext)
+{
+    TCGv t0 = tcg_temp_local_new();
+    TCGv t1 = get_gpr(ctx, a->rs, ext);
+    TCGv t2 = tcg_temp_new();
+    TCGLabel *l1 = gen_new_label();
+    target_ulong uimm = (target_long)a->imm; /* Sign extend to 32/64 bits */
+
+    gen_load_gpr(t1, a->rs);
+    tcg_gen_addi_tl(t0, t1, uimm);
+    tcg_gen_ext32s_tl(t0, t0);
+
+    tcg_gen_xori_tl(t1, t1, ~uimm);
+    tcg_gen_xori_tl(t2, t0, uimm);
+    tcg_gen_and_tl(t1, t1, t2);
+    tcg_temp_free(t2);
+    tcg_gen_brcondi_tl(TCG_COND_GE, t1, 0, l1);
+    /* operands of same sign, result different sign */
+    generate_exception(ctx, EXCP_OVERFLOW);
+    gen_set_label(l1);
+    tcg_gen_ext32s_tl(t0, t0);
+    gen_store_gpr(t0, a->rt);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+#define DECLEAR_GEN_CL(suffix, arg_type)                                    \
+static bool gen_cl_##suffix(DisasContext *ctx, arg_type * a, bool zero)     \
+{                                                                           \
+    TCGv dest = dest_gpr(ctx, a->rd);                                       \
+    TCGv src = get_gpr(ctx, a->rs, EXT_NONE);                               \
+    if (!zero) {                                                            \
+        tcg_gen_not_tl(dest, src);                                          \
+    }                                                                       \
+    tcg_gen_ext32u_tl(dest, dest);                                          \
+    tcg_gen_clzi_tl(dest, dest, TARGET_LONG_BITS);                          \
+    tcg_gen_subi_tl(dest, dest, TARGET_LONG_BITS - 32);                     \
+    gen_set_gpr(a->rd, dest, EXT_NONE);                                     \
+    return true;                                                            \
+}                                                                           \
+
+DECLEAR_GEN_CL(legacy, arg_r)
+#undef DECLEAR_GEN_CL
+
+#ifdef TARGET_MIPS64
+#define DECLEAR_GEN_DCL(suffix, arg_type)                                   \
+static bool gen_dcl_##suffix(DisasContext *ctx, arg_type * a, bool zero)    \
+{                                                                           \
+    TCGv dest = dest_gpr(ctx, a->rd);                                       \
+    TCGv src = get_gpr(ctx, a->rs, EXT_NONE);                               \
+    if (!zero) {                                                            \
+        tcg_gen_not_tl(dest, src);                                          \
+    }                                                                       \
+    tcg_gen_clzi_i64(dest, dest, 64);                                       \
+    gen_set_gpr(a->rd, dest, EXT_NONE);                                     \
+    return true;                                                            \
+}                                                                           \
+
+DECLEAR_GEN_DCL(legacy, arg_r)
+#undef DECLEAR_GEN_DCL
+#endif
+
+static bool gen_setcond(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rt, EXT_NONE);
+
+    tcg_gen_setcond_tl(cond, dest, src1, src2);
+
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static bool gen_setcond_imm(DisasContext *ctx, arg_i *a, TCGCond cond)
+{
+    TCGv dest = dest_gpr(ctx, a->rt);
+    TCGv src1 = get_gpr(ctx, a->rs, EXT_NONE);
+
+    tcg_gen_setcondi_tl(cond, dest, src1, a->imm);
+
+    gen_set_gpr(a->rt, dest, EXT_NONE);
+
+    return true;
+}
+
+static bool gen_mult32(DisasContext *ctx, arg_r2_s *a,
+                       void (*func)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv src1 = get_gpr(ctx, a->rs, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rt, EXT_NONE);
+    TCGv dst_lo = dest_lo(ctx, 0);
+    TCGv dst_hi = dest_hi(ctx, 0);
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    tcg_gen_trunc_tl_i32(t1, src1);
+    tcg_gen_trunc_tl_i32(t2, src2);
+
+    func(t1, t2, t1, t2);
+
+    tcg_gen_ext_i32_tl(dst_lo, t1);
+    tcg_gen_ext_i32_tl(dst_hi, t2);
+
+    gen_set_lo(0, dst_lo, EXT_NONE);
+    gen_set_hi(0, dst_hi, EXT_NONE);
+
+    return true;
+}
+
+#if defined(TARGET_MIPS64)
+static bool gen_mult64(DisasContext *ctx, arg_r2_s *a,
+                       void (*func)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv src1 = get_gpr(ctx, a->rs, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rt, EXT_NONE);
+    TCGv dst_lo = dest_lo(ctx, 0);
+    TCGv dst_hi = dest_hi(ctx, 0);
+
+    func(dst_lo, dst_hi, src1, src2);
+
+    gen_set_lo(0, dst_lo, EXT_NONE);
+    gen_set_hi(0, dst_hi, EXT_NONE);
+
+    return true;
+}
+#endif
+
+static bool gen_div(DisasContext *ctx, arg_r2_s *a, DisasExtend src_ext,
+                    DisasExtend dst_ext)
+{
+    TCGv temp1, temp2, zero, one, mone, min;
+    TCGv src1 = get_gpr(ctx, a->rs, src_ext);
+    TCGv src2 = get_gpr(ctx, a->rt, src_ext);
+    TCGv dst_lo = dest_lo(ctx, 0);
+    TCGv dst_hi = dest_hi(ctx, 0);
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    mone = tcg_constant_tl(-1);
+    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
+
+    /*
+     * If overflow, set temp2 to 1, else source2.
+     * This produces the required result of min.
+     */
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, src1, min);
+    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, src2, mone);
+    tcg_gen_and_tl(temp1, temp1, temp2);
+    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp1, zero, one, src2);
+
+    /*
+     * If div by zero, set temp1 to -1 and temp2 to 1 to
+     * produce the required result of -1.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, src2, zero, mone, src1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, src2, zero, one, src2);
+
+    tcg_gen_div_tl(dst_lo, temp1, temp2);
+    tcg_gen_rem_tl(dst_hi, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+
+    gen_set_lo(0, dst_lo, dst_ext);
+    gen_set_hi(0, dst_hi, dst_ext);
+
+    return true;
+}
+
+static bool gen_divu(DisasContext *ctx, arg_r2_s *a, DisasExtend src_ext,
+                    DisasExtend dst_ext)
+{
+    TCGv temp1, temp2, zero, one, max;
+    TCGv src1 = get_gpr(ctx, a->rs, src_ext);
+    TCGv src2 = get_gpr(ctx, a->rt, src_ext);
+    TCGv dst_lo = dest_lo(ctx, 0);
+    TCGv dst_hi = dest_hi(ctx, 0);
+
+    temp1 = tcg_temp_new();
+    temp2 = tcg_temp_new();
+    zero = tcg_constant_tl(0);
+    one = tcg_constant_tl(1);
+    max = tcg_constant_tl(~0);
+
+    /*
+     * If div by zero, set temp1 to max and temp2 to 1 to
+     * produce the required result of max.
+     */
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp1, src2, zero, max, src1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, temp2, src2, zero, one, src2);
+
+    tcg_gen_divu_tl(dst_lo, temp1, temp2);
+    tcg_gen_remu_tl(dst_hi, temp1, temp2);
+
+    tcg_temp_free(temp1);
+    tcg_temp_free(temp2);
+
+    gen_set_lo(0, dst_lo, dst_ext);
+    gen_set_hi(0, dst_hi, dst_ext);
+
+    return true;
+}
+
+static bool gen_mul_addsub(DisasContext *ctx, arg_r2_s *a, DisasExtend ext,
+                            void (*func)(TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv src1 = get_gpr(ctx, a->rs, ext);
+    TCGv src2 = get_gpr(ctx, a->rt, ext);
+    TCGv_i64 src3 = get_hilo(ctx, 0);
+    TCGv_i64 dst = dest_hilo(ctx, 0);
+    TCGv_i64 t2 = tcg_temp_new_i64();
+    TCGv_i64 t3 = tcg_temp_new_i64();
+
+    switch (ext) {
+    case EXT_SIGN:
+        tcg_gen_ext_tl_i64(t2, src1);
+        tcg_gen_ext_tl_i64(t3, src2);
+        break;
+    case EXT_ZERO:
+        tcg_gen_extu_tl_i64(t2, src1);
+        tcg_gen_extu_tl_i64(t3, src2);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+
+    tcg_gen_mul_i64(dst, t2, t3);
+    tcg_temp_free_i64(t2);
+    tcg_temp_free_i64(t3);
+    func(dst, dst, src3);
+
+    gen_set_hilo(0, dst);
+
+    return true;
+}
+
+TRANS(ADD, gen_add, EXT_SIGN)
+TRANS(ADDU, gen_arith_notrap, EXT_SIGN, tcg_gen_add_tl)
+TRANS_6R(ADDI, gen_add_imm, EXT_SIGN)
+TRANS(ADDIU, gen_arith_imm_notrap, EXT_SIGN, tcg_gen_addi_tl)
+TRANS(SUB, gen_sub, EXT_SIGN)
+TRANS(SUBU, gen_arith_notrap, EXT_SIGN, tcg_gen_sub_tl)
+TRANS_6R(CLO, gen_cl_legacy, false)
+TRANS_6R(CLZ, gen_cl_legacy, true)
+TRANS(SLT, gen_setcond, TCG_COND_LT)
+TRANS(SLTU, gen_setcond, TCG_COND_LTU)
+TRANS(SLTI, gen_setcond_imm, TCG_COND_LT)
+TRANS(SLTIU, gen_setcond_imm, TCG_COND_LTU)
+TRANS_6R(MUL, gen_arith_notrap, EXT_SIGN, tcg_gen_mul_tl)
+TRANS_6R(MULT, gen_mult32, tcg_gen_muls2_i32)
+TRANS_6R(MULTU, gen_mult32, tcg_gen_mulu2_i32)
+TRANS_6R(DIV, gen_div, EXT_SIGN, EXT_SIGN)
+TRANS_6R(DIVU, gen_divu, EXT_ZERO, EXT_SIGN)
+TRANS_6R(MADD, gen_mul_addsub, EXT_SIGN, tcg_gen_add_i64)
+TRANS_6R(MADDU, gen_mul_addsub, EXT_ZERO, tcg_gen_add_i64)
+TRANS_6R(MSUB, gen_mul_addsub, EXT_SIGN, tcg_gen_sub_i64)
+TRANS_6R(MSUBU, gen_mul_addsub, EXT_ZERO, tcg_gen_sub_i64)
+
+TRANS64(DADD, gen_add, EXT_NONE)
+TRANS64(DADDU, gen_arith_notrap, EXT_NONE, tcg_gen_add_tl)
+TRANS64_6R(DADDI, gen_add_imm, EXT_NONE)
+TRANS64(DADDIU, gen_arith_imm_notrap, EXT_NONE, tcg_gen_addi_tl)
+TRANS64(DSUB, gen_sub, EXT_NONE)
+TRANS64(DSUBU, gen_arith_notrap, EXT_NONE, tcg_gen_sub_tl)
+TRANS64_6R(DCLO, gen_dcl_legacy, false)
+TRANS64_6R(DCLZ, gen_dcl_legacy, true)
+TRANS64_6R(DMULT, gen_mult64, tcg_gen_muls2_i64)
+TRANS64_6R(DMULTU, gen_mult64, tcg_gen_mulu2_i64)
+TRANS64_6R(DDIV, gen_div, EXT_NONE, EXT_NONE)
+TRANS64_6R(DDIVU, gen_divu, EXT_NONE, EXT_NONE)
diff --git a/target/mips/tcg/legacy.decode b/target/mips/tcg/legacy.decode
new file mode 100644
index 0000000000..d535fbe31b
--- /dev/null
+++ b/target/mips/tcg/legacy.decode
@@ -0,0 +1,62 @@
+# MIPS I to MIPS Release 5 instructions
+#
+# Copyright (C) 2022 Jiaxun Yang
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+
+
+# Fields:
+%rd       11:5
+%rs       21:5
+%rt       16:5
+
+%imms16   0:s16
+
+# Argument sets:
+&empty
+&r      rd rs rt
+&r2_s   rs rt
+&i      rt rs imm
+
+# Formats:
+@r             ................................     &r  %rd %rs %rt
+@r2_s          ................................     &r2_s %rs %rt
+@i             ................................     &i   %rt %rs imm=%imms16
+
+# Base arithmetic instructions
+ADD            000000 ...............00000100000       @r
+ADDI           001000 ..........................       @i # 6R
+ADDIU          001001 ..........................       @i
+ADDU           000000 ...............00000100001       @r
+CLO            011100 ...............00000100001       @r # 6Rm
+CLZ            011100 ...............00000100000       @r # 6Rm
+DIV            000000 ..........0000000000011010       @r2_s # 6R
+DIVU           000000 ..........0000000000011011       @r2_s # 6R
+MADD           011100 ..........0000000000000000       @r2_s # 6R
+MADDU          011100 ..........0000000000000001       @r2_s # 6R
+MSUB           011100 ..........0000000000000100       @r2_s # 6R
+MSUBU          011100 ..........0000000000000101       @r2_s # 6R
+MUL            011100 ...............00000000010       @r    # 6R
+MULT           000000 ..........0000000000011000       @r2_s # 6R
+MULTU          000000 ..........0000000000011001       @r2_s # 6R
+SLT            000000 ...............00000101010       @r
+SLTI           001010 ..........................       @i
+SLTIU          001011 ..........................       @i
+SLTU           000000 ...............00000101011       @r
+SUB            000000 ...............00000100010       @r
+SUBU           000000 ...............00000100011       @r
+
+
+DADD           000000 ...............00000101100       @r
+DADDI          011000 ..........................       @i # 6R
+DADDIU         011001 ..........................       @i
+DADDU          000000 ...............00000101101       @r
+DCLO           011100 ...............00000100101       @r # 6Rm
+DCLZ           011100 ...............00000100100       @r # 6Rm
+DDIV           000000 ..........0000000000011110       @r2_s # 6R
+DDIVU          000000 ..........0000000000011111       @r2_s # 6R
+DSUB           000000 ...............00000101110       @r
+DSUBU          000000 ...............00000101111       @r
+DMULT          000000 ..........0000000000011100       @r2_s # 6R
+DMULTU         000000 ..........0000000000011101       @r2_s  # 6R
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 7ee969ec8f..7a27fe93e0 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -1,4 +1,5 @@
 gen = [
+  decodetree.process('legacy.decode', extra_args: ['--static-decode=decode_isa_legacy']),
   decodetree.process('rel6.decode', extra_args: ['--decode=decode_isa_rel6']),
   decodetree.process('msa.decode', extra_args: '--decode=decode_ase_msa'),
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index b5d595ef34..bcb267e6bd 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -38,6 +38,9 @@
 #include "fpu_helper.h"
 #include "translate.h"
 
+/* Include the generated ISA decoders */
+#include "decode-legacy.c.inc"
+
 /*
  * Many sysemu-only helpers are not reachable for user-only.
  * Define stub generators here, so that we need not either sprinkle
@@ -1196,16 +1199,6 @@ enum {
     MMI_OPC_MADDU1     = 0x21 | MMI_OPC_CLASS_MMI,
 };
 
-/*
- * If an operation is being performed on less than TARGET_LONG_BITS,
- * it may require the inputs to be sign- or zero-extended; which will
- * depend on the exact operation being performed.
- */
-typedef enum {
-    EXT_NONE,
-    EXT_SIGN,
-    EXT_ZERO
-} DisasExtend;
 
 /* global register indices */
 TCGv cpu_gpr[32], cpu_PC;
@@ -12261,6 +12254,9 @@ static void gen_sync(int stype)
     tcg_gen_mb(tcg_mo);
 }
 
+/* ISA base */
+#include "insn_trans/trans_arith.c.inc"
+
 /* ISA extensions (ASEs) */
 
 /* MIPS16 extension to MIPS32 */
@@ -16090,6 +16086,10 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         return;
     }
 
+    if (decode_isa_legacy(ctx, ctx->opcode)) {
+        return;
+    }
+
     if (decode_opc_legacy(env, ctx)) {
         return;
     }
-- 
2.34.1


