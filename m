Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D527B05
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 12:47:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTlG7-0006iy-Eq
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 06:47:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hTkvS-000636-VF
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:26:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hTkvM-0001Xe-Ti
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:26:17 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50228)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hTkvM-00011h-JF
	for qemu-devel@nongnu.org; Thu, 23 May 2019 06:26:12 -0400
Received: by mail-wm1-x343.google.com with SMTP id f204so5236519wme.0
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oAoiZsybadmeQ96H+02fGdiYzseS4i8XXKVQd8p6lEE=;
	b=S9WuOBWbrGdqhGF8KY3OKgzIE1TTgotnUhw+sL0NlOxMc54JzGKQxibMSWu+rkUIbo
	QXWLleKc3fWXKebwkFmH1iVRwgNfzkJacCNZOchH6cbq8F4as4SP1T/ygs9tDfBhME19
	GhIla4MbWbaWnvUPCvuMui+UU+c0zMDLsHM6aT4sQarfosMO9XOy8oaPAKQNFY0TQam7
	Cl35hkSzJ3klhebn/aCYqUHoniSeNEi+KJTgjqe47dR5jo9FLJEVSCIopJVEDuaSlu1g
	COEU1A8UxF/5ZJk5wJYjWP0u3TsjC5v7SPJh3bu5+sH1Ku2/jB2OnQljAlxM5PJW56HO
	XJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oAoiZsybadmeQ96H+02fGdiYzseS4i8XXKVQd8p6lEE=;
	b=M8dtEELie1B7BKo9Ya320Zo5Dde9LYY8YL4tur9LWK7gcUoWBwFLTLFy7GXFv46X1X
	kZRHP1zLlV+/Ehi4wjwxNd5vAlppU31DSBBq+XfPKAaABg0HXDViKZ6HPdzCUagEPLZ0
	H0dlAGfWOXG10dwDiwVUYr1trj+sVkS/VqVqEn8djcs5pxAc3ffVQ3fRUTGlOepSNCbV
	Y1haJuTO21tlNqo08/8gBfck2SDES+l0UNvrwJDMMFAXeUKV1U13tzFXr90/4BXq1k9I
	Q25DpmY1zsAq2xUETUnH65hSemLWJYnM2Aj+3sr6c/kOpVnPIqndNjNhivpz9HtXDf+Q
	l3rQ==
X-Gm-Message-State: APjAAAUsso958Vq6D/Le1AAoIFLyojgUoJmPW92VAoY36cj+uam1EtVO
	zXlT5qYoxbwT3itXaL8uUQycXw==
X-Google-Smtp-Source: APXvYqyLTgkLc5EuKMAH/3TMTCDiXImZ/KRXhvapMUXWVxQGBOJuDgfaR84Y1X5JrdSo0mYO+J3vkQ==
X-Received: by 2002:a1c:6206:: with SMTP id w6mr11717149wmb.56.1558607145841; 
	Thu, 23 May 2019 03:25:45 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	y18sm11063422wmd.29.2019.05.23.03.25.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 03:25:44 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 397BD1FFA6;
	Thu, 23 May 2019 11:25:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 11:25:24 +0100
Message-Id: <20190523102532.10486-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v2 20/28] tests/tcg/multiarch: expand system
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand the memory test to cover move of the softmmu code. Specifically
we:

  - improve commentary
  - add some helpers (for later BE support)
  - reduce boiler plate into helpers
  - add signed reads at various sizes/offsets
  - required -DCHECK_UNALIGNED

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target |   2 +
 tests/tcg/i386/Makefile.softmmu-target    |   2 +
 tests/tcg/multiarch/system/memory.c       | 350 +++++++++++++++++-----
 3 files changed, 282 insertions(+), 72 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index cdb836f7e1e..2e560e4d08e 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -28,5 +28,7 @@ LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
 
+memory: CFLAGS+=-DCHECK_UNALIGNED=1
+
 # Running
 QEMU_OPTS+=-M virt -cpu max -display none -semihosting-config enable=on,target=native,chardev=output -kernel
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index c31bbbf39a7..e1f98177aa5 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -42,5 +42,7 @@ LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
 
+memory: CFLAGS+=-DCHECK_UNALIGNED=1
+
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index a7a0a8e9784..dc1d8a98ff2 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -5,18 +5,33 @@
  * behave across normal and unaligned accesses across several pages.
  * We are not replicating memory tests for stuck bits and other
  * hardware level failures but looking for issues with different size
- * accesses when:
-
+ * accesses when access is:
  *
+ *   - unaligned at various sizes (if -DCHECK_UNALIGNED set)
+ *   - spanning a (softmmu) page
+ *   - sign extension when loading
  */
 
 #include <inttypes.h>
