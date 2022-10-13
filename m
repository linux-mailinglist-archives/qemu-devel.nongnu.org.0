Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9155FE530
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:21:35 +0200 (CEST)
Received: from localhost ([::1]:47538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6a3-00048V-M6
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63g-0002qN-Ia
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj63e-0005Iu-Ag
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7k8b24GypBXluQtInzX8fqWslu5uPL+KTdH1KJPHgBo=;
 b=euMsCjTI2SQAu931hEnBGAZ+DUiyQU8ADkUpmN1btdzBMU/K5GacHGtf8Cj8P0RsaGUUdC
 tEvd6IKKbjQnBpfCleoNU5RJRXMoCC/3qi7kOLqeqjAdP/P6WeCVgqw5+6wPRK6s3IsVyg
 XKsr4e6krdtPJGxBOGyOvxd8ybkkJvg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-36-pE2QNH5oP6Or6WgA5pcieg-1; Thu, 13 Oct 2022 17:49:15 -0400
X-MC-Unique: pE2QNH5oP6Or6WgA5pcieg-1
Received: by mail-ed1-f71.google.com with SMTP id
 h13-20020a056402280d00b0045cb282161cso2332827ede.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7k8b24GypBXluQtInzX8fqWslu5uPL+KTdH1KJPHgBo=;
 b=d8zjpkpiOegquKS6DKoTI2B3xj59RXj6GaVILR2jpB5LT8GBg275ABX9YcFQfl0vqY
 p9aUIEdpqRqCRqf5dZmaMNtLqgakC1Bo676bcvqhMFKBWF3xLYrSzsmlcD1S0oNUZV0/
 uAmJFav7XXy1Gal/N2kZjOoNni9nZIjE7z6rsRKAm7aNDOOMfC7Ve25/6zX/AQG+fV9F
 aAesQ6VdTqVsgqdC8k81lWyoersFsnbPRPG+Y/Nh+J6Yu0AjFUkfAHDfxhqr/0unGmNC
 ydPJfufAhw/EySLf3c1qTWqaRH8ZrctsUZJWKsdm/vBIVUc76yEkH0N3tdRMe3kZ1GOb
 PBeA==
X-Gm-Message-State: ACrzQf25VIO7FvW8v1fI96phfQ4bAYAoyUqwtpudEj0u6hNWboGITRP2
 OZRYMUERZzcP43BIXGJCr43yH37adUlaYs+q9MSzEE45vgCqfm0Ch0tkoaoCEqT0wopVeStdTA5
 XiluAiQDkn796kIEHr2gB/i0Z/WKETupxziza6g7VGrtSqHMYwX5z2ZanL/E65Uw2Bj4=
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id
 bb5-20020a1709070a0500b0077bb5386476mr1347686ejc.324.1665697678912; 
 Thu, 13 Oct 2022 14:47:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6x978Qhqo824LHkxAq5iOybgtPsPnSb7B0RE9z/2J4o+2R3cJiIZanysamtXI3lmaW4WHm9Q==
X-Received: by 2002:a17:907:a05:b0:77b:b538:6476 with SMTP id
 bb5-20020a1709070a0500b0077bb5386476mr1347671ejc.324.1665697678416; 
 Thu, 13 Oct 2022 14:47:58 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a1709063ca200b00773f3ccd989sm460077ejh.68.2022.10.13.14.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 22/35] target/i386: reimplement 0x0f 0xd0-0xd7, 0xe0-0xe7,
 0xf0-0xf7, add AVX
Date: Thu, 13 Oct 2022 23:46:38 +0200
Message-Id: <20221013214651.672114-23-pbonzini@redhat.com>
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

The more complicated ones here are d6-d7, e6-e7, f7.  The others
are trivial.

For LDDQU, using gen_load_sse directly might corrupt the register if
the second part of the load fails.  Therefore, add a custom X86_TYPE_WM
value; like X86_TYPE_W it does call gen_load(), but it also rejects a
value of 11 in the ModRM field like X86_TYPE_M.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 53 ++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  1 +
 target/i386/tcg/emit.c.inc       | 77 +++++++++++++++++++++++++++-----
 target/i386/tcg/translate.c      |  2 +-
 4 files changed, 122 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 764d8d1d7c..f05234ad34 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -289,6 +289,18 @@ static void decode_0F7F(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = *decode_by_prefix(s, opcodes_0F7F);
 }
 
