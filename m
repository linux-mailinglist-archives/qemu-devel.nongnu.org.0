Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C6602E1E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:16:12 +0200 (CEST)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknO7-00041W-Dm
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004Ri-8s
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiD-0005Li-2I
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEH6gyhwfKzrBdd0m2d8k+AjX9Air0NZ8MLQdft/4O8=;
 b=RzKeXzfP1n1C1blxwzotrMwpPHHEPWT3ojXd0lyai+vailm/UV7oMoOj4LBuvWWBvz5PIQ
 pdf6AGTPdPvCXy9UjQVYe9GrhGsqkhx5E9rsnpG0DaTzVuLdUJ7MBFWx7IIMu1vJjBDY3a
 R+jEH2qkOa6ht5gDAkW3nKNF90+6zcs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-PJkcDir-P4CydiBl2gmTpA-1; Tue, 18 Oct 2022 09:32:46 -0400
X-MC-Unique: PJkcDir-P4CydiBl2gmTpA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h9-20020a05640250c900b0045cfb639f56so10969675edb.13
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEH6gyhwfKzrBdd0m2d8k+AjX9Air0NZ8MLQdft/4O8=;
 b=Ef2SAG9hKhYMxu8u93RNNuzID/HbcjZT4ikt1X2+RGbhxOtRbMMN4yOjoIe1otbhCo
 iLVRpy6XtVYRv5LL+PDaLGvEQGYft4TOFoCOeLE6PrtoqDVp63Zxit+ORnm9C0mhTVHp
 vkHu4Jcrl1EfCJNeptlDZgBiR7myWBkfgjJ8zX9ZYeFff1V4iGLAiObKPhzDKBMkZ5+/
 W7UykTtt2oHVbcn13nL08UI9W7ErX7CilEwIasDSTAvIDH0ta1fwHbhzkV/XcFO4TxxX
 okfm19qZhOn7HlqKZIBkPIsRjnxFJvWM9krtdqs6VgAScq+g+IImhujO66GF4FcN6ytm
 pLCQ==
X-Gm-Message-State: ACrzQf3IPNzBikKLA6DyyTaH89urPCLbGTF54vXky2Lbm+Y7V0UCGkA4
 DVy748f7hnMWdogGNV2aEbJcoMp4VMWnEBykI5Na9MiJCPxEV1Al6FwTix7x7tbfR9Q4HOeB9E1
 kuEr/gDTzudGgW6g5FUwGPJQ41VM/X3cB2AGU4d7c3gAQOVzQi/gpSRp9uAEImos5ZiQ=
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id
 s1-20020a17090699c100b006feb01d0134mr2427197ejn.598.1666099964791; 
 Tue, 18 Oct 2022 06:32:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4cfEpBW/GTnhrtkb6oj4wYMFOtjJ/VG1Di4AMqX3s7GrZMOMDBtiEFe/zVtvVqwbz9SWb3ZA==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id
 s1-20020a17090699c100b006feb01d0134mr2427166ejn.598.1666099964318; 
 Tue, 18 Oct 2022 06:32:44 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1709063d3100b0073cf6ec3276sm7516775ejf.207.2022.10.18.06.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 37/53] target/i386: reimplement 0x0f 0x50-0x5f, add AVX
Date: Tue, 18 Oct 2022 15:30:26 +0200
Message-Id: <20221018133042.856368-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

These are mostly floating-point SSE operations.  The odd ones out
are MOVMSK and CVTxx2yy, the others are straightforward.

Unary operations are a bit special in AVX because they have 2 operands
for PD/PS operands (VEX.vvvv must be 1111b), and 3 operands for SD/SS.
They are handled using X86_OP_GROUP3 for compactness.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  43 ++++++++
 target/i386/tcg/emit.c.inc       | 166 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   2 +-
 3 files changed, 210 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index a160a0b7a3..b20c38ca73 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -252,7 +252,41 @@ static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = opcodes_0F3A[*b];
 }
 
