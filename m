Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E675A1C24
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:20:42 +0200 (CEST)
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLDN-0004tc-7o
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7H-0007UZ-Oa
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7C-0002hx-Us
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYBd0BXAdM8xfMNh7raGYNQ09880/cEx2ZCvPjXnPkE=;
 b=icVe6tun0CAW2vZNRrDyH780YhzGo1i7vNONExlbGdFvS2Apd0oJ1xPX3us8bwYQlE4Ts0
 xa8JH+RD6tvTOF/XsQBa5tC/CSlsZfRmi6/pwY+f7ayUqnAuT3RvUFlEIwz39pgga5tuM6
 BqRSruXFKa4TJIiZk7Wc60WHg1++G+c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-JfmsAj7BNiSzvB9xGhlYTg-1; Thu, 25 Aug 2022 18:14:16 -0400
X-MC-Unique: JfmsAj7BNiSzvB9xGhlYTg-1
Received: by mail-wr1-f70.google.com with SMTP id
 n17-20020adf8b11000000b0022536079ef1so3395467wra.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=TYBd0BXAdM8xfMNh7raGYNQ09880/cEx2ZCvPjXnPkE=;
 b=vBd8EOVNDVKJq1RKGvzY+00MoSacgcragmDzgitJULfI1duqv+Rj05wIcP9FKPhjew
 Ba3k12xS2cmcpuiSix8Or1cSrhsJe9NsqmsKG/CdlkFW1YPBr1FfXcK02ouRkMqTB1ui
 qL/YpEJ8T9zkVL26NKOHnrlIXum0pBAeHHsK9eSYuu3UhmK3jYFx5vIFwKJGs5g3uIGv
 MAcryV9dEHWfRqRH5vxWpz1QX1BM2kdPWem3gv2FZ7H5Iy4VSVlqIpsKocoUpB7pDJE3
 C/j1d9GZh+Ni5qnKIG/w91t9VNpGU/j1P+yUVnq7OIUOpgPVYYoV1S+syii1gXsuNSVd
 rVbg==
X-Gm-Message-State: ACgBeo0c4wmzib+t3yXBBFUPDgrmwTjvQq9huKfMzKO53U73kQYY90sr
 6uq1UO048RoYSuN45ZAhZ8/0vwDRLoXvrW7TivJVic7Hc5D200TTXG6wzvLCjRtWEeM6CQj3oBu
 if/IvyI7kAVtaYQArEllcCOxHiBP+LpNJEdVBKFZclrrP/d+eh33Xg38tmueJNKAs9gY=
X-Received: by 2002:a05:600c:4e04:b0:3a5:a34e:ae81 with SMTP id
 b4-20020a05600c4e0400b003a5a34eae81mr3398920wmq.147.1661465655103; 
 Thu, 25 Aug 2022 15:14:15 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4b5rXfLAG20Q5L/haueEliGAAqh/s7vSp9Vf9aDE+E2L8PmyOmGn9GRRkMns6xmH1efhP8YQ==
X-Received: by 2002:a05:600c:4e04:b0:3a5:a34e:ae81 with SMTP id
 b4-20020a05600c4e0400b003a5a34eae81mr3398905wmq.147.1661465654695; 
 Thu, 25 Aug 2022 15:14:14 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c284800b003a3561d4f3fsm417572wmb.43.2022.08.25.15.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 01/18] i386: Rework sse_op_table1
Date: Fri, 26 Aug 2022 00:13:54 +0200
Message-Id: <20220825221411.35122-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Paul Brook <paul@nowt.org>

Add a flags field each row in sse_op_table1.

Initially this is only used as a replacement for the magic
SSE_SPECIAL and SSE_DUMMY pointers, the other flags will become relevant
as the rest of the AVX implementation is built out.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-5-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 314 +++++++++++++++++++++---------------
 1 file changed, 185 insertions(+), 129 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..7fec582358 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2788,146 +2788,196 @@ typedef void (*SSEFunc_0_ppi)(TCGv_ptr reg_a, TCGv_ptr reg_b, TCGv_i32 val);
 typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv val);
 
