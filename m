Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C985B51F0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:33:47 +0200 (CEST)
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWSR-00014O-06
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1X-0001XH-NJ
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1V-0007Nm-Oa
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M+nKCzzgE5YjMK/hJLVxLXGbAIK3id29IdAPMiGFWyE=;
 b=cK6w6zthl/UwRwKfqGeE4A8vVs4u5Mk/W5sNjuxsMq7zS2G3E/M3bL+eN//kbjcE+sTGWG
 jZB6TuIkVbwzNaGeVyacjxjrWg/n0zrtLXoufY3Oc5OJdNr7HJp+fzwmjO9lj4DKRew3yV
 oJawjtrQPcG3ulP4/f5dS64tWY2UeiE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-ii7LG8noOAOeP1bSis91Yw-1; Sun, 11 Sep 2022 19:05:55 -0400
X-MC-Unique: ii7LG8noOAOeP1bSis91Yw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z2-20020a056402274200b004516734e755so2469902edd.3
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=M+nKCzzgE5YjMK/hJLVxLXGbAIK3id29IdAPMiGFWyE=;
 b=oeTycS3hi+5NQ5Fc0gVlui4+KZ8HQxVlYiB/4l7l4WTA6J0eH973wOrlS8RZ5pLUZ+
 GojsUha3GbqPZdrosc+16cutX47UbQF3q47db/L/L7fCwIrI+P79t1o9rJjTBkTE7DHO
 mceCDoQxf4YrL4YI9XWyriGz8czVOvDnVUp/37OkjDErDcRphn022Sd6RQ3MKMYb2Ujl
 wGNPXZELCDLG+uTcnQQcMTm1RRA5YQttzwR40/dKbrXmYhmVWTPuKxF0jVWw8GDPiojI
 7c6TsJSX5Fdu3bu7ipqxeZHPnqLcg4RdMzluHy4kWePLsdactzgaiCY60CoSVotMdSTN
 3mfA==
X-Gm-Message-State: ACgBeo1OIhmzHHrqm6JVOECMwNogZd3Ddu3ScTZKE8z0RV8S5Qrls5FL
 7aQ6sGXRpwlRZCV1ZZN8m/UT7CvqaHyKqD41IoASNZf7hR9iAkJEyTI2nb6RiB1nrI+4rx5qZKj
 TPWuWQuDPM0nnR3+KmZZPzmx6z7G/nmmBhRdXrJVxXmA6YTCfjmKlsam95Xup++LF9Og=
X-Received: by 2002:a05:6402:84e:b0:440:4bac:be5a with SMTP id
 b14-20020a056402084e00b004404bacbe5amr20240091edz.103.1662937554229; 
 Sun, 11 Sep 2022 16:05:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4V7OLghGY+a2XlZeOWTd980Net83lAH8YbXMAu+n4oIGyt9qvMc4cD0yf85XP0X1m/Mcf4kA==
X-Received: by 2002:a05:6402:84e:b0:440:4bac:be5a with SMTP id
 b14-20020a056402084e00b004404bacbe5amr20240075edz.103.1662937553905; 
 Sun, 11 Sep 2022 16:05:53 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 r12-20020aa7da0c000000b004511957d075sm4660022eds.80.2022.09.11.16.05.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/37] target/i386: reimplement 0x0f 0x28-0x2f, add AVX
Date: Mon, 12 Sep 2022 01:04:11 +0200
Message-Id: <20220911230418.340941-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Here the code is a bit uglier due to the truncation and extension
of registers to and from 32-bit.  Otherwise there is nothing special
going on.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc |  54 ++++++++++++++
 target/i386/tcg/emit.c.inc       | 120 +++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |   1 +
 3 files changed, 175 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 268ccb886f..383a425ccd 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -620,6 +620,51 @@ static void decode_0F16(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     }
 }
 
+static void decode_0F2A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F2A[4] = {
+        X86_OP_ENTRY3(CVTPI2Px,  V,x, None,None, Q,q, vex4),
+        X86_OP_ENTRY3(CVTPI2Px,  V,x, None,None, Q,q, vex4),
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
+        X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4),
+        X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4), /* MOVSD */
+    };
+
+    *entry = *decode_by_prefix(s, opcodes_0F2B);
+}
+
+static void decode_0F2C(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F2C[4] = {
+        X86_OP_ENTRY3(CVTTPx2PI,  P,q,  None,None, W,x, vex4),
+        X86_OP_ENTRY3(CVTTPx2PI,  P,q,  None,None, W,x, vex4),
+        X86_OP_ENTRY3(VCVTTSx2SI, G,y,  None,None, W,x, vex3),
+        X86_OP_ENTRY3(VCVTTSx2SI, G,y,  None,None, W,x, vex3),
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F2C);
+}
+
+static void decode_0F2D(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0F2D[4] = {
+        X86_OP_ENTRY3(CVTPx2PI,  P,q,  None,None, W,x, vex4),
+        X86_OP_ENTRY3(CVTPx2PI,  P,q,  None,None, W,x, vex4),
+        X86_OP_ENTRY3(VCVTSx2SI, G,y,  None,None, W,x, vex3),
+        X86_OP_ENTRY3(VCVTSx2SI, G,y,  None,None, W,x, vex3),
+    };
+    *entry = *decode_by_prefix(s, opcodes_0F2D);
+}
+
 static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
