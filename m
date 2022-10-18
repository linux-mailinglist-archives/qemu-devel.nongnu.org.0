Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79D602E93
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:34:17 +0200 (CEST)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknfc-0007CD-Bk
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmil-00056D-6L
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmii-0005Rc-Qn
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666100000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSR2lpDNC8IBgBSkWZiMfu9tJ4GXzzplaFKR04jADyg=;
 b=e41VqZCg8CZUTNQLR7J8dl125Efv+bGmydpz6QOmcEwhmmYfh9uRYPkWz+bcrIn/CNfm/l
 j341E5LDnMGf4zJ/gI7z9r1OFkKnnvlNI1JLdqKFZ1o7tgwZ8uDMCmQq0E60DK/m3rPJtg
 73++cWszj+TVyiskDascQ3NM5v/SHsA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-8ePw6XB0PD-f-o7g8GxsBA-1; Tue, 18 Oct 2022 09:33:19 -0400
X-MC-Unique: 8ePw6XB0PD-f-o7g8GxsBA-1
Received: by mail-ed1-f70.google.com with SMTP id
 m7-20020a056402430700b0045daff6ee5dso3492505edc.10
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSR2lpDNC8IBgBSkWZiMfu9tJ4GXzzplaFKR04jADyg=;
 b=IllNpKH4WIwPNdXlAa35x3z/2iwmk03wHQkIKS8U+CvEDGMayupdHmAGZBS6bPNvrj
 fNya2HbNAOHrANUPEhkr/uFJnfZjGxWhfUzS9lJauyNRCjTi8XS15kYYEkHc+w4HmVFn
 3Gd25ZN/KuUpRCvoJERqjX/RhjdaOettfNUQelSCi0Jk0V74gYnMM3aZnREPEEDYzf4K
 ru2gE96g7j/1B7opmehjsC0IAOEnLQaE0zYxq/mjl55z+o28h9RgS6mBqYCWIs56Hrtz
 fmT2JZ76f5WWBOzmBwTpt0KKIT7TEJI0ihqgYg1JClLVYkLSEAr8bD5P8hAEScz+8iAl
 2jrg==
X-Gm-Message-State: ACrzQf1htRtmW9otvjJrMrqHVrzBo2nB9oGzBkX0uHUC/7RKtSOG+YAv
 s11+Tq1YDz07Hmy2pfmPBXlvvUratKougrwDLNLbYeeCLGDyyCqLV5PLNSbWGJ50uut7/5cZk9E
 SmUC3eyN6MwDzJX9+7IZVJYez58RyyxCxRFedJ67AaCm56Fil/RLdMSU5tX9g8D+7yyk=
X-Received: by 2002:a05:6402:401e:b0:45c:a1ce:94bf with SMTP id
 d30-20020a056402401e00b0045ca1ce94bfmr2602675eda.177.1666099997636; 
 Tue, 18 Oct 2022 06:33:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM740oPZe9c+b7mYaCcMqEoqgWDbwefK+UnFugmFtGzXA2EFYcdgtgaVav/RTD+nufJYzA2+Qg==
X-Received: by 2002:a05:6402:401e:b0:45c:a1ce:94bf with SMTP id
 d30-20020a056402401e00b0045ca1ce94bfmr2602646eda.177.1666099997237; 
 Tue, 18 Oct 2022 06:33:17 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 sd42-20020a1709076e2a00b00722e50dab2csm7555257ejc.109.2022.10.18.06.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:33:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 47/53] target/i386: reimplement 0x0f 0x28-0x2f, add AVX
Date: Tue, 18 Oct 2022 15:30:36 +0200
Message-Id: <20221018133042.856368-48-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Here the code is a bit uglier due to the truncation and extension
of registers to and from 32-bit.  There is also a mistake in the
manual with respect to the size of the memory operand of CVTPS2PI
and CVTTPS2PI, reported by Ricky Zhou.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  56 ++++++++++++++
 target/i386/tcg/emit.c.inc       | 128 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   1 +
 3 files changed, 185 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 5435447e07..a5d5428260 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -672,6 +672,53 @@ static void decode_0F16(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     }
 }
 
