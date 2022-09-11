Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40D5B51DA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:22:28 +0200 (CEST)
Received: from localhost ([::1]:44800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWHT-0007yo-UH
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0m-0000kg-Bf
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0k-0007D8-5X
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMtUDiV1+ffhKLN6thVrdMzy6J2M1GpEPn/VYO3Snmo=;
 b=EgcqRUmgDBdg/94mwVvLjGqnkk0OseqqvctFyFG/Jhf2KDtA7gD5C18EqlaImEY3W61sk4
 gYtdcOepvvwSR6A4k5M0UQ8JzfGsFP9Df9xjj16EewpaqnJt8H1WNYgoafjPSNXgscwbAW
 yUnc1bDTfmWG6D7NA6hlyQZ7XOIg8Ow=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-C-68IwNMOA-Ygm5EyEOe7Q-1; Sun, 11 Sep 2022 19:05:07 -0400
X-MC-Unique: C-68IwNMOA-Ygm5EyEOe7Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 ga37-20020a1709070c2500b0077dbc748733so67917ejc.17
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bMtUDiV1+ffhKLN6thVrdMzy6J2M1GpEPn/VYO3Snmo=;
 b=lXoLzqzM0jBTzlqAq2SU8blo78hBZJS1k0/ABDuetUtw/qn/9vXiMQNpiEu6JIX6Ng
 23hr3yiAV8ahLHxyQFW0+YGnAGQ4ZyjW6cE7kf3yRnJYXsJ9fU12f8DhNcJvFvS0eg+t
 y1QrrQEfakC2AOI2xHjBQ1eGQQrCbwOGWen8lNCdKRpFrg4cEvtqM0BkjkL7ZbNBcV7m
 xnC0Ua7nyvXyi8dS+6PaKDXHF2othiEA/rEgrqaqa/qhAakGfcaIIkZBNxT/Y2/gLKPb
 cCD2FK31aeZNEF5mxXy3HDNlyirgQC9iBcZiNnlykceH+QMhAolJ39hh2grR+XVOujQ0
 dwQA==
X-Gm-Message-State: ACgBeo2VT0gojDFE/oMESHvk2IKFX7o6v5NOqnWIZlMHFM/rpyLbbHvu
 +wFrAKiA+mfXu2uqcgGwytuiRLXm0GWlUqudwTdh0tkgWI5MUy0ccKqOQS689FKW/zC9GdiLxtr
 2PPhcXefQpMNuT6L1nGx2uT9N3iyQl/PL7dcvPkYcgppETozMvKxw95g5q/QnoxzDK+Y=
X-Received: by 2002:a17:907:802:b0:73d:c710:943e with SMTP id
 wv2-20020a170907080200b0073dc710943emr16671233ejb.214.1662937505644; 
 Sun, 11 Sep 2022 16:05:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6cUvrG8AQzCkng+i9yqy2RP23+eFj12dzN0v4qMPXEGcQ8QTePMtebOaBYsg8wBAEcFBvBXg==
X-Received: by 2002:a17:907:802:b0:73d:c710:943e with SMTP id
 wv2-20020a170907080200b0073dc710943emr16671217ejb.214.1662937505323; 
 Sun, 11 Sep 2022 16:05:05 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 t11-20020aa7d4cb000000b0044e8774914esm4730319edr.35.2022.09.11.16.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>
Subject: [PATCH 14/37] target/i386: Prepare ops_sse_header.h for 256 bit AVX
Date: Mon, 12 Sep 2022 01:03:54 +0200
Message-Id: <20220911230418.340941-15-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Adjust all #ifdefs to match the ones in ops_sse.h.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-23-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse_header.h | 114 +++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 39 deletions(-)

diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index d99464afb0..7f57dab496 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -43,7 +43,7 @@ DEF_HELPER_3(glue(pslld, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(psrlq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(psllq, SUFFIX), void, env, Reg, Reg)
 
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(psrldq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pslldq, SUFFIX), void, env, Reg, Reg)
 #endif
@@ -101,7 +101,7 @@ SSE_HELPER_L(pcmpeql, FCMPEQ)
 
 SSE_HELPER_W(pmullw, FMULLW)
 #if SHIFT == 0
-SSE_HELPER_W(pmulhrw, FMULHRW)
+DEF_HELPER_3(glue(pmulhrw, SUFFIX), void, env, Reg, Reg)
 #endif
 SSE_HELPER_W(pmulhuw, FMULHUW)
 SSE_HELPER_W(pmulhw, FMULHW)
@@ -113,7 +113,9 @@ DEF_HELPER_3(glue(pmuludq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmaddwd, SUFFIX), void, env, Reg, Reg)
 
 DEF_HELPER_3(glue(psadbw, SUFFIX), void, env, Reg, Reg)
+#if SHIFT < 2
 DEF_HELPER_4(glue(maskmov, SUFFIX), void, env, Reg, Reg, tl)
+#endif
 DEF_HELPER_2(glue(movl_mm_T0, SUFFIX), void, Reg, i32)
 #ifdef TARGET_X86_64
 DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
@@ -122,38 +124,63 @@ DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
 #if SHIFT == 0
 DEF_HELPER_3(glue(pshufw, SUFFIX), void, Reg, Reg, int)
 #else
-DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
-DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshuflw, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 #endif
 
-#if SHIFT == 1
+#if SHIFT >= 1
 /* FPU ops */
 /* XXX: not accurate */
 
-#define SSE_HELPER_S(name, F)                            \
-    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)        \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)        \
-    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)        \
+#define SSE_HELPER_P4(name)                                             \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)
+
+#define SSE_HELPER_P3(name, ...)                                        \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)
+
+#if SHIFT == 1
+#define SSE_HELPER_S4(name)                                             \
+    SSE_HELPER_P4(name)                                                 \
+    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
     DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+#define SSE_HELPER_S3(name)                                             \
