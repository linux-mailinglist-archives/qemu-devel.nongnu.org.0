Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E945B51EF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:33:20 +0200 (CEST)
Received: from localhost ([::1]:41394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWRz-00008v-5t
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1G-00012n-90
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1D-0007LS-OT
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBAah+7oggi8iL2POsLEQkKSu7EEFicyPdj/k6QJj1s=;
 b=UsQR0ikvHT/WFUNzCXWq1eiStbYgKdPghmBf5TfsLbff8Zu+F+nvrzThUwgmDIhTq9ovlY
 jAqf2WjnmVY7BbF86RNBfwV3IY6ifbdRhUrGRkiltPjEZNq62hzAiCvj0gMMM9TdoUcrUi
 EY3+W8X5tT8JdOf6f4BLoG2exFvyeeU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-V04ELDmCPCSNZqRZpU47wA-1; Sun, 11 Sep 2022 19:05:33 -0400
X-MC-Unique: V04ELDmCPCSNZqRZpU47wA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hs4-20020a1709073e8400b0073d66965277so2275946ejc.6
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DBAah+7oggi8iL2POsLEQkKSu7EEFicyPdj/k6QJj1s=;
 b=qDd5nSaop+JTkGVgkKeI4XmX6wxDbg5vS0nrpUBApTl33gdnmFw2vC4nlsowLIPHRw
 mXzhMtNWwUWvgVqRFrHVOGLVOrslrYNWAFqJ0tkafiIwZNQBcUpXLieWDtMjayUd/dtr
 yuFin7DUHwjiX93wTo9YFifQq8q9O5LGGnDZEhe7PTn6s3N8CUZaA+ZsCG3lFVA6Qoen
 eeaKDPtZztoDkYsBWDmVUB8boFXvXpLx4O7o2vGPNZzX+Xh6yc/1O6cHCPCabrpQFXVx
 ihFLlzLhxH2VOKgsVZBJlY0LwREfRmWxvLfMoRqXBqROG/HKXyg5l/hJmCj65S09zln9
 jQSA==
X-Gm-Message-State: ACgBeo0f6v/zoYdlZ8uBmIx7FNdYlr5xIy3btU0e4/5wsRVsz4NQrcZW
 IZm3zMLkJKzynegkaTXzH9RKS0gqcXiLmBLdRhBD6bWBho2JOJ9ynGgxYPIhk6dJf5FGk6JwKNK
 Ey8FS1p/8QZHf+2WYXzcXkXg4dLo1+xAu0nScIL5D2MWE4WYyaK91VunpBb4UpSuvjD0=
X-Received: by 2002:a17:907:1612:b0:770:86e3:2f1f with SMTP id
 hb18-20020a170907161200b0077086e32f1fmr15768281ejc.403.1662937532378; 
 Sun, 11 Sep 2022 16:05:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4FOTiAUBG/8q/jVNZN/7aAYxlH8N+MPgLUb2YEbtAwDX/MLNsYb2vrnF4s6kst+t8mnF2QPg==
X-Received: by 2002:a17:907:1612:b0:770:86e3:2f1f with SMTP id
 hb18-20020a170907161200b0077086e32f1fmr15768269ejc.403.1662937532048; 
 Sun, 11 Sep 2022 16:05:32 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a1709060cd200b0077085fdd613sm3508935ejh.44.2022.09.11.16.05.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/37] target/i386: reimplement 0x0f 0x78-0x7f, add AVX
Date: Mon, 12 Sep 2022 01:04:03 +0200
Message-Id: <20220911230418.340941-24-pbonzini@redhat.com>
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

These are a mixed match, including the first two horizontal
(66 and F2 only) operations, more moves, and SSE4a extract/insert.

Because SSE4a is pretty rare, I chose to leave the helper as they are,
but it is possible to unify them by loading index and length from the
source XMM register.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 23 +++++++++
 target/i386/tcg/emit.c.inc       | 81 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  1 +
 3 files changed, 105 insertions(+)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 5a94e05d71..6aa8bac74f 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -159,6 +159,22 @@ static void decode_0F6F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     }
 }
 