-#define SSE_SPECIAL ((void *)1)
-#define SSE_DUMMY ((void *)2)
+#define SSE_OPF_V0        (1 << 0) /* vex.v must be 1111b (only 2 operands) */
+#define SSE_OPF_CMP       (1 << 1) /* does not write for first operand */
+#define SSE_OPF_BLENDV    (1 << 2) /* blendv* instruction */
+#define SSE_OPF_SPECIAL   (1 << 3) /* magic */
+#define SSE_OPF_3DNOW     (1 << 4) /* 3DNow! instruction */
+#define SSE_OPF_MMX       (1 << 5) /* MMX/integer/AVX2 instruction */
+#define SSE_OPF_SCALAR    (1 << 6) /* Has SSE scalar variants */
+#define SSE_OPF_AVX2      (1 << 7) /* AVX2 instruction */
+#define SSE_OPF_SHUF      (1 << 9) /* pshufx/shufpx */
 
-#define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
-#define SSE_FOP(x) { gen_helper_ ## x ## ps, gen_helper_ ## x ## pd, \
-                     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, }
+#define OP(op, flags, a, b, c, d)       \
+    {flags, {a, b, c, d} }
 
-static const SSEFunc_0_epp sse_op_table1[256][4] = {
+#define MMX_OP(x) OP(op2, SSE_OPF_MMX, \
+        gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm, NULL, NULL)
+
+#define SSE_FOP(name) OP(op2, SSE_OPF_SCALAR, \
+        gen_helper_##name##ps, gen_helper_##name##pd, \
+        gen_helper_##name##ss, gen_helper_##name##sd)
+#define SSE_OP(sname, dname, op, flags) OP(op, flags, \
+        gen_helper_##sname##_xmm, gen_helper_##dname##_xmm, NULL, NULL)
+
+struct SSEOpHelper_table1 {
+    int flags;
+    SSEFunc_0_epp op[4];
+};
+
+#define SSE_3DNOW { SSE_OPF_3DNOW }
+#define SSE_SPECIAL { SSE_OPF_SPECIAL }
+
+static const struct SSEOpHelper_table1 sse_op_table1[256] = {
     /* 3DNow! extensions */
-    [0x0e] = { SSE_DUMMY }, /* femms */
-    [0x0f] = { SSE_DUMMY }, /* pf... */
+    [0x0e] = SSE_SPECIAL, /* femms */
+    [0x0f] = SSE_3DNOW, /* pf... (sse_op_table5) */
     /* pure SSE operations */
-    [0x10] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
-    [0x11] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
-    [0x12] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movlps, movlpd, movsldup, movddup */
-    [0x13] = { SSE_SPECIAL, SSE_SPECIAL },  /* movlps, movlpd */
-    [0x14] = { gen_helper_punpckldq_xmm, gen_helper_punpcklqdq_xmm },
-    [0x15] = { gen_helper_punpckhdq_xmm, gen_helper_punpckhqdq_xmm },
-    [0x16] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },  /* movhps, movhpd, movshdup */
-    [0x17] = { SSE_SPECIAL, SSE_SPECIAL },  /* movhps, movhpd */
+    [0x10] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
+    [0x11] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
+    [0x12] = SSE_SPECIAL, /* movlps, movlpd, movsldup, movddup */
+    [0x13] = SSE_SPECIAL, /* movlps, movlpd */
+    [0x14] = SSE_OP(punpckldq, punpcklqdq, op2, 0), /* unpcklps, unpcklpd */
+    [0x15] = SSE_OP(punpckhdq, punpckhqdq, op2, 0), /* unpckhps, unpckhpd */
+    [0x16] = SSE_SPECIAL, /* movhps, movhpd, movshdup */
+    [0x17] = SSE_SPECIAL, /* movhps, movhpd */
 
