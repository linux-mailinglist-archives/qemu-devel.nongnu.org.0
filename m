Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9939822D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 20:00:16 +0200 (CEST)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Uu6-0005Jr-EZ
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 14:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1i0UR8-0000rT-Ey
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1i0UR7-0007Dw-5n
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:18 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:45508)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1i0UR7-0007Dc-1g
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:17 -0400
Received: by mail-yb1-xb44.google.com with SMTP id u32so1326455ybi.12
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78dLtAzIc8Khj/cWFcmAZfU/AZ/wK2C4JMNwdD2INNQ=;
 b=ZL2ebsA7Ub9YoCKiuOEpEwUzvZFXxms+seoXSC0LrQYXmqmYYJc7iwb39cH/mBuf/S
 fhufh1DmiR9QGVYugodcVj48Zz5JD0Y6u38QB9wEwV+KaPhXMJTFg2VZFOg8YhhChjzA
 GMyjP9+cxMplJhsrxa3Fkna8RcEojWBhJI2LJW11hWAuq4gFH2x57WdUWlNzrnslup+i
 IlUFkSbbbIxHvTvVSfudFv2EHfr/kCx/qN+GDNqomRoPZKy5pMrvnLPzQG0UqfMR5mGB
 5oEmYtuidgt3edagar3BnaXsKiLXOeCQRq5v+C/Ti/LR0Hw9PEFoCCMPILxM6sry0SPp
 Nmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78dLtAzIc8Khj/cWFcmAZfU/AZ/wK2C4JMNwdD2INNQ=;
 b=ko5+v+HCbXoRztb23XtdMF+OyH5rrlU1/8zq+tn5CIq2KOaybNqYmiKCwF8rrpJCWb
 6NNm7WOoy1KOtpmZRguYlMvlbP2VQI7Lasl3xCobF504YmNORjSE+2aX+5UB1gYVnSZv
 ucuEcITbMZndBflgBqGj1l17/zcglq4BD/yl3it5JX9OqVrVTZmNVjzclSh1DPrPX+cs
 lDnKLAd6tdxhnDwIvnqsDwA/o1/85K4WU23c2Bg/ChW0TNKGLluqG5+dn8NJzVzfSEDN
 HrkAg1Q3vAwIzf8nxt6XhW7bfDVFsnatLqhvqHAxW9Cplxi4Ug2ZCyVBocJOkWwNT3rT
 /mZQ==
X-Gm-Message-State: APjAAAWQK/s77+UpwDimO88CnWk96EgCwRakSXTBdMBYkFD5GaF+bm1U
 FcGWosvFmZXmlCeflnxtSsVB2/XQ
X-Google-Smtp-Source: APXvYqzhO8XWDTYidGfiIjCG0N6lRQ7/iFEdbkMJSv00QA+QLj0reMc8igQpfB3QRxYgMhdPOwC7CQ==
X-Received: by 2002:a25:6846:: with SMTP id d67mr25596541ybc.483.1566408616372; 
 Wed, 21 Aug 2019 10:30:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:c0:c67f:e390::3])
 by smtp.gmail.com with ESMTPSA id l71sm2826167ywl.39.2019.08.21.10.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:30:15 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:28:51 -0400
Message-Id: <20190821172951.15333-16-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821172951.15333-1-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
Subject: [Qemu-devel] [RFC PATCH v4 15/75] target/i386: introduce function
 check_cpuid
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a helper function to take care of instruction CPUID checks.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 62 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 467ecf15ba..3e54443d99 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4516,6 +4516,68 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b)
 #define gen_gvec_cmp(dofs, aofs, bofs, oprsz, maxsz, vece, cond)        \
     tcg_gen_gvec_cmp(cond, vece, dofs, aofs, bofs, oprsz, maxsz)
 
+typedef enum {
+    CHECK_CPUID_MMX = 1,
+    CHECK_CPUID_3DNOW,
+    CHECK_CPUID_SSE,
+    CHECK_CPUID_SSE2,
+    CHECK_CPUID_CLFLUSH,
+    CHECK_CPUID_SSE3,
+    CHECK_CPUID_SSSE3,
+    CHECK_CPUID_SSE4_1,
+    CHECK_CPUID_SSE4_2,
+    CHECK_CPUID_SSE4A,
+    CHECK_CPUID_AES,
+    CHECK_CPUID_PCLMULQDQ,
+    CHECK_CPUID_AVX,
+    CHECK_CPUID_AES_AVX,
+    CHECK_CPUID_PCLMULQDQ_AVX,
+    CHECK_CPUID_AVX2,
+} CheckCpuidFeat;
+
+static bool check_cpuid(CPUX86State *env, DisasContext *s, CheckCpuidFeat feat)
+{
+    switch (feat) {
+    case CHECK_CPUID_MMX:
+        return (s->cpuid_features & CPUID_MMX)
+            && (s->cpuid_ext2_features & CPUID_EXT2_MMX);
+    case CHECK_CPUID_3DNOW:
+        return s->cpuid_ext2_features & CPUID_EXT2_3DNOW;
+    case CHECK_CPUID_SSE:
+        return s->cpuid_features & CPUID_SSE;
+    case CHECK_CPUID_SSE2:
+        return s->cpuid_features & CPUID_SSE2;
+    case CHECK_CPUID_CLFLUSH:
+        return s->cpuid_features & CPUID_CLFLUSH;
+    case CHECK_CPUID_SSE3:
+        return s->cpuid_ext_features & CPUID_EXT_SSE3;
+    case CHECK_CPUID_SSSE3:
+        return s->cpuid_ext_features & CPUID_EXT_SSSE3;
+    case CHECK_CPUID_SSE4_1:
+        return s->cpuid_ext_features & CPUID_EXT_SSE41;
+    case CHECK_CPUID_SSE4_2:
+        return s->cpuid_ext_features & CPUID_EXT_SSE42;
+    case CHECK_CPUID_SSE4A:
+        return s->cpuid_ext3_features & CPUID_EXT3_SSE4A;
+    case CHECK_CPUID_AES:
+        return s->cpuid_ext_features & CPUID_EXT_AES;
+    case CHECK_CPUID_PCLMULQDQ:
+        return s->cpuid_ext_features & CPUID_EXT_PCLMULQDQ;
+    case CHECK_CPUID_AVX:
+        return s->cpuid_ext_features & CPUID_EXT_AVX;
+    case CHECK_CPUID_AES_AVX:
+        return (s->cpuid_ext_features & CPUID_EXT_AES)
+            && (s->cpuid_ext_features & CPUID_EXT_AVX);
+    case CHECK_CPUID_PCLMULQDQ_AVX:
+        return (s->cpuid_ext_features & CPUID_EXT_PCLMULQDQ)
+            && (s->cpuid_ext_features & CPUID_EXT_AVX);
+    case CHECK_CPUID_AVX2:
+        return s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_AVX2;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
 {
     enum {
-- 
2.20.1


