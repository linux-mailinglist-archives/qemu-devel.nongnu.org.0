Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167685B51F8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:39:53 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWYK-0002Qz-5j
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1m-00024O-5k
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1k-0007TW-9x
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6bRjieiGzdBvtZIC5lJqenm0fl7JlMwt7v12NnjAxw=;
 b=dZpHgd+EIf8EB1aADc4isxzCsC0vpv1DSCgzePUa6VOysKrEGFtK3wQFQlf+v2AJkM2uVv
 tVTjreRvGAjspe9IlrkSsgY6W1/PTU4HAfpWJr3S5h+rHE8aYn1WzN199oLA6R4b5ZYzAz
 wSgxEotHupO0H/zXmsxS4F/HFzKZD2I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-i3sEuFrLNICbd7T_iA8ukw-1; Sun, 11 Sep 2022 19:06:09 -0400
X-MC-Unique: i3sEuFrLNICbd7T_iA8ukw-1
Received: by mail-ed1-f69.google.com with SMTP id
 x5-20020a05640226c500b00451ec193793so226746edd.16
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B6bRjieiGzdBvtZIC5lJqenm0fl7JlMwt7v12NnjAxw=;
 b=ZbUJy0xU05Hln0PUcmUg7CDPBejpmAD6sNSZ7cjxdzfkiJegVycTkMfkBhy8BMqdpr
 Fabb/S9Xq2P8HAlAg2sfNXJWoGZ06HMs7QbP6wOMdXL1kiVRb5WolkOv0ngx6Em2BU+S
 TW5shCcgj0pyuAFOPCO0MguI+Xi4ndezN3eyelvIDpouPP9Tb60s+LgMPCFtJA7oFxgG
 6HllljNtkzM0WbpFdvy92ohVGurGNdY3SP/Ca76MbKOA+4APeQbUOm1p6aAdXJ+yTeGl
 ApDJ46TvllRtebSHLV3hGfQcRvGtQJIGqBe3RYoXxJSGhHh+hbMt5tcenXxdr3McvKy3
 K9hA==
X-Gm-Message-State: ACgBeo25u/A/DMT0rhkMB0Baq7f5rSAh9Xn1Z6O+iZN0zAyHF8zLVrW/
 vRn8h0anqvfvgMUBoBZGiRi3jxoo1PG2uctXGFosUsN+qE25kEnAZWkRek2S7mwKWf3RJM+h+QZ
 s71aWFcR/+eNsD2iqn8cOFJankQjClKCdcaMxqJeXN0BtwiYVoBn6rH+P8I/CcMYCplw=
X-Received: by 2002:a17:907:d8e:b0:77d:2649:1a78 with SMTP id
 go14-20020a1709070d8e00b0077d26491a78mr2217327ejc.521.1662937568469; 
 Sun, 11 Sep 2022 16:06:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6roiL7zEdk1D4MuVptP2cBLyrUajhLkiOpoek689icEn0tQ2nKuHPKb4SWXAvCpyOsJKhWMw==
X-Received: by 2002:a17:907:d8e:b0:77d:2649:1a78 with SMTP id
 go14-20020a1709070d8e00b0077d26491a78mr2217315ejc.521.1662937568173; 
 Sun, 11 Sep 2022 16:06:08 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a05640207c300b00451e3160451sm518351edy.89.2022.09.11.16.06.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:06:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 36/37] target/i386: move 3DNow completely out of gen_sse
Date: Mon, 12 Sep 2022 01:04:16 +0200
Message-Id: <20220911230418.340941-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Everything else has been converted to the new decoder, so separate the
part that survives.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 104 +++++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 36 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f312663110..0783b1e7ee 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2918,7 +2918,6 @@ static bool first = true; static unsigned long limit;
 #define SSE_OPF_CMP       (1 << 1) /* does not write for first operand */
 #define SSE_OPF_BLENDV    (1 << 2) /* blendv* instruction */
 #define SSE_OPF_SPECIAL   (1 << 3) /* magic */
