Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4F87CB7D
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 20:08:00 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hst15-0005Pw-8e
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 14:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42967)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hssrM-0002e9-2c
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hssrK-000339-Tl
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:56 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:43843)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hssrK-000322-PQ
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:54 -0400
Received: by mail-yb1-xb41.google.com with SMTP id y123so21711842yby.10
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46sUYgeGntAE/jMTF6+vkugERws++s4JtY9D7A29bq0=;
 b=D37uY7oxeeDybj3NRVcMwIIi0BXJK/THpWyo8nzud5a8ljUcHginSLc9mG7f8r87Gh
 glAfmEh8BnuFiowoKyXQ5S06fUL1nJDYYLugPm0XVlrW6Nvf8u1cUi1HXs9DCd0z7Ekf
 zR3T1cOCX00cNMUoe21POASK+8Grlzd/tZkV7XWFgybOce3SB97g4+2SbZsGvfSi9KD7
 mIr3U3qpWM9NOQn90FqFkM6WYgTf37qdnVjg7JjHl3WGmJ/2SLcFOnD/QrNR7GOIi12Z
 LfB1qXu00BO2jKOeJ9Ry7TZqRb75WBHkj0f1IGjz/J4bGnaHsHj58UH+bH1cBOkRN75d
 pcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46sUYgeGntAE/jMTF6+vkugERws++s4JtY9D7A29bq0=;
 b=f65dXpGEQ5YuArol1Ih226RpKr8L8/fgw3MAzUXD+CcqnUNsh8XVVklhDr4D+4Q2Kw
 Ly9xWzMp1uxvmXb4SxSOq9pPJOeuP5EfudbuwDi3369Jzw7rnJq4q2gTzLGq2Xo0x30I
 yeYzxrI+JSd/kRkZTLEZzND+4lrrUmVvT40Xpy/BtgNyQ1xTN+uOnHJlCrVk/Sxtb956
 ySJ1CHcyJgKQJP9wcA8GimsS/3XoFRyox5cGY1AH9T3XCzmO4BgGc19YRb9IsPTGbFUm
 K0rnw+C6CsPJQSiSq+Y2w65sdsXJHisgMbP1EXAXDPY+8YOV7GJ8hzGQkRTj5EowbHgj
 jFkA==
X-Gm-Message-State: APjAAAX+pCGXLVSHqs7TAE3/PJSfHzxfpiGmDUIRcLlLHhBV/jik1f+Y
 PtY5LGcwXduQYfmp+obj7bK16fZA
X-Google-Smtp-Source: APXvYqzg0JjrnQLuBWtxwrTgh+kDDBNGzcm6a3HbBkLJBUpedePZ0Cq5kVbTw+oQ3Zzlc2A60hjUKQ==
X-Received: by 2002:a5b:b41:: with SMTP id b1mr72272206ybr.277.1564595874164; 
 Wed, 31 Jul 2019 10:57:54 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id 206sm16077696ywk.44.2019.07.31.10.57.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:57:53 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 13:57:00 -0400
Message-Id: <20190731175702.4916-21-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175702.4916-1-jan.bobek@gmail.com>
References: <20190731175702.4916-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: [Qemu-devel] [RFC PATCH v1 20/22] target/i386: reimplement (V)PMAXSW
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jan Bobek <jan.bobek@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the gvec infrastructure to achieve the desired functionality.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/ops_sse.h        |  3 ---
 target/i386/ops_sse_header.h |  2 --
 target/i386/translate.c      | 12 +++++++++++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 058ed5cdfc..92d0544474 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -338,7 +338,6 @@ static inline int satsw(int x)
 }
 
 #define FMAXUB(a, b) ((a) > (b)) ? (a) : (b)
-#define FMAXSW(a, b) ((int16_t)(a) > (int16_t)(b)) ? (a) : (b)
 
 #define FCMPGTB(a, b) ((int8_t)(a) > (int8_t)(b) ? -1 : 0)
 #define FCMPGTW(a, b) ((int16_t)(a) > (int16_t)(b) ? -1 : 0)
@@ -355,8 +354,6 @@ static inline int satsw(int x)
 
 SSE_HELPER_B(helper_pmaxub, FMAXUB)
 