+static void decode_0FD6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry movq[4] = {
+        {},
+        X86_OP_ENTRY3(MOVQ,    W,x,  None, None, V,q, vex5),
+        X86_OP_ENTRY3(MOVq_dq, V,dq, None, None, N,q),
+        X86_OP_ENTRY3(MOVq_dq, P,q,  None, None, U,q),
+    };
+
+    *entry = *decode_by_prefix(s, movq);
+}
+
 static const X86OpEntry opcodes_0F38_00toEF[240] = {
 };
 
@@ -398,6 +410,17 @@ static void decode_0F5B(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
     *entry = *decode_by_prefix(s, opcodes_0F5B);
 }
 
+static void decode_0FE6(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
+{
+    static const X86OpEntry opcodes_0FE6[4] = {
+        {},
+        X86_OP_ENTRY2(VCVTTPD2DQ,  V,x, W,x,      vex2),
+        X86_OP_ENTRY2(VCVTDQ2PD,   V,x, W,x,      vex2),
+        X86_OP_ENTRY2(VCVTPD2DQ,   V,x, W,x,      vex2),
+    };
+    *entry = *decode_by_prefix(s, opcodes_0FE6);
+}
+
 static const X86OpEntry opcodes_0F[256] = {
     [0x50] = X86_OP_ENTRY3(MOVMSK,     G,y, None,None, U,x, vex7 p_00_66),
     [0x51] = X86_OP_GROUP3(sse_unary,  V,x, H,x, W,x, vex2_rep3 p_00_66_f3_f2),
@@ -454,6 +477,33 @@ static const X86OpEntry opcodes_0F[256] = {
     [0x7e] = X86_OP_GROUP0(0F7E),
     [0x7f] = X86_OP_GROUP0(0F7F),
 
+    [0xd0] = X86_OP_ENTRY3(VADDSUB,   V,x, H,x, W,x,        vex2 cpuid(SSE3) p_66_f2),
+    [0xd1] = X86_OP_ENTRY3(PSRLW_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd2] = X86_OP_ENTRY3(PSRLD_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd3] = X86_OP_ENTRY3(PSRLQ_r,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd4] = X86_OP_ENTRY3(PADDQ,     V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd5] = X86_OP_ENTRY3(PMULLW,    V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xd6] = X86_OP_GROUP0(0FD6),
+    [0xd7] = X86_OP_ENTRY3(PMOVMSKB,  G,d, None,None, U,x,  vex7 mmx avx2_256 p_00_66),
+
+    [0xe0] = X86_OP_ENTRY3(PAVGB,     V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xe1] = X86_OP_ENTRY3(PSRAW_r,   V,x, H,x, W,x,        vex7 mmx avx2_256 p_00_66),
+    [0xe2] = X86_OP_ENTRY3(PSRAD_r,   V,x, H,x, W,x,        vex7 mmx avx2_256 p_00_66),
+    [0xe3] = X86_OP_ENTRY3(PAVGW,     V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xe4] = X86_OP_ENTRY3(PMULHUW,   V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xe5] = X86_OP_ENTRY3(PMULHW,    V,x, H,x, W,x,        vex4 mmx avx2_256 p_00_66),
+    [0xe6] = X86_OP_GROUP0(0FE6),
+    [0xe7] = X86_OP_ENTRY3(MOVDQ,     W,x, None,None, V,x,  vex1 mmx p_00_66), /* MOVNTQ/MOVNTDQ */
+
+    [0xf0] = X86_OP_ENTRY3(MOVDQ,    V,x, None,None, WM,x,  vex4_unal cpuid(SSE3) p_f2), /* LDDQU */
+    [0xf1] = X86_OP_ENTRY3(PSLLW_r,  V,x, H,x, W,x,         vex7 mmx avx2_256 p_00_66),
+    [0xf2] = X86_OP_ENTRY3(PSLLD_r,  V,x, H,x, W,x,         vex7 mmx avx2_256 p_00_66),
+    [0xf3] = X86_OP_ENTRY3(PSLLQ_r,  V,x, H,x, W,x,         vex7 mmx avx2_256 p_00_66),
+    [0xf4] = X86_OP_ENTRY3(PMULUDQ,  V,x, H,x, W,x,         vex4 mmx avx2_256 p_00_66),
+    [0xf5] = X86_OP_ENTRY3(PMADDWD,  V,x, H,x, W,x,         vex4 mmx avx2_256 p_00_66),
+    [0xf6] = X86_OP_ENTRY3(PSADBW,   V,x, H,x, W,x,         vex4 mmx avx2_256 p_00_66),
+    [0xf7] = X86_OP_ENTRY3(MASKMOV,  None,None, V,dq, U,dq, vex4_unal avx2_256 mmx p_00_66),
+
     /* Incorrectly missing from 2-17 */
     [0xd8] = X86_OP_ENTRY3(PSUBUSB,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
     [0xd9] = X86_OP_ENTRY3(PSUBUSW,  V,x, H,x, W,x,  vex4 mmx avx2_256 p_00_66),
@@ -710,6 +760,9 @@ static bool decode_op(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
         }
         goto get_modrm;
 
+    case X86_TYPE_WM:  /* modrm byte selects an XMM/YMM memory operand */
+        op->unit = X86_OP_SSE;
+        /* fall through */
     case X86_TYPE_M:  /* modrm byte selects a memory operand */
         modrm = get_modrm(s, env);
         if ((modrm >> 6) == 3) {
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index 8456ae67ad..ef318a00ed 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -47,6 +47,7 @@ typedef enum X86OpType {
     X86_TYPE_Y, /* string destination */
 
     /* Custom */
+    X86_TYPE_WM, /* modrm byte selects an XMM/YMM memory operand */
     X86_TYPE_2op, /* 2-operand RMW instruction */
     X86_TYPE_LoBits, /* encoded in bits 0-2 of the operand + REX.B */
     X86_TYPE_0, /* Hard-coded GPRs (RAX..RDI) */
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 0d437686e6..4227ddd9f3 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -471,6 +471,7 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 }
 HORIZONTAL_FP_SSE(VHADD, hadd)
 HORIZONTAL_FP_SSE(VHSUB, hsub)
+HORIZONTAL_FP_SSE(VADDSUB, addsub)
 
 #define BINARY_INT_GVEC(uname, func, ...)                                          \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -485,6 +486,7 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
 BINARY_INT_GVEC(PADDB,   tcg_gen_gvec_add, MO_8)
 BINARY_INT_GVEC(PADDW,   tcg_gen_gvec_add, MO_16)
 BINARY_INT_GVEC(PADDD,   tcg_gen_gvec_add, MO_32)
+BINARY_INT_GVEC(PADDQ,   tcg_gen_gvec_add, MO_64)
 BINARY_INT_GVEC(PADDSB,  tcg_gen_gvec_ssadd, MO_8)
 BINARY_INT_GVEC(PADDSW,  tcg_gen_gvec_ssadd, MO_16)
 BINARY_INT_GVEC(PADDUSB, tcg_gen_gvec_usadd, MO_8)
@@ -500,6 +502,7 @@ BINARY_INT_GVEC(PMAXSW,  tcg_gen_gvec_smax, MO_16)
 BINARY_INT_GVEC(PMAXUB,  tcg_gen_gvec_umax, MO_8)
 BINARY_INT_GVEC(PMINSW,  tcg_gen_gvec_smin, MO_16)
 BINARY_INT_GVEC(PMINUB,  tcg_gen_gvec_umin, MO_8)
+BINARY_INT_GVEC(PMULLW,  tcg_gen_gvec_mul, MO_16)
 BINARY_INT_GVEC(POR,     tcg_gen_gvec_or, MO_64)
 BINARY_INT_GVEC(PSUBB,   tcg_gen_gvec_sub, MO_8)
 BINARY_INT_GVEC(PSUBW,   tcg_gen_gvec_sub, MO_16)
@@ -557,6 +560,23 @@ BINARY_INT_MMX(PUNPCKHWD,  punpckhwd)
 BINARY_INT_MMX(PUNPCKHDQ,  punpckhdq)
 BINARY_INT_MMX(PACKSSDW,   packssdw)
 
+BINARY_INT_MMX(PAVGB,   pavgb)
+BINARY_INT_MMX(PAVGW,   pavgw)
+BINARY_INT_MMX(PMADDWD, pmaddwd)
+BINARY_INT_MMX(PMULHUW, pmulhuw)
+BINARY_INT_MMX(PMULHW,  pmulhw)
+BINARY_INT_MMX(PMULUDQ, pmuludq)
+BINARY_INT_MMX(PSADBW,  psadbw)
+
+BINARY_INT_MMX(PSLLW_r, psllw)
+BINARY_INT_MMX(PSLLD_r, pslld)
+BINARY_INT_MMX(PSLLQ_r, psllq)
+BINARY_INT_MMX(PSRLW_r, psrlw)
+BINARY_INT_MMX(PSRLD_r, psrld)
+BINARY_INT_MMX(PSRLQ_r, psrlq)
+BINARY_INT_MMX(PSRAW_r, psraw)
+BINARY_INT_MMX(PSRAD_r, psrad)
+
 /* Instructions with no MMX equivalent.  */
 #define BINARY_INT_SSE(uname, lname)                                               \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
@@ -588,6 +608,9 @@ static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decod
                       gen_helper_##lname##_ymm);                                   \
 }
 
+UNARY_INT_SSE(VCVTDQ2PD, cvtdq2pd)
+UNARY_INT_SSE(VCVTPD2DQ, cvtpd2dq)
+UNARY_INT_SSE(VCVTTPD2DQ, cvttpd2dq)
 UNARY_INT_SSE(VCVTDQ2PS, cvtdq2ps)
 UNARY_INT_SSE(VCVTPS2DQ, cvtps2dq)
 UNARY_INT_SSE(VCVTTPS2DQ, cvttps2dq)
@@ -802,6 +825,19 @@ static void gen_INSERTQ_r(DisasContext *s, CPUX86State *env, X86DecodedInsn *dec
     gen_helper_insertq_r(cpu_env, OP_PTR0, OP_PTR2);
 }
 
+static void gen_MASKMOV(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    tcg_gen_mov_tl(s->A0, cpu_regs[R_EDI]);
+    gen_extu(s->aflag, s->A0);
+    gen_add_A0_ds_seg(s);
+
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_maskmov_xmm(cpu_env, OP_PTR1, OP_PTR2, s->A0);
+    } else {
+        gen_helper_maskmov_mmx(cpu_env, OP_PTR1, OP_PTR2, s->A0);
+    }
+}
+
 static void gen_MOVBE(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
@@ -875,16 +911,27 @@ static void gen_MOVQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     int lo_ofs = vector_elem_offset(&decode->op[0], MO_64, 0);
 
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, decode->op[2].offset);
-    /*
-     * tcg_gen_gvec_dup_i64(MO_64, op0.offset, 8, vec_len, s->tmp1_64) would
-     * seem to work, but it does not on big-endian platforms; the cleared parts
-     * are always at higher addresses, but cross-endian emulation inverts the
-     * byte order so that the cleared parts need to be at *lower* addresses.
-     * Because oprsz is 8, we see this here even for SSE; but more in general,
-     * it disqualifies using oprsz < maxsz to emulate VEX128.
-     */
-    tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, lo_ofs);
+    if (decode->op[0].has_ea) {
+        tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
+    } else {
+        /*
+         * tcg_gen_gvec_dup_i64(MO_64, op0.offset, 8, vec_len, s->tmp1_64) would
+         * seem to work, but it does not on big-endian platforms; the cleared parts
+         * are always at higher addresses, but cross-endian emulation inverts the
+         * byte order so that the cleared parts need to be at *lower* addresses.
+         * Because oprsz is 8, we see this here even for SSE; but more in general,
+         * it disqualifies using oprsz < maxsz to emulate VEX128.
+         */
+        tcg_gen_gvec_dup_imm(MO_64, decode->op[0].offset, vec_len, vec_len, 0);
+        tcg_gen_st_i64(s->tmp1_i64, cpu_env, lo_ofs);
+    }
+}
+
+static void gen_MOVq_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    gen_helper_enter_mmx(cpu_env);
+    /* Otherwise the same as any other movq.  */
+    return gen_MOVQ(s, env, decode);
 }
 
 static void gen_MULX(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
@@ -938,6 +985,16 @@ static void gen_PEXT(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
     gen_helper_pext(s->T0, s->T0, s->T1);
 }
 
+static void gen_PMOVMSKB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
+{
+    if (s->prefix & PREFIX_DATA) {
+        gen_helper_pmovmskb_xmm(s->tmp2_i32, cpu_env, OP_PTR2);
+    } else {
+        gen_helper_pmovmskb_mmx(s->tmp2_i32, cpu_env, OP_PTR2);
+    }
+    tcg_gen_extu_i32_tl(s->T0, s->tmp2_i32);
+}
+
 static void gen_PSHUFW(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     TCGv_i32 imm = tcg_constant8u_i32(decode->immediate);
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ea6c37f47c..ac5868352c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4775,7 +4775,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             ((b >= 0x150 && b <= 0x17f) ||
-             (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
+             (b >= 0x1d0 && b <= 0x1ff))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
         }
-- 
2.37.3