-#define SSE_OPF_3DNOW     (1 << 4) /* 3DNow! instruction */
 #define SSE_OPF_MMX       (1 << 5) /* MMX/integer/AVX2 instruction */
 #define SSE_OPF_SCALAR    (1 << 6) /* Has SSE scalar variants */
 #define SSE_OPF_SHUF      (1 << 9) /* pshufx/shufpx */
@@ -2952,13 +2951,9 @@ struct SSEOpHelper_table1 {
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
@@ -3172,7 +3167,7 @@ static void gen_helper_pavgusb(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b)
     gen_helper_pavgb_mmx(env, reg_a, reg_a, reg_b);
 }
 
-static const SSEFunc_0_epp sse_op_table5[256] = {
+static const SSEFunc_0_epp op_3dnow[256] = {
     [0x0c] = gen_helper_pi2fw,
     [0x0d] = gen_helper_pi2fd,
     [0x1c] = gen_helper_pf2iw,
@@ -3351,7 +3346,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         b1 = 0;
     sse_op_flags = sse_op_table1[b].flags;
     sse_op_fn = sse_op_table1[b].fn[b1];
-    if ((sse_op_flags & (SSE_OPF_SPECIAL | SSE_OPF_3DNOW)) == 0
+    if ((sse_op_flags & SSE_OPF_SPECIAL) == 0
             && !sse_op_fn.op1) {
         goto unknown_op;
     }
@@ -3365,11 +3360,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
         gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
@@ -3385,15 +3375,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
@@ -4536,18 +4517,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
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
 
 
@@ -4598,6 +4567,70 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     }
 }
 
+static void gen_3dnow(CPUX86State *env, DisasContext *s, int b,
+                      target_ulong pc_start)
+{
+    int op1_offset, op2_offset, val;
+    int modrm, mod, rm, reg;
+    SSEFunc_0_epp fn;
+
+    /* simple MMX/SSE operation */
+    if (s->flags & HF_TS_MASK) {
+        gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
+        return;
+    }
+    if (s->flags & HF_EM_MASK) {
+        goto illegal_op;
+        return;
+    }
+    if (b == 0x10e) {
+        if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
+            /* If we were fully decoding this we might use illegal_op.  */
+            goto unknown_op;
+        }
+        /* femms */
+        gen_helper_emms(cpu_env);
+        return;
+    }
+
+    if (!(s->cpuid_ext2_features & CPUID_EXT2_3DNOW)) {
+        goto illegal_op;
+    }
+
+    gen_helper_enter_mmx(cpu_env);
+
+    modrm = x86_ldub_code(env, s);
+    reg = ((modrm >> 3) & 7);
+    mod = (modrm >> 6) & 3;
+
+    op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
+    if (mod != 3) {
+        gen_lea_modrm(env, s, modrm);
+        op2_offset = offsetof(CPUX86State,mmx_t0);
+        gen_ldq_env_A0(s, op2_offset);
+    } else {
+        rm = (modrm & 7);
+        op2_offset = offsetof(CPUX86State,fpregs[rm].mmx);
+    }
+
+    val = x86_ldub_code(env, s);
+    fn = op_3dnow[val];
+    if (!fn) {
+        goto unknown_op;
+    }
+    tcg_gen_addi_ptr(s->ptr0, cpu_env, op1_offset);
+    tcg_gen_addi_ptr(s->ptr1, cpu_env, op2_offset);
+    fn(cpu_env, s->ptr0, s->ptr1);
+    return;
+
+illegal_op:
+    gen_illegal_opcode(s);
+    return;
+
+unknown_op:
+    gen_unknown_opcode(env, s);
+}
+
 /* convert one instruction. s->base.is_jmp is set if the translation must
    be stopped. Return the next pc value */
 static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
@@ -8505,9 +8538,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         set_cc_op(s, CC_OP_POPCNT);
         break;
     case 0x10e ... 0x10f:
-        /* 3DNow! instructions, ignore prefixes */
-        s->prefix &= ~(PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA);
-        /* fall through */
+        gen_3dnow(env, s, b, pc_start);
+        break;
     case 0x110 ... 0x117:
     case 0x128 ... 0x12f:
     case 0x138 ... 0x13a:
-- 
2.37.2



