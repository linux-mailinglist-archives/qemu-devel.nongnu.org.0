Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5447CB6E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 20:02:24 +0200 (CEST)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hssvf-0002Yt-8Y
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 14:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hssrH-0002N0-KB
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hssrG-0002rz-CZ
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:51 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:39086)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hssrG-0002r1-8C
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:57:50 -0400
Received: by mail-yb1-xb41.google.com with SMTP id z128so2573679yba.6
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvfVVm1R1i5TWS3AOjieQ7QlUKuT8clHbsVMx2FutBg=;
 b=mPI1b4BdBuyMd+z8QdDfpNkvZyaM5PZcyO+9qRFqSUx+XV9ErrHsdqw83B0on9wty9
 5PdREDB7e14gQY4ob/1qKU5Up7i0n53rqaycWOMS0O3a5JxpRkCg5K8N2uDrtsrGC5qr
 vMe3Q928cIsgYBzcWqBIOYrvYpVf6AQ80QwvTcVQdO32H1TzhhdRhQEw7ZIXyDstoDow
 5nwOqf4W8Smrrxzx0eNGkAnLvrTdSaD02vUY7HBnaJqavWZHnYS8qgqLeYmURT1zSoDW
 a+VUeLXSsMFpM6yeOfYy8t/ix2Rtr09GfqHebTkyh5DxtsTPpceg+zhIDG4eB6nLeB1S
 ORUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvfVVm1R1i5TWS3AOjieQ7QlUKuT8clHbsVMx2FutBg=;
 b=NNrmdTQzYy9hc/LiRTIo4SEviLI2R5n44HOVVrqghhN2fx+haxy7yamRAJLii/atpw
 uD+GAlGVtE3mUNpqIGVZbVQHnPLkwLZoWwspJtlCer81QVwqLWJsanseS/ybWPYOKJQh
 OgnuQpWj7yy1h06u8/PbNK8nrOBQjt/UFgVgNYhjMn7Bp7kIrhrpPKSw/xrr99d8C9Gz
 sHyhaHnsKtkpOWf4nQJqR+Q4Iaokzy1HHrbizPb/zT5b539JuqZI/+OhS2EjsFVrNKXN
 M9GmKbY/nxHcExxz1ZVjO/KYD9WRH8WqqBrhsTNeSWUt0zXioPYyWkKfzTFBFsBpKqIA
 2mlw==
X-Gm-Message-State: APjAAAX9pJsriXGB+DhyouTXLEGBkKMZzXmtHj/g7ZE9PyktRZ/TxuNS
 1xDgfPoTbFUa/fiPwsPgpcVhh9C/
X-Google-Smtp-Source: APXvYqzpKtDX0hnj1kIajPI0khLumwvWsYATgroxsmSK864aT66+ShjbHij5XNcpbHfApdj6yH2+cA==
X-Received: by 2002:a5b:792:: with SMTP id b18mr62858185ybq.498.1564595869520; 
 Wed, 31 Jul 2019 10:57:49 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id 206sm16077696ywk.44.2019.07.31.10.57.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:57:49 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 13:56:54 -0400
Message-Id: <20190731175702.4916-15-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175702.4916-1-jan.bobek@gmail.com>
References: <20190731175702.4916-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: [Qemu-devel] [RFC PATCH v1 14/22] target/i386: reimplement
 (V)PADDS(B, W)
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
 target/i386/ops_sse.h        |  4 ----
 target/i386/ops_sse_header.h |  2 --
 target/i386/translate.c      | 19 +++++++++++++++++--
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 59935a65be..8829dcb781 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -339,8 +339,6 @@ static inline int satsw(int x)
 
 #define FADDUB(a, b) satub((a) + (b))
 #define FADDUW(a, b) satuw((a) + (b))
-#define FADDSB(a, b) satsb((int8_t)(a) + (int8_t)(b))
-#define FADDSW(a, b) satsw((int16_t)(a) + (int16_t)(b))
 
 #define FSUBUB(a, b) satub((a) - (b))
 #define FSUBUW(a, b) satuw((a) - (b))
@@ -365,12 +363,10 @@ static inline int satsw(int x)
 #endif
 
 SSE_HELPER_B(helper_paddusb, FADDUB)
-SSE_HELPER_B(helper_paddsb, FADDSB)
 SSE_HELPER_B(helper_psubusb, FSUBUB)
 SSE_HELPER_B(helper_psubsb, FSUBSB)
 
 SSE_HELPER_W(helper_paddusw, FADDUW)
-SSE_HELPER_W(helper_paddsw, FADDSW)
 SSE_HELPER_W(helper_psubusw, FSUBUW)
 SSE_HELPER_W(helper_psubsw, FSUBSW)
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index bcdbac99a0..78203e80a5 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -61,12 +61,10 @@ DEF_HELPER_3(glue(pslldq, SUFFIX), void, env, Reg, Reg)
     DEF_HELPER_3(glue(name, SUFFIX), void, env, Reg, Reg)
 
 SSE_HELPER_B(paddusb, FADDUB)