+#include <stdbool.h>
 #include <minilib.h>
 
-#define TEST_SIZE (4096 * 4)  /* 4 pages */
+#ifndef CHECK_UNALIGNED
+# error "Target does not specify CHECK_UNALIGNED"
+#endif
+
+#define PAGE_SIZE 4096             /* nominal 4k "pages" */
+#define TEST_SIZE (PAGE_SIZE * 4)  /* 4 pages */
 
+#define ARRAY_SIZE(x) ((sizeof(x) / sizeof((x)[0])))
+
+__attribute__((aligned(PAGE_SIZE)))
 static uint8_t test_data[TEST_SIZE];
 
+typedef void (*init_ufn) (int offset);
+typedef bool (*read_ufn) (int offset);
+typedef bool (*read_sfn) (int offset, bool nf);
+
 static void pdot(int count)
 {
     if (count % 128 == 0) {
@@ -24,17 +39,26 @@ static void pdot(int count)
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
 
-static void init_test_data_u8(void)
+static void init_test_data_u8(int unused_offset)
 {
     uint8_t count = 0, *ptr = &test_data[0];
     int i;
+    (void)(unused_offset);
 
     ml_printf("Filling test area with u8:");
     for (i = 0; i < TEST_SIZE; i++) {
@@ -44,62 +68,112 @@ static void init_test_data_u8(void)
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
+    return neg ? (0xff << (index % 7)) : (0xff >> ((index % 6) + 1));
+}
+
+static void init_test_data_s8(bool neg_first)
+{
+    uint8_t top, bottom, *ptr = &test_data[0];
+    int i;
+
+    ml_printf("Filling test area with s8 pairs (%s):",
+              neg_first ? "neg first" : "pos first");
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
 
-static int read_test_data_u16(int offset)
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
+
+static bool read_test_data_u16(int offset)
 {
     uint16_t word, *ptr = (uint16_t *)&test_data[offset];
     int i;
@@ -114,17 +188,17 @@ static int read_test_data_u16(int offset)
         low = word & 0xff;
         if (high < low && high != 0) {
             ml_printf("Error %d < %d\n", high, low);
-            return 1;
+            return false;
         } else {
             pdot(i);
         }
 
     }
-    ml_printf("done\n");
-    return 0;
+    ml_printf("done @ %p\n", ptr);
+    return true;
 }
 
-static int read_test_data_u32(int offset)
+static bool read_test_data_u32(int offset)
 {
     uint32_t word, *ptr = (uint32_t *)&test_data[offset];
     int i;
@@ -145,16 +219,16 @@ static int read_test_data_u32(int offset)
             (b2 < b3 && b2 != 0) ||
             (b3 < b4 && b3 != 0)) {
             ml_printf("Error %d, %d, %d, %d", b1, b2, b3, b4);
-            return 2;
+            return false;
         } else {
             pdot(i);
         }
     }
-    ml_printf("done\n");
-    return 0;
+    ml_printf("done @ %p\n", ptr);
+    return true;
 }
 
-static int read_test_data_u64(int offset)
+static bool read_test_data_u64(int offset)
 {
     uint64_t word, *ptr = (uint64_t *)&test_data[offset];
     int i;
@@ -184,60 +258,192 @@ static int read_test_data_u64(int offset)
             (b7 < b8 && b7 != 0)) {
             ml_printf("Error %d, %d, %d, %d, %d, %d, %d, %d",
                       b1, b2, b3, b4, b5, b6, b7, b8);
-            return 2;
+            return false;
         } else {
             pdot(i);
         }
     }
-    ml_printf("done\n");
-    return 0;
+    ml_printf("done @ %p\n", ptr);
+    return true;
 }
 
 /* Read the test data and verify at various offsets */
