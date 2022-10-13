Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239885FE4E9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:00:37 +0200 (CEST)
Received: from localhost ([::1]:55232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6Fo-0008EA-5g
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63a-0002mX-B2
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63Y-0005IQ-D3
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8dsQrf3WUq4YDr5jN4X5smND/Tjp6AGn7jZDnvLNNM=;
 b=Q38eCcSAPg24Pn1YCvSnjqZqhvverUf9mrAtFr59AwCKwYMLRiNMPa15ZAD4+tqE6ZUfFH
 Xto3tjAl4l8z6iiObaHYDvZ4E6zY8u7n+sqvGbire5wYq6THStkyzJR3HTGMAez0TYWVi4
 hQIdbjgLQFXJNLh7xp972S1eGdpLxbw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84--uWC4FmmOvii6Tyk0rH0ag-1; Thu, 13 Oct 2022 17:47:54 -0400
X-MC-Unique: -uWC4FmmOvii6Tyk0rH0ag-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0045cec07c3dcso2124215edb.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8dsQrf3WUq4YDr5jN4X5smND/Tjp6AGn7jZDnvLNNM=;
 b=1/LFR+intutN15m50FBnlkwqcDGruUq8q6YCW4lBulIV51qpTUcane+yFVmvr863MH
 f7fZSQjlLCwnTShoRuMUS9UnmPctOcgGj69LF2rFPKpWy81PfRNI3WGAtjdKBcYpOI1a
 EslF92mLUsKRpSn+cslfHgcG6TrC25fGGgvv9a2fy/ERAzouI94NXTvjNZZ899Il1BwQ
 H9rT/8ScUoQSlH13DTVC01IjILX+rrlCCB6mGA9T+g6KX3SxqEPULdLDnLAjkWX7WFOm
 eop1Ax4t/qjUaz4mc9r96yErZmdRet1X15NHycMOA3tL/m0h5J7XwofXwnn1gp3CLKu7
 +zvg==
X-Gm-Message-State: ACrzQf0g4/w8NMuaYinjALZLh1azVAgzu8hXSVrB+kEs9u/ubPw+wiWy
 9VztymlVkOfey+gcewsuXXjU8ho3sfd4Nn1cTJEdU2I4pL1i1rknoZkqILcyKQg8DlkYNvaN4Z0
 BWRvTCtPvPALI87BGrLg7gYbX5FancGEvsBTpOh6wdpTZON3mCaKII+J8Iz4FVH33ocU=
X-Received: by 2002:a17:906:9756:b0:78b:8c9b:3b1d with SMTP id
 o22-20020a170906975600b0078b8c9b3b1dmr1299316ejy.256.1665697672970; 
 Thu, 13 Oct 2022 14:47:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Vx/tPHobAqouAopMpInOVjFb5hjdVmnPL2laluI6a7FUtOY+hQGJoiymNk5lTw57rjMMOJg==
X-Received: by 2002:a17:906:9756:b0:78b:8c9b:3b1d with SMTP id
 o22-20020a170906975600b0078b8c9b3b1dmr1299302ejy.256.1665697672623; 
 Thu, 13 Oct 2022 14:47:52 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a1709061da900b00731582babcasm455614ejh.71.2022.10.13.14.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 20/35] target/i386: reimplement 0x0f 0x78-0x7f, add AVX
Date: Thu, 13 Oct 2022 23:46:36 +0200
Message-Id: <20221013214651.672114-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

These are a mixed batch, including the first two horizontal
(66 and F2 only) operations, more moves, and SSE4a extract/insert.

Because SSE4a is pretty rare, I chose to leave the helper as they are,
but it is possible to unify them by loading index and length from the
source XMM register and generating deposit or extract TCG ops.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 51 +++++++++++++++++++
 target/i386/tcg/emit.c.inc       | 86 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  1 +
 3 files changed, 138 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index abb99bfe51..df38c12a2d 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -168,6 +168,50 @@ static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = *decode_by_prefix(s, opcodes_0F6F);
 }
 
+static void decode_0F78(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F78[4] = {
+        {},
+        X86_OP_ENTRY3(EXTRQ_i,       V,x, None,None, I,w,  cpuid(SSE4A)),
+        {},
+        X86_OP_ENTRY3(INSERTQ_i,     V,x, U,x, I,w,        cpuid(SSE4A)),
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F78);
+}
+
+static void decode_0F79(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    if (s->prefix & PREFIX_REPNZ) {
+        entry->gen = gen_INSERTQ_r;
+    } else if (s->prefix & PREFIX_DATA) {
+        entry->gen = gen_EXTRQ_r;
+    } else {
+        entry->gen = NULL;
+    };
+}
+
+static void decode_0F7E(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F7E[4] = {
+        X86_OP_ENTRY3(MOVD_from,  E,y, None,None, P,y, vex5 mmx),
+        X86_OP_ENTRY3(MOVD_from,  E,y, None,None, V,y, vex5),
+        X86_OP_ENTRY3(MOVQ,       V,x, None,None, W,q, vex5),  /* wrong dest Vy on SDM! */
+        {},
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F7E);
+}
+
+static void decode_0F7F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F7F[4] = {
+        X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex1 mmx), /* movq */
+        X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex1), /* movdqa */
+        X86_OP_ENTRY3(MOVDQ,       W,x, None,None, V,x, vex4_unal), /* movdqu */
+        {},
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F7F);
+}
+
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
 };
 
