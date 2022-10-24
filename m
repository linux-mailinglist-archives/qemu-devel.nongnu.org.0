Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F4560AFCC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:58:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzJ4-0003dk-8G; Mon, 24 Oct 2022 11:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJ2-0003dI-PY
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:24:00 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJ0-0008Fk-M1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:24:00 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4744D3200645;
 Mon, 24 Oct 2022 11:23:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 24 Oct 2022 11:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1666625035; x=1666711435; bh=lQ
 HWUYJM8thKmUr0Q+IUw7XZeSNMjQBQ0vISQ+mREWM=; b=o+2F6fX9iLYjNuX24j
 sN/x2FUS8ioqK5LJlGS0R9g+fo9IJzOMg2k7DvSAmx/26cW+/B4imTYD8szKMem+
 3t5hSAqAJBTCv0kVOMSFsDM/kaWsPg4EtwgYhrz7xupRBmY9HiPD7xH6Sq20n70T
 yvtwwu5DW0VLq/lecXAzkngugCfDcS9LJJhUE2r7VvE06ED74peqiVBVuKi7frbn
 9OOVVG3SmnspUVLn79X6Lud7c1VSD49Sp3Y9Xtp9JuhBRbi6HXHwAuJsK1TxPHoj
 8BHWwMDE1d7fV2MLPTyqcjJHUHPWXd0XsVpFYQkL6qQz5gWO6lPutRQ1omEa6l5Y
 D0zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666625035; x=1666711435; bh=lQHWUYJM8thKm
 Ur0Q+IUw7XZeSNMjQBQ0vISQ+mREWM=; b=pNsyy8TG4hwFXImRIOkZXRM2GNcMS
 iQEjhTZ5bSpD+TsFheDUCmk2rQ5th1CmMfEJJ06KjNANhiA+6of1ONbK2f81wIWF
 EJNBQ7jhyYXUSDBl2X9VBPo6U2tO6Tn7KP4b8t/xFzOVbThJG+PNEkQoaNmTDi15
 bMv9kDna4i0lj+9w+PZOJC9YEKpda8xdPulzluFnpsov67CIYZ5ItZZcAid+yPn3
 2MpiYYeM9jK7FkLuHzQ+Nz/Myta0Apq8xNTOIZw1b0mkmFdkPgiBgR9FLpJ4j5gl
 lBdLNPfaIgtMbKLvd5x4K89l5aU7pleLLxHSMAjboujHwNaJQorvMYf2A==
X-ME-Sender: <xms:C65WY3XwSKA5BK7oZRZvIlcBodk7wmiuaym8z29K5iHo1ouQb1iRWQ>
 <xme:C65WY_mb6TAEINxG_-LC7ETjGYF0kEtZPfnOkx0LeWcuwcnxsz2HdcBCdQa0Og0AA
 2Y_r76JvvjNF7K43g0>
X-ME-Received: <xmr:C65WYzZ3hWS-UdbtOJc82H2U2ro2T6l7xy6CRupcQLm3-rA78vhBoTxdIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
 dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:C65WYyWymbR-9F6QkXR4W1F5QLTl5W7cqXRCVytJSL5mbi7WALqAng>
 <xmx:C65WYxnc3YcYFS2B196up8vn7VR0kKguYVRenvMgU8yTpb6e7VLGZQ>
 <xmx:C65WY_fIJ0Mdu0mp8PZBtYyY5zuBF4lwBaCGrSlQzwvFrQ0scdlB0w>
 <xmx:C65WY2zztGLozSau7bCBmkDbkSg-tMr99i1QujSWi19Su4vhev8FNA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 11:23:54 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, richard.henderson@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/6] target/mips: Introduce register access helper functions
Date: Mon, 24 Oct 2022 16:23:44 +0100
Message-Id: <20221024152349.215135-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
References: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce register access functions with value extend capability
to prepare for decodetree based translation implmentation.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/tcg/translate.c | 143 +++++++++++++++++++++++++++++++++++-
 target/mips/tcg/translate.h |  54 ++++++++++++++
 2 files changed, 196 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index de1511baaf..b5d595ef34 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1196,6 +1196,17 @@ enum {
     MMI_OPC_MADDU1     = 0x21 | MMI_OPC_CLASS_MMI,
 };
 
