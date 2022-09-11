Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BCA5B51C3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:06:09 +0200 (CEST)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXW1g-0001ZX-6k
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwI-0004si-Pl
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVwF-0006OL-2F
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jHZa3eb+zjmS6qcxsMkyihbbwP8UhRCmQoRiVRocQM=;
 b=KY/YQiWHT0+8nNSoNr3EjlAMCuOgh7VHE4PyW+9e/+X09LmVUKd4RXR6v+XoR4O1Gvlg3a
 eFNb8bcoEVqdd7Vw3v+iYoFvJH6c2NkgtEnoygI6jNIIZLE5ANr5T9sxjvYcMSgS7freTa
 cRW/C8ZnoypCPa6YunopWkX1rjmiXBw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-bt6Ebx4uOrqr_rnVuMHItw-1; Sun, 11 Sep 2022 19:00:27 -0400
X-MC-Unique: bt6Ebx4uOrqr_rnVuMHItw-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so4953508edz.0
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8jHZa3eb+zjmS6qcxsMkyihbbwP8UhRCmQoRiVRocQM=;
 b=Pg3Bt43r9B/YBxRBlIHefWq0YEoVS1mtasyMTNZmjDu1xQ9bctIdRHUwtBzoIkvC/H
 5qQC6/pyVwyHNswzWKqYfwO3yidun/cLNVCmMuU22fb7ovk1GyesTJksgmreSz+pQVzq
 RgjdCw02WCCVUkyP8ZOiY6DN35Lai4fvktUeFj4jJ1abK50nwgMPMJ5Hb2Ay3SbTSvda
 +MzU8sWnrYlduwMB8LXavey2FoIMtgZyyFB5nmcVJYkVg3qiSTxDpYkzNH3kxvZTkumH
 NWypPhUJcAfoCQs+66WWfaQwfDXibdR6+sFNstSnOn+6WOzQPDQqmN9tUEiSCWy9AMyf
 +QdA==
X-Gm-Message-State: ACgBeo1bPvU+xHIjikebzfl7BGkxfCRkUJOk5/uqSX5nYP3xcf/vNQXX
 XDgiN9hywiwNAOQGi2j8OIy6HXQxSD+q4d1ZcmoRFPNj90ghxuZ5vA0SCk998jNcghegMxIiFqC
 5BvkRb6BQJYluJMUYQKPRhRGcX5jC6M1dll6Rd2v7UxksOBJWEwT7W39pGL7yfg+ET2g=
X-Received: by 2002:a17:906:8442:b0:77c:6b3d:bec2 with SMTP id
 e2-20020a170906844200b0077c6b3dbec2mr3349922ejy.224.1662937225928; 
 Sun, 11 Sep 2022 16:00:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+qesOeOu5y0y7zBsULXo2o92XqqlspFzqPFl3rDUYKpYevqAtbye++wlDgJXzqIGjLqyrOA==
X-Received: by 2002:a17:906:8442:b0:77c:6b3d:bec2 with SMTP id
 e2-20020a170906844200b0077c6b3dbec2mr3349867ejy.224.1662937225389; 
 Sun, 11 Sep 2022 16:00:25 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 bo24-20020a0564020b3800b0044e8ecb9d25sm4684667edb.52.2022.09.11.16.00.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:00:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] tests/tcg: i386: add MMX and 3DNow! tests
Date: Mon, 12 Sep 2022 01:00:12 +0200
Message-Id: <20220911230014.340601-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230014.340601-1-pbonzini@redhat.com>
References: <20220911230014.340601-1-pbonzini@redhat.com>
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

Adjust the test-avx.py generator to produce tests specifically for
MMX and 3DNow.  Using a separate generator introduces some code
duplication, but is a simpler approach because of test-avx's extra
complexity to support 3- and 4-operand AVX instructions.

If needed, a common library can be introduced later.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/Makefile.target |  18 +-
 tests/tcg/i386/test-3dnow.c    |   3 +
 tests/tcg/i386/test-avx.py     |   1 -
 tests/tcg/i386/test-mmx.c      | 315 +++++++++++++++++++++++++++++++++
 tests/tcg/i386/test-mmx.py     | 244 +++++++++++++++++++++++++
 5 files changed, 577 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/i386/test-3dnow.c
 create mode 100644 tests/tcg/i386/test-mmx.c
 create mode 100755 tests/tcg/i386/test-mmx.py

diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index be21b81b96..ae71e7f748 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -7,8 +7,8 @@ VPATH 		+= $(I386_SRC)
 
 I386_SRCS=$(notdir $(wildcard $(I386_SRC)/*.c))
 ALL_X86_TESTS=$(I386_SRCS:.c=)
-SKIP_I386_TESTS=test-i386-ssse3 test-avx
-X86_64_TESTS:=$(filter test-i386-bmi2 test-i386-ssse3 test-avx, $(ALL_X86_TESTS))
+SKIP_I386_TESTS=test-i386-ssse3 test-avx test-3dnow test-mmx
+X86_64_TESTS:=$(filter test-i386-bmi2 $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
 
 test-i386-sse-exceptions: CFLAGS += -msse4.1 -mfpmath=sse
 run-test-i386-sse-exceptions: QEMU_OPTS += -cpu max
@@ -82,9 +82,21 @@ run-plugin-sha512-sse-with-%: QEMU_OPTS+=-cpu max
 
 TESTS+=sha512-sse
 
-CLEANFILES += test-avx.h
+CLEANFILES += test-avx.h test-mmx.h test-3dnow.h
+test-3dnow.h: test-mmx.py x86.csv
+	$(PYTHON) $(I386_SRC)/test-mmx.py $(I386_SRC)/x86.csv $@ 3DNOW
+
+test-mmx.h: test-mmx.py x86.csv
+	$(PYTHON) $(I386_SRC)/test-mmx.py $(I386_SRC)/x86.csv $@ MMX SSE SSE2 SSE3 SSSE3
+
 test-avx.h: test-avx.py x86.csv
 	$(PYTHON) $(I386_SRC)/test-avx.py $(I386_SRC)/x86.csv $@
 
+test-3dnow: CFLAGS += -masm=intel -O -I.
+test-3dnow: test-3dnow.h
+
+test-mmx: CFLAGS += -masm=intel -O -I.
+test-mmx: test-mmx.h
+
 test-avx: CFLAGS += -masm=intel -O -I.
 test-avx: test-avx.h
diff --git a/tests/tcg/i386/test-3dnow.c b/tests/tcg/i386/test-3dnow.c
new file mode 100644
index 0000000000..67abc68677
--- /dev/null
+++ b/tests/tcg/i386/test-3dnow.c
@@ -0,0 +1,3 @@
+#define EMMS "femms"
+#define TEST_FILE "test-3dnow.h"
+#include "test-mmx.c"
diff --git a/tests/tcg/i386/test-avx.py b/tests/tcg/i386/test-avx.py
index 6eb455a8b4..2516c66445 100755
--- a/tests/tcg/i386/test-avx.py
+++ b/tests/tcg/i386/test-avx.py
@@ -7,7 +7,6 @@
 from fnmatch import fnmatch
 
 archs = [
-    # TODO: MMX?
     "SSE", "SSE2", "SSE3", "SSSE3", "SSE4_1", "SSE4_2",
 ]
 
diff --git a/tests/tcg/i386/test-mmx.c b/tests/tcg/i386/test-mmx.c
new file mode 100644
index 0000000000..09e5d583ff
--- /dev/null
+++ b/tests/tcg/i386/test-mmx.c
@@ -0,0 +1,315 @@
+#include <stdio.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+
+#ifndef TEST_FILE
+#define TEST_FILE "test-mmx.h"
+#endif
+#ifndef EMMS
+#define EMMS "emms"
+#endif
+
+typedef void (*testfn)(void);
+
+typedef struct {
+    uint64_t q0, q1;
+} __attribute__((aligned(16))) v2di;
+
+typedef struct {
+    uint64_t mm[8];
+    v2di xmm[8];
+    uint64_t r[16];
+    uint64_t flags;
+    uint32_t ff;
+    uint64_t pad;
+    v2di mem[4];
+    v2di mem0[4];
+} reg_state;
+
+typedef struct {
+    int n;
+    testfn fn;
+    const char *s;
+    reg_state *init;
+} TestDef;
+
+reg_state initI;
+reg_state initF32;
+reg_state initF64;
+
+static void dump_mmx(int n, const uint64_t *r, int ff)
+{
+    if (ff == 32) {
+        float v[2];
+        memcpy(v, r, sizeof(v));
+        printf("MM%d = %016lx %8g %8g\n", n, *r, v[1], v[0]);
+    } else {
+        printf("MM%d = %016lx\n", n, *r);
+    }
+}
+
+static void dump_xmm(const char *name, int n, const v2di *r, int ff)
+{
+    printf("%s%d = %016lx %016lx\n",
+           name, n, r->q1, r->q0);
+    if (ff == 32) {
+        float v[4];
+        memcpy(v, r, sizeof(v));
+        printf(" %8g %8g %8g %8g\n",
+                v[3], v[2], v[1], v[0]);
+    }
+}
+
+static void dump_regs(reg_state *s, int ff)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        dump_mmx(i, &s->mm[i], ff);
+    }
+    for (i = 0; i < 4; i++) {
+        dump_xmm("mem", i, &s->mem0[i], 0);
+    }
+}
+
+static void compare_state(const reg_state *a, const reg_state *b)
+{
+    int i;
+    for (i = 0; i < 8; i++) {
+        if (a->mm[i] != b->mm[i]) {
+            printf("MM%d = %016lx\n", i, b->mm[i]);
+        }
+    }
+    for (i = 0; i < 16; i++) {
+        if (a->r[i] != b->r[i]) {
+            printf("r%d = %016lx\n", i, b->r[i]);
+        }
+    }
+    for (i = 0; i < 8; i++) {
+        if (memcmp(&a->xmm[i], &b->xmm[i], 8)) {
+            dump_xmm("xmm", i, &b->xmm[i], a->ff);
+        }
+    }
+    for (i = 0; i < 4; i++) {
+        if (memcmp(&a->mem0[i], &a->mem[i], 16)) {
+            dump_xmm("mem", i, &a->mem[i], a->ff);
+        }
+    }
+    if (a->flags != b->flags) {
+        printf("FLAGS = %016lx\n", b->flags);
+    }
+}
+
+#define LOADMM(r, o) "movq " #r ", " #o "[%0]\n\t"
+#define LOADXMM(r, o) "movdqa " #r ", " #o "[%0]\n\t"
+#define STOREMM(r, o) "movq " #o "[%1], " #r "\n\t"
+#define STOREXMM(r, o) "movdqa " #o "[%1], " #r "\n\t"
+#define MMREG(F) \
+    F(mm0, 0x00) \
+    F(mm1, 0x08) \
+    F(mm2, 0x10) \
+    F(mm3, 0x18) \
+    F(mm4, 0x20) \
+    F(mm5, 0x28) \
+    F(mm6, 0x30) \
+    F(mm7, 0x38)
+#define XMMREG(F) \
+    F(xmm0, 0x040) \
+    F(xmm1, 0x050) \
+    F(xmm2, 0x060) \
+    F(xmm3, 0x070) \
+    F(xmm4, 0x080) \
+    F(xmm5, 0x090) \
+    F(xmm6, 0x0a0) \
+    F(xmm7, 0x0b0)
+#define LOADREG(r, o) "mov " #r ", " #o "[rax]\n\t"
+#define STOREREG(r, o) "mov " #o "[rax], " #r "\n\t"
+#define REG(F) \
+    F(rbx, 0xc8) \
+    F(rcx, 0xd0) \
+    F(rdx, 0xd8) \
+    F(rsi, 0xe0) \
+    F(rdi, 0xe8) \
+    F(r8, 0x100) \
+    F(r9, 0x108) \
+    F(r10, 0x110) \
+    F(r11, 0x118) \
+    F(r12, 0x120) \
+    F(r13, 0x128) \
+    F(r14, 0x130) \
+    F(r15, 0x138) \
+
+static void run_test(const TestDef *t)
+{
+    reg_state result;
+    reg_state *init = t->init;
+    memcpy(init->mem, init->mem0, sizeof(init->mem));
+    printf("%5d %s\n", t->n, t->s);
+    asm volatile(
+            MMREG(LOADMM)
+            XMMREG(LOADXMM)
+            "sub rsp, 128\n\t"
+            "push rax\n\t"
+            "push rbx\n\t"
+            "push rcx\n\t"
+            "push rdx\n\t"
+            "push %1\n\t"
+            "push %2\n\t"
+            "mov rax, %0\n\t"
+            "pushf\n\t"
+            "pop rbx\n\t"
+            "shr rbx, 8\n\t"
+            "shl rbx, 8\n\t"
+            "mov rcx, 0x140[rax]\n\t"
+            "and rcx, 0xff\n\t"
+            "or rbx, rcx\n\t"
+            "push rbx\n\t"
+            "popf\n\t"
+            REG(LOADREG)
+            "mov rax, 0xc0[rax]\n\t"
+            "call [rsp]\n\t"
+            "mov [rsp], rax\n\t"
+            "mov rax, 8[rsp]\n\t"
+            REG(STOREREG)
+            "mov rbx, [rsp]\n\t"
+            "mov 0xc0[rax], rbx\n\t"
+            "mov rbx, 0\n\t"
+            "mov 0xf0[rax], rbx\n\t"
+            "mov 0xf8[rax], rbx\n\t"
+            "pushf\n\t"
+            "pop rbx\n\t"
+            "and rbx, 0xff\n\t"
+            "mov 0x140[rax], rbx\n\t"
+            "add rsp, 16\n\t"
+            "pop rdx\n\t"
+            "pop rcx\n\t"
+            "pop rbx\n\t"
+            "pop rax\n\t"
+            "add rsp, 128\n\t"
+            MMREG(STOREMM)
+	    EMMS "\n\t"
+            XMMREG(STOREXMM)
+            : : "r"(init), "r"(&result), "r"(t->fn)
+            : "memory", "cc",
+            "rsi", "rdi",
+            "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
+            "mm0", "mm1", "mm2", "mm3", "mm4", "mm5", "mm6", "mm7",
+            "xmm0", "xmm1", "xmm2", "xmm3", "xmm4", "xmm5",
+            "xmm6", "xmm7", "xmm8", "xmm9", "xmm10", "xmm11",
+            "xmm12", "xmm13", "xmm14", "xmm15"
+            );
+    compare_state(init, &result);
+}
+
+#define TEST(n, cmd, type) \
+static void __attribute__((naked)) test_##n(void) \
+{ \
+    asm volatile(cmd); \
+    asm volatile("ret"); \
+}
+#include TEST_FILE
+
+
+static const TestDef test_table[] = {
+#define TEST(n, cmd, type) {n, test_##n, cmd, &init##type},
+#include TEST_FILE
+    {-1, NULL, "", NULL}
+};
+
+static void run_all(void)
+{
+    const TestDef *t;
+    for (t = test_table; t->fn; t++) {
+        run_test(t);
+    }
+}
+
+#define ARRAY_LEN(x) (sizeof(x) / sizeof(x[0]))
+
+float val_f32[] = {2.0, -1.0, 4.8, 0.8, 3, -42.0, 5e6, 7.5, 8.3};
+uint64_t val_i64[] = {
+    0x3d6b3b6a9e4118f2lu, 0x355ae76d2774d78clu,
+    0xd851c54a56bf1f29lu, 0x4a84d1d50bf4c4fflu,
+    0x5826475e2c5fd799lu, 0xfd32edc01243f5e9lu,
+};
+
+v2di deadbeef = {0xa5a5a5a5deadbeefull, 0xa5a5a5a5deadbeefull};
+
+void init_f32reg(uint64_t *r)
+{
+    static int n;
+    float v[2];
+    int i;
+    for (i = 0; i < 2; i++) {
+        v[i] = val_f32[n++];
+        if (n == ARRAY_LEN(val_f32)) {
+            n = 0;
+        }
+    }
+    memcpy(r, v, sizeof(*r));
+}
+
+void init_intreg(uint64_t *r)
+{
+    static uint64_t mask;
+    static int n;
+
+    *r = val_i64[n] ^ mask;
+    n++;
+    if (n == ARRAY_LEN(val_i64)) {
+        n = 0;
+        mask *= 0x104C11DB7;
+    }
+}
+
+static void init_all(reg_state *s)
+{
+    int i;
+
+    for (i = 0; i < 16; i++) {
+        init_intreg(&s->r[i]);
+    }
+    s->r[3] = (uint64_t)&s->mem[0]; /* rdx */
+    s->r[5] = (uint64_t)&s->mem[2]; /* rdi */
+    s->r[6] = 0;
+    s->r[7] = 0;
+    s->flags = 2;
+    for (i = 0; i < 8; i++) {
+        s->xmm[i] = deadbeef;
+	memcpy(&s->mm[i], &s->xmm[i], sizeof(s->mm[i]));
+    }
+    for (i = 0; i < 2; i++) {
+        s->mem0[i] = deadbeef;
+    }
+}
+
+int main(int argc, char *argv[])
+{
+    init_all(&initI);
+    init_intreg(&initI.mm[5]);
+    init_intreg(&initI.mm[6]);
+    init_intreg(&initI.mm[7]);
+    init_intreg(&initI.mem0[1].q0);
+    init_intreg(&initI.mem0[1].q1);
+    printf("Int:\n");
+    dump_regs(&initI, 0);
+
+    init_all(&initF32);
+    init_f32reg(&initF32.mm[5]);
+    init_f32reg(&initF32.mm[6]);
+    init_f32reg(&initF32.mm[7]);
+    init_f32reg(&initF32.mem0[1].q0);
+    init_f32reg(&initF32.mem0[1].q1);
+    initF32.ff = 32;
+    printf("F32:\n");
+    dump_regs(&initF32, 32);
+
+    if (argc > 1) {
+        int n = atoi(argv[1]);
+        run_test(&test_table[n]);
+    } else {
+        run_all();
+    }
+    return 0;
+}
diff --git a/tests/tcg/i386/test-mmx.py b/tests/tcg/i386/test-mmx.py
new file mode 100755
index 0000000000..392315e176
--- /dev/null
+++ b/tests/tcg/i386/test-mmx.py
@@ -0,0 +1,244 @@
+#! /usr/bin/env python3
+
+# Generate test-avx.h from x86.csv
+
+import csv
+import sys
+from fnmatch import fnmatch
+
+ignore = set(["EMMS", "FEMMS", "FISTTP",
+    "LDMXCSR", "VLDMXCSR", "STMXCSR", "VSTMXCSR"])
+
+imask = {
+    'PALIGNR': 0x3f,
+    'PEXTRB': 0x0f,
+    'PEXTRW': 0x07,
+    'PEXTRD': 0x03,
+    'PEXTRQ': 0x01,
+    'PINSRB': 0x0f,
+    'PINSRW': 0x07,
+    'PINSRD': 0x03,
+    'PINSRQ': 0x01,
+    'PSHUF[DW]': 0xff,
+    'PSHUF[LH]W': 0xff,
+    'PS[LR][AL][WDQ]': 0x3f,
+}
+
+def strip_comments(x):
+    for l in x:
+        if l != '' and l[0] != '#':
+            yield l
+
+def reg_w(w):
+    if w == 8:
+        return 'al'
+    elif w == 16:
+        return 'ax'
+    elif w == 32:
+        return 'eax'
+    elif w == 64:
+        return 'rax'
+    raise Exception("bad reg_w %d" % w)
+
+def mem_w(w):
+    if w == 8:
+        t = "BYTE"
+    elif w == 16:
+        t = "WORD"
+    elif w == 32:
+        t = "DWORD"
+    elif w == 64:
+        t = "QWORD"
+    else:
+        raise Exception()
+
+    return t + " PTR 32[rdx]"
+
+class MMArg():
+    isxmm = True
+
+    def __init__(self, mw):
+        if mw not in [0, 32, 64]:
+            raise Exception("Bad /m width: %s" % w)
+        self.mw = mw
+        self.ismem = mw != 0
+    def regstr(self, n):
+        if n < 0:
+            return mem_w(self.mw)
+        else:
+            return "mm%d" % (n, )
+
+def match(op, pattern):
+    return fnmatch(op, pattern)
+
+class ArgImm8u():
+    isxmm = False
+    ismem = False
+    def __init__(self, op):
+        for k, v in imask.items():
+            if match(op, k):
+                self.mask = imask[k];
+                return
+        raise Exception("Unknown immediate")
+    def vals(self):
+        mask = self.mask
+        yield 0
+        n = 0
+        while n != mask:
+            n += 1
+            while (n & ~mask) != 0:
+                n += (n & ~mask)
+            yield n
+
+class ArgRM():
+    isxmm = False
+    def __init__(self, rw, mw):
+        if rw not in [8, 16, 32, 64]:
+            raise Exception("Bad r/w width: %s" % w)
+        if mw not in [0, 8, 16, 32, 64]:
+            raise Exception("Bad r/w width: %s" % w)
+        self.rw = rw
+        self.mw = mw
+        self.ismem = mw != 0
+    def regstr(self, n):
+        if n < 0:
+            return mem_w(self.mw)
+        else:
+            return reg_w(self.rw)
+
+class ArgMem():
+    isxmm = False
+    ismem = True
+    def __init__(self, w):
+        if w not in [8, 16, 32, 64, 128, 256]:
+            raise Exception("Bad mem width: %s" % w)
+        self.w = w
+    def regstr(self, n):
+        return mem_w(self.w)
+
+class SkipInstruction(Exception):
+    pass
+
+def ArgGenerator(arg, op):
+    if arg[:2] == 'mm':
+        if "/" in arg:
+            r, m = arg.split('/')
+            if (m[0] != 'm'):
+                raise Exception("Expected /m: %s", arg)
+            return MMArg(int(m[1:]));
+        else:
+            return MMArg(0);
+    elif arg[:4] == 'imm8':
+        return ArgImm8u(op);
+    elif arg[0] == 'r':
+        if '/m' in arg:
+            r, m = arg.split('/')
+            if (m[0] != 'm'):
+                raise Exception("Expected /m: %s", arg)
+            mw = int(m[1:])
+            if r == 'r':
+                rw = mw
+            else:
+                rw = int(r[1:])
+            return ArgRM(rw, mw)
+
+        return ArgRM(int(arg[1:]), 0);
+    elif arg[0] == 'm':
+        return ArgMem(int(arg[1:]))
+    else:
+        raise SkipInstruction
+
+class InsnGenerator:
+    def __init__(self, op, args):
+        self.op = op
+        if op[0:2] == "PF":
+            self.optype = 'F32'
+        else:
+            self.optype = 'I'
+
+        try:
+            self.args = list(ArgGenerator(a, op) for a in args)
+            if len(self.args) > 0 and self.args[-1] is None:
+                self.args = self.args[:-1]
+        except SkipInstruction:
+            raise
+        except Exception as e:
+            raise Exception("Bad arg %s: %s" % (op, e))
+
+    def gen(self):
+        regs = (5, 6, 7)
+        dest = 4
+
+        nreg = len(self.args)
+        if nreg == 0:
+            yield self.op
+            return
+        if isinstance(self.args[-1], ArgImm8u):
+            nreg -= 1
+            immarg = self.args[-1]
+        else:
+            immarg = None
+        memarg = -1
+        for n, arg in enumerate(self.args):
+            if arg.ismem:
+                memarg = n
+
+        if nreg == 1:
+            regset = [(regs[0],)]
+            if memarg  if immarg is None:
+                yield self.op + ' ' + ','.join(argstr)
+            else:
+                for immval in immarg.vals():
+                    yield self.op + ' ' + ','.join(argstr) + ',' + str(immval)
+
+def split0(s):
+    if s == '':
+        return []
+    return s.split(',')
+
+def main():
+    n = 0
+    if len(sys.argv) <= 3:
+        print("Usage: test-mmx.py x86.csv test-mmx.h CPUID...")
+        exit(1)
+    csvfile = open(sys.argv[1], 'r', newline='')
+    archs = sys.argv[3:]
+    with open(sys.argv[2], "w") as outf:
+        outf.write("// Generated by test-mmx.py. Do not edit.\n")
+        for row in csv.reader(strip_comments(csvfile)):
+            insn = row[0].replace(',', '').split()
+            if insn[0] in ignore:
+                continue
+            cpuid = row[6]
+            if cpuid in archs:
+                try:
+                    g = InsnGenerator(insn[0], insn[1:])
+                    for insn in g.gen():
+                        outf.write('TEST(%d, "%s", %s)\n' % (n, insn, g.optype))
+                        n += 1
+                except SkipInstruction:
+                    pass
+        outf.write("#undef TEST\n")
+        csvfile.close()
+
+if __name__ == "__main__":
+    main()
-- 
2.37.2