+    SSE_HELPER_P3(name)                                                 \
+    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
+    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+#else
+#define SSE_HELPER_S4(name, ...) SSE_HELPER_P4(name)
+#define SSE_HELPER_S3(name, ...) SSE_HELPER_P3(name)
+#endif
 
-SSE_HELPER_S(add, FPU_ADD)
-SSE_HELPER_S(sub, FPU_SUB)
-SSE_HELPER_S(mul, FPU_MUL)
-SSE_HELPER_S(div, FPU_DIV)
-SSE_HELPER_S(min, FPU_MIN)
-SSE_HELPER_S(max, FPU_MAX)
-SSE_HELPER_S(sqrt, FPU_SQRT)
+DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
+DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
 
+SSE_HELPER_S4(add)
+SSE_HELPER_S4(sub)
+SSE_HELPER_S4(mul)
+SSE_HELPER_S4(div)
+SSE_HELPER_S4(min)
+SSE_HELPER_S4(max)
+
+SSE_HELPER_S3(sqrt)
 
 DEF_HELPER_3(glue(cvtps2pd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(cvtpd2ps, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(cvtss2sd, void, env, Reg, Reg)
-DEF_HELPER_3(cvtsd2ss, void, env, Reg, Reg)
 DEF_HELPER_3(glue(cvtdq2ps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(cvtdq2pd, SUFFIX), void, env, Reg, Reg)
+
+DEF_HELPER_3(glue(cvtps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvtpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+
+DEF_HELPER_3(glue(cvttps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvttpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+
+#if SHIFT == 1
+DEF_HELPER_3(cvtss2sd, void, env, Reg, Reg)
+DEF_HELPER_3(cvtsd2ss, void, env, Reg, Reg)
 DEF_HELPER_3(cvtpi2ps, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtpi2pd, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtsi2ss, void, env, ZMMReg, i32)
@@ -164,8 +191,6 @@ DEF_HELPER_3(cvtsq2ss, void, env, ZMMReg, i64)
 DEF_HELPER_3(cvtsq2sd, void, env, ZMMReg, i64)
 #endif
 
-DEF_HELPER_3(glue(cvtps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(cvtpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvtps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvtpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvtss2si, s32, env, ZMMReg)
@@ -175,8 +200,6 @@ DEF_HELPER_2(cvtss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvtsd2sq, s64, env, ZMMReg)
 #endif
 
-DEF_HELPER_3(glue(cvttps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(cvttpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvttps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvttpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvttss2si, s32, env, ZMMReg)
@@ -185,27 +208,24 @@ DEF_HELPER_2(cvttsd2si, s32, env, ZMMReg)
 DEF_HELPER_2(cvttss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvttsd2sq, s64, env, ZMMReg)
 #endif
+#endif
 
 DEF_HELPER_3(glue(rsqrtps, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(rcpps, SUFFIX), void, env, ZMMReg, ZMMReg)
+#if SHIFT == 1
+DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(extrq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(insertq_i, void, env, ZMMReg, int, int)
-DEF_HELPER_3(glue(haddps, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(haddpd, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(hsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(hsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(addsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(addsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
+#endif
 
-#define SSE_HELPER_CMP(name, F, C)                              \
-    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)               \
-    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg) \
-    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+SSE_HELPER_P4(hadd)
+SSE_HELPER_P4(hsub)
+SSE_HELPER_P4(addsub)
+
+#define SSE_HELPER_CMP(name, F, C) SSE_HELPER_S4(name)
 
 SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
 SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
@@ -216,10 +236,13 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
 SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
+#if SHIFT == 1
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
 DEF_HELPER_3(ucomisd, void, env, Reg, Reg)
 DEF_HELPER_3(comisd, void, env, Reg, Reg)
+#endif
+
 DEF_HELPER_2(glue(movmskps, SUFFIX), i32, env, Reg)
 DEF_HELPER_2(glue(movmskpd, SUFFIX), i32, env, Reg)
 #endif
@@ -236,7 +259,7 @@ DEF_HELPER_3(glue(packssdw, SUFFIX), void, env, Reg, Reg)
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg)
 #endif
@@ -283,7 +306,7 @@ DEF_HELPER_3(glue(psignd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(palignr, SUFFIX), void, env, Reg, Reg, s32)
 
 /* SSE4.1 op helpers */
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(pblendvb, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(blendvps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(blendvpd, SUFFIX), void, env, Reg, Reg)
@@ -312,22 +335,30 @@ DEF_HELPER_3(glue(pmaxsd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmaxuw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmaxud, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmulld, SUFFIX), void, env, Reg, Reg)
+#if SHIFT == 1
 DEF_HELPER_3(glue(phminposuw, SUFFIX), void, env, Reg, Reg)
+#endif
 DEF_HELPER_4(glue(roundps, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(roundpd, SUFFIX), void, env, Reg, Reg, i32)
+#if SHIFT == 1
 DEF_HELPER_4(glue(roundss, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(roundsd, SUFFIX), void, env, Reg, Reg, i32)
+#endif
 DEF_HELPER_4(glue(blendps, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(blendpd, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pblendw, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(dpps, SUFFIX), void, env, Reg, Reg, i32)
+#if SHIFT == 1
 DEF_HELPER_4(glue(dppd, SUFFIX), void, env, Reg, Reg, i32)
+#endif
 DEF_HELPER_4(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, i32)
 #endif
 
 /* SSE4.2 op helpers */
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg)
+#endif
+#if SHIFT == 1
 DEF_HELPER_4(glue(pcmpestri, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpestrm, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpistri, SUFFIX), void, env, Reg, Reg, i32)
@@ -336,13 +367,15 @@ DEF_HELPER_3(crc32, tl, i32, tl, i32)
 #endif
 
 /* AES-NI op helpers */
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(aesdec, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(aesdeclast, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(aesenc, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(aesenclast, SUFFIX), void, env, Reg, Reg)
+#if SHIFT == 1
 DEF_HELPER_3(glue(aesimc, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
+#endif
 DEF_HELPER_4(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, i32)
 #endif
 
@@ -354,6 +387,9 @@ DEF_HELPER_4(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, i32)
 #undef SSE_HELPER_W
 #undef SSE_HELPER_L
 #undef SSE_HELPER_Q
-#undef SSE_HELPER_S
+#undef SSE_HELPER_S3
+#undef SSE_HELPER_S4
+#undef SSE_HELPER_P3
+#undef SSE_HELPER_P4
 #undef SSE_HELPER_CMP
 #undef UNPCK_OP
-- 
2.37.2