@@ -317,6 +361,13 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x6e] = X86_OP_ENTRY3(MOVD_to,    V,x, None,None, E,y, vex5 mmx p_00_66),  /* wrong dest Vy on SDM! */
     [0x6f] = X86_OP_GROUP0(0F6F),
 
+    [0x78] = X86_OP_GROUP0(0F78),
+    [0x79] = X86_OP_GROUP2(0F79,       V,x, U,x,       cpuid(SSE4A)),
+    [0x7c] = X86_OP_ENTRY3(VHADD,      V,x, H,x, W,x,  vex2 cpuid(SSE3) p_66_f2),
+    [0x7d] = X86_OP_ENTRY3(VHSUB,      V,x, H,x, W,x,  vex2 cpuid(SSE3) p_66_f2),
+    [0x7e] = X86_OP_GROUP0(0F7E),
+    [0x7f] = X86_OP_GROUP0(0F7F),
+
     /* Incorrectly missing from 2-17 */
     [0xd8] = X86_OP_ENTRY3(PSUBUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0xd9] = X86_OP_ENTRY3(PSUBUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index e063d2fe04..7e13fb5869 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -443,6 +443,30 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 UNARY_FP32_SSE(VRSQRT, rsqrt)
 UNARY_FP32_SSE(VRCP, rcp)
 
+/*
+ * 66 = v*pd Vpd, Hpd, Wpd
+ * f2 = v*ps Vps, Hps, Wps
+ */
+static inline void gen_horizontal_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                         SSEFunc_0_eppp pd_xmm, SSEFunc_0_eppp ps_xmm,
+                                         SSEFunc_0_eppp pd_ymm, SSEFunc_0_eppp ps_ymm)
+{
+    SSEFunc_0_eppp ps, pd, fn;
+    ps = s->vex_l ? ps_ymm : ps_xmm;
+    pd = s->vex_l ? pd_ymm : pd_xmm;
+    fn = s->prefix & PREFIX_DATA ? pd : ps;
+    fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+}
+#define HORIZONTAL_FP_SSE(uname, lname)                                            \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_horizontal_fp_sse(s, env, decode,                                          \
+                          gen_helper_##lname##pd_xmm, gen_helper_##lname##ps_xmm,  \
+                          gen_helper_##lname##pd_ymm, gen_helper_##lname##ps_ymm); \
+}
+HORIZONTAL_FP_SSE(VHADD, hadd)
+HORIZONTAL_FP_SSE(VHSUB, hsub)
+
 #define BINARY_INT_GVEC(uname, func, ...)                                          \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
@@ -716,6 +740,32 @@ static void gen_CRC32(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_crc32(s->T0, s->tmp2_i32, s->T1, tcg_constant_i32(8 << ot));
 }
 
+static void gen_EXTRQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 length = tcg_constant_i32(decode->immediate & 63);
+    TCGv_i32 index = tcg_constant_i32((decode->immediate >> 8) & 63);
+
+    gen_helper_extrq_i(cpu_env, OP_PTR0, index, length);
+}
+
+static void gen_EXTRQ_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_extrq_r(cpu_env, OP_PTR0, OP_PTR2);
+}
+
+static void gen_INSERTQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 length = tcg_constant_i32(decode->immediate & 63);
+    TCGv_i32 index = tcg_constant_i32((decode->immediate >> 8) & 63);
+
+    gen_helper_insertq_i(cpu_env, OP_PTR0, OP_PTR1, index, length);
+}
+
+static void gen_INSERTQ_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_insertq_r(cpu_env, OP_PTR0, OP_PTR2);
+}
+
 static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -728,6 +778,24 @@ static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
 }
 
+static void gen_MOVD_from(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[2].ot;
+
+    switch (ot) {
+    case MO_32:
+#ifdef TARGET_X86_64
+        tcg_gen_ld32u_tl(s->T0, cpu_env, decode->op[2].offset);
+        break;
+    case MO_64:
+#endif
+        tcg_gen_ld_tl(s->T0, cpu_env, decode->op[2].offset);
+        break;
+    default:
+        abort();
+    }
+}
+
 static void gen_MOVD_to(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[2].ot;
@@ -765,6 +833,24 @@ static void gen_MOVMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
     tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
 }
 
+static void gen_MOVQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+    int lo_ofs = vector_elem_offset(&decode->op[0], MO_64, 0);
+
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset);
+    /*
+     * tcg_gen_gvec_dup_i64(MO_64, op0.offset, 8, vec_len, s->tmp1_64) would
+     * seem to work, but it does not on big-endian platforms; the cleared parts
+     * are always at higher addresses, but cross-endian emulation inverts the
+     * byte order so that the cleared parts need to be at *lower* addresses.
+     * Because oprsz is 8, we see this here even for SSE; but more in general,
+     * it disqualifies using oprsz < maxsz to emulate VEX128.
+     */
+    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, lo_ofs);
+}
+
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8e382ce0b4..d87c7b3bac 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4775,6 +4775,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             ((b >= 0x150 && b <= 0x16f) ||
+             (b >= 0x178 && b <= 0x17f) ||
              (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
-- 
2.37.3