+static void decode_0F7E(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry movd_from_vec =
+        X86_OP_ENTRY3(MOVD_from,  E,y, None,None, V,y, vex5 mmx);
+    static const X86OpEntry movq =
+        X86_OP_ENTRY3(MOVQ,       V,x, None,None, W,q, vex5);  /* wrong dest Vy on SDM! */
+
+    if (s->prefix & PREFIX_REPNZ) {
+        entry->gen = NULL;
+    } else if (s->prefix & PREFIX_REPZ) {
+        *entry = movq;
+    } else {
+        *entry = movd_from_vec;
+    }
+}
+
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
 };
 
@@ -297,6 +313,13 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x6e] = X86_OP_ENTRY3(MOVD_to,    V,x, None,None, E,y, vex5 mmx p_00_66),  /* wrong dest Vy on SDM! */
     [0x6f] = X86_OP_GROUP3(0F6F,       V,x, None,None, W,x, vex5 mmx p_00_66_f3),
 
+    [0x78] = X86_OP_ENTRY2(SSE4a_I,    V,x, I,w,       cpuid(SSE4A) p_66_f2),
+    [0x79] = X86_OP_ENTRY2(SSE4a_R,    V,x, W,x,       cpuid(SSE4A) p_66_f2),
+    [0x7c] = X86_OP_ENTRY3(VHADD,      V,x, H,x, W,x,  vex2 cpuid(SSE3) p_66_f2),
+    [0x7d] = X86_OP_ENTRY3(VHSUB,      V,x, H,x, W,x,  vex2 cpuid(SSE3) p_66_f2),
+    [0x7e] = X86_OP_GROUP0(0F7E),
+    [0x7f] = X86_OP_GROUP3(0F6F,       W,x, None,None, V,x, vex5 mmx p_00_66_f3),
+
     /* Incorrectly missing from 2-17 */
     [0xd8] = X86_OP_ENTRY3(PSUBUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0xd9] = X86_OP_ENTRY3(PSUBUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 5feb50efdb..2053c9d8fb 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -380,6 +380,30 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
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
+    fn(cpu_env, s->ptr0, s->ptr1, s->ptr2);
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
 /*
  * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
  * 66 = vp* Vx, Hx, Wx
@@ -621,6 +645,28 @@ static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     }
 }
 
+static void gen_MOVD_from(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    MemOp ot = decode->op[2].ot;
+    int lo_ofs = decode->op[2].offset
+        - xmm_offset(decode->op[2].ot)
+        + xmm_offset(ot);
+
+    switch (ot) {
+    case MO_32:
+#ifdef TARGET_X86_64
+        tcg_gen_ld_i32(s->tmp2_i32, cpu_env, lo_ofs);
+        tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+        break;
+    case MO_64:
+#endif
+        tcg_gen_ld_tl(s->T0, cpu_env, lo_ofs);
+        break;
+    default:
+        abort();
+    }
+}
+
 static void gen_MOVD_to(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[2].ot;
@@ -661,6 +707,18 @@ static void gen_MOVMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
     tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
 }
 
+static void gen_MOVQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    int vec_len = sse_vec_len(s, decode);
+    int lo_ofs = decode->op[0].offset
+        - xmm_offset(decode->op[0].ot)
+        + xmm_offset(MO_64);
+
+    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset);
+    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+    tcg_gen_st_i64(s->tmp1_i64, cpu_env, lo_ofs);
+}
+
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -878,6 +936,29 @@ static void gen_SHRX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     tcg_gen_shr_tl(s->T0, s->T0, s->T1);
 }
 
+static void gen_SSE4a_I(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    TCGv_i32 length = tcg_const_i32(decode->immediate & 255);
+    TCGv_i32 index = tcg_const_i32(decode->immediate >> 8);
+
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_extrq_i(cpu_env, s->ptr0, index, length);
+    } else {
+        gen_helper_insertq_i(cpu_env, s->ptr0, index, length);
+    }
+    tcg_temp_free_i32(length);
+    tcg_temp_free_i32(index);
+}
+
+static void gen_SSE4a_R(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_extrq_r(cpu_env, s->ptr0, s->ptr2);
+    } else {
+        gen_helper_insertq_r(cpu_env, s->ptr0, s->ptr2);
+    }
+}
+
 #define gen_VAND   gen_PAND
 #define gen_VANDN  gen_PANDN
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 8ef419dd59..53d693279a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4668,6 +4668,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             ((b >= 0x150 && b <= 0x16f) ||
+             (b >= 0x178 && b <= 0x17f) ||
              (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
             return disas_insn_new(s, cpu, b + 0x100);
         }
-- 
2.37.2