-    [0x28] = { SSE_SPECIAL, SSE_SPECIAL },  /* movaps, movapd */
-    [0x29] = { SSE_SPECIAL, SSE_SPECIAL },  /* movaps, movapd */
-    [0x2a] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvtpi2ps, cvtpi2pd, cvtsi2ss, cvtsi2sd */
-    [0x2b] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movntps, movntpd, movntss, movntsd */
-    [0x2c] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
-    [0x2d] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
-    [0x2e] = { gen_helper_ucomiss, gen_helper_ucomisd },
-    [0x2f] = { gen_helper_comiss, gen_helper_comisd },
-    [0x50] = { SSE_SPECIAL, SSE_SPECIAL }, /* movmskps, movmskpd */
-    [0x51] = SSE_FOP(sqrt),
-    [0x52] = { gen_helper_rsqrtps, NULL, gen_helper_rsqrtss, NULL },
-    [0x53] = { gen_helper_rcpps, NULL, gen_helper_rcpss, NULL },
-    [0x54] = { gen_helper_pand_xmm, gen_helper_pand_xmm }, /* andps, andpd */
-    [0x55] = { gen_helper_pandn_xmm, gen_helper_pandn_xmm }, /* andnps, andnpd */
-    [0x56] = { gen_helper_por_xmm, gen_helper_por_xmm }, /* orps, orpd */
-    [0x57] = { gen_helper_pxor_xmm, gen_helper_pxor_xmm }, /* xorps, xorpd */
+    [0x28] = SSE_SPECIAL, /* movaps, movapd */
+    [0x29] = SSE_SPECIAL, /* movaps, movapd */
+    [0x2a] = SSE_SPECIAL, /* cvtpi2ps, cvtpi2pd, cvtsi2ss, cvtsi2sd */
+    [0x2b] = SSE_SPECIAL, /* movntps, movntpd, movntss, movntsd */
+    [0x2c] = SSE_SPECIAL, /* cvttps2pi, cvttpd2pi, cvttsd2si, cvttss2si */
+    [0x2d] = SSE_SPECIAL, /* cvtps2pi, cvtpd2pi, cvtsd2si, cvtss2si */
+    [0x2e] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
+            gen_helper_ucomiss, gen_helper_ucomisd, NULL, NULL),
+    [0x2f] = OP(op1, SSE_OPF_CMP | SSE_OPF_SCALAR | SSE_OPF_V0,
+            gen_helper_comiss, gen_helper_comisd, NULL, NULL),
+    [0x50] = SSE_SPECIAL, /* movmskps, movmskpd */
+    [0x51] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+                gen_helper_sqrtps, gen_helper_sqrtpd,
+                gen_helper_sqrtss, gen_helper_sqrtsd),
+    [0x52] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+                gen_helper_rsqrtps, NULL, gen_helper_rsqrtss, NULL),
+    [0x53] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+                gen_helper_rcpps, NULL, gen_helper_rcpss, NULL),
+    [0x54] = SSE_OP(pand, pand, op2, 0), /* andps, andpd */
+    [0x55] = SSE_OP(pandn, pandn, op2, 0), /* andnps, andnpd */
+    [0x56] = SSE_OP(por, por, op2, 0), /* orps, orpd */
+    [0x57] = SSE_OP(pxor, pxor, op2, 0), /* xorps, xorpd */
     [0x58] = SSE_FOP(add),
     [0x59] = SSE_FOP(mul),
-    [0x5a] = { gen_helper_cvtps2pd, gen_helper_cvtpd2ps,
-               gen_helper_cvtss2sd, gen_helper_cvtsd2ss },
-    [0x5b] = { gen_helper_cvtdq2ps, gen_helper_cvtps2dq, gen_helper_cvttps2dq },
+    [0x5a] = OP(op1, SSE_OPF_SCALAR | SSE_OPF_V0,
+                gen_helper_cvtps2pd, gen_helper_cvtpd2ps,
+                gen_helper_cvtss2sd, gen_helper_cvtsd2ss),
+    [0x5b] = OP(op1, SSE_OPF_V0,
+                gen_helper_cvtdq2ps, gen_helper_cvtps2dq,
+                gen_helper_cvttps2dq, NULL),
     [0x5c] = SSE_FOP(sub),
     [0x5d] = SSE_FOP(min),
     [0x5e] = SSE_FOP(div),
     [0x5f] = SSE_FOP(max),
 