+static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
+        entry->op1 = X86_TYPE_None;
+        entry->s1 = X86_SIZE_None;
+    }
+    switch (*b) {
+    case 0x51: entry->gen = gen_VSQRT; break;
+    case 0x52: entry->gen = gen_VRSQRT; break;
+    case 0x53: entry->gen = gen_VRCP; break;
+    case 0x5A: entry->gen = gen_VCVTfp2fp; break;
+    }
+}
+
+static void decode_0F5B(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F5B[4] = {
+        X86_OP_ENTRY2(VCVTDQ2PS,   V,x, W,x,      vex2),
+        X86_OP_ENTRY2(VCVTPS2DQ,   V,x, W,x,      vex2),
+        X86_OP_ENTRY2(VCVTTPS2DQ,  V,x, W,x,      vex2),
+        {},
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F5B);
+}
+
 static const X86OpEntry opcodes_0F[256] = {
+    [0x50] = X86_OP_ENTRY3(MOVMSK,     G,y, None,None, U,x, vex7 p_00_66),
+    [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x52] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex5 p_00_f3),
+    [0x53] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex5 p_00_f3),
+    [0x54] = X86_OP_ENTRY3(PAND,       V,x, H,x, W,x,  vex4 p_00_66), /* vand */
+    [0x55] = X86_OP_ENTRY3(PANDN,      V,x, H,x, W,x,  vex4 p_00_66), /* vandn */
+    [0x56] = X86_OP_ENTRY3(POR,        V,x, H,x, W,x,  vex4 p_00_66), /* vor */
+    [0x57] = X86_OP_ENTRY3(PXOR,       V,x, H,x, W,x,  vex4 p_00_66), /* vxor */
+
     [0x60] = X86_OP_ENTRY3(PUNPCKLBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x61] = X86_OP_ENTRY3(PUNPCKLWD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x62] = X86_OP_ENTRY3(PUNPCKLDQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
@@ -265,6 +299,15 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x38] = X86_OP_GROUP0(0F38),
     [0x3a] = X86_OP_GROUP0(0F3A),
 
+    [0x58] = X86_OP_ENTRY3(VADD,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x59] = X86_OP_ENTRY3(VMUL,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5a] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex3 p_00_66_f3_f2),
+    [0x5b] = X86_OP_GROUP0(0F5B),
+    [0x5c] = X86_OP_ENTRY3(VSUB,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5d] = X86_OP_ENTRY3(VMIN,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5e] = X86_OP_ENTRY3(VDIV,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+    [0x5f] = X86_OP_ENTRY3(VMAX,       V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
+
     [0x68] = X86_OP_ENTRY3(PUNPCKHBW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x69] = X86_OP_ENTRY3(PUNPCKHWD,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x6a] = X86_OP_ENTRY3(PUNPCKHDQ,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 0d35a8627f..e063d2fe04 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -318,6 +318,131 @@ static void gen_store_sse(DisasContext *s, X86DecodedInsn *decode, int src_ofs)
     }
 }
 
+/*
+ * 00 = v*ps Vps, Hps, Wpd
+ * 66 = v*pd Vpd, Hpd, Wps
+ * f3 = v*ss Vss, Hss, Wps
+ * f2 = v*sd Vsd, Hsd, Wps
+ */
+static inline void gen_unary_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                              SSEFunc_0_epp pd_xmm, SSEFunc_0_epp ps_xmm,
+                              SSEFunc_0_epp pd_ymm, SSEFunc_0_epp ps_ymm,
+                              SSEFunc_0_eppp sd, SSEFunc_0_eppp ss)
+{
+    if ((s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) != 0) {
+        SSEFunc_0_eppp fn = s->prefix & PREFIX_REPZ ? ss : sd;
+        if (!fn) {
+            gen_illegal_opcode(s);
+            return;
+        }
+        fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+    } else {
+        SSEFunc_0_epp ps, pd, fn;
+        ps = s->vex_l ? ps_ymm : ps_xmm;
+        pd = s->vex_l ? pd_ymm : pd_xmm;
+        fn = s->prefix & PREFIX_DATA ? pd : ps;
+        if (!fn) {
+            gen_illegal_opcode(s);
+            return;
+        }
+        fn(cpu_env, OP_PTR0, OP_PTR2);
+    }
+}
+#define UNARY_FP_SSE(uname, lname)                                                 \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_unary_fp_sse(s, env, decode,                                               \
+                     gen_helper_##lname##pd_xmm,                                   \
+                     gen_helper_##lname##ps_xmm,                                   \
+                     gen_helper_##lname##pd_ymm,                                   \
+                     gen_helper_##lname##ps_ymm,                                   \
+                     gen_helper_##lname##sd,                                       \
+                     gen_helper_##lname##ss);                                      \
+}
+UNARY_FP_SSE(VSQRT, sqrt)
+
+/*
+ * 00 = v*ps Vps, Hps, Wpd
+ * 66 = v*pd Vpd, Hpd, Wps
+ * f3 = v*ss Vss, Hss, Wps
+ * f2 = v*sd Vsd, Hsd, Wps
+ */
+static inline void gen_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                              SSEFunc_0_eppp pd_xmm, SSEFunc_0_eppp ps_xmm,
+                              SSEFunc_0_eppp pd_ymm, SSEFunc_0_eppp ps_ymm,
+                              SSEFunc_0_eppp sd, SSEFunc_0_eppp ss)
+{
+    SSEFunc_0_eppp ps, pd, fn;
+    if ((s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) != 0) {
+        fn = s->prefix & PREFIX_REPZ ? ss : sd;
+    } else {
+        ps = s->vex_l ? ps_ymm : ps_xmm;
+        pd = s->vex_l ? pd_ymm : pd_xmm;
+        fn = s->prefix & PREFIX_DATA ? pd : ps;
+    }
+    if (fn) {
+        fn(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+    } else {
+        gen_illegal_opcode(s);
+    }
+}
+#define FP_SSE(uname, lname)                                                       \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_fp_sse(s, env, decode,                                                     \
+               gen_helper_##lname##pd_xmm,                                         \
+               gen_helper_##lname##ps_xmm,                                         \
+               gen_helper_##lname##pd_ymm,                                         \
+               gen_helper_##lname##ps_ymm,                                         \
+               gen_helper_##lname##sd,                                             \
+               gen_helper_##lname##ss);                                            \
+}
+FP_SSE(VADD, add)
+FP_SSE(VMUL, mul)
+FP_SSE(VSUB, sub)
+FP_SSE(VMIN, min)
+FP_SSE(VDIV, div)
+FP_SSE(VMAX, max)
+
+/*
+ * 00 = v*ps Vps, Wpd
+ * f3 = v*ss Vss, Wps
+ */
+static inline void gen_unary_fp32_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                      SSEFunc_0_epp ps_xmm,
+                                      SSEFunc_0_epp ps_ymm,
+                                      SSEFunc_0_eppp ss)
+{
+    if ((s->prefix & (PREFIX_DATA | PREFIX_REPNZ)) != 0) {
+        goto illegal_op;
+    } else if (s->prefix & PREFIX_REPZ) {
+        if (!ss) {
+            goto illegal_op;
+        }
+        ss(cpu_env, OP_PTR0, OP_PTR1, OP_PTR2);
+    } else {
+        SSEFunc_0_epp fn = s->vex_l ? ps_ymm : ps_xmm;
+        if (!fn) {
+            goto illegal_op;
+        }
+        fn(cpu_env, OP_PTR0, OP_PTR2);
+    }
+    return;
+
+illegal_op:
+    gen_illegal_opcode(s);
+}
+#define UNARY_FP32_SSE(uname, lname)                                               \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_unary_fp32_sse(s, env, decode,                                             \
+                       gen_helper_##lname##ps_xmm,                                 \
+                       gen_helper_##lname##ps_ymm,                                 \
+                       gen_helper_##lname##ss);                                    \
+}
+UNARY_FP32_SSE(VRSQRT, rsqrt)
+UNARY_FP32_SSE(VRCP, rcp)
+
 #define BINARY_INT_GVEC(uname, func, ...)                                          \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