+static void decode_0F2A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F2A[4] = {
+        X86_OP_ENTRY3(CVTPI2Px,  V,x,  None,None, Q,q),
+        X86_OP_ENTRY3(CVTPI2Px,  V,x,  None,None, Q,q),
+        X86_OP_ENTRY3(VCVTSI2Sx, V,x,  H,x, E,y,        vex3),
+        X86_OP_ENTRY3(VCVTSI2Sx, V,x,  H,x, E,y,        vex3),
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F2A);
+}
+
+static void decode_0F2B(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F2B[4] = {
+        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex4), /* MOVNTPS */
+        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex4), /* MOVNTPD */
+        X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4 cpuid(SSE4A)), /* MOVNTSS */
+        X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4 cpuid(SSE4A)), /* MOVNTSD */
+    };
+
+    *entry = *decode_by_prefix(s, opcodes_0F2B);
+}
+
+static void decode_0F2C(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F2C[4] = {
+        /* Listed as ps/pd in the manual, but CVTTPS2PI only reads 64-bit.  */
+        X86_OP_ENTRY3(CVTTPx2PI,  P,q,  None,None, W,q),
+        X86_OP_ENTRY3(CVTTPx2PI,  P,q,  None,None, W,dq),
+        X86_OP_ENTRY3(VCVTTSx2SI, G,y,  None,None, W,ss, vex3),
+        X86_OP_ENTRY3(VCVTTSx2SI, G,y,  None,None, W,sd, vex3),
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F2C);
+}
+
+static void decode_0F2D(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F2D[4] = {
+        /* Listed as ps/pd in the manual, but CVTPS2PI only reads 64-bit.  */
+        X86_OP_ENTRY3(CVTPx2PI,  P,q,  None,None, W,q),
+        X86_OP_ENTRY3(CVTPx2PI,  P,q,  None,None, W,dq),
+        X86_OP_ENTRY3(VCVTSx2SI, G,y,  None,None, W,ss, vex3),
+        X86_OP_ENTRY3(VCVTSx2SI, G,y,  None,None, W,sd, vex3),
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F2D);
+}
+
 static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
@@ -746,6 +793,15 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x76] = X86_OP_ENTRY3(PCMPEQD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x77] = X86_OP_GROUP0(0F77),
 
+    [0x28] = X86_OP_ENTRY3(MOVDQ,      V,x,  None,None, W,x, vex1 p_00_66), /* MOVAPS */
+    [0x29] = X86_OP_ENTRY3(MOVDQ,      W,x,  None,None, V,x, vex1 p_00_66), /* MOVAPS */
+    [0x2A] = X86_OP_GROUP0(0F2A),
+    [0x2B] = X86_OP_GROUP0(0F2B),
+    [0x2C] = X86_OP_GROUP0(0F2C),
+    [0x2D] = X86_OP_GROUP0(0F2D),
+    [0x2E] = X86_OP_ENTRY3(VUCOMI,     None,None, V,x, W,x,  vex4 p_00_66),
+    [0x2F] = X86_OP_ENTRY3(VCOMI,      None,None, V,x, W,x,  vex4 p_00_66),
+
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
 
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index d87f6016d9..266e7499ad 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1038,6 +1038,36 @@ static void gen_CRC32(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_crc32(s->T0, s->tmp2_i32, s->T1, tcg_constant_i32(8 << ot));
 }
 