-SSE_HELPER_B(paddsb, FADDSB)
 SSE_HELPER_B(psubusb, FSUBUB)
 SSE_HELPER_B(psubsb, FSUBSB)
 
 SSE_HELPER_W(paddusw, FADDUW)
-SSE_HELPER_W(paddsw, FADDSW)
 SSE_HELPER_W(psubusw, FSUBUW)
 SSE_HELPER_W(psubsw, FSUBSW)
 
diff --git a/target/i386/translate.c b/target/i386/translate.c
index 6f4dfd06a1..5ea5014d99 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -2842,8 +2842,8 @@ static const SSEFunc_0_epp sse_op_table1[256][4] = {
     [0xe9] = MMX_OP2(psubsw),
     [0xea] = MMX_OP2(pminsw),
     [0xeb] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
-    [0xec] = MMX_OP2(paddsb),
-    [0xed] = MMX_OP2(paddsw),
+    [0xec] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
+    [0xed] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
     [0xee] = MMX_OP2(pmaxsw),
     [0xef] = { SSE_TOMBSTONE, SSE_TOMBSTONE },
     [0xf0] = { NULL, NULL, NULL, SSE_SPECIAL }, /* lddqu */
@@ -3171,6 +3171,11 @@ static inline void gen_gvec_ld_modrm_3(CPUX86State *env, DisasContext *s,
 #define gen_vpadd_xmm(env, s, modrm, vece) gen_gvec_ld_modrm_vxmm((env), (s), (modrm), (vece), tcg_gen_gvec_add, 0123)
 #define gen_vpadd_ymm(env, s, modrm, vece) gen_gvec_ld_modrm_vymm((env), (s), (modrm), (vece), tcg_gen_gvec_add, 0123)
 
+#define gen_padds_mm(env, s, modrm, vece)   gen_gvec_ld_modrm_mm  ((env), (s), (modrm), (vece), tcg_gen_gvec_ssadd, 0112)
+#define gen_padds_xmm(env, s, modrm, vece)  gen_gvec_ld_modrm_xmm ((env), (s), (modrm), (vece), tcg_gen_gvec_ssadd, 0112)
+#define gen_vpadds_xmm(env, s, modrm, vece) gen_gvec_ld_modrm_vxmm((env), (s), (modrm), (vece), tcg_gen_gvec_ssadd, 0123)
+#define gen_vpadds_ymm(env, s, modrm, vece) gen_gvec_ld_modrm_vymm((env), (s), (modrm), (vece), tcg_gen_gvec_ssadd, 0123)
+
 #define gen_psub_mm(env, s, modrm, vece)   gen_gvec_ld_modrm_mm  ((env), (s), (modrm), (vece), tcg_gen_gvec_sub, 0112)
 #define gen_psub_xmm(env, s, modrm, vece)  gen_gvec_ld_modrm_xmm ((env), (s), (modrm), (vece), tcg_gen_gvec_sub, 0112)
 #define gen_vpsub_xmm(env, s, modrm, vece) gen_gvec_ld_modrm_vxmm((env), (s), (modrm), (vece), tcg_gen_gvec_sub, 0123)
@@ -3331,6 +3336,16 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
     case 0xd4 | M_0F | P_66 | VEX_128: gen_vpadd_xmm(env, s, modrm, MO_64); return;
     case 0xd4 | M_0F | P_66 | VEX_256: gen_vpadd_ymm(env, s, modrm, MO_64); return;
 
+    case 0xec | M_0F:                  gen_padds_mm(env, s, modrm, MO_8); return;
+    case 0xec | M_0F | P_66:           gen_padds_xmm(env, s, modrm, MO_8); return;
+    case 0xec | M_0F | P_66 | VEX_128: gen_vpadds_xmm(env, s, modrm, MO_8); return;
+    case 0xec | M_0F | P_66 | VEX_256: gen_vpadds_ymm(env, s, modrm, MO_8); return;
+
+    case 0xed | M_0F:                  gen_padds_mm(env, s, modrm, MO_16); return;
+    case 0xed | M_0F | P_66:           gen_padds_xmm(env, s, modrm, MO_16); return;
+    case 0xed | M_0F | P_66 | VEX_128: gen_vpadds_xmm(env, s, modrm, MO_16); return;
+    case 0xed | M_0F | P_66 | VEX_256: gen_vpadds_ymm(env, s, modrm, MO_16); return;
+
     case 0xf8 | M_0F:                  gen_psub_mm(env, s, modrm, MO_8); return;
     case 0xf8 | M_0F | P_66:           gen_psub_xmm(env, s, modrm, MO_8); return;
     case 0xf8 | M_0F | P_66 | VEX_128: gen_vpsub_xmm(env, s, modrm, MO_8); return;
-- 
2.20.1


