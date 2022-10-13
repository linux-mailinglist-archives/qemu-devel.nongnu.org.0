Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8C5FE4F1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:06:38 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6Ld-0006CH-Bf
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63e-0002qF-1K
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63b-0005Ik-Er
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIIWwroXmAqH+9EGYvOEJ0bQT5fBy14wDFD0nbzHhVo=;
 b=NwKim2nuvkNlaoLLhcDByXry1RC0yYZyMOXJpL85cA3zwhw4mZdZElUorjRTQCLWEKKpgK
 4rae2VaE7MTSBviJ1o6H7Fjm4kFB612MXbdgAD/74l9MtnCzTTGNSuFPAle6ZJ8b2UTG+H
 n6e3b7qDsZ2rehiSuhkXctsYRjH5SVs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-let2N5SNNfWfBDxZ_imMng-1; Thu, 13 Oct 2022 17:47:57 -0400
X-MC-Unique: let2N5SNNfWfBDxZ_imMng-1
Received: by mail-ed1-f69.google.com with SMTP id
 s8-20020a056402520800b0045cab560d5eso2344952edd.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIIWwroXmAqH+9EGYvOEJ0bQT5fBy14wDFD0nbzHhVo=;
 b=EWV9XJCVTqxt3Reoo6dn9qkQIMAf5VxXrsCpyH7b0Vv5l9gVg0hXlCOCVdbwL3Uzkn
 CrEtKOeQ4GmKgrVLxaGA5Qg+M6lxNHmTMKGjNphjGKCuU2OkZ+YDCIBxmv4FcRTwJHs+
 Rx8GhBd39xX6QTyYKG4priMBHkHNANLNfhm4D3ME3hlECvMuaVtIXjkLg8qEufzmVEnp
 U19gimGP+ybTxtr0Ph1P8Egw2ES4YoTHDy5cV6iKOIgqUdq547aD/uDu+5wAruvdlNrh
 7uK6KfYawN5GgCeAfOwV9C4q4IveYSMdr1l3/op/xy9bigHPsI5RL5K9UhZBG6I0oP8z
 sFDA==
X-Gm-Message-State: ACrzQf3sjDUBJG217EHRa+wwLgSfhKGmQurvRsQ17jCU4SW0PN6cHjk2
 wCpxmj1T9kkCKVUsV8qfhy04jVLQMSeYwn7fRaVQ0YT/978X7iGfyRMREJ2CJ4nzlf6aTm8NoYq
 ZXS/AUiZQ8LEsqNK6fnwxC1/LjRqO5Insj5y4t0wwScxjc5jsXg+od2aJd7yAAiJCRxs=
X-Received: by 2002:a17:906:db0c:b0:77b:7d7d:5805 with SMTP id
 xj12-20020a170906db0c00b0077b7d7d5805mr1345956ejb.726.1665697676008; 
 Thu, 13 Oct 2022 14:47:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54JRh3jZ4OiGvVuTeEz5L9+rhljJ9/qhHTfipViPCoBZ9Ea1P+qI/aqBbPlq6CQeU9t545mQ==
X-Received: by 2002:a17:906:db0c:b0:77b:7d7d:5805 with SMTP id
 xj12-20020a170906db0c00b0077b7d7d5805mr1345941ejb.726.1665697675611; 
 Thu, 13 Oct 2022 14:47:55 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a50ed82000000b00458dda85495sm582812edr.0.2022.10.13.14.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 21/35] target/i386: reimplement 0x0f 0x70-0x77, add AVX
Date: Thu, 13 Oct 2022 23:46:37 +0200
Message-Id: <20221013214651.672114-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

This includes shifts by immediate, which use bits 3-5 of the ModRM byte
as an opcode extension.  With the exception of 128-bit shifts, they are
implemented using gvec.

