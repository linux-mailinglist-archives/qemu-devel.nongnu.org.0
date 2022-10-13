Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ECE5FE52D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:20:39 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6ZC-0002R0-LE
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj64J-0002uo-CK
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj64F-0005NX-EN
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0sceTZqqFnWbCTVvDvjpXvGtiFc0mYd+pliRbsQ9Vc=;
 b=PdJVk8N0ikKSfAAn+6tciOlsTsDrYyGxG6Ow1bUvumZy4L81aOgPe7uQw/4pRHnO7Yp3gR
 Rz3cjG3aWVixYesUoHZAnhzb24+XLx5C4EqZl1w2NL55ILkE7XFSUaMlj3OHDU80MTKyyi
 5fVrMF3n7oKOeJsklAf5En656iP+h4c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-IqTZpWQ_MyihrOa5NDDTvA-1; Thu, 13 Oct 2022 17:48:33 -0400
X-MC-Unique: IqTZpWQ_MyihrOa5NDDTvA-1
Received: by mail-ej1-f71.google.com with SMTP id
 hp41-20020a1709073e2900b0078e07dbf280so1462695ejc.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0sceTZqqFnWbCTVvDvjpXvGtiFc0mYd+pliRbsQ9Vc=;
 b=X5dzZrCjJF61yEom47DVgserKu2l/8wRZSgGPSFbnnF0IOC6lR64ydWkPIFQH+TaT3
 m9Nyze8r+Sro+3wo8PTzQ5VRsgerE4CcGkhHWoU2ydnUgLPYbzyvxhv8bQ4rGnhRN902
 syvotqYuYw8JJ0rIWLUyAtFCS5BiMYaQ1tlpjy2vJK2JrCMEXW3MZ/mSTBA0zO5/dDCh
 KWcpKdP2KOnzLV9fBxweBEPenoQy3vmhfcHVkctcb16n2aqQaDCmxrizMLL9jG0rq/+1
 sFqbR/8ToDZGmvHfIiC/1EuUUFqD6hcC/dxwvB4j0D8LGf4S5TmS6EC02JweAzhM4ouV
 /U8w==
X-Gm-Message-State: ACrzQf2WUFJsCe4UpuHEfYMQZcWm/qbYASdpSQ0PbTIs9wkMIjooSM/y
 TkQRt2TOgZQRDK3MY2/AxzXGCUMw4V1CTs08nYyYTx28w+wKx6pkjyA+lsCNeOecc4z4CSqhE5X
 tvo+rOzlrwy9iGplW642IFOgJE+5gLQqE2YBhuFAmcmxFDXPYWTKa1g+fCzc7XYWrqas=
X-Received: by 2002:a50:ec84:0:b0:459:ae8:8025 with SMTP id
 e4-20020a50ec84000000b004590ae88025mr1489909edr.321.1665697711917; 
 Thu, 13 Oct 2022 14:48:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM68yYEkUMqAk8uuTY13eynijx+jPyTqeD711x8vL+4vINC6QRfVwCcxuPp+N5SKIHOaUcbRBA==
X-Received: by 2002:a50:ec84:0:b0:459:ae8:8025 with SMTP id
 e4-20020a50ec84000000b004590ae88025mr1489888edr.321.1665697711500; 
 Thu, 13 Oct 2022 14:48:31 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 b29-20020a170906729d00b00782ee6b34f2sm419333ejl.183.2022.10.13.14.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 34/35] target/i386: move 3DNow to the new decoder
Date: Thu, 13 Oct 2022 23:46:50 +0200
Message-Id: <20221013214651.672114-35-pbonzini@redhat.com>
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

This adds another kind of weirdness when you thought you had seen it all:
an opcode byte that comes _after_ the address, not before.  It's not
worth adding a new X86_SPECIAL_* constant for it, but it's actually
not unlike VCMP; so, forgive me for exploiting the similarity and just
deciding to dispatch to the right gen_helper_* call in a single code
generation function.