+/*
+ * If an operation is being performed on less than TARGET_LONG_BITS,
+ * it may require the inputs to be sign- or zero-extended; which will
+ * depend on the exact operation being performed.
+ */
+typedef enum {
+    EXT_NONE,
+    EXT_SIGN,
+    EXT_ZERO
+} DisasExtend;
+
 /* global register indices */
 TCGv cpu_gpr[32], cpu_PC;
 /*
@@ -1221,6 +1232,18 @@ static const char regnames_LO[][4] = {
     "LO0", "LO1", "LO2", "LO3",
 };
 
+static TCGv ctx_temp_new(DisasContext *ctx)
+{
+    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
+    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
+}
+
+static TCGv_i64 ctx_temp_new_i64(DisasContext *ctx)
+{
+    assert(ctx->ntemp64 < ARRAY_SIZE(ctx->temp64));
+    return ctx->temp64[ctx->ntemp64++] = tcg_temp_new_i64();
+}
+
 /* General purpose registers moves. */
 void gen_load_gpr(TCGv t, int reg)
 {
@@ -1238,6 +1261,106 @@ void gen_store_gpr(TCGv t, int reg)
     }
 }
 
+void gen_extend(TCGv dst, TCGv src, DisasExtend src_ext)
+{
+    switch (src_ext) {
+    case EXT_NONE:
+        tcg_gen_mov_tl(dst, src);
+        return;
+    case EXT_SIGN:
+        tcg_gen_ext32s_tl(dst, src);
+        return;
+    case EXT_ZERO:
+        tcg_gen_ext32u_tl(dst, src);
+        return;
+    }
+    g_assert_not_reached();
+}
+
+TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend src_ext)
+{
+    TCGv t;
+
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+
+    switch (src_ext) {
+    case EXT_NONE:
+        return cpu_gpr[reg_num];
+    default:
+        t = ctx_temp_new(ctx);
+        gen_extend(t, cpu_gpr[reg_num], src_ext);
+        return t;
+    }
+}
+
+TCGv_i64 get_hilo(DisasContext *ctx, int acc)
+{
+    TCGv_i64 t = ctx_temp_new_i64(ctx);
+    /* acc must be 0 when DSP is not implemented */
+    g_assert(acc == 0 || ctx->insn_flags & ASE_DSP);
+    tcg_gen_concat_tl_i64(t, cpu_LO[acc], cpu_HI[acc]);
+
+    return t;
+}
+
+TCGv dest_gpr(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0) {
+        return ctx_temp_new(ctx);
+    }
+    return cpu_gpr[reg_num];
+}
+
+TCGv dest_lo(DisasContext *ctx, int acc)
+{
+    /* acc must be 0 when DSP is not implemented */
+    g_assert(acc == 0 || ctx->insn_flags & ASE_DSP);
+
+    return cpu_LO[acc];
+}
+
+TCGv dest_hi(DisasContext *ctx, int acc)
+{
+    /* acc must be 0 when DSP is not implemented */
+    g_assert(acc == 0 || ctx->insn_flags & ASE_DSP);
+
+    return cpu_HI[acc];
+}
+
+/* For 32 bit hilo pair */
+TCGv_i64 dest_hilo(DisasContext *ctx, int acc)
+{
+    /* acc must be 0 when DSP is not implemented */
+    g_assert(acc == 0 || ctx->insn_flags & ASE_DSP);
+    return ctx_temp_new_i64(ctx);
+}
+
+void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
+{
+    if (reg_num != 0) {
+        gen_extend(cpu_gpr[reg_num], t, dst_ext);
+    }
+}
+
+void gen_set_lo(int acc, TCGv t, DisasExtend dst_ext)
+{
+    gen_extend(cpu_LO[acc], t, dst_ext);
+}
+
+void gen_set_hi(int acc, TCGv t, DisasExtend dst_ext)
+{
+    gen_extend(cpu_HI[acc], t, dst_ext);
+}
+
+/* For 32 bit hilo pair */
+void gen_set_hilo(int acc, TCGv_i64 t)
+{
+    gen_move_low32(cpu_LO[acc], t);
+    gen_move_high32(cpu_HI[acc], t);
+}
+
 #if defined(TARGET_MIPS64)
 void gen_load_gpr_hi(TCGv_i64 t, int reg)
 {
@@ -2615,7 +2738,6 @@ static void gen_shift_imm(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t0);
 }
 
-/* Arithmetic */
 static void gen_arith(DisasContext *ctx, uint32_t opc,
                       int rd, int rs, int rt)
 {
@@ -16031,6 +16153,12 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         ctx->base.max_insns = 2;
     }
 
