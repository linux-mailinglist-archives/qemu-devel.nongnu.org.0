Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614F5BEF73
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:56:16 +0200 (CEST)
Received: from localhost ([::1]:49790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalDz-0000et-8Y
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0M-0006T2-Ke
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oah0H-0002Dl-Uh
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXGMPhyWPieM/QIjTI01XrC9LGHf1/ZCQfetOtjgTZI=;
 b=KAA+NeN5O9HAvRXrWTRbzARFNtWzn1bHPZbHPRpraBrS1xhDIcoUBRUUDJEwYbNtGRIdi3
 xvMbAZsHd1ouYINC3zVqi+fLLsuIC9mvIiEfGLK3APvyCKvHHOOYB7oZPfLkkweFbld7kI
 31ufPXnP8JDLqJfQwF1LqxAngckgxd4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-D4krkW89NPS-eoDcDKA-xg-1; Tue, 20 Sep 2022 13:25:47 -0400
X-MC-Unique: D4krkW89NPS-eoDcDKA-xg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w17-20020a056402269100b0045249bc17a9so2369385edd.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nXGMPhyWPieM/QIjTI01XrC9LGHf1/ZCQfetOtjgTZI=;
 b=H6PK80fzptfEznVulx9W0JPFJuAwQHa0zYoJ6NbBXxXrA6+M4ZbGdXzh2NAGwRGX/H
 YRH8BnPgiim7azH3MfGQskNTpazhFdEiGlNhKesFHBK7QTluPWEnWk5HEWa0bUg6eWl/
 GR40rO11oT1w20t9tqMyLOyJEYtKHeAZxPRwL/RDzxpITSP2VziVIyje2f5HDoaVl+og
 LLzDx5ohDcIlUaaUomzZK0bEYq9MYxKqJMKj792ZvmKc3hAoq+UY44Cv+uslKA0bV58E
 KvUafw1auJJ+to0EU220WwIawVQbEj64xKtX1m+NujAEjRLY3NAoOQ8teLKutyRbbWpH
 /TYA==
X-Gm-Message-State: ACrzQf1mDD1512RtLwAqzXa5/9Opw145Y62N7MHn960oUutLVw5UGMO1
 4EGVot6Uwwe2UXI4a+QZ30C9vrzNLtQeI6V5q68tRpt7jkvK5mYtcqarGWUWvqvDG5u5LW7UHQA
 aDJ0qfN+b7JX+H3Rwwqx1x+rrgjR81RlYZWSg7Er44ACtRLRcvL4RulcZo7qR7JdBor0=
X-Received: by 2002:aa7:dc13:0:b0:443:3f15:8440 with SMTP id
 b19-20020aa7dc13000000b004433f158440mr20811476edu.274.1663694746203; 
 Tue, 20 Sep 2022 10:25:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4pmBQfMJWlDBtWqs9kWEKUQYmbAjAzgPSDZHoXFXxuUi4SN1exdvScaG77/o5TDGIuNPAXbw==
X-Received: by 2002:aa7:dc13:0:b0:443:3f15:8440 with SMTP id
 b19-20020aa7dc13000000b004433f158440mr20811451edu.274.1663694745885; 
 Tue, 20 Sep 2022 10:25:45 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a170906600500b007708130c287sm200140ejj.40.2022.09.20.10.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 24/37] target/i386: reimplement 0x0f 0xd0-0xd7, 0xe0-0xe7,
 0xf0-0xf7, add AVX
Date: Tue, 20 Sep 2022 19:24:54 +0200
Message-Id: <20220920172507.95568-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/decode-new.c.inc | 53 ++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  1 +
 target/i386/tcg/emit.c.inc       | 77 +++++++++++++++++++++++++++-----
 target/i386/tcg/translate.c      |  2 +-
 4 files changed, 122 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 02f4063ebc..0bc41b01c9 100644
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
index 5fb68a365c..c248b089b7 100644
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
index 062d8213b3..0e0783416b 100644
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
@@ -876,16 +912,27 @@ static void gen_MOVQ(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
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
+        gen_op_st_v(s, MO_64, s->tmp1_i64, s->A0);
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
@@ -939,6 +986,16 @@ static void gen_PEXT(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
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
index 4d0bf511fa..2366fd4211 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4696,7 +4696,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         if (use_new &&
             ((b >= 0x150 && b <= 0x17f) ||
-             (b >= 0x1d8 && b <= 0x1ff && (b & 8)))) {
+             (b >= 0x1d0 && b <= 0x1ff))) {
             disas_insn_new(s, cpu, b + 0x100);
             return s->pc;
         }
-- 
2.37.2