In fact, the old decoder had a bug where s->rip_offset should have
been set to 1 for 3DNow! instructions, and it's fixed now.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/helper.h             |  1 -
 target/i386/tcg/decode-new.c.inc | 10 +++++
 target/i386/tcg/decode-new.h     |  1 +
 target/i386/tcg/emit.c.inc       | 61 +++++++++++++++++++++++++++
 target/i386/tcg/fpu_helper.c     |  6 ---
 target/i386/tcg/translate.c      | 71 +-------------------------------
 6 files changed, 74 insertions(+), 76 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index a2c2c085a3..88143b2a24 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -212,7 +212,6 @@ DEF_HELPER_2(ldmxcsr, void, env, i32)
 DEF_HELPER_1(update_mxcsr, void, env)
 DEF_HELPER_1(enter_mmx, void, env)
 DEF_HELPER_1(emms, void, env)
-DEF_HELPER_3(movq, void, env, ptr, ptr)
 
 #define SHIFT 0
 #include "ops_sse_header.h"
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 20ab702c0f..a680b01140 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -786,6 +786,14 @@ static void decode_0FE6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 }
 
 static const X86OpEntry opcodes_0F[256] = {
+    [0x0E] = X86_OP_ENTRY0(EMMS,                              cpuid(3DNOW)), /* femms */
+    /*
+     * 3DNow!'s opcode byte comes *after* modrm and displacements, making it
+     * more like an Ib operand.  Dispatch to the right helper in a single gen_*
+     * function.
+     */
+    [0x0F] = X86_OP_ENTRY3(3dnow,       P,q, Q,q, I,b,        cpuid(3DNOW)),
+
     [0x10] = X86_OP_GROUP0(0F10),
     [0x11] = X86_OP_GROUP0(0F11),
     [0x12] = X86_OP_GROUP0(0F12),
@@ -1371,6 +1379,8 @@ static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
     case X86_FEAT_AVX:
         return (s->cpuid_ext_features & CPUID_EXT_AVX);
 
+    case X86_FEAT_3DNOW:
+        return (s->cpuid_ext2_features & CPUID_EXT2_3DNOW);
     case X86_FEAT_SSE4A:
         return (s->cpuid_ext3_features & CPUID_EXT3_SSE4A);
 
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index 2f0b0e4cfd..f159c26850 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -96,6 +96,7 @@ typedef enum X86OpSize {
 
 typedef enum X86CPUIDFeature {
     X86_FEAT_None,
+    X86_FEAT_3DNOW,
     X86_FEAT_ADX,
     X86_FEAT_AES,
     X86_FEAT_AVX,
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index aa5cd6730f..35acca04ef 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -19,6 +19,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+typedef void (*SSEFunc_0_epp)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b);
 typedef void (*SSEFunc_0_epppti)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                  TCGv_ptr reg_c, TCGv a0, TCGv_i32 scale);
 
@@ -326,6 +327,66 @@ static void gen_store_sse(DisasContext *s, X86DecodedInsn *decode, int src_ofs)
     }
 }
 
