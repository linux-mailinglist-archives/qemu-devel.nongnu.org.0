Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C95FE532
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:24:25 +0200 (CEST)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6cq-0008Vv-34
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63z-0002sB-J1
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63x-0005L9-LF
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70RXMgFGOWL2Ethpw64uma2hqWvxsXTQPpiJoWHOYj4=;
 b=fFsRPs3HZ3/a/nA6h+ikz9PzBeOCp5YkKp5HV8B2C466DEehxEYHRAW8QJh+UWF3Q9cT4W
 4pqAP9bZHGU4SLtgMzuujyEf8Twhv5HoDLScDtYnws6PR97+bcnXHlmF6VhGXdFLj8xNPl
 CgQDPXQ6s7Yw42zzuU6fEOAZ8kN7grg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-JbU-Bx4cPQWw1tw5FqKKKA-1; Thu, 13 Oct 2022 17:48:20 -0400
X-MC-Unique: JbU-Bx4cPQWw1tw5FqKKKA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w20-20020a05640234d400b0045d0d1afe8eso674209edc.15
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70RXMgFGOWL2Ethpw64uma2hqWvxsXTQPpiJoWHOYj4=;
 b=VYtt9AQJtrKzk2/i4pSz+F+llGfSMzj0QfdcQwZnNJxIu6bwn8NiwcPwe702hKuOCR
 ZnGmYgkrOssZCLLTF4aCc/2GU+lxsC+7WFzQCTYxId0CZu7mJUwAhPZN2B45QKN9LTU8
 fCxZDukF76mGNc+x/bemwhvXfdvpNH7evgRwdnMLvoD6x6kwunpxAAZZZr+pXB2He+Wi
 GBQmF/glWBdargvQULVa2GtEKUIm9IqeiHmzN+ZMhJPi1lSYByD2mWtyq3yWCwChUxRg
 pKU1W/9+1cQjX9WoLItBvHhohJV7tCWT9Z5oAhriFk+oqWPAILH9BSP5eZ5tdlEUZQ4b
 7Cnw==
X-Gm-Message-State: ACrzQf2ptgjGX8Ef1qA8SwRhNt8/i7g3GmJiKudM91P7rf/8gthO707L
 MGE0TaLsSrXDWr16E4JeaHyf6B5xXWUlwRk27s8CSYU0LovqVK9sD0bKbGp0Scjs9kM5jsds+cY
 WQnGS1uxYbaN+zXwT9B0+ifmN/s4SUetWDWgLK4Pic5tMahYuc9mdx4IcNUnLOkEO5Z8=
X-Received: by 2002:a50:fc85:0:b0:458:e7c6:1cfa with SMTP id
 f5-20020a50fc85000000b00458e7c61cfamr1582870edq.256.1665697698343; 
 Thu, 13 Oct 2022 14:48:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wQwOuXGTs8Ds0ADQOt2p7IddjoRLBRGxjwygXMd9eVBUu4TDfD5TJ35NfgJGISTb+HgTm6Q==
X-Received: by 2002:a50:fc85:0:b0:458:e7c6:1cfa with SMTP id
 f5-20020a50fc85000000b00458e7c61cfamr1582854edq.256.1665697698008; 
 Thu, 13 Oct 2022 14:48:18 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 nb36-20020a1709071ca400b00780f24b797dsm445658ejc.108.2022.10.13.14.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 29/35] target/i386: reimplement 0x0f 0x28-0x2f, add AVX
Date: Thu, 13 Oct 2022 23:46:45 +0200
Message-Id: <20221013214651.672114-30-pbonzini@redhat.com>
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
index fae1fd89d2..2105d080b4 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -679,6 +679,53 @@ static void decode_0F16(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
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
@@ -753,6 +800,15 @@ static const X86OpEntry opcodes_0F[256] = {
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
index 50c5c9268e..c4bf47eac2 100644
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
@@ -1729,6 +1759,14 @@ static void gen_VCMP(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
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
@@ -1737,6 +1775,88 @@ static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
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
@@ -1992,6 +2112,14 @@ static void gen_VSHUF(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
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
index 1e4732da1e..1d20dc30bb 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4776,6 +4776,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
              (b >= 0x110 && b <= 0x117) ||
+             (b >= 0x128 && b <= 0x12f) ||
              (b >= 0x150 && b <= 0x17f) ||
              b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
-- 
2.37.3


