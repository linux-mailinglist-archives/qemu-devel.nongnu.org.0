Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E25FE7A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 19:07:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLWE8-0005cS-M1
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 13:07:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLW2G-0004J9-Op
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLVzl-0000ir-Ou
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:52:43 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54120)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hLVzl-0000i2-IN
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 12:52:41 -0400
Received: by mail-wm1-x341.google.com with SMTP id 26so4621142wmj.3
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EdGFZbKcoEBKfDx7OK4/edboZqTBfkUrZ7ki4QLE8eA=;
	b=Vnh4GMUK5QCmlPtHA7hD6oBMmOgnZ8iQETkp3w5KToQkaRL2QaZCOWqBDQ1S7wU778
	bKKN9F6RH4P9Fwe2HxiaWUR0QIwUG9kA5r4fXve3QiQaN50s1URvUBO9hu2h4EG3hz6V
	J7N31K63lhyAFkfgJ77g2mEFKC+V4g1Zv3GMRr0Vblscha8u0wBM7lza2HxOzQJnC0yE
	1R7JaxKClioOn2Z1SdMNJu+/CD9ONy7oec/6otDw4+9QmLLR/gIuuIYvNfOldwKnMQOp
	2MExU3t174MEfCSOIiX6g1k4vJTf0X6yBxld9MWCXQVOupW/PVtkTbgJiQyXMRgcCbrD
	k4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EdGFZbKcoEBKfDx7OK4/edboZqTBfkUrZ7ki4QLE8eA=;
	b=TcHcnidz6F1akgMRtxPJLzYrxQDBWQa6WfokO4zN9mCUWE8f7ul5YOyWPdTg3yMKTg
	G1TVDH6+N5WpGxccRyrRCdSNJc90Ele4kUdVqCoC7a+AY236NygswbunqmyaqpKau4Qp
	jv4CUOipy3TvYtk7k0va0OUVMx+dsvb8VxZ8JbTtPZivVGxA/3euwXIqFGzjxt98Cuwu
	Zl6iFW5NkHNcPbV3nhWyHPvdOSNwQTvn73dew84VdYuxXAUVyOxGvXfTm3FuVJFxifyZ
	yetg8hE6JMFSLc855znlwo4qJvOS96nBu9TN1U5KnVbwjS7JMbzoxEDCVYiDbxk/wCEr
	9eHw==
X-Gm-Message-State: APjAAAUP+PVRbX5YeauT/GqXtvUSI4kb8KW8hvFM5mBJsvNdrsv9cQ49
	K9P3WZ+eRx8v6/IcKavEZhgQ/w==
X-Google-Smtp-Source: APXvYqxIMHLBboSDBeyK8zHHBf9xoLbbYOThU5rMin0J64RCAD/E/ZK7hJ2XHuIr4OajXDoEUKvwBA==
X-Received: by 2002:a05:600c:2208:: with SMTP id
	z8mr3664126wml.89.1556643160443; 
	Tue, 30 Apr 2019 09:52:40 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	w2sm27140431wrm.74.2019.04.30.09.52.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 09:52:37 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C971F1FF93;
	Tue, 30 Apr 2019 17:52:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 17:52:25 +0100
Message-Id: <20190430165234.32272-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430165234.32272-1-alex.bennee@linaro.org>
References: <20190430165234.32272-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH v5 06/15] tests/tcg/multiarch: expand system
 memory test to cover more
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand the memory test to cover move of the softmmu code. Specifically
we:

  - improve commentary
  - add some helpers (for later BE support)
  - reduce boiler plate into helpers
  - add signed reads at various sizes/offsets

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/system/memory.c | 254 ++++++++++++++++++++++++----
 1 file changed, 219 insertions(+), 35 deletions(-)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index a7a0a8e978..5befbb36bb 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -5,16 +5,21 @@
  * behave across normal and unaligned accesses across several pages.
  * We are not replicating memory tests for stuck bits and other
  * hardware level failures but looking for issues with different size
- * accesses when:
-
+ * accesses when access is:
  *
+ *   - unaligned at various sizes
+ *   - spanning a (softmmu) page
+ *   - sign extension when loading
  */
 
 #include <inttypes.h>
+#include <stdbool.h>
 #include <minilib.h>
 
-#define TEST_SIZE (4096 * 4)  /* 4 pages */
+#define PAGE_SIZE 4096             /* nominal 4k "pages" */
+#define TEST_SIZE (PAGE_SIZE * 4)  /* 4 pages */
 
+__attribute__((aligned(PAGE_SIZE)))
 static uint8_t test_data[TEST_SIZE];
 
 static void pdot(int count)
@@ -24,11 +29,19 @@ static void pdot(int count)
     }
 }
 