+static void gen_helper_pavgusb(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b)
+{
+    gen_helper_pavgb_mmx(env, reg_a, reg_a, reg_b);
+}
+
+#define FN_3DNOW_MOVE ((SSEFunc_0_epp) (uintptr_t) 1)
+static const SSEFunc_0_epp fns_3dnow[] = {
+    [0x0c] = gen_helper_pi2fw,
+    [0x0d] = gen_helper_pi2fd,
+    [0x1c] = gen_helper_pf2iw,
+    [0x1d] = gen_helper_pf2id,
+    [0x8a] = gen_helper_pfnacc,
+    [0x8e] = gen_helper_pfpnacc,
+    [0x90] = gen_helper_pfcmpge,
+    [0x94] = gen_helper_pfmin,
+    [0x96] = gen_helper_pfrcp,
+    [0x97] = gen_helper_pfrsqrt,
+    [0x9a] = gen_helper_pfsub,
+    [0x9e] = gen_helper_pfadd,
+    [0xa0] = gen_helper_pfcmpgt,
+    [0xa4] = gen_helper_pfmax,
+    [0xa6] = FN_3DNOW_MOVE, /* PFRCPIT1; no need to actually increase precision */
+    [0xa7] = FN_3DNOW_MOVE, /* PFRSQIT1 */
+    [0xb6] = FN_3DNOW_MOVE, /* PFRCPIT2 */
+    [0xaa] = gen_helper_pfsubr,
+    [0xae] = gen_helper_pfacc,
+    [0xb0] = gen_helper_pfcmpeq,
+    [0xb4] = gen_helper_pfmul,
+    [0xb7] = gen_helper_pmulhrw_mmx,
+    [0xbb] = gen_helper_pswapd,
+    [0xbf] = gen_helper_pavgusb,
+};
+
+static void gen_3dnow(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    uint8_t b = decode->immediate;
+    SSEFunc_0_epp fn = b < ARRAY_SIZE(fns_3dnow) ? fns_3dnow[b] : NULL;
+
+    if (!fn) {
+        gen_illegal_opcode(s);
+        return;
+    }
+    if (s->flags & HF_TS_MASK) {
+        gen_NM_exception(s);
+        return;
+    }
+    if (s->flags & HF_EM_MASK) {
+        gen_illegal_opcode(s);
+        return;
+    }
+
+    gen_helper_enter_mmx(cpu_env);
+    if (fn == FN_3DNOW_MOVE) {
+       tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[1].offset);
+       tcg_gen_st_i64(s->tmp1_i64, cpu_env, decode->op[0].offset);
+    } else {
+       fn(cpu_env, OP_PTR0, OP_PTR1);
+    }
+}
+
 /*
  * 00 = v*ps Vps, Hps, Wpd
  * 66 = v*pd Vpd, Hpd, Wps
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 7670739abe..a6a90a1817 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -3126,12 +3126,6 @@ void helper_emms(CPUX86State *env)
     *(uint32_t *)(env->fptags + 4) = 0x01010101;
 }
 
-/* XXX: suppress */
-void helper_movq(CPUX86State *env, void *d, void *s)
-{
-    *(uint64_t *)d = *(uint64_t *)s;
-}
-
 #define SHIFT 0
 #include "ops_sse.h"
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1d20dc30bb..77f764ba1a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3011,7 +3011,6 @@ static bool first = true; static unsigned long limit;
 #define SSE_OPF_CMP       (1 << 1) /* does not write for first operand */
 #define SSE_OPF_BLENDV    (1 << 2) /* blendv* instruction */
 #define SSE_OPF_SPECIAL   (1 << 3) /* magic */
-#define SSE_OPF_3DNOW     (1 << 4) /* 3DNow! instruction */
 #define SSE_OPF_MMX       (1 << 5) /* MMX/integer/AVX2 instruction */
 #define SSE_OPF_SCALAR    (1 << 6) /* Has SSE scalar variants */
 #define SSE_OPF_SHUF      (1 << 9) /* pshufx/shufpx */
@@ -3045,13 +3044,9 @@ struct SSEOpHelper_table1 {
     SSEFuncs fn[4];
 };
 
