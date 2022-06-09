Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB2254490A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:39:05 +0200 (CEST)
Received: from localhost ([::1]:50974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFZA-0004pQ-Uk
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7f-0001k9-Jm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7d-00062u-O4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d14so22478158wra.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=A14QxFs16bLONsVCSDgKLzSud5B5D6SZ03whQ20bd3w=;
 b=CggcEqGcQmo4V+zqyGuGh0OrHns6C2kvXM732Ca0W6lPCoxIM0XF/QQTx7orla1dlS
 iCoI3LkbK2LHZ0m5gV8v7aNMmxnw//aJPYJwS7dc9f8KvDYNGWl87EFFQWNrbYL4NEk3
 wOCHGZCWYAKB460pdWCn2tqhrz9096rmLXlnld4yDryeW3+fiH1TdaS205ubXCPd4Y0Z
 Li9exE0QUcRS8VnhJYCgz6hZUJtapy/c5UkH7+iT5rDzTAcfs3DQ/XG8wV/H+HyE3LxK
 B8VvPMV2ut3xKAYncRBmWpnUXIKNa8DGV5oRswrhwzOn4toKTsHtKPhLu+1Ak4NaCJMD
 JWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A14QxFs16bLONsVCSDgKLzSud5B5D6SZ03whQ20bd3w=;
 b=rAKucWDceyQ9uWls2Fdv+ng9pciwjYgmj1uXYA+Rjy38qJLqI4KrOQiK576jA9OX8O
 9P3M3p/neetcPUYzcU9hukL3/FxNpLH1dix9I0sTV3ZBIjkcMBTEfkiJwp0tB6w1wWzQ
 netDeqK+YgMd3ihIcx+jBjQbQ5XDdIlpR1//tq2iPfeCZ7cwHnwPPXospzT/btZCYHo/
 6vAYqGLwd+EXhVRj7s1N5WeRzIwYfd4LGX202U/RWaX77QzDyhLi7vWhMVFw8pW9ODfc
 7L6XzOIZEVCre71pyhe6JhbvrTjKskHnkAVwrLtm6Gk1eCrW9i/mY8OZikVhOSPFSwO9
 7G5Q==
X-Gm-Message-State: AOAM533gXK/ogNfgMMHnJHn16K8xA9Zc4bCoGNnjvnnQp+WtuGGQ8VoX
 hb5Ol0Fyza4/NnUri4A3JCQMbzyeKhBMuA==
X-Google-Smtp-Source: ABdhPJyDYxr57yHj56c8tb/KvvKQvKCR16vHsUUzT6bekffpeBxp1u38mWphBarfSf7L3z5swcDbfg==
X-Received: by 2002:a05:6000:168c:b0:218:4523:c975 with SMTP id
 y12-20020a056000168c00b002184523c975mr17911740wrd.23.1654765593007; 
 Thu, 09 Jun 2022 02:06:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/55] target/arm: Move expand_pred_b to vec_internal.h
Date: Thu,  9 Jun 2022 10:05:32 +0100
Message-Id: <20220609090537.1971756-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Put the inline function near the array declaration.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220607203306.657998-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vec_internal.h | 8 +++++++-
 target/arm/sve_helper.c   | 9 ---------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 1d63402042f..d1a1ea4a668 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -50,8 +50,14 @@
 #define H8(x)   (x)
 #define H1_8(x) (x)
 
-/* Data for expanding active predicate bits to bytes, for byte elements. */
+/*
+ * Expand active predicate bits to bytes, for byte elements.
+ */
 extern const uint64_t expand_pred_b_data[256];
+static inline uint64_t expand_pred_b(uint8_t byte)
+{
+    return expand_pred_b_data[byte];
+}
 
 static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
 {
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8cd371e3e37..e865c125273 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -103,15 +103,6 @@ uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
     return flags;
 }
 
-/*
- * Expand active predicate bits to bytes, for byte elements.
- * (The data table itself is in vec_helper.c as MVE also needs it.)
- */
-static inline uint64_t expand_pred_b(uint8_t byte)
-{
-    return expand_pred_b_data[byte];
-}
-
 /* Similarly for half-word elements.
  *  for (i = 0; i < 256; ++i) {
  *      unsigned long m = 0;
-- 
2.25.1