-SSE_HELPER_W(helper_pmaxsw, FMAXSW)
-
 SSE_HELPER_B(helper_pcmpgtb, FCMPGTB)
 SSE_HELPER_W(helper_pcmpgtw, FCMPGTW)
 SSE_HELPER_L(helper_pcmpgtl, FCMPGTL)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 3d0e321230..bf38738783 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -62,8 +62,6 @@ DEF_HELPER_3(glue(pslldq, SUFFIX), void, env, Reg, Reg)
 
 SSE_HELPER_B(pmaxub, FMAXUB)
 
-SSE_HELPER_W(pmaxsw, FMAXSW)
-
 SSE_HELPER_B(pcmpgtb, FCMPGTB)
 SSE_HELPER_W(pcmpgtw, FCMPGTW)
 SSE_HELPER_L(pcmpgtl, FCMPGTL)
diff --git a/target/i386/translate.c b/target/i386/translate.c
index 893fe1253f..48bfb4e47b 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -2844,7 +2844,7 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0xeb] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
     [0xec] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
     [0xed] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
-    [0xee] = MMX_OP2(pmaxsw),
+    [0xee] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
     [0xef] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
     [0xf0] = { NULL, NULL, NULL, SSE_SPECIAL }, /* lddqu */
     [0xf1] = MMX_OP2(psllw),
@@ -3206,6 +3206,11 @@ static inline void gen_gvec_ld_modrm_3(CPUX86State *env, DisasContext *s,
 #define gen_vpminu_xmm(env, s, modrm, vece) gen_gvec_ld_modrm_vxmm((env), (s), (modrm), (vece), tcg_gen_gvec_umin, 0123)
 #define gen_vpminu_ymm(env, s, modrm, vece) gen_gvec_ld_modrm_vymm((env), (s), (modrm), (vece), tcg_gen_gvec_umin, 0123)
 
+#define gen_pmaxs_mm(env, s, modrm, vece)   gen_gvec_ld_modrm_mm  ((env), (s), (modrm), (vece), tcg_gen_gvec_smax, 0112)
+#define gen_pmaxs_xmm(env, s, modrm, vece)  gen_gvec_ld_modrm_xmm ((env), (s), (modrm), (vece), tcg_gen_gvec_smax, 0112)
+#define gen_vpmaxs_xmm(env, s, modrm, vece) gen_gvec_ld_modrm_vxmm((env), (s), (modrm), (vece), tcg_gen_gvec_smax, 0123)
+#define gen_vpmaxs_ymm(env, s, modrm, vece) gen_gvec_ld_modrm_vymm((env), (s), (modrm), (vece), tcg_gen_gvec_smax, 0123)
+
 #define gen_pand_mm(env, s, modrm)   gen_gvec_ld_modrm_mm  ((env), (s), (modrm), MO_64, tcg_gen_gvec_and, 0112)
 #define gen_pand_xmm(env, s, modrm)  gen_gvec_ld_modrm_xmm ((env), (s), (modrm), MO_64, tcg_gen_gvec_and, 0112)
 #define gen_vpand_xmm(env, s, modrm) gen_gvec_ld_modrm_vxmm((env), (s), (modrm), MO_64, tcg_gen_gvec_and, 0123)
@@ -3431,6 +3436,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
     case 0xea | M_0F | P_66 | VEX_128: gen_vpmins_xmm(env, s, modrm, MO_16); return;
     case 0xea | M_0F | P_66 | VEX_256: gen_vpmins_ymm(env, s, modrm, MO_16); return;
 
+    case 0xee | M_0F:                  gen_pmaxs_mm(env, s, modrm, MO_16); return;
+    case 0xee | M_0F | P_66:           gen_pmaxs_xmm(env, s, modrm, MO_16); return;
+    case 0xee | M_0F | P_66 | VEX_128: gen_vpmaxs_xmm(env, s, modrm, MO_16); return;
+    case 0xee | M_0F | P_66 | VEX_256: gen_vpmaxs_ymm(env, s, modrm, MO_16); return;
+
     case 0xdb | M_0F:                  gen_pand_mm(env, s, modrm); return;
     case 0xdb | M_0F | P_66:           gen_pand_xmm(env, s, modrm); return;
     case 0xdb | M_0F | P_66 | VEX_128: gen_vpand_xmm(env, s, modrm); return;
-- 
2.20.1