-    [0xc2] = SSE_FOP(cmpeq),
-    [0xc6] = { (SSEFunc_0_epp)gen_helper_shufps,
-               (SSEFunc_0_epp)gen_helper_shufpd }, /* XXX: casts */
+    [0xc2] = SSE_FOP(cmpeq), /* sse_op_table4 */
+    [0xc6] = OP(dummy, SSE_OPF_SHUF, (SSEFunc_0_epp)gen_helper_shufps,
+                (SSEFunc_0_epp)gen_helper_shufpd, NULL, NULL),
 
     /* SSSE3, SSE4, MOVBE, CRC32, BMI1, BMI2, ADX.  */
-    [0x38] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
-    [0x3a] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
+    [0x38] = SSE_SPECIAL,
+    [0x3a] = SSE_SPECIAL,
 
     /* MMX ops and their SSE extensions */
-    [0x60] = MMX_OP2(punpcklbw),
-    [0x61] = MMX_OP2(punpcklwd),
-    [0x62] = MMX_OP2(punpckldq),
-    [0x63] = MMX_OP2(packsswb),
-    [0x64] = MMX_OP2(pcmpgtb),
-    [0x65] = MMX_OP2(pcmpgtw),
-    [0x66] = MMX_OP2(pcmpgtl),
-    [0x67] = MMX_OP2(packuswb),
-    [0x68] = MMX_OP2(punpckhbw),
-    [0x69] = MMX_OP2(punpckhwd),
-    [0x6a] = MMX_OP2(punpckhdq),
-    [0x6b] = MMX_OP2(packssdw),
-    [0x6c] = { NULL, gen_helper_punpcklqdq_xmm },
-    [0x6d] = { NULL, gen_helper_punpckhqdq_xmm },
-    [0x6e] = { SSE_SPECIAL, SSE_SPECIAL }, /* movd mm, ea */
-    [0x6f] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movq, movdqa, , movqdu */
-    [0x70] = { (SSEFunc_0_epp)gen_helper_pshufw_mmx,
-               (SSEFunc_0_epp)gen_helper_pshufd_xmm,
-               (SSEFunc_0_epp)gen_helper_pshufhw_xmm,
-               (SSEFunc_0_epp)gen_helper_pshuflw_xmm }, /* XXX: casts */
-    [0x71] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftw */
-    [0x72] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftd */
-    [0x73] = { SSE_SPECIAL, SSE_SPECIAL }, /* shiftq */
-    [0x74] = MMX_OP2(pcmpeqb),
-    [0x75] = MMX_OP2(pcmpeqw),
-    [0x76] = MMX_OP2(pcmpeql),
-    [0x77] = { SSE_DUMMY }, /* emms */
-    [0x78] = { NULL, SSE_SPECIAL, NULL, SSE_SPECIAL }, /* extrq_i, insertq_i */
-    [0x79] = { NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r },
-    [0x7c] = { NULL, gen_helper_haddpd, NULL, gen_helper_haddps },
-    [0x7d] = { NULL, gen_helper_hsubpd, NULL, gen_helper_hsubps },
-    [0x7e] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movd, movd, , movq */
-    [0x7f] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movq, movdqa, movdqu */
-    [0xc4] = { SSE_SPECIAL, SSE_SPECIAL }, /* pinsrw */
-    [0xc5] = { SSE_SPECIAL, SSE_SPECIAL }, /* pextrw */
-    [0xd0] = { NULL, gen_helper_addsubpd, NULL, gen_helper_addsubps },
-    [0xd1] = MMX_OP2(psrlw),
-    [0xd2] = MMX_OP2(psrld),
-    [0xd3] = MMX_OP2(psrlq),
-    [0xd4] = MMX_OP2(paddq),
-    [0xd5] = MMX_OP2(pmullw),
-    [0xd6] = { NULL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL },
-    [0xd7] = { SSE_SPECIAL, SSE_SPECIAL }, /* pmovmskb */
-    [0xd8] = MMX_OP2(psubusb),
-    [0xd9] = MMX_OP2(psubusw),
-    [0xda] = MMX_OP2(pminub),
-    [0xdb] = MMX_OP2(pand),
-    [0xdc] = MMX_OP2(paddusb),
-    [0xdd] = MMX_OP2(paddusw),
-    [0xde] = MMX_OP2(pmaxub),
-    [0xdf] = MMX_OP2(pandn),
-    [0xe0] = MMX_OP2(pavgb),
-    [0xe1] = MMX_OP2(psraw),
-    [0xe2] = MMX_OP2(psrad),
-    [0xe3] = MMX_OP2(pavgw),
-    [0xe4] = MMX_OP2(pmulhuw),
-    [0xe5] = MMX_OP2(pmulhw),
-    [0xe6] = { NULL, gen_helper_cvttpd2dq, gen_helper_cvtdq2pd, gen_helper_cvtpd2dq },
-    [0xe7] = { SSE_SPECIAL , SSE_SPECIAL },  /* movntq, movntq */
-    [0xe8] = MMX_OP2(psubsb),
-    [0xe9] = MMX_OP2(psubsw),
-    [0xea] = MMX_OP2(pminsw),
-    [0xeb] = MMX_OP2(por),
-    [0xec] = MMX_OP2(paddsb),
-    [0xed] = MMX_OP2(paddsw),
-    [0xee] = MMX_OP2(pmaxsw),
-    [0xef] = MMX_OP2(pxor),
-    [0xf0] = { NULL, NULL, NULL, SSE_SPECIAL }, /* lddqu */
-    [0xf1] = MMX_OP2(psllw),
-    [0xf2] = MMX_OP2(pslld),
-    [0xf3] = MMX_OP2(psllq),
-    [0xf4] = MMX_OP2(pmuludq),
-    [0xf5] = MMX_OP2(pmaddwd),
-    [0xf6] = MMX_OP2(psadbw),
-    [0xf7] = { (SSEFunc_0_epp)gen_helper_maskmov_mmx,
-               (SSEFunc_0_epp)gen_helper_maskmov_xmm }, /* XXX: casts */
-    [0xf8] = MMX_OP2(psubb),
-    [0xf9] = MMX_OP2(psubw),
-    [0xfa] = MMX_OP2(psubl),
-    [0xfb] = MMX_OP2(psubq),
-    [0xfc] = MMX_OP2(paddb),
-    [0xfd] = MMX_OP2(paddw),
-    [0xfe] = MMX_OP2(paddl),
+    [0x60] = MMX_OP(punpcklbw),
+    [0x61] = MMX_OP(punpcklwd),
+    [0x62] = MMX_OP(punpckldq),
+    [0x63] = MMX_OP(packsswb),
+    [0x64] = MMX_OP(pcmpgtb),
+    [0x65] = MMX_OP(pcmpgtw),
+    [0x66] = MMX_OP(pcmpgtl),
+    [0x67] = MMX_OP(packuswb),
+    [0x68] = MMX_OP(punpckhbw),
+    [0x69] = MMX_OP(punpckhwd),
+    [0x6a] = MMX_OP(punpckhdq),
+    [0x6b] = MMX_OP(packssdw),
+    [0x6c] = OP(op2, SSE_OPF_MMX,
+                NULL, gen_helper_punpcklqdq_xmm, NULL, NULL),
+    [0x6d] = OP(op2, SSE_OPF_MMX,
+                NULL, gen_helper_punpckhqdq_xmm, NULL, NULL),
+    [0x6e] = SSE_SPECIAL, /* movd mm, ea */
+    [0x6f] = SSE_SPECIAL, /* movq, movdqa, , movqdu */
+    [0x70] = OP(op1i, SSE_OPF_SHUF | SSE_OPF_MMX | SSE_OPF_V0,
+            (SSEFunc_0_epp)gen_helper_pshufw_mmx,
+            (SSEFunc_0_epp)gen_helper_pshufd_xmm,
+            (SSEFunc_0_epp)gen_helper_pshufhw_xmm,
+            (SSEFunc_0_epp)gen_helper_pshuflw_xmm),
+    [0x71] = SSE_SPECIAL, /* shiftw */
+    [0x72] = SSE_SPECIAL, /* shiftd */
+    [0x73] = SSE_SPECIAL, /* shiftq */
+    [0x74] = MMX_OP(pcmpeqb),
+    [0x75] = MMX_OP(pcmpeqw),
+    [0x76] = MMX_OP(pcmpeql),
+    [0x77] = SSE_SPECIAL, /* emms */
+    [0x78] = SSE_SPECIAL, /* extrq_i, insertq_i (sse4a) */
+    [0x79] = OP(op1, SSE_OPF_V0,
+            NULL, gen_helper_extrq_r, NULL, gen_helper_insertq_r),
+    [0x7c] = OP(op2, 0,
+                NULL, gen_helper_haddpd, NULL, gen_helper_haddps),
+    [0x7d] = OP(op2, 0,
+                NULL, gen_helper_hsubpd, NULL, gen_helper_hsubps),
+    [0x7e] = SSE_SPECIAL, /* movd, movd, , movq */
+    [0x7f] = SSE_SPECIAL, /* movq, movdqa, movdqu */
+    [0xc4] = SSE_SPECIAL, /* pinsrw */
+    [0xc5] = SSE_SPECIAL, /* pextrw */
+    [0xd0] = OP(op2, 0,
+                NULL, gen_helper_addsubpd, NULL, gen_helper_addsubps),
+    [0xd1] = MMX_OP(psrlw),
+    [0xd2] = MMX_OP(psrld),
+    [0xd3] = MMX_OP(psrlq),
+    [0xd4] = MMX_OP(paddq),
+    [0xd5] = MMX_OP(pmullw),
+    [0xd6] = SSE_SPECIAL,
+    [0xd7] = SSE_SPECIAL, /* pmovmskb */
+    [0xd8] = MMX_OP(psubusb),
+    [0xd9] = MMX_OP(psubusw),
+    [0xda] = MMX_OP(pminub),
+    [0xdb] = MMX_OP(pand),
+    [0xdc] = MMX_OP(paddusb),
+    [0xdd] = MMX_OP(paddusw),
+    [0xde] = MMX_OP(pmaxub),
+    [0xdf] = MMX_OP(pandn),
+    [0xe0] = MMX_OP(pavgb),
+    [0xe1] = MMX_OP(psraw),
+    [0xe2] = MMX_OP(psrad),
+    [0xe3] = MMX_OP(pavgw),
+    [0xe4] = MMX_OP(pmulhuw),
+    [0xe5] = MMX_OP(pmulhw),
+    [0xe6] = OP(op1, SSE_OPF_V0,
+            NULL, gen_helper_cvttpd2dq,
+            gen_helper_cvtdq2pd, gen_helper_cvtpd2dq),
+    [0xe7] = SSE_SPECIAL,  /* movntq, movntq */
+    [0xe8] = MMX_OP(psubsb),
+    [0xe9] = MMX_OP(psubsw),
+    [0xea] = MMX_OP(pminsw),
+    [0xeb] = MMX_OP(por),
+    [0xec] = MMX_OP(paddsb),
+    [0xed] = MMX_OP(paddsw),
+    [0xee] = MMX_OP(pmaxsw),
+    [0xef] = MMX_OP(pxor),
+    [0xf0] = SSE_SPECIAL, /* lddqu */
+    [0xf1] = MMX_OP(psllw),
+    [0xf2] = MMX_OP(pslld),
+    [0xf3] = MMX_OP(psllq),
+    [0xf4] = MMX_OP(pmuludq),
+    [0xf5] = MMX_OP(pmaddwd),
+    [0xf6] = MMX_OP(psadbw),
+    [0xf7] = OP(op1t, SSE_OPF_MMX | SSE_OPF_V0,
+                (SSEFunc_0_epp)gen_helper_maskmov_mmx,
+                (SSEFunc_0_epp)gen_helper_maskmov_xmm, NULL, NULL),
+    [0xf8] = MMX_OP(psubb),
+    [0xf9] = MMX_OP(psubw),
+    [0xfa] = MMX_OP(psubl),
+    [0xfb] = MMX_OP(psubq),
+    [0xfc] = MMX_OP(paddb),
+    [0xfd] = MMX_OP(paddw),
+    [0xfe] = MMX_OP(paddl),
 };