-#define SSE_3DNOW { SSE_OPF_3DNOW }
 #define SSE_SPECIAL { SSE_OPF_SPECIAL }
 
 static const struct SSEOpHelper_table1 sse_op_table1[256] = {
-    /* 3DNow! extensions */
-    [0x0e] = SSE_SPECIAL, /* femms */
-    [0x0f] = SSE_3DNOW, /* pf... (sse_op_table5) */
     /* pure SSE operations */
     [0x10] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
     [0x11] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
@@ -3260,38 +3255,6 @@ static const SSEFunc_0_eppp sse_op_table4[8][4] = {
 };
 #undef SSE_CMP
 
-static void gen_helper_pavgusb(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b)
-{
-    gen_helper_pavgb_mmx(env, reg_a, reg_a, reg_b);
-}
-
-static const SSEFunc_0_epp sse_op_table5[256] = {
-    [0x0c] = gen_helper_pi2fw,
-    [0x0d] = gen_helper_pi2fd,
-    [0x1c] = gen_helper_pf2iw,
-    [0x1d] = gen_helper_pf2id,
-    [0x8a] = gen_helper_pfnacc,
-    [0x8e] = gen_helper_pfpnacc,
-    [0x90] = gen_helper_pfcmpge,
-    [0x94] = gen_helper_pfmin,
-    [0x96] = gen_helper_pfrcp,
-    [0x97] = gen_helper_pfrsqrt,
-    [0x9a] = gen_helper_pfsub,
-    [0x9e] = gen_helper_pfadd,
-    [0xa0] = gen_helper_pfcmpgt,
-    [0xa4] = gen_helper_pfmax,
-    [0xa6] = gen_helper_movq, /* pfrcpit1; no need to actually increase precision */
-    [0xa7] = gen_helper_movq, /* pfrsqit1 */
-    [0xaa] = gen_helper_pfsubr,
-    [0xae] = gen_helper_pfacc,
-    [0xb0] = gen_helper_pfcmpeq,
-    [0xb4] = gen_helper_pfmul,
-    [0xb6] = gen_helper_movq, /* pfrcpit2 */
-    [0xb7] = gen_helper_pmulhrw_mmx,
-    [0xbb] = gen_helper_pswapd,
-    [0xbf] = gen_helper_pavgusb,
-};
-
 struct SSEOpHelper_table6 {
     SSEFuncs fn[2];
     uint32_t ext_mask;
@@ -3443,7 +3406,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
         b1 = 0;
     sse_op_flags = sse_op_table1[b].flags;
     sse_op_fn = sse_op_table1[b].fn[b1];
-    if ((sse_op_flags & (SSE_OPF_SPECIAL | SSE_OPF_3DNOW)) == 0
+    if ((sse_op_flags & SSE_OPF_SPECIAL) == 0
             && !sse_op_fn.op1) {
         goto unknown_op;
     }
@@ -3457,11 +3420,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
             is_xmm = 1;
         }
     }
-    if (sse_op_flags & SSE_OPF_3DNOW) {
-        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
-            goto illegal_op;
-        }
-    }
     /* simple MMX/SSE operation */
     if (s->flags & HF_TS_MASK) {
         gen_exception(s, EXCP07_PREX);
@@ -3477,15 +3435,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
         && (b != 0x38 && b != 0x3a)) {
         goto unknown_op;
     }
-    if (b == 0x0e) {
-        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
-            /* If we were fully decoding this we might use illegal_op.  */
-            goto unknown_op;
-        }
-        /* femms */
-        gen_helper_emms(cpu_env);
-        return;
-    }
     if (b == 0x77) {
         /* emms */
         gen_helper_emms(cpu_env);
@@ -4643,18 +4592,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
                 rm = (modrm & 7);
                 op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
             }
-            if (sse_op_flags & SSE_OPF_3DNOW) {
-                /* 3DNow! data insns */
-                val = x86_ldub_code(env, s);
-                SSEFunc_0_epp op_3dnow = sse_op_table5[val];
-                if (!op_3dnow) {
-                    goto unknown_op;
-                }
-                tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
-                tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
-                op_3dnow(cpu_env, s->ptr0, s->ptr1);
-                return;
-            }
         }
 
 
@@ -4775,7 +4712,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
-             (b >= 0x110 && b <= 0x117) ||
+             (b >= 0x10e && b <= 0x117) ||
              (b >= 0x128 && b <= 0x12f) ||
              (b >= 0x150 && b <= 0x17f) ||
              b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
@@ -8504,10 +8441,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
         set_cc_op(s, CC_OP_POPCNT);
         break;
-    case 0x10e ... 0x10f:
-        /* 3DNow! instructions, ignore prefixes */
-        s->prefix &= ~(PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA);
-        /* fall through */
     case 0x110 ... 0x117:
     case 0x128 ... 0x12f:
     case 0x138 ... 0x13a:
-- 
2.37.3