+static void gen_CVTPI2Px(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_enter_mmx(cpu_env);
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_cvtpi2pd(cpu_env, OP_PTR0, OP_PTR2);
+    } else {
+        gen_helper_cvtpi2ps(cpu_env, OP_PTR0, OP_PTR2);
+    }
+}
+
+static void gen_CVTPx2PI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_enter_mmx(cpu_env);
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_cvtpd2pi(cpu_env, OP_PTR0, OP_PTR2);
+    } else {
+        gen_helper_cvtps2pi(cpu_env, OP_PTR0, OP_PTR2);
+    }
+}
+
+static void gen_CVTTPx2PI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_enter_mmx(cpu_env);
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_cvttpd2pi(cpu_env, OP_PTR0, OP_PTR2);
+    } else {
+        gen_helper_cvttps2pi(cpu_env, OP_PTR0, OP_PTR2);
+    }
+}
+
 static void gen_EMMS(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_helper_emms(cpu_env);
@@ -1724,6 +1754,14 @@ static void gen_VCMP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_cmp_funcs[index][b](cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
 }
 
+static void gen_VCOMI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    SSEFunc_0_epp fn;
+    fn = s->prefix & PREFIX_DATA ? gen_helper_comisd : gen_helper_comiss;
+    fn(cpu_env, OP_PTR1, OP_PTR2);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
 static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_unary_fp_sse(s, env, decode,
@@ -1732,6 +1770,88 @@ static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
                      gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
 }
 
+static void gen_VCVTSI2Sx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = vector_len(s, decode);
+    TCGv_i32 in;
+
+    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
+
+#ifdef TARGET_X86_64
+    MemOp ot = decode->op[2].ot;
+    if (ot == MO_64) {
+        if (s->prefix & PREFIX_REPNZ) {
+            gen_helper_cvtsq2sd(cpu_env, OP_PTR0, s->T1);
+        } else {
+            gen_helper_cvtsq2ss(cpu_env, OP_PTR0, s->T1);
+        }
+        return;
+    }
+    in = s->tmp2_i32;
+    tcg_gen_trunc_tl_i32(in, s->T1);
+#else
+    in = s->T1;
+#endif
+
+    if (s->prefix & PREFIX_REPNZ) {
+        gen_helper_cvtsi2sd(cpu_env, OP_PTR0, in);
+    } else {
+        gen_helper_cvtsi2ss(cpu_env, OP_PTR0, in);
+    }
+}
+
+static inline void gen_VCVTtSx2SI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                  SSEFunc_i_ep ss2si, SSEFunc_l_ep ss2sq,
+                                  SSEFunc_i_ep sd2si, SSEFunc_l_ep sd2sq)
+{
+    TCGv_i32 out;
+
+#ifdef TARGET_X86_64
+    MemOp ot = decode->op[0].ot;
+    if (ot == MO_64) {
+        if (s->prefix & PREFIX_REPNZ) {
+            sd2sq(s->T0, cpu_env, OP_PTR2);
+        } else {
+            ss2sq(s->T0, cpu_env, OP_PTR2);
+        }
+        return;
+    }
+
+    out = s->tmp2_i32;
+#else
+    out = s->T0;
+#endif
+    if (s->prefix & PREFIX_REPNZ) {
+        sd2si(out, cpu_env, OP_PTR2);
+    } else {
+        ss2si(out, cpu_env, OP_PTR2);
+    }
+#ifdef TARGET_X86_64
+    tcg_gen_extu_i32_tl(s->T0, out);
+#endif
+}
+
+#ifndef TARGET_X86_64
+#define gen_helper_cvtss2sq NULL
+#define gen_helper_cvtsd2sq NULL
+#define gen_helper_cvttss2sq NULL
+#define gen_helper_cvttsd2sq NULL
+#endif
+
+static void gen_VCVTSx2SI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_VCVTtSx2SI(s, env, decode,
+                   gen_helper_cvtss2si, gen_helper_cvtss2sq,
+                   gen_helper_cvtsd2si, gen_helper_cvtsd2sq);
+}
+
+static void gen_VCVTTSx2SI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_VCVTtSx2SI(s, env, decode,
+                   gen_helper_cvttss2si, gen_helper_cvttss2sq,
+                   gen_helper_cvttsd2si, gen_helper_cvttsd2sq);
+}
+
 static void gen_VEXTRACTx128(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     int mask = decode->immediate & 1;
@@ -1987,6 +2107,14 @@ static void gen_VSHUF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     fn(OP_PTR0, OP_PTR1, OP_PTR2, imm);
 }
 
+static void gen_VUCOMI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    SSEFunc_0_epp fn;
+    fn = s->prefix & PREFIX_DATA ? gen_helper_ucomisd : gen_helper_ucomiss;
+    fn(cpu_env, OP_PTR1, OP_PTR2);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
 static void gen_VZEROALL(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     TCGv_ptr ptr = tcg_temp_new_ptr();
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 90bdd0994e..cf895e4132 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4784,6 +4784,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
              (b >= 0x110 && b <= 0x117) ||
+             (b >= 0x128 && b <= 0x12f) ||
              (b >= 0x150 && b <= 0x17f) ||
              b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
-- 
2.37.3


