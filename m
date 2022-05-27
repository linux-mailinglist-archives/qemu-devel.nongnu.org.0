Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AEB5366E3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:23:36 +0200 (CEST)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuecZ-0001e8-3p
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueML-0003Tv-2r
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:49 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMA-0001g8-MB
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:47 -0400
Received: by mail-pj1-x102c.google.com with SMTP id d20so1132774pjr.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5YSH0HOeiRGn4/ykhm8gudRAWnEQH/lDAlEuGwcaYQ=;
 b=U8C0c8SInV4/UTyQLdHWB+GU0bEeiLpA4RDzLvHFdxk0MnqNXU5dhHeCpPh1jRrCYZ
 zo+5iV4Nk2ia58A0bMLq/Bc+c0V/OtMfKbxTuWWOCji8nzKL6CxFz3VBwED9f0cZdMV+
 T8ufwQPRuZiaKCK3HHskwqhTC4i6vc7sucp4N/+ynKy/fVkNNcjDv2sNeFcSYTaTb9iz
 KKmSRGEssM77pLq4ghQHJXX8OO6dpmzdbSKU2oy+hEZosG8AYSsTThuVJYOsNJl+s/Nr
 FqWxSJbS3qWcPBXn6ds/JhfYN9ebZ3wPvMeEpMQkZ8V2/GM+EyxEIBldYhLLKLHNpVbd
 +cAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5YSH0HOeiRGn4/ykhm8gudRAWnEQH/lDAlEuGwcaYQ=;
 b=B/NdIU2iGgCGfL6ZhjFvgiHhYORF3nd8HVNUuOdXtv01Jk2gFaNNcA9Tv7d9P5MJwO
 j6Gr6mFyt4HKRMVelCsUjLCDkbziWssn2HqcbgxfIIdLcwcWGsK/KxLPo6bys4LDbTqU
 2GSBkURNixp9fdYcaWmyxNI74n1LTkBhCrhzeL4SN8LZGCC8uNMdoRpxSv8xQd0AvOT2
 gCvHaUUGvpqYzV8Zlj1u+DRHiDZEvfRzDjuxcqwc6RUiVR8w/620Fe3qyDwkKjDXK9g+
 nWQC6HTxUrtgVFh0NnhKk6DY8pqFb9kb1YFuVOZKPwFPVB7UVl0DTcIal7C63siHkOjh
 dZ3g==
X-Gm-Message-State: AOAM533UYDCCgYDXN7XjVHZMwUPllFI+O0e5Vq8ayh89/d/Hmof8vb0E
 yyNQfXKZiBdYrER8DrvltUzx0OXU4kQMDw==
X-Google-Smtp-Source: ABdhPJyPQ66bGHmK+Zrx7qP0ABrUJxZSWvWR0b6rOfBH6C4newcauN+CV5fs+s5+aeU4kh2YzpBUWw==
X-Received: by 2002:a17:90a:6f41:b0:1e2:89af:5bfc with SMTP id
 d59-20020a17090a6f4100b001e289af5bfcmr2640788pjk.217.1653674797300; 
 Fri, 27 May 2022 11:06:37 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 14/15] target/arm: Move expand_pred_h to vec_internal.h
Date: Fri, 27 May 2022 11:06:22 -0700
Message-Id: <20220527180623.185261-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Move the data to vec_helper.c and the inline to vec_internal.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_internal.h |  7 +++++++
 target/arm/sve_helper.c   | 29 -----------------------------
 target/arm/vec_helper.c   | 26 ++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index d1a1ea4a66..43cff5ec7c 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -59,6 +59,13 @@ static inline uint64_t expand_pred_b(uint8_t byte)
     return expand_pred_b_data[byte];
 }
 
+/* Similarly for half-word elements. */
+extern const uint64_t expand_pred_h_data[0x55+1];
+static inline uint64_t expand_pred_h(uint8_t byte)
+{
+    return expand_pred_h_data[byte & 0x55];
+}
+
 static inline void clear_tail(void *vd, uintptr_t opr_sz, uintptr_t max_sz)
 {
     uint64_t *d = vd + opr_sz;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b8a37dd1eb..9a2741b20f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -103,35 +103,6 @@ uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
     return flags;
 }
 
-/* Similarly for half-word elements.
- *  for (i = 0; i < 256; ++i) {
- *      unsigned long m = 0;
- *      if (i & 0xaa) {
- *          continue;
- *      }
- *      for (j = 0; j < 8; j += 2) {
- *          if ((i >> j) & 1) {
- *              m |= 0xfffful << (j << 3);
- *          }
- *      }
- *      printf("[0x%x] = 0x%016lx,\n", i, m);
- *  }
- */
-static inline uint64_t expand_pred_h(uint8_t byte)
-{
-    static const uint64_t word[] = {
-        [0x01] = 0x000000000000ffff, [0x04] = 0x00000000ffff0000,
-        [0x05] = 0x00000000ffffffff, [0x10] = 0x0000ffff00000000,
-        [0x11] = 0x0000ffff0000ffff, [0x14] = 0x0000ffffffff0000,
-        [0x15] = 0x0000ffffffffffff, [0x40] = 0xffff000000000000,
-        [0x41] = 0xffff00000000ffff, [0x44] = 0xffff0000ffff0000,
-        [0x45] = 0xffff0000ffffffff, [0x50] = 0xffffffff00000000,
-        [0x51] = 0xffffffff0000ffff, [0x54] = 0xffffffffffff0000,
-        [0x55] = 0xffffffffffffffff,
-    };
-    return word[byte & 0x55];
-}
-
 /* Similarly for single word elements.  */
 static inline uint64_t expand_pred_s(uint8_t byte)
 {
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 17fb158362..4db68fbbb3 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -127,6 +127,32 @@ const uint64_t expand_pred_b_data[256] = {
     0xffffffffffffffff,
 };
 
+/*
+ * Similarly for half-word elements.
+ *  for (i = 0; i < 256; ++i) {
+ *      unsigned long m = 0;
+ *      if (i & 0xaa) {
+ *          continue;
+ *      }
+ *      for (j = 0; j < 8; j += 2) {
+ *          if ((i >> j) & 1) {
+ *              m |= 0xfffful << (j << 3);
+ *          }
+ *      }
+ *      printf("[0x%x] = 0x%016lx,\n", i, m);
+ *  }
+ */
+const uint64_t expand_pred_h_data[0x55+1] = {
+    [0x01] = 0x000000000000ffff, [0x04] = 0x00000000ffff0000,
+    [0x05] = 0x00000000ffffffff, [0x10] = 0x0000ffff00000000,
+    [0x11] = 0x0000ffff0000ffff, [0x14] = 0x0000ffffffff0000,
+    [0x15] = 0x0000ffffffffffff, [0x40] = 0xffff000000000000,
+    [0x41] = 0xffff00000000ffff, [0x44] = 0xffff0000ffff0000,
+    [0x45] = 0xffff0000ffffffff, [0x50] = 0xffffffff00000000,
+    [0x51] = 0xffffffff0000ffff, [0x54] = 0xffffffffffff0000,
+    [0x55] = 0xffffffffffffffff,
+};
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
 int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
                      bool neg, bool round)
-- 
2.34.1