+    ctx->ntemp = 0;
+    ctx->ntemp64 = 0;
+    memset(ctx->temp, 0, sizeof(ctx->temp));
+    memset(ctx->temp64, 0, sizeof(ctx->temp));
+    ctx->zero = tcg_constant_tl(0);
+
     LOG_DISAS("\ntb %p idx %d hflags %04x\n", ctx->base.tb, ctx->mem_idx,
               ctx->hflags);
 }
@@ -16053,6 +16181,7 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     int insn_bytes;
     int is_slot;
+    int i;
 
     is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
     if (ctx->insn_flags & ISA_NANOMIPS32) {
@@ -16074,6 +16203,18 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         return;
     }
 
+    for (i = ctx->ntemp - 1; i >= 0; --i) {
+        tcg_temp_free(ctx->temp[i]);
+        ctx->temp[i] = NULL;
+        ctx->ntemp--;
+    }
+
+    for (i = ctx->ntemp64 - 1; i >= 0; --i) {
+        tcg_temp_free_i64(ctx->temp64[i]);
+        ctx->temp64[i] = NULL;
+        ctx->ntemp64--;
+    }
+
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         if (!(ctx->hflags & (MIPS_HFLAG_BDS16 | MIPS_HFLAG_BDS32 |
                              MIPS_HFLAG_FBNSLOT))) {
diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 69f85841d2..980aa8682d 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -49,6 +49,11 @@ typedef struct DisasContext {
     bool saar;
     bool mi;
     int gi;
+    TCGv zero;
+    TCGv temp[4];
+    uint8_t ntemp;
+    TCGv_i64 temp64[4];
+    uint8_t ntemp64;
 } DisasContext;
 
 #define DISAS_STOP       DISAS_TARGET_0
@@ -119,6 +124,17 @@ enum {
     OPC_BC1TANY4     = (0x01 << 16) | OPC_BC1ANY4,
 };
 
+/*
+ * If an operation is being performed on less than TARGET_LONG_BITS,
+ * it may require the inputs to be sign- or zero-extended; which will
+ * depend on the exact operation being performed.
+ */
+typedef enum {
+    EXT_NONE,
+    EXT_SIGN,
+    EXT_ZERO
+} DisasExtend;
+
 #define gen_helper_0e1i(name, arg1, arg2) do { \
     gen_helper_##name(cpu_env, arg1, tcg_constant_i32(arg2)); \
     } while (0)
@@ -150,6 +166,18 @@ void check_cp1_64bitmode(DisasContext *ctx);
 void check_cp1_registers(DisasContext *ctx, int regs);
 void check_cop1x(DisasContext *ctx);
 
+void gen_extend(TCGv dst, TCGv src, DisasExtend src_ext);
+TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend src_ext);
+TCGv_i64 get_hilo(DisasContext *ctx, int acc);
+TCGv dest_gpr(DisasContext *ctx, int reg_num);
+TCGv dest_lo(DisasContext *ctx, int acc);
+TCGv dest_hi(DisasContext *ctx, int acc);
+TCGv_i64 dest_hilo(DisasContext *ctx, int acc);
+void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext);
+void gen_set_lo(int acc, TCGv t, DisasExtend dst_ext);
+void gen_set_hi(int acc, TCGv t, DisasExtend dst_ext);
+void gen_set_hilo(int acc, TCGv_i64 t);
+
 void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
 void gen_move_low32(TCGv ret, TCGv_i64 arg);
 void gen_move_high32(TCGv ret, TCGv_i64 arg);
@@ -231,6 +259,32 @@ bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { return FUNC(ctx, a, __VA_ARGS__); }
 
+/* Instructions removed in Release 6 */
+#define TRANS_6R(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { return !(ctx->insn_flags & ISA_MIPS_R6) & FUNC(ctx, a, __VA_ARGS__); }
+
+#if defined(TARGET_MIPS64)
+#define TRANS64(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { check_mips_64(ctx); return FUNC(ctx, a, __VA_ARGS__); }
+#define TRANS64_6R(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { if (ctx->insn_flags & ISA_MIPS_R6) return false; check_mips_64(ctx); \
+    return FUNC(ctx, a, __VA_ARGS__); }
+#else
+#define TRANS64(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { return false; }
+#define TRANS64_6R(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { return false; }
+#endif
+
+#define TRANS_FLAGS(NAME, FLAGS, ...) \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
+    { return (ctx->insn_flags & FLAGS) && FUNC(s, __VA_ARGS__); }
+
 static inline bool cpu_is_bigendian(DisasContext *ctx)
 {
     return extract32(ctx->CP0_Config0, CP0C0_BE, 1);
-- 
2.34.1


