Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFAE4FBFFD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:13:03 +0200 (CEST)
Received: from localhost ([::1]:56498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndviw-0004K1-3u
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ndvSm-0004vT-6E
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:56:20 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ndvSj-0000KI-PU
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 10:56:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id g18so6490714ejc.10
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yPC/gOBbwwkkj0weImJlOxaU85E9fvrO7WnUDzF2s2s=;
 b=PSFN21SXyOPMuRwpim0eg+bhbT6NGO00oTz3ZD5G1lAuefNvTx6XmHr8wgbZtJp37Q
 lMknYOewhN6TMaZcxNEyGSwP3pFQLdyZhMjk+GI9CKC4vDGrIbx2kiP1eGmZrJQWdDsE
 mGeZv3LlvLM8EwOlJFc5D8Kw2tlghTzU7ZcW5p7e8uyprbTK9GgJLDaTOGElRbHj3zMV
 0G7c7Bo4SWokkGmps/SjYmnImZKIgpA2+LBm9hUoBkzQg2Qf56jmsHmB9/rGi7WQKKYH
 1aIqXt/MtHm82R80iAV3r27C4f6z8+vcChxURcrJ4CqaTibIVNQsNytJqTusZ1m8Gg/d
 BA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yPC/gOBbwwkkj0weImJlOxaU85E9fvrO7WnUDzF2s2s=;
 b=wzFK3HYCNNFAjV8G8tWW0sqazXlq0ad93rf8hIMzWOFiaoPW/B8IRih7BoQclMU6HC
 jMki3r7+q9rgCHbX5eryrSSI+aPWKeEA42CmkmgLkqR3dLY8pqKM5+DbEaS/2kl5j3vV
 TdrHcQlPGiO85lxy4NoRRDHhTHJuFGaEYBQwjJ3Q6yFByCCorK66fjW6yQvUZ8AylcAJ
 eSZHSaGdFZcCTYGlE4Pls+fS+Wd0AK+Inm4b/F2nE5/IYJ0qFpcqEOW6ChE1Y0soi66F
 30/stCSXgAUueNHNoUAtvbmjKolei0VBWl16jAII98h8zMA8ghCLs7uZJkyuS5NIX5rU
 fHLA==
X-Gm-Message-State: AOAM533kOCOjZg0C4vvdZNLTKS2Omnig8WIxsdZq4lHv1QIrx/3am4rA
 LU68rv6T+uZQFaulvs0/OLp/6g==
X-Google-Smtp-Source: ABdhPJxvvE8nhqsaTAC0hnA70cLf/VVUYMUpCNROO3bFUafxyNIaPBlbmu2rEEsfe2myKuFknCxDkA==
X-Received: by 2002:a17:906:301a:b0:6e8:a0b2:340a with SMTP id
 26-20020a170906301a00b006e8a0b2340amr1810885ejz.248.1649688975713; 
 Mon, 11 Apr 2022 07:56:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a50c905000000b0041d828d0c58sm1160473edh.53.2022.04.11.07.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 07:56:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 443831FFB7;
 Mon, 11 Apr 2022 15:56:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/i386: avoid copying junk to extended ZMMReg fields
Date: Mon, 11 Apr 2022 15:56:09 +0100
Message-Id: <20220411145609.3932882-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When change b7711471f5 was made to alias XMMReg to ZMMReg for the
purposes of easing the handling of AVX512 registers we unwittingly
broke the SSE helpers which construct a temporary value on the stack
before copying them out. To avoid this lets encode REG_WIDTH based on
shift and convert the pointer indirection with an explicit memcpy.

An incomplete sampling of the affected instructions seems to indicate
the default behaviour for legacy SSE is "the upper bits (MAXVL-1:128)
of the corresponding YMM register destination are unmodified."

Fixes: b7711471f5 ("target-i386: make xmm_regs 512-bit wide")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/420
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/i386/ops_sse.h | 71 ++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 31 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 6f1fc174b3..adfb498a71 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -28,6 +28,7 @@
 #define L(n) MMX_L(n)
 #define Q(n) MMX_Q(n)
 #define SUFFIX _mmx
+#define REG_WIDTH 8
 #else
 #define Reg ZMMReg
 #define XMM_ONLY(...) __VA_ARGS__
@@ -36,6 +37,7 @@
 #define L(n) ZMM_L(n)
 #define Q(n) ZMM_Q(n)
 #define SUFFIX _xmm
+#define REG_WIDTH 16
 #endif
 
 void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -516,7 +518,7 @@ void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
     r.W(1) = s->W((order >> 2) & 3);
     r.W(2) = s->W((order >> 4) & 3);
     r.W(3) = s->W((order >> 6) & 3);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 #else
 void helper_shufps(Reg *d, Reg *s, int order)
@@ -527,7 +529,7 @@ void helper_shufps(Reg *d, Reg *s, int order)
     r.L(1) = d->L((order >> 2) & 3);
     r.L(2) = s->L((order >> 4) & 3);
     r.L(3) = s->L((order >> 6) & 3);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void helper_shufpd(Reg *d, Reg *s, int order)
@@ -536,7 +538,7 @@ void helper_shufpd(Reg *d, Reg *s, int order)
 
     r.Q(0) = d->Q(order & 1);
     r.Q(1) = s->Q((order >> 1) & 1);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_pshufd, SUFFIX)(Reg *d, Reg *s, int order)