+/*
+ * Helper macros for shift/extract so we can keep our endian handling
+ * in one place.
+ */
+#define BYTE_SHIFT(b, pos) ((uint64_t)b << (pos * 8))
+#define BYTE_EXTRACT(b, pos) ((b >> (pos * 8)) & 0xff)
 
 /*
- * Fill the data with ascending value bytes. As x86 is a LE machine we
- * write in ascending order and then read and high byte should either
- * be zero or higher than the lower bytes.
+ * Fill the data with ascending value bytes.
+ *
+ * Currently we only support Little Endian machines so write in
+ * ascending address order. When we read higher address bytes should
+ * either be zero or higher than the lower bytes.
  */
 
 static void init_test_data_u8(void)
@@ -44,60 +57,109 @@ static void init_test_data_u8(void)
     ml_printf("done\n");
 }
 
+/*
+ * Full the data with alternating positive and negative bytes. This
+ * should mean for reads larger than a byte all subsequent reads will
+ * stay either negative or positive. We never write 0.
+ */
+
+static inline uint8_t get_byte(int index, bool neg)
+{
+    return neg ? ( 0xff << (index % 7)) : ( 0xff >> ((index % 6) + 1));
+}
+
+static void init_test_data_s8(bool neg_first)
+{
+    uint8_t top, bottom, *ptr = &test_data[0];
+    int i;
+
+    ml_printf("Filling test area with s8 pairs (%s):", neg_first ? "neg first":"pos first");
+    for (i = 0; i < TEST_SIZE / 2; i++) {
+        *ptr++ = get_byte(i, neg_first);
+        *ptr++ = get_byte(i, !neg_first);
+        pdot(i);
+    }
+    ml_printf("done\n");
+}
+
+/*
+ * Zero the first few bytes of the test data in preparation for
+ * new offset values.
+ */
+static void reset_start_data(int offset)
+{
+    uint32_t *ptr = (uint32_t *) &test_data[0];
+    int i;
+    for (i = 0; i < offset; i++) {
+        *ptr++ = 0;
+    }
+}
+
 static void init_test_data_u16(int offset)
 {
     uint8_t count = 0;
-    uint16_t word, *ptr = (uint16_t *) &test_data[0];
+    uint16_t word, *ptr = (uint16_t *) &test_data[offset];
     const int max = (TEST_SIZE - offset) / sizeof(word);
     int i;
 
-    ml_printf("Filling test area with u16 (offset %d):", offset);
+    ml_printf("Filling test area with u16 (offset %d, %p):", offset, ptr);
 
-    /* Leading zeros */
-    for (i = 0; i < offset; i++) {
-        *ptr = 0;
-    }
+    reset_start_data(offset);
 
-    ptr = (uint16_t *) &test_data[offset];
     for (i = 0; i < max; i++) {
-        uint8_t high, low;
-        low = count++;
-        high = count++;
-        word = (high << 8) | low;
+        uint8_t low = count++, high = count++;
+        word = BYTE_SHIFT(high, 1) | BYTE_SHIFT(low, 0);
         *ptr++ = word;
         pdot(i);
     }
-    ml_printf("done\n");
+    ml_printf("done @ %p\n", ptr);
 }
 
 static void init_test_data_u32(int offset)
 {
     uint8_t count = 0;
-    uint32_t word, *ptr = (uint32_t *) &test_data[0];
+    uint32_t word, *ptr = (uint32_t *) &test_data[offset];
     const int max = (TEST_SIZE - offset) / sizeof(word);
     int i;
 
-    ml_printf("Filling test area with u32 (offset %d):", offset);
+    ml_printf("Filling test area with u32 (offset %d, %p):", offset, ptr);
 
-    /* Leading zeros */
-    for (i = 0; i < offset; i++) {
-        *ptr = 0;
-    }
+    reset_start_data(offset);
 
-    ptr = (uint32_t *) &test_data[offset];
     for (i = 0; i < max; i++) {
-        uint8_t b1, b2, b3, b4;
-        b4 = count++;
-        b3 = count++;
-        b2 = count++;
-        b1 = count++;
-        word = (b1 << 24) | (b2 << 16) | (b3 << 8) | b4;
+        uint8_t b4 = count++, b3 = count++;
+        uint8_t b2 = count++, b1 = count++;
+        word = BYTE_SHIFT(b1, 3) | BYTE_SHIFT(b2, 2) | BYTE_SHIFT(b3, 1) | b4;
         *ptr++ = word;
         pdot(i);
     }
-    ml_printf("done\n");
+    ml_printf("done @ %p\n", ptr);
 }
 
+static void init_test_data_u64(int offset)
+{
+    uint8_t count = 0;
+    uint64_t word, *ptr = (uint64_t *) &test_data[offset];
+    const int max = (TEST_SIZE - offset) / sizeof(word);
+    int i;
+
+    ml_printf("Filling test area with u64 (offset %d, %p):", offset, ptr);
+
+    reset_start_data(offset);
+
+    for (i = 0; i < max; i++) {
+        uint8_t b8 = count++, b7 = count++;
+        uint8_t b6 = count++, b5 = count++;
+        uint8_t b4 = count++, b3 = count++;
+        uint8_t b2 = count++, b1 = count++;
+        word = BYTE_SHIFT(b1, 7) | BYTE_SHIFT(b2, 6) | BYTE_SHIFT(b3, 5) |
+               BYTE_SHIFT(b4, 4) | BYTE_SHIFT(b5, 3) | BYTE_SHIFT(b6, 2) |
+               BYTE_SHIFT(b7, 1) | b8;
+        *ptr++ = word;
+        pdot(i);
+    }
+    ml_printf("done @ %p\n", ptr);
+}
 
 static int read_test_data_u16(int offset)
 {
@@ -120,7 +182,7 @@ static int read_test_data_u16(int offset)
         }
 
     }