@@ -413,6 +538,29 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 BINARY_INT_SSE(PUNPCKLQDQ, punpcklqdq)
 BINARY_INT_SSE(PUNPCKHQDQ, punpckhqdq)
 
+static inline void gen_unary_int_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                     SSEFunc_0_epp xmm, SSEFunc_0_epp ymm)
+{
+    if (!s->vex_l) {
+        xmm(cpu_env, OP_PTR0, OP_PTR2);
+    } else {
+        ymm(cpu_env, OP_PTR0, OP_PTR2);
+    }
+}
+
+#define UNARY_INT_SSE(uname, lname)                                                \
+static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    gen_unary_int_sse(s, env, decode,                                              \
+                      gen_helper_##lname##_xmm,                                    \
+                      gen_helper_##lname##_ymm);                                   \
+}
+
+UNARY_INT_SSE(VCVTDQ2PS, cvtdq2ps)
+UNARY_INT_SSE(VCVTPS2DQ, cvtps2dq)
+UNARY_INT_SSE(VCVTTPS2DQ, cvttps2dq)
+
+
 static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 {
     TCGv carry_in = NULL;
@@ -607,6 +755,16 @@ static void gen_MOVDQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_store_sse(s, decode, decode->op[2].offset);
 }
 
+static void gen_MOVMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    typeof(gen_helper_movmskps_ymm) *ps, *pd, *fn;
+    ps = s->vex_l ? gen_helper_movmskps_ymm : gen_helper_movmskps_xmm;
+    pd = s->vex_l ? gen_helper_movmskpd_ymm : gen_helper_movmskpd_xmm;
+    fn = s->prefix & PREFIX_DATA ? pd : ps;
+    fn(s->tmp2_i32, cpu_env, OP_PTR2);
+    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+}
+
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -707,3 +865,11 @@ static void gen_SHRX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
     tcg_gen_shr_tl(s->T0, s->T0, s->T1);
 }
+
+static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_unary_fp_sse(s, env, decode,
+                     gen_helper_cvtpd2ps_xmm, gen_helper_cvtps2pd_xmm,
+                     gen_helper_cvtpd2ps_ymm, gen_helper_cvtps2pd_ymm,
+                     gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ff5c4bbb56..dd831d7a1a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4782,7 +4782,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         use_new &= b <= limit;
 #endif
         if (use_new &&
-            ((b >= 0x160 && b <= 0x16f) ||
+            ((b >= 0x150 && b <= 0x16f) ||
              (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
-- 
2.37.3