@@ -547,7 +549,7 @@ void glue(helper_pshufd, SUFFIX)(Reg *d, Reg *s, int order)
     r.L(1) = s->L((order >> 2) & 3);
     r.L(2) = s->L((order >> 4) & 3);
     r.L(3) = s->L((order >> 6) & 3);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_pshuflw, SUFFIX)(Reg *d, Reg *s, int order)
@@ -559,7 +561,7 @@ void glue(helper_pshuflw, SUFFIX)(Reg *d, Reg *s, int order)
     r.W(2) = s->W((order >> 4) & 3);
     r.W(3) = s->W((order >> 6) & 3);
     r.Q(1) = s->Q(1);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
@@ -571,7 +573,7 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
     r.W(5) = s->W(4 + ((order >> 2) & 3));
     r.W(6) = s->W(4 + ((order >> 4) & 3));
     r.W(7) = s->W(4 + ((order >> 6) & 3));
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 #endif
 
@@ -937,7 +939,7 @@ void helper_haddps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     r.ZMM_S(1) = float32_add(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
     r.ZMM_S(2) = float32_add(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
     r.ZMM_S(3) = float32_add(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
@@ -946,7 +948,7 @@ void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 
     r.ZMM_D(0) = float64_add(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
     r.ZMM_D(1) = float64_add(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
@@ -957,7 +959,7 @@ void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     r.ZMM_S(1) = float32_sub(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
     r.ZMM_S(2) = float32_sub(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
     r.ZMM_S(3) = float32_sub(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
@@ -966,7 +968,7 @@ void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 
     r.ZMM_D(0) = float64_sub(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
     r.ZMM_D(1) = float64_sub(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void helper_addsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
@@ -1153,7 +1155,7 @@ void glue(helper_packsswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.B(14) = satsb((int16_t)s->W(6));
     r.B(15) = satsb((int16_t)s->W(7));
 #endif
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_packuswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1180,7 +1182,7 @@ void glue(helper_packuswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.B(14) = satub((int16_t)s->W(6));
     r.B(15) = satub((int16_t)s->W(7));
 #endif
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1199,7 +1201,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.W(6) = satsw(s->L(2));
     r.W(7) = satsw(s->L(3));
 #endif
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 #define UNPCK_OP(base_name, base)                                       \
@@ -1226,8 +1228,8 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                  r.B(13) = s->B((base << (SHIFT + 2)) + 6);             \
                  r.B(14) = d->B((base << (SHIFT + 2)) + 7);             \
                  r.B(15) = s->B((base << (SHIFT + 2)) + 7);             \
-                                                                      ) \
-            *d = r;                                                     \
+            )                                                           \
+            memcpy(d, &r, REG_WIDTH);                                  \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## wd, SUFFIX)(CPUX86State *env,\
@@ -1245,7 +1247,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                  r.W(6) = d->W((base << (SHIFT + 1)) + 3);              \
                  r.W(7) = s->W((base << (SHIFT + 1)) + 3);              \
                                                                       ) \
-            *d = r;                                                     \
+            memcpy(d, &r, REG_WIDTH);                                  \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
@@ -1259,7 +1261,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                  r.L(2) = d->L((base << SHIFT) + 1);                    \
                  r.L(3) = s->L((base << SHIFT) + 1);                    \
                                                                       ) \
-            *d = r;                                                     \
+            memcpy(d, &r, REG_WIDTH);                                  \
     }                                                                   \
                                                                         \
     XMM_ONLY(                                                           \
@@ -1272,7 +1274,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                                                                         \
                  r.Q(0) = d->Q(base);                                   \
                  r.Q(1) = s->Q(base);                                   \
-                 *d = r;                                                \
+                 memcpy(d, &r, REG_WIDTH);                             \
              }                                                          \
                                                                         )
 
@@ -1313,7 +1315,7 @@ void helper_pfacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 
     r.MMX_S(0) = float32_add(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
     r.MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void helper_pfadd(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1378,7 +1380,7 @@ void helper_pfnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 
     r.MMX_S(0) = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
     r.MMX_S(1) = float32_sub(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void helper_pfpnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1387,7 +1389,7 @@ void helper_pfpnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 
     r.MMX_S(0) = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
     r.MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void helper_pfrcp(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1424,21 +1426,27 @@ void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 
     r.MMX_L(0) = s->MMX_L(1);
     r.MMX_L(1) = s->MMX_L(0);
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 #endif
 
 /* SSSE3 op helpers */
 void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
+    const uint8_t scm_mask = REG_WIDTH - 1;
     int i;
     Reg r;
 
-    for (i = 0; i < (8 << SHIFT); i++) {
-        r.B(i) = (s->B(i) & 0x80) ? 0 : (d->B(s->B(i) & ((8 << SHIFT) - 1)));
+    for (i = 0; i < REG_WIDTH; i++) {
+        uint8_t scm = s->B(i); /* shuffle control mask */
+        if (scm & 0x80) {
+            r.B(i) = 0;
+        } else {
+            r.B(i) = d->B(scm & scm_mask);
+        }
     }
 
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_phaddw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1455,7 +1463,7 @@ void glue(helper_phaddw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     XMM_ONLY(r.W(6) = (int16_t)s->W(4) + (int16_t)s->W(5));
     XMM_ONLY(r.W(7) = (int16_t)s->W(6) + (int16_t)s->W(7));
 
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1467,7 +1475,7 @@ void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.L((1 << SHIFT) + 0) = (int32_t)s->L(0) + (int32_t)s->L(1);
     XMM_ONLY(r.L(3) = (int32_t)s->L(2) + (int32_t)s->L(3));
 
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_phaddsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1483,7 +1491,7 @@ void glue(helper_phaddsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     XMM_ONLY(r.W(6) = satsw((int16_t)s->W(4) + (int16_t)s->W(5)));
     XMM_ONLY(r.W(7) = satsw((int16_t)s->W(6) + (int16_t)s->W(7)));
 
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1585,7 +1593,7 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #undef SHR
     }
 
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 #define XMM0 (env->xmm_regs[0])
@@ -1718,7 +1726,7 @@ void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.W(5) = satuw((int32_t) s->L(1));
     r.W(6) = satuw((int32_t) s->L(2));
     r.W(7) = satuw((int32_t) s->L(3));
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 #define FMINSB(d, s) MIN((int8_t)d, (int8_t)s)
@@ -1984,7 +1992,7 @@ void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         r.W(i) += abs1(d->B(d0 + 3) - s->B(s0 + 3));
     }
 
-    *d = r;
+    memcpy(d, &r, REG_WIDTH);
 }
 
 /* SSE4.2 op helpers */
@@ -2324,3 +2332,4 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #undef L
 #undef Q
 #undef SUFFIX
+#undef REG_WIDTH
-- 
2.30.2