+#undef MMX_OP
+#undef OP
+#undef SSE_FOP
+#undef SSE_OP
+#undef SSE_SPECIAL
+
+#define MMX_OP2(x) { gen_helper_ ## x ## _mmx, gen_helper_ ## x ## _xmm }
+#define SSE_SPECIAL_FN ((void *)1)
 
 static const SSEFunc_0_epp sse_op_table2[3 * 8][2] = {
     [0 + 2] = MMX_OP2(psrlw),
@@ -2970,6 +3020,8 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 };
 #endif
 
+#define SSE_FOP(x) { gen_helper_ ## x ## ps, gen_helper_ ## x ## pd, \
+                     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd, }
 static const SSEFunc_0_epp sse_op_table4[8][4] = {
     SSE_FOP(cmpeq),
     SSE_FOP(cmplt),
@@ -2980,6 +3032,7 @@ static const SSEFudefine SSE42_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_SSE42 }
-#define SSE41_SPECIAL { { NULL, SSE_SPECIAL }, CPUID_EXT_SSE41 }
+#define SSE41_SPECIAL { { NULL, SSE_SPECIAL_FN }, CPUID_EXT_SSE41 }
 #define PCLMULQDQ_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, \
         CPUID_EXT_PCLMULQDQ }
 #define AESNI_OP(x) { { NULL, gen_helper_ ## x ## _xmm }, CPUID_EXT_AES }