@@ -672,6 +717,15 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x76] = X86_OP_ENTRY3(PCMPEQD,    V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0x77] = X86_OP_ENTRY0(EMMS_VZERO, vex8),
 
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
index 2319368cb5..d61b43f21c 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -921,6 +921,36 @@ static void gen_CRC32(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_crc32(s->T0, s->tmp2_i32, s->T1, tcg_const_i32(8 << ot));
 }
 
+static void gen_CVTPI2Px(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_enter_mmx(cpu_env);
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_cvtpi2pd(cpu_env, s->ptr0, s->ptr2);
+    } else {
+        gen_helper_cvtpi2ps(cpu_env, s->ptr0, s->ptr2);
+    }
+}
+
+static void gen_CVTPx2PI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_enter_mmx(cpu_env);
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_cvtpd2pi(cpu_env, s->ptr0, s->ptr2);
+    } else {
+        gen_helper_cvtps2pi(cpu_env, s->ptr0, s->ptr2);
+    }
+}
+
+static void gen_CVTTPx2PI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_enter_mmx(cpu_env);
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_cvttpd2pi(cpu_env, s->ptr0, s->ptr2);
+    } else {
+        gen_helper_cvttps2pi(cpu_env, s->ptr0, s->ptr2);
+    }
+}
+
 static void gen_EMMS_VZERO(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     if (!(s->prefix & PREFIX_VEX)) {
@@ -1863,6 +1893,14 @@ static inline void gen_VCMP(DisasContext *s, CPUX86State *env, X86DecodedInsn *d
     gen_helper_cmp_funcs[index][b](cpu_env, s->ptr0, s->ptr1, s->ptr2);
 }
 
+static void gen_VCOMI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    SSEFunc_0_epp fn;
+    fn = s->prefix & PREFIX_DATA ? gen_helper_comisd : gen_helper_comiss;
+    fn(cpu_env, s->ptr1, s->ptr2);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
 static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     gen_unary_fp_sse(s, env, decode,
@@ -1871,6 +1909,80 @@ static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
                      gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
 }
 
+static void gen_VCVTSI2Sx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+    MemOp ot = decode->op[2].ot;
+    TCGv_i32 in;
+
+    tcg_gen_gvec_mov(MO_64, decode->op[0].offset, decode->op[1].offset, vec_len, vec_len);
+#ifdef TARGET_X86_64
+    if (ot == MO_64) {
+        if (s->prefix & PREFIX_REPNZ) {
+            gen_helper_cvtsq2sd(cpu_env, s->ptr0, s->T1);
+        } else {
+            gen_helper_cvtsq2ss(cpu_env, s->ptr0, s->T1);
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
+        gen_helper_cvtsi2sd(cpu_env, s->ptr0, in);
+    } else {
+        gen_helper_cvtsi2ss(cpu_env, s->ptr0, in);
+    }
+}
+
+static inline void gen_VCVTtSx2SI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
+                                  SSEFunc_i_ep ss2si, SSEFunc_l_ep ss2sq,
+                                  SSEFunc_i_ep sd2si, SSEFunc_l_ep sd2sq)
+{
+    MemOp ot = decode->op[0].ot;
+    TCGv_i32 out;
+
+#ifdef TARGET_X86_64
+    if (ot == MO_64) {
+        if (s->prefix & PREFIX_REPNZ) {
+            sd2sq(s->T0, cpu_env, s->ptr2);
+        } else {
+            ss2sq(s->T0, cpu_env, s->ptr2);
+        }
+        return;
+    }
+
+    out = s->tmp2_i32;
+#else
+    out = s->T0;
+#endif
+    if (s->prefix & PREFIX_REPNZ) {
+        sd2si(out, cpu_env, s->ptr2);
+    } else {
+        ss2si(out, cpu_env, s->ptr2);
+    }
+#ifdef TARGET_X86_64
+    tcg_gen_extu_i32_tl(s->T0, out);
+#endif
+}
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
 static void gen_VCVTpd_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     SSEFunc_0_epp fn = NULL;
@@ -2162,4 +2274,12 @@ static inline void gen_VSHUF(DisasContext *s, CPUX86State *env, X86DecodedInsn *
     tcg_temp_free_i32(imm);
 }
 
+static void gen_VUCOMI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    SSEFunc_0_epp fn;
+    fn = s->prefix & PREFIX_DATA ? gen_helper_ucomisd : gen_helper_ucomiss;
+    fn(cpu_env, s->ptr1, s->ptr2);
+    set_cc_op(s, CC_OP_EFLAGS);
+}
+
 #define gen_VXOR  gen_PXOR
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index bb5f74140c..f312663110 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4669,6 +4669,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         if (use_new &&
             (b == 0x138 || b == 0x13a ||
              (b >= 0x110 && b <= 0x117) ||
+             (b >= 0x128 && b <= 0x12f) ||
              (b >= 0x150 && b <= 0x17f) ||
              b == 0x1c2 || (b >= 0x1c4 && b <= 0x1c6) ||
              (b >= 0x1d0 && b <= 0x1ff))) {
-- 
2.37.2