-int do_reads(void)
+read_ufn read_ufns[] = { read_test_data_u16,
+                         read_test_data_u32,
+                         read_test_data_u64 };
+
+bool do_unsigned_reads(void)
 {
-    int r = 0;
-    int off = 0;
+    int i;
+    bool ok = true;
 
-    while (r == 0 && off < 8) {
-        r = read_test_data_u16(off);
-        r |= read_test_data_u32(off);
-        r |= read_test_data_u64(off);
-        off++;
+    for (i = 0; i < ARRAY_SIZE(read_ufns) && ok; i++) {
+#if CHECK_UNALIGNED
+        int off;
+        for (off = 0; off < 8 && ok; off++) {
+            ok = read_ufns[i](off);
+        }
+#else
+        ok = read_ufns[i](0);
+#endif
     }
 
-    return r;
+    return ok;
 }
 
-int main(void)
+static bool do_unsigned_test(init_ufn fn)
 {
-    int i, r = 0;
+#if CHECK_UNALIGNED
+    bool ok = true;
+    int i;
+    for (i = 0; i < 8 && ok; i++) {
+        fn(i);
+        ok = do_unsigned_reads();
+    }
+#else
+    fn(0);
+    return do_unsigned_reads();
+#endif
+}
+
+/*
+ * We need to ensure signed data is read into a larger data type to
+ * ensure that sign extension is working properly.
+ */
+
+static bool read_test_data_s8(int offset, bool neg_first)
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
+            return false;
+        }
+    }
+    ml_printf("done @ %p\n", ptr);
+    return true;
+}
+
+static bool read_test_data_s16(int offset, bool neg_first)
+{
+    int16_t *ptr = (int16_t *)&test_data[offset];
+    int i;
+    const int max = (TEST_SIZE - offset) / (sizeof(*ptr));
+
+    ml_printf("Reading s16 from %#lx (offset %d, %s):", ptr,
+              offset, neg_first ? "neg" : "pos");
 
+    for (i = 0; i < max; i++) {
+        int32_t data = *ptr++;
 
-    init_test_data_u8();
-    r = do_reads();
-    if (r) {
-        return r;
+        if (neg_first && data < 0) {
+            pdot(i);
+        } else if (data > 0) {
+            pdot(i);
+        } else {
+            ml_printf("Error %d %c 0\n", data, neg_first ? '<' : '>');
+            return false;
+        }
     }
+    ml_printf("done @ %p\n", ptr);
+    return true;
+}
+
+static bool read_test_data_s32(int offset, bool neg_first)
+{
+    int32_t *ptr = (int32_t *)&test_data[offset];
+    int i;
+    const int max = (TEST_SIZE - offset) / (sizeof(int32_t));
 
-    for (i = 0; i < 8; i++) {
-        init_test_data_u16(i);
+    ml_printf("Reading s32 from %#lx (offset %d, %s):",
+              ptr, offset, neg_first ? "neg" : "pos");
 
-        r = do_reads();
-        if (r) {
-            return r;
+    for (i = 0; i < max; i++) {
+        int64_t data = *ptr++;
+
+        if (neg_first && data < 0) {
+            pdot(i);
+        } else if (data > 0) {
+            pdot(i);
+        } else {
+            ml_printf("Error %d %c 0\n", data, neg_first ? '<' : '>');
+            return false;
         }
     }
+    ml_printf("done @ %p\n", ptr);
+    return true;
+}
 
-    for (i = 0; i < 8; i++) {
-        init_test_data_u32(i);
+/*
+ * Read the test data and verify at various offsets
+ *
+ * For everything except bytes all our reads should be either positive
+ * or negative depending on what offset we are reading from. Currently
+ * we only handle LE systems.
+ */
+read_sfn read_sfns[] = { read_test_data_s8,
+                         read_test_data_s16,
+                         read_test_data_s32 };
 
-        r = do_reads();
-        if (r) {
-            return r;
+bool do_signed_reads(bool neg_first)
+{
+    int i;
+    bool ok = true;
+
+    for (i = 0; i < ARRAY_SIZE(read_sfns) && ok; i++) {
+#if CHECK_UNALIGNED
+        int off;
+        for (off = 0; off < 8 && ok; off++) {
+            bool nf = i == 0 ? neg_first ^ (off & 1) : !(neg_first ^ (off & 1));
+            ok = read_sfns[i](off, nf);
         }
+#else
+        ok = read_sfns[i](0, i == 0 ? neg_first : !neg_first);
+#endif
+    }
+
+    return ok;
+}
+
+init_ufn init_ufns[] = { init_test_data_u8,
+                         init_test_data_u16,
+                         init_test_data_u32,
+                         init_test_data_u64 };
+
+int main(void)
+{
+    int i;
+    bool ok = true;
+
+    /* Run through the unsigned tests first */
+    for (i = 0; i < ARRAY_SIZE(init_ufns) && ok; i++) {
+        ok = do_unsigned_test(init_ufns[i]);
+    }
+
+    if (ok) {
+        init_test_data_s8(false);
+        ok = do_signed_reads(false);
+    }
+
+    if (ok) {
+        init_test_data_s8(true);
+        ok = do_signed_reads(true);
     }
 
-    ml_printf("Test complete: %s\n", r == 0 ? "PASSED" : "FAILED");
-    return r;
+    ml_printf("Test complete: %s\n", ok ? "PASSED" : "FAILED");
+    return ok ? 0 : -1;
 }
-- 
2.20.1


