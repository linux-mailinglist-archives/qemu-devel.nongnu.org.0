Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0290602E14
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:14:13 +0200 (CEST)
Received: from localhost ([::1]:37556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknMC-0000pd-F0
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004RQ-3e
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhl-0005Fh-KK
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uc7wD+lI3WJ/B3hYnqHB7VyRq1+TbEhatASAzR8zQNI=;
 b=beWAmG+6cbNcJ5aP6LL/ZQJIJmcLHaX2/6Rssp2sVYaxf4lPHE9FqBBkS0vzx5JPyb7vfK
 wJWuoRnN11g17+MrUGU+ymY63PD8l/9n0nHc+/1P8oV9ApfHx1yyxzujOrZyHsTVggZKNb
 S4YZib9kO0YWK6k/DCrivDCwrCun/Z4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-PytP3j7DOLqpTT5A-qtUjw-1; Tue, 18 Oct 2022 09:32:23 -0400
X-MC-Unique: PytP3j7DOLqpTT5A-qtUjw-1
Received: by mail-ed1-f71.google.com with SMTP id
 h13-20020a056402280d00b0045cb282161cso11714779ede.8
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uc7wD+lI3WJ/B3hYnqHB7VyRq1+TbEhatASAzR8zQNI=;
 b=AjUiKoFrUwyINWevklT7TnYEQi3fDhLTgV7ivlTSTcQCQVn1ZultJJWBqDDZz8lmgt
 2bw0kEc6c9cAL207kHlOJJtfzw+AFLc/UqBqJlVtPwRC1vVXrngh9yywxpvZnli2+KKy
 kKJqcqUq/GJu742/sXEYf8KgqAI7z3KsBPmXuNqOsAE15GoC541xcQ/SMg/sZnPkudhX
 DFrs6QghbyLB6j/2cx+/FAimzDiA8bw9O2sXGSHgQVkVKRTsjSTSbdr8vthKj8Rlk532
 sw1JQLnRI4ttCTaqjZ5VkMyLuDVuFEaIvHoGifKFwvMiyfe/FXKNFkV+6RfZSTi/q/15
 F5Cg==
X-Gm-Message-State: ACrzQf2oBtt9PWx7F0uITRfdrSk/+pb799V4cEp+lB2qSztUayy2TJH/
 THShMhl1YT3irvHXt0O+vlZezrSBR7DFtnSI3XVZJTyzXMyVJYV3gBX29K8O1ykqrutyewpJLdB
 IrguwOBqJFpwiQc1uMrWJodW3pmPFhgBc6ibd+Awxzbjidu8myr2OKCkxn/ImmH4BMYU=
X-Received: by 2002:a17:907:1dde:b0:78d:9725:cc69 with SMTP id
 og30-20020a1709071dde00b0078d9725cc69mr2491426ejc.305.1666099941602; 
 Tue, 18 Oct 2022 06:32:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5iDDgzeuXx4AFj5Pf6UrDmI6wafzCrUASx7D35C45sRcS2AYx/AjsR1eRFUih30t2Rj0FFMg==
X-Received: by 2002:a17:907:1dde:b0:78d:9725:cc69 with SMTP id
 og30-20020a1709071dde00b0078d9725cc69mr2491403ejc.305.1666099941277; 
 Tue, 18 Oct 2022 06:32:21 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa7df15000000b0045c76120e61sm8889615edy.54.2022.10.18.06.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 29/53] target/i386: Prepare ops_sse_header.h for 256 bit AVX
Date: Tue, 18 Oct 2022 15:30:18 +0200
Message-Id: <20221018133042.856368-30-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Adjust all #ifdefs to match the ones in ops_sse.h.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-23-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse_header.h | 114 +++++++++++++++++++++++------------
 1 file changed, 75 insertions(+), 39 deletions(-)

diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 400b24c091..9d9a115df4 100644
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
 DEF_HELPER_5(insertq_i, void, env, ZMMReg, ZMMReg, int, int)
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
2.37.3