@@ -3112,6 +3165,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 {
     int b1, op1_offset, op2_offset, is_xmm, val;
     int modrm, mod, rm, reg;
+    struct SSEOpHelper_table1 sse_op;
     SSEFunc_0_epp sse_fn_epp;
     SSEFunc_0_eppi sse_fn_eppi;
     SSEFunc_0_ppi sse_fn_ppi;
@@ -3127,8 +3181,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         b1 = 3;
     else
         b1 = 0;
-    sse_fn_epp = sse_op_table1[b][b1];
-    if (!sse_fn_epp) {
+    sse_op = sse_op_table1[b];
+    sse_fn_epp = sse_op.op[b1];
+    if ((sse_op.flags & (SSE_OPF_SPECIAL | SSE_OPF_3DNOW)) == 0
+            && !sse_fn_epp) {
         goto unknown_op;
     }
     if ((b <= 0x5f && b >= 0x10) || b == 0xc6 || b == 0xc2) {
@@ -3182,7 +3238,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         reg |= REX_R(s);
     }
     mod = (modrm >> 6) & 3;
-    if (sse_fn_epp == SSE_SPECIAL) {
+    if (sse_op.flags & SSE_OPF_SPECIAL) {
         b |= (b1 << 8);
         switch(b) {
         case 0x0e7: /* movntq */
@@ -3823,7 +3879,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     gen_ldq_env_A0(s, op2_offset);
                 }
             }
-            if (sse_fn_epp == SSE_SPECIAL) {
+            if (sse_fn_epp == SSE_SPECIAL_FN) {
                 goto unknown_op;
             }
 
@@ -4209,7 +4265,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
 
             s->rip_offset = 1;
 
-            if (sse_fn_eppi == SSE_SPECIAL) {
+            if (sse_fn_eppi == SSE_SPECIAL_FN) {
                 ot = mo_64_32(s->dflag);
                 rm = (modrm & 7) | REX_B(s);
                 if (mod != 3)
-- 
2.37.1