-    ml_printf("done\n");
+    ml_printf("done @ %p\n", ptr);
     return 0;
 }
 
@@ -150,7 +212,7 @@ static int read_test_data_u32(int offset)
             pdot(i);
         }
     }
-    ml_printf("done\n");
+    ml_printf("done @ %p\n", ptr);
     return 0;
 }
 
@@ -189,7 +251,7 @@ static int read_test_data_u64(int offset)
             pdot(i);
         }
     }
-    ml_printf("done\n");
+    ml_printf("done @ %p\n", ptr);
     return 0;
 }
 
@@ -209,6 +271,110 @@ int do_reads(void)
     return r;
 }
 
+/*
+ * We need to ensure signed data is read into a larger data type to
+ * ensure that sign extension is working properly.
+ */
+
+static int read_test_data_s8(int offset, bool neg_first)
+{
+    int8_t *ptr = (int8_t *)&test_data[offset];
+    int i;
+    const int max = (TEST_SIZE - offset) / 2;
+
+    ml_printf("Reading s8 pairs from %#lx (offset %d):", ptr, offset);
+
+    for (i = 0; i < max; i++) {
+        int16_t first, second;
+        bool ok;
+        first = *ptr++;
+        second = *ptr++;
+
+        if (neg_first && first < 0 && second > 0) {
+            pdot(i);
+        } else if (!neg_first && first > 0 && second < 0) {
+            pdot(i);
+        } else {
+            ml_printf("Error %d %c %d\n", first, neg_first ? '<' : '>', second);
+            return 1;
+        }
+    }
+    ml_printf("done @ %p\n", ptr);
+    return 0;
+}
+
+static int read_test_data_s16(int offset, bool neg_first)
+{
+    int16_t *ptr = (int16_t *)&test_data[offset];
+    int i;
+    const int max = (TEST_SIZE - offset) / (sizeof(*ptr));
+
+    ml_printf("Reading s16 from %#lx (offset %d, %s):",
+              ptr, offset, neg_first ? "neg":"pos");
+
+    for (i = 0; i < max; i++) {
+        int32_t data = *ptr++;
+
+        if (neg_first && data < 0) {
+            pdot(i);
+        } else if (data > 0) {
+            pdot(i);
+        } else {
+            ml_printf("Error %d %c 0\n", data, neg_first ? '<' : '>');
+            return 1;
+        }
+    }
+    ml_printf("done @ %p\n", ptr);
+    return 0;
+}
+
+static int read_test_data_s32(int offset, bool neg_first)
+{
+    int32_t *ptr = (int32_t *)&test_data[offset];
+    int i;
+    const int max = (TEST_SIZE - offset) / (sizeof(int32_t));
+
+    ml_printf("Reading s32 from %#lx (offset %d, %s):",
+              ptr, offset, neg_first ? "neg":"pos");
+
+    for (i = 0; i < max; i++) {
+        int64_t data = *ptr++;
+
+        if (neg_first && data < 0) {
+            pdot(i);
+        } else if (data > 0) {
+            pdot(i);
+        } else {
+            ml_printf("Error %d %c 0\n", data, neg_first ? '<' : '>');
+            return 1;
+        }
+    }
+    ml_printf("done @ %p\n", ptr);
+    return 0;
+}
+
+/*
+ * Read the test data and verify at various offsets
+ *
+ * For everything except bytes all our reads should be either positive
+ * or negative depending on what offset we are reading from. Currently
+ * we only handle LE systems.
+ */
+int do_signed_reads(bool neg_first)
+{
+    int r = 0;
+    int off = 0;
+
+    while (r == 0 && off < 8) {
+        r = read_test_data_s8(off, neg_first ^ (off & 1));
+        r |= read_test_data_s16(off, !(neg_first ^ (off & 1)));
+        r |= read_test_data_s32(off, !(neg_first ^ (off & 1)));
+        off++;
+    }
+
+    return r;
+}
+
 int main(void)
 {
     int i, r = 0;
@@ -238,6 +404,24 @@ int main(void)
         }
     }
 
+    for (i = 0; i < 8; i++) {
+        init_test_data_u64(i);
+
+        r = do_reads();
+        if (r) {
+            return r;
+        }
+    }
+
+    init_test_data_s8(false);
+    r = do_signed_reads(false);
+    if (r) {
+        return r;
+    }
+
+    init_test_data_s8(true);
+    r = do_signed_reads(true);
+
     ml_printf("Test complete: %s\n", r == 0 ? "PASSED" : "FAILED");
     return r;
 }
-- 
2.20.1