This also covers VZEROALL and VZEROUPPER, which use the same opcode
as EMMS.  If we were wanting to optimize out gen_clear_ymmh then this
would be one of the starting points.  The implementation of the VZEROALL
and VZEROUPPER helpers is by Paul Brook.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  92 +++++++++++++-
 target/i386/tcg/emit.c.inc       | 204 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   3 +-
 3 files changed, 293 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index df38c12a2d..764d8d1d7c 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -157,6 +157,58 @@ static void decode_group17(DisasContext *s, CPUX86State *env, X86OpEntry *entry,
     entry->gen = group17_gen[op];
 }
 
+static void decode_group12(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_group12[8] = {
+        {},
+        {},
+        X86_OP_ENTRY3(PSRLW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+        {},
+        X86_OP_ENTRY3(PSRAW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+        {},
+        X86_OP_ENTRY3(PSLLW_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+        {},
+    };
+
+    int op = (get_modrm(s, env) >> 3) & 7;
+    *entry = opcodes_group12[op];
+}
+
+static void decode_group13(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_group13[8] = {
+        {},
+        {},
+        X86_OP_ENTRY3(PSRLD_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+        {},
+        X86_OP_ENTRY3(PSRAD_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+        {},
+        X86_OP_ENTRY3(PSLLD_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+        {},
+    };
+
+    int op = (get_modrm(s, env) >> 3) & 7;
+    *entry = opcodes_group13[op];
+}
+
+static void decode_group14(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_group14[8] = {
+        /* grp14 */
+        {},
+        {},
+        X86_OP_ENTRY3(PSRLQ_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+        X86_OP_ENTRY3(PSRLDQ_i, H,x, U,x, I,b, vex7 avx2_256 p_66),
+        {},
+        {},
+        X86_OP_ENTRY3(PSLLQ_i,  H,x, U,x, I,b, vex7 mmx avx2_256 p_00_66),
+        X86_OP_ENTRY3(PSLLDQ_i, H,x, U,x, I,b, vex7 avx2_256 p_66),
+    };
+
+    int op = (get_modrm(s, env) >> 3) & 7;
+    *entry = opcodes_group14[op];
+}
+
 static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry opcodes_0F6F[4] = {
@@ -168,6 +220,31 @@ static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = *decode_by_prefix(s, opcodes_0F6F);
 }
 
+static void decode_0F70(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry pshufw[4] = {
+        X86_OP_ENTRY3(PSHUFW,  P,q, Q,q, I,b, vex4 mmx),
+        X86_OP_ENTRY3(PSHUFD,  V,x, W,x, I,b, vex4 avx2_256),
+        X86_OP_ENTRY3(PSHUFHW, V,x, W,x, I,b, vex4 avx2_256),
+        X86_OP_ENTRY3(PSHUFLW, V,x, W,x, I,b, vex4 avx2_256),
+    };
+
+    *entry = *decode_by_prefix(s, pshufw);
+}
+
+static void decode_0F77(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    if (!(s->prefix & PREFIX_VEX)) {
+        entry->gen = gen_EMMS;
+    } else if (!s->vex_l) {
+        entry->gen = gen_VZEROUPPER;
+        entry->vex_class = 8;
+    } else {
+        entry->gen = gen_VZEROALL;
+        entry->vex_class = 8;
+    }
+}
+
 static void decode_0F78(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry opcodes_0F78[4] = {
@@ -340,6 +417,15 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x66] = X86_OP_ENTRY3(PCMPGTD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x67] = X86_OP_ENTRY3(PACKUSWB,   V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
 
+    [0x70] = X86_OP_GROUP0(0F70),
+    [0x71] = X86_OP_GROUP0(group12),
+    [0x72] = X86_OP_GROUP0(group13),
+    [0x73] = X86_OP_GROUP0(group14),
+    [0x74] = X86_OP_ENTRY3(PCMPEQB,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x75] = X86_OP_ENTRY3(PCMPEQW,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x76] = X86_OP_ENTRY3(PCMPEQD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
+    [0x77] = X86_OP_GROUP0(0F77),
+
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
 
@@ -941,10 +1027,8 @@ static bool validate_vex(DisasContext *s, X86DecodedInsn *decode)
         }
         break;
     case 8:
-        if (!(s->prefix & PREFIX_VEX)) {
-            /* EMMS */
-            return true;
-        }
+        /* Non-VEX case handled in decode_0F77.  */
+        assert(s->prefix & PREFIX_VEX);
         if (!(s->flags & HF_AVX_EN_MASK)) {
             goto illegal;
         }
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 7e13fb5869..0d437686e6 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -19,6 +19,11 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+static inline TCGv_i32 tcg_constant8u_i32(uint8_t val)
+{
+    return tcg_constant_i32(val);
+}
+
 static void gen_NM_exception(DisasContext *s)
 {
     gen_exception(s, EXCP07_PREX);
@@ -485,6 +490,9 @@ BINARY_INT_GVEC(PADDSW,  tcg_gen_gvec_ssadd, MO_16)
 BINARY_INT_GVEC(PADDUSB, tcg_gen_gvec_usadd, MO_8)
 BINARY_INT_GVEC(PADDUSW, tcg_gen_gvec_usadd, MO_16)
 BINARY_INT_GVEC(PAND,    tcg_gen_gvec_and, MO_64)
+BINARY_INT_GVEC(PCMPEQB, tcg_gen_gvec_cmp, TCG_COND_EQ, MO_8)
+BINARY_INT_GVEC(PCMPEQD, tcg_gen_gvec_cmp, TCG_COND_EQ, MO_32)
+BINARY_INT_GVEC(PCMPEQW, tcg_gen_gvec_cmp, TCG_COND_EQ, MO_16)
 BINARY_INT_GVEC(PCMPGTB, tcg_gen_gvec_cmp, TCG_COND_GT, MO_8)
 BINARY_INT_GVEC(PCMPGTW, tcg_gen_gvec_cmp, TCG_COND_GT, MO_16)
 BINARY_INT_GVEC(PCMPGTD, tcg_gen_gvec_cmp, TCG_COND_GT, MO_32)
@@ -585,6 +593,29 @@ UNARY_INT_SSE(VCVTPS2DQ, cvtps2dq)
 UNARY_INT_SSE(VCVTTPS2DQ, cvttps2dq)
 
 
+static inline void gen_unary_imm_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                     SSEFunc_0_ppi xmm, SSEFunc_0_ppi ymm)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    if (!s->vex_l) {
+        xmm(OP_PTR0, OP_PTR1, imm);
+    } else {
+        ymm(OP_PTR0, OP_PTR1, imm);
+    }
+}
+
+#define UNARY_IMM_SSE(uname, lname)                                                \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_unary_imm_sse(s, env, decode,                                              \
+                      gen_helper_##lname##_xmm,                                    \
+                      gen_helper_##lname##_ymm);                                   \
+}
+
+UNARY_IMM_SSE(PSHUFD,     pshufd)
+UNARY_IMM_SSE(PSHUFHW,    pshufhw)
+UNARY_IMM_SSE(PSHUFLW,    pshuflw)
+
 static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 {
     TCGv carry_in = NULL;
@@ -740,6 +771,11 @@ static void gen_CRC32(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_crc32(s->T0, s->tmp2_i32, s->T1, tcg_constant_i32(8 << ot));
 }
 
+static void gen_EMMS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_emms(cpu_env);
+}
+
 static void gen_EXTRQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     TCGv_i32 length = tcg_constant_i32(decode->immediate & 63);
@@ -902,6 +938,154 @@ static void gen_PEXT(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_pext(s->T0, s->T0, s->T1);
 }
 
+static void gen_PSHUFW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
+    gen_helper_pshufw_mmx(OP_PTR0, OP_PTR1, imm);
+}
+
+static void gen_PSRLW_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    if (decode->immediate >= 16) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shri(MO_16,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSLLW_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    if (decode->immediate >= 16) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shli(MO_16,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSRAW_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    if (decode->immediate >= 16) {
+        decode->immediate = 15;
+    }
+    tcg_gen_gvec_sari(MO_16,
+                      decode->op[0].offset, decode->op[1].offset,
+                      decode->immediate, vec_len, vec_len);
+}
+
+static void gen_PSRLD_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    if (decode->immediate >= 32) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shri(MO_32,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSLLD_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    if (decode->immediate >= 32) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shli(MO_32,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSRAD_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    if (decode->immediate >= 32) {
+        decode->immediate = 31;
+    }
+    tcg_gen_gvec_sari(MO_32,
+                      decode->op[0].offset, decode->op[1].offset,
+                      decode->immediate, vec_len, vec_len);
+}
+
+static void gen_PSRLQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    if (decode->immediate >= 64) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shri(MO_64,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static void gen_PSLLQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+
+    if (decode->immediate >= 64) {
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    } else {
+        tcg_gen_gvec_shli(MO_64,
+                          decode->op[0].offset, decode->op[1].offset,
+                          decode->immediate, vec_len, vec_len);
+    }
+}
+
+static TCGv_ptr make_imm8u_xmm_vec(uint8_t imm, int vec_len)
+{
+    MemOp ot = vec_len == 16 ? MO_128 : MO_256;
+    TCGv_i32 imm_v = tcg_constant8u_i32(imm);
+    TCGv_ptr ptr = tcg_temp_new_ptr();
+
+    tcg_gen_gvec_dup_imm(MO_64, offsetof(CPUX86State, xmm_t0) + xmm_offset(ot),
+                         vec_len, vec_len, 0);
+
+    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_t0));
+    tcg_gen_st_i32(imm_v, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_L(0)));
+    return ptr;
+}
+
+static void gen_PSRLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+    TCGv_ptr imm_vec = make_imm8u_xmm_vec(decode->immediate, vec_len);
+
+    if (s->vex_l) {
+        gen_helper_psrldq_ymm(cpu_env, OP_PTR0, OP_PTR1, imm_vec);
+    } else {
+        gen_helper_psrldq_xmm(cpu_env, OP_PTR0, OP_PTR1, imm_vec);
+    }
+    tcg_temp_free_ptr(imm_vec);
+}
+
+static void gen_PSLLDQ_i(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+    TCGv_ptr imm_vec = make_imm8u_xmm_vec(decode->immediate, vec_len);
+
+    if (s->vex_l) {
+        gen_helper_pslldq_ymm(cpu_env, OP_PTR0, OP_PTR1, imm_vec);
+    } else {
+        gen_helper_pslldq_xmm(cpu_env, OP_PTR0, OP_PTR1, imm_vec);
+    }
+    tcg_temp_free_ptr(imm_vec);
+}
+
 static void gen_RORX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -959,3 +1143,23 @@ static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
                      gen_helper_cvtpd2ps_ymm, gen_helper_cvtps2pd_ymm,
                      gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
 }
+
+static void gen_VZEROALL(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_ptr ptr = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_t0));
+    gen_helper_memset(ptr, ptr, tcg_constant_i32(0),
+                      tcg_constant_ptr(CPU_NB_REGS * sizeof(ZMMReg)));
+    tcg_temp_free_ptr(ptr);
+}
+
+static void gen_VZEROUPPER(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int i;
+
+    for (i = 0; i < CPU_NB_REGS; i++) {
+        int offset = offsetof(CPUX86State, xmm_regs[i].ZMM_X(1));
+        tcg_gen_gvec_dup_imm(MO_64, offset, 16, 16, 0);
+    }
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d87c7b3bac..ea6c37f47c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4774,8 +4774,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         use_new &= b <= limit;
 #endif
         if (use_new &&
-            ((b >= 0x150 && b <= 0x16f) ||
-             (b >= 0x178 && b <= 0x17f) ||
+            ((b >= 0x150 && b <= 0x17f) ||
              (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
-- 
2.37.3


