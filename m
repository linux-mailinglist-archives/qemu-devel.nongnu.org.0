Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBC31E36A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:12:37 +0100 (CET)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWvs-0002dQ-9L
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWSF-0001Fi-JQ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:59 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWS2-0004uy-BC
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:59 -0500
Received: by mail-pg1-x52c.google.com with SMTP id t11so9515859pgu.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NrnvBEX9wxABZhH4uNqG+pDYIgCmpZeFvdyMJTnD9lE=;
 b=tD5CPryvqELvdKeQJpYUqTvpW7+8XAQohNOVXSVPTNa2etQltOfURNxfZGuOL6A1k4
 DVLHuls7BYc9xqMlvc4eodeP2Ys4nLhzm6fSGprOmK28gELLneDUQ6MOvsXoOtwfNRiz
 RTtjNOmM6+vXVwpvgSZC9QMkeaIPZhBwASjvE7bLpudbHrEJ7qCNpVmj1Izbb4psHBXW
 Z0wb+jt/dbBkU9pSi+kZ7jFG/h/TFOle5e3CaF2lOJPcRXEU99EydpVnDMbKbb7YnQuE
 Qfo5o/WBd/ohSM6cyZ58dEzLITzMmGFkFhftv2qds4XWdzwYcmTr+wLc7B2DCh49chT3
 8A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NrnvBEX9wxABZhH4uNqG+pDYIgCmpZeFvdyMJTnD9lE=;
 b=AHEzk4v3Ehgy4FehWd+ay/lZ1eXbJ6EWGDyy+56ohm2xNhruCyhQ+sgwm5Fx0wG3dr
 DQNTQo8zzZ0DTKNVxoSItkggzo8UNyTbPhOdYRgK7pSCseAMT6NuU6zy6zTQ9Hkslsnp
 LfcJjTIU16bI0Xv+GF57D5WHzsTpeoQFA6IR/AK+N7+Ja4znDPySDoUNmmK55NejrF8M
 +uZAkD2/Q+wOrgVXow1fXAkn5IngVcf2WvS11u8xP+V9JkgaCwwHXi29rZEe97/ZNjhm
 X5AXmGttDNxe8yl7ujjvIooGZNyBhmqRt6cnE92VpztUXOY+J6GttVyozOMpvK92sUli
 h+iw==
X-Gm-Message-State: AOAM530GGXcekIAIP65IT0rBh0DBaush1sI0Goy5QapHLvKDhAYCnykJ
 uljJGODKnxOeY59POcq0XX1Op1KQ3RYonA==
X-Google-Smtp-Source: ABdhPJyKj6pttxsg3hcJ1hWHIRbFcWyx3HthMGB+C5x2fi42GReIJ0+qWIe6KcBrDad9Lgxk+5p2HA==
X-Received: by 2002:a63:f709:: with SMTP id x9mr1531548pgh.287.1613605302698; 
 Wed, 17 Feb 2021 15:41:42 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/35] Hexagon (tests/tcg/hexagon) TCG tests -
 atomics/load/store/misc
Date: Wed, 17 Feb 2021 15:40:21 -0800
Message-Id: <20210217234023.1742406-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1612763186-18161-33-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/hexagon/atomics.c       | 139 +++++++++++
 tests/tcg/hexagon/dual_stores.c   |  60 +++++
 tests/tcg/hexagon/mem_noshuf.c    | 328 ++++++++++++++++++++++++++
 tests/tcg/hexagon/misc.c          | 380 ++++++++++++++++++++++++++++++
 tests/tcg/hexagon/preg_alias.c    | 169 +++++++++++++
 tests/tcg/hexagon/Makefile.target |  15 ++
 tests/tcg/hexagon/first.S         |  56 +++++
 7 files changed, 1147 insertions(+)
 create mode 100644 tests/tcg/hexagon/atomics.c
 create mode 100644 tests/tcg/hexagon/dual_stores.c
 create mode 100644 tests/tcg/hexagon/mem_noshuf.c
 create mode 100644 tests/tcg/hexagon/misc.c
 create mode 100644 tests/tcg/hexagon/preg_alias.c
 create mode 100644 tests/tcg/hexagon/first.S

diff --git a/tests/tcg/hexagon/atomics.c b/tests/tcg/hexagon/atomics.c
new file mode 100644
index 0000000000..ff1ceee241
--- /dev/null
+++ b/tests/tcg/hexagon/atomics.c
@@ -0,0 +1,139 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <inttypes.h>
+#include <pthread.h>
+
+/* Using volatile because we are testing atomics */
+static inline int atomic_inc32(volatile int *x)
+{
+    int old, dummy;
+    __asm__ __volatile__(
+        "1: %0 = memw_locked(%2)\n\t"
+        "   %1 = add(%0, #1)\n\t"
+        "   memw_locked(%2, p0) = %1\n\t"
+        "   if (!p0) jump 1b\n\t"
+        : "=&r"(old), "=&r"(dummy)
+        : "r"(x)
+        : "p0", "memory");
+    return old;
+}
+
+/* Using volatile because we are testing atomics */
+static inline long long atomic_inc64(volatile long long *x)
+{
+    long long old, dummy;
+    __asm__ __volatile__(
+        "1: %0 = memd_locked(%2)\n\t"
+        "   %1 = #1\n\t"
+        "   %1 = add(%0, %1)\n\t"
+        "   memd_locked(%2, p0) = %1\n\t"
+        "   if (!p0) jump 1b\n\t"
+        : "=&r"(old), "=&r"(dummy)
+        : "r"(x)
+        : "p0", "memory");
+    return old;
+}
+
+/* Using volatile because we are testing atomics */
+static inline int atomic_dec32(volatile int *x)
+{
+    int old, dummy;
+    __asm__ __volatile__(
+        "1: %0 = memw_locked(%2)\n\t"
+        "   %1 = add(%0, #-1)\n\t"
+        "   memw_locked(%2, p0) = %1\n\t"
+        "   if (!p0) jump 1b\n\t"
+        : "=&r"(old), "=&r"(dummy)
+        : "r"(x)
+        : "p0", "memory");
+    return old;
+}
+
+/* Using volatile because we are testing atomics */
+static inline long long atomic_dec64(volatile long long *x)
+{
+    long long old, dummy;
+    __asm__ __volatile__(
+        "1: %0 = memd_locked(%2)\n\t"
+        "   %1 = #-1\n\t"
+        "   %1 = add(%0, %1)\n\t"
+        "   memd_locked(%2, p0) = %1\n\t"
+        "   if (!p0) jump 1b\n\t"
+        : "=&r"(old), "=&r"(dummy)
+        : "r"(x)
+        : "p0", "memory");
+    return old;
+}
+
+#define LOOP_CNT 1000
+/* Using volatile because we are testing atomics */
+volatile int tick32 = 1;
+/* Using volatile because we are testing atomics */
+volatile long long tick64 = 1;
+int err;
+
+void *thread1_func(void *arg)
+{
+    int i;
+
+    for (i = 0; i < LOOP_CNT; i++) {
+        atomic_inc32(&tick32);
+        atomic_dec64(&tick64);
+    }
+    return NULL;
+}
+
+void *thread2_func(void *arg)
+{
+    int i;
+    for (i = 0; i < LOOP_CNT; i++) {
+        atomic_dec32(&tick32);
+        atomic_inc64(&tick64);
+    }
+    return NULL;
+}
+
+void test_pthread(void)
+{
+    pthread_t tid1, tid2;
+
+    pthread_create(&tid1, NULL, thread1_func, "hello1");
+    pthread_create(&tid2, NULL, thread2_func, "hello2");
+    pthread_join(tid1, NULL);
+    pthread_join(tid2, NULL);
+
+    if (tick32 != 1) {
+        printf("ERROR: tick32 %d != 1\n", tick32);
+        err++;
+    }
+    if (tick64 != 1) {
+        printf("ERROR: tick64 %lld != 1\n", tick64);
+        err++;
+    }
+}
+
+int main(int argc, char **argv)
+{
+    test_pthread();
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
diff --git a/tests/tcg/hexagon/dual_stores.c b/tests/tcg/hexagon/dual_stores.c
new file mode 100644
index 0000000000..a86a381ab9
--- /dev/null
+++ b/tests/tcg/hexagon/dual_stores.c
@@ -0,0 +1,60 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdio.h>
+
+/*
+ *  Make sure that two stores in the same packet honor proper
+ *  semantics: slot 1 executes first, then slot 0.
+ *  This is important when the addresses overlap.
+ */
+static inline void dual_stores(int *p, char *q, int x, char y)
+{
+  asm volatile("{\n\t"
+               "    memw(%0) = %2\n\t"
+               "    memb(%1) = %3\n\t"
+               "}\n"
+               :: "r"(p), "r"(q), "r"(x), "r"(y)
+               : "memory");
+}
+
+typedef union {
+    int word;
+    char byte;
+} Dual;
+
+int err;
+
+static void check(Dual d, int expect)
+{
+    if (d.word != expect) {
+        printf("ERROR: 0x%08x != 0x%08x\n", d.word, expect);
+        err++;
+    }
+}
+
+int main()
+{
+    Dual d;
+
+    d.word = ~0;
+    dual_stores(&d.word, &d.byte, 0x12345678, 0xff);
+    check(d, 0x123456ff);
+
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
diff --git a/tests/tcg/hexagon/mem_noshuf.c b/tests/tcg/hexagon/mem_noshuf.c
new file mode 100644
index 0000000000..dd714d5e98
--- /dev/null
+++ b/tests/tcg/hexagon/mem_noshuf.c
@@ -0,0 +1,328 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdio.h>
+
+/*
+ *  Make sure that the :mem_noshuf packet attribute is honored.
+ *  This is important when the addresses overlap.
+ *  The store instruction in slot 1 effectively executes first,
+ *  followed by the load instruction in slot 0.
+ */
+
+#define MEM_NOSHUF32(NAME, ST_TYPE, LD_TYPE, ST_OP, LD_OP) \
+static inline unsigned int NAME(ST_TYPE * p, LD_TYPE * q, ST_TYPE x) \
+{ \
+    unsigned int ret; \
+    asm volatile("{\n\t" \
+                 "    " #ST_OP "(%1) = %3\n\t" \
+                 "    %0 = " #LD_OP "(%2)\n\t" \
+                 "}:mem_noshuf\n" \
+                 : "=r"(ret) \
+                 : "r"(p), "r"(q), "r"(x) \
+                 : "memory"); \
+    return ret; \
+}
+
+#define MEM_NOSHUF64(NAME, ST_TYPE, LD_TYPE, ST_OP, LD_OP) \
+static inline unsigned long long NAME(ST_TYPE * p, LD_TYPE * q, ST_TYPE x) \
+{ \
+    unsigned long long ret; \
+    asm volatile("{\n\t" \
+                 "    " #ST_OP "(%1) = %3\n\t" \
+                 "    %0 = " #LD_OP "(%2)\n\t" \
+                 "}:mem_noshuf\n" \
+                 : "=r"(ret) \
+                 : "r"(p), "r"(q), "r"(x) \
+                 : "memory"); \
+    return ret; \
+}
+
+/* Store byte combinations */
+MEM_NOSHUF32(mem_noshuf_sb_lb,  signed char,  signed char,      memb, memb)
+MEM_NOSHUF32(mem_noshuf_sb_lub, signed char,  unsigned char,    memb, memub)
+MEM_NOSHUF32(mem_noshuf_sb_lh,  signed char,  signed short,     memb, memh)
+MEM_NOSHUF32(mem_noshuf_sb_luh, signed char,  unsigned short,   memb, memuh)
+MEM_NOSHUF32(mem_noshuf_sb_lw,  signed char,  signed int,       memb, memw)
+MEM_NOSHUF64(mem_noshuf_sb_ld,  signed char,  signed long long, memb, memd)
+
+/* Store half combinations */
+MEM_NOSHUF32(mem_noshuf_sh_lb,  signed short, signed char,      memh, memb)
+MEM_NOSHUF32(mem_noshuf_sh_lub, signed short, unsigned char,    memh, memub)
+MEM_NOSHUF32(mem_noshuf_sh_lh,  signed short, signed short,     memh, memh)
+MEM_NOSHUF32(mem_noshuf_sh_luh, signed short, unsigned short,   memh, memuh)
+MEM_NOSHUF32(mem_noshuf_sh_lw,  signed short, signed int,       memh, memw)
+MEM_NOSHUF64(mem_noshuf_sh_ld,  signed short, signed long long, memh, memd)
+
+/* Store word combinations */
+MEM_NOSHUF32(mem_noshuf_sw_lb,  signed int,   signed char,      memw, memb)
+MEM_NOSHUF32(mem_noshuf_sw_lub, signed int,   unsigned char,    memw, memub)
+MEM_NOSHUF32(mem_noshuf_sw_lh,  signed int,   signed short,     memw, memh)
+MEM_NOSHUF32(mem_noshuf_sw_luh, signed int,   unsigned short,   memw, memuh)
+MEM_NOSHUF32(mem_noshuf_sw_lw,  signed int,   signed int,       memw, memw)
+MEM_NOSHUF64(mem_noshuf_sw_ld,  signed int,   signed long long, memw, memd)
+
+/* Store double combinations */
+MEM_NOSHUF32(mem_noshuf_sd_lb,  long long,    signed char,      memd, memb)
+MEM_NOSHUF32(mem_noshuf_sd_lub, long long,    unsigned char,    memd, memub)
+MEM_NOSHUF32(mem_noshuf_sd_lh,  long long,    signed short,     memd, memh)
+MEM_NOSHUF32(mem_noshuf_sd_luh, long long,    unsigned short,   memd, memuh)
+MEM_NOSHUF32(mem_noshuf_sd_lw,  long long,    signed int,       memd, memw)
+MEM_NOSHUF64(mem_noshuf_sd_ld,  long long,    signed long long, memd, memd)
+
+static inline unsigned int cancel_sw_lb(int pred, int *p, signed char *q, int x)
+{
+    unsigned int ret;
+    asm volatile("p0 = cmp.eq(%4, #0)\n\t"
+                 "{\n\t"
+                 "    if (!p0) memw(%1) = %3\n\t"
+                 "    %0 = memb(%2)\n\t"
+                 "}:mem_noshuf\n"
+                 : "=r"(ret)
+                 : "r"(p), "r"(q), "r"(x), "r"(pred)
+                 : "p0", "memory");
+    return ret;
+}
+
+static inline
+unsigned long long cancel_sw_ld(int pred, int *p, long long *q, int x)
+{
+    long long ret;
+    asm volatile("p0 = cmp.eq(%4, #0)\n\t"
+                 "{\n\t"
+                 "    if (!p0) memw(%1) = %3\n\t"
+                 "    %0 = memd(%2)\n\t"
+                 "}:mem_noshuf\n"
+                 : "=r"(ret)
+                 : "r"(p), "r"(q), "r"(x), "r"(pred)
+                 : "p0", "memory");
+    return ret;
+}
+
+typedef union {
+    signed long long d[2];
+    unsigned long long ud[2];
+    signed int w[4];
+    unsigned int uw[4];
+    signed short h[8];
+    unsigned short uh[8];
+    signed char b[16];
+    unsigned char ub[16];
+} Memory;
+
+int err;
+
+static void check32(int n, int expect)
+{
+    if (n != expect) {
+        printf("ERROR: 0x%08x != 0x%08x\n", n, expect);
+        err++;
+    }
+}
+
+static void check64(long long n, long long expect)
+{
+    if (n != expect) {
+        printf("ERROR: 0x%08llx != 0x%08llx\n", n, expect);
+        err++;
+    }
+}
+
+int main()
+{
+    Memory n;
+    unsigned int res32;
+    unsigned long long res64;
+
+    /*
+     * Store byte combinations
+     */
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sb_lb(&n.b[0], &n.b[0], 0x87);
+    check32(res32, 0xffffff87);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sb_lub(&n.b[0], &n.ub[0], 0x87);
+    check32(res32, 0x00000087);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sb_lh(&n.b[0], &n.h[0], 0x87);
+    check32(res32, 0xffffff87);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sb_luh(&n.b[0], &n.uh[0], 0x87);
+    check32(res32, 0x0000ff87);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sb_lw(&n.b[0], &n.w[0], 0x87);
+    check32(res32, 0xffffff87);
+
+    n.d[0] = ~0LL;
+    res64 = mem_noshuf_sb_ld(&n.b[0], &n.d[0], 0x87);
+    check64(res64, 0xffffffffffffff87LL);
+
+    /*
+     * Store half combinations
+     */
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sh_lb(&n.h[0], &n.b[0], 0x8787);
+    check32(res32, 0xffffff87);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sh_lub(&n.h[0], &n.ub[1], 0x8f87);
+    check32(res32, 0x0000008f);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sh_lh(&n.h[0], &n.h[0], 0x8a87);
+    check32(res32, 0xffff8a87);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sh_luh(&n.h[0], &n.uh[0], 0x8a87);
+    check32(res32, 0x8a87);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sh_lw(&n.h[1], &n.w[0], 0x8a87);
+    check32(res32, 0x8a87ffff);
+
+    n.w[0] = ~0;
+    res64 = mem_noshuf_sh_ld(&n.h[1], &n.d[0], 0x8a87);
+    check64(res64, 0xffffffff8a87ffffLL);
+
+    /*
+     * Store word combinations
+     */
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sw_lb(&n.w[0], &n.b[0], 0x12345687);
+    check32(res32, 0xffffff87);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sw_lub(&n.w[0], &n.ub[0], 0x12345687);
+    check32(res32, 0x00000087);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sw_lh(&n.w[0], &n.h[0], 0x1234f678);
+    check32(res32, 0xfffff678);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sw_luh(&n.w[0], &n.uh[0], 0x12345678);
+    check32(res32, 0x00005678);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sw_lw(&n.w[0], &n.w[0], 0x12345678);
+    check32(res32, 0x12345678);
+
+    n.d[0] = ~0LL;
+    res64 = mem_noshuf_sw_ld(&n.w[0], &n.d[0], 0x12345678);
+    check64(res64, 0xffffffff12345678LL);
+
+    /*
+     * Store double combinations
+     */
+    n.d[0] = ~0LL;
+    res32 = mem_noshuf_sd_lb(&n.d[0], &n.b[1], 0x123456789abcdef0);
+    check32(res32, 0xffffffde);
+
+    n.d[0] = ~0LL;
+    res32 = mem_noshuf_sd_lub(&n.d[0], &n.ub[1], 0x123456789abcdef0);
+    check32(res32, 0x000000de);
+
+    n.d[0] = ~0LL;
+    res32 = mem_noshuf_sd_lh(&n.d[0], &n.h[1], 0x123456789abcdef0);
+    check32(res32, 0xffff9abc);
+
+    n.d[0] = ~0LL;
+    res32 = mem_noshuf_sd_luh(&n.d[0], &n.uh[1], 0x123456789abcdef0);
+    check32(res32, 0x00009abc);
+
+    n.d[0] = ~0LL;
+    res32 = mem_noshuf_sd_lw(&n.d[0], &n.w[1], 0x123456789abcdef0);
+    check32(res32, 0x12345678);
+
+    n.d[0] = ~0LL;
+    res64 = mem_noshuf_sd_ld(&n.d[0], &n.d[0], 0x123456789abcdef0);
+    check64(res64, 0x123456789abcdef0LL);
+
+    /*
+     * Predicated word stores
+     */
+    n.w[0] = ~0;
+    res32 = cancel_sw_lb(0, &n.w[0], &n.b[0], 0x12345678);
+    check32(res32, 0xffffffff);
+
+    n.w[0] = ~0;
+    res32 = cancel_sw_lb(1, &n.w[0], &n.b[0], 0x12345687);
+    check32(res32, 0xffffff87);
+
+    /*
+     * Predicated double stores
+     */
+    n.d[0] = ~0LL;
+    res64 = cancel_sw_ld(0, &n.w[0], &n.d[0], 0x12345678);
+    check64(res64, 0xffffffffffffffffLL);
+
+    n.d[0] = ~0LL;
+    res64 = cancel_sw_ld(1, &n.w[0], &n.d[0], 0x12345678);
+    check64(res64, 0xffffffff12345678LL);
+
+    n.d[0] = ~0LL;
+    res64 = cancel_sw_ld(0, &n.w[1], &n.d[0], 0x12345678);
+    check64(res64, 0xffffffffffffffffLL);
+
+    n.d[0] = ~0LL;
+    res64 = cancel_sw_ld(1, &n.w[1], &n.d[0], 0x12345678);
+    check64(res64, 0x12345678ffffffffLL);
+
+    /*
+     * No overlap tests
+     */
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sb_lb(&n.b[1], &n.b[0], 0x87);
+    check32(res32, 0xffffffff);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sb_lb(&n.b[0], &n.b[1], 0x87);
+    check32(res32, 0xffffffff);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sh_lh(&n.h[1], &n.h[0], 0x8787);
+    check32(res32, 0xffffffff);
+
+    n.w[0] = ~0;
+    res32 = mem_noshuf_sh_lh(&n.h[0], &n.h[1], 0x8787);
+    check32(res32, 0xffffffff);
+
+    n.d[0] = ~0LL;
+    res32 = mem_noshuf_sw_lw(&n.w[0], &n.w[1], 0x12345678);
+    check32(res32, 0xffffffff);
+
+    n.d[0] = ~0LL;
+    res32 = mem_noshuf_sw_lw(&n.w[1], &n.w[0], 0x12345678);
+    check32(res32, 0xffffffff);
+
+    n.d[0] = ~0LL;
+    n.d[1] = ~0LL;
+    res64 = mem_noshuf_sd_ld(&n.d[1], &n.d[0], 0x123456789abcdef0LL);
+    check64(res64, 0xffffffffffffffffLL);
+
+    n.d[0] = ~0LL;
+    n.d[1] = ~0LL;
+    res64 = mem_noshuf_sd_ld(&n.d[0], &n.d[1], 0x123456789abcdef0LL);
+    check64(res64, 0xffffffffffffffffLL);
+
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
diff --git a/tests/tcg/hexagon/misc.c b/tests/tcg/hexagon/misc.c
new file mode 100644
index 0000000000..458759f7b1
--- /dev/null
+++ b/tests/tcg/hexagon/misc.c
@@ -0,0 +1,380 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdio.h>
+#include <string.h>
+
+typedef unsigned char uint8_t;
+typedef unsigned short uint16_t;
+typedef unsigned int uint32_t;
+
+
+static inline void S4_storerhnew_rr(void *p, int index, uint16_t v)
+{
+  asm volatile("{\n\t"
+               "    r0 = %0\n\n"
+               "    memh(%1+%2<<#2) = r0.new\n\t"
+               "}\n"
+               :: "r"(v), "r"(p), "r"(index)
+               : "r0", "memory");
+}
+
+static uint32_t data;
+static inline void *S4_storerbnew_ap(uint8_t v)
+{
+  void *ret;
+  asm volatile("{\n\t"
+               "    r0 = %1\n\n"
+               "    memb(%0 = ##data) = r0.new\n\t"
+               "}\n"
+               : "=r"(ret)
+               : "r"(v)
+               : "r0", "memory");
+  return ret;
+}
+
+static inline void *S4_storerhnew_ap(uint16_t v)
+{
+  void *ret;
+  asm volatile("{\n\t"
+               "    r0 = %1\n\n"
+               "    memh(%0 = ##data) = r0.new\n\t"
+               "}\n"
+               : "=r"(ret)
+               : "r"(v)
+               : "r0", "memory");
+  return ret;
+}
+
+static inline void *S4_storerinew_ap(uint32_t v)
+{
+  void *ret;
+  asm volatile("{\n\t"
+               "    r0 = %1\n\n"
+               "    memw(%0 = ##data) = r0.new\n\t"
+               "}\n"
+               : "=r"(ret)
+               : "r"(v)
+               : "r0", "memory");
+  return ret;
+}
+
+static inline void S4_storeirbt_io(void *p, int pred)
+{
+  asm volatile("p0 = cmp.eq(%0, #1)\n\t"
+               "if (p0) memb(%1+#4)=#27\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirbf_io(void *p, int pred)
+{
+  asm volatile("p0 = cmp.eq(%0, #1)\n\t"
+               "if (!p0) memb(%1+#4)=#27\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirbtnew_io(void *p, int pred)
+{
+  asm volatile("{\n\t"
+               "    p0 = cmp.eq(%0, #1)\n\t"
+               "    if (p0.new) memb(%1+#4)=#27\n\t"
+               "}\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirbfnew_io(void *p, int pred)
+{
+  asm volatile("{\n\t"
+               "    p0 = cmp.eq(%0, #1)\n\t"
+               "    if (!p0.new) memb(%1+#4)=#27\n\t"
+               "}\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirht_io(void *p, int pred)
+{
+  asm volatile("p0 = cmp.eq(%0, #1)\n\t"
+               "if (p0) memh(%1+#4)=#27\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirhf_io(void *p, int pred)
+{
+  asm volatile("p0 = cmp.eq(%0, #1)\n\t"
+               "if (!p0) memh(%1+#4)=#27\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirhtnew_io(void *p, int pred)
+{
+  asm volatile("{\n\t"
+               "    p0 = cmp.eq(%0, #1)\n\t"
+               "    if (p0.new) memh(%1+#4)=#27\n\t"
+               "}\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirhfnew_io(void *p, int pred)
+{
+  asm volatile("{\n\t"
+               "    p0 = cmp.eq(%0, #1)\n\t"
+               "    if (!p0.new) memh(%1+#4)=#27\n\t"
+               "}\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirit_io(void *p, int pred)
+{
+  asm volatile("p0 = cmp.eq(%0, #1)\n\t"
+               "if (p0) memw(%1+#4)=#27\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirif_io(void *p, int pred)
+{
+  asm volatile("p0 = cmp.eq(%0, #1)\n\t"
+               "if (!p0) memw(%1+#4)=#27\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeiritnew_io(void *p, int pred)
+{
+  asm volatile("{\n\t"
+               "    p0 = cmp.eq(%0, #1)\n\t"
+               "    if (p0.new) memw(%1+#4)=#27\n\t"
+               "}\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+static inline void S4_storeirifnew_io(void *p, int pred)
+{
+  asm volatile("{\n\t"
+               "    p0 = cmp.eq(%0, #1)\n\t"
+               "    if (!p0.new) memw(%1+#4)=#27\n\t"
+               "}\n\t"
+               :: "r"(pred), "r"(p)
+               : "p0", "memory");
+}
+
+/*
+ * Test that compound-compare-jump is executed in 2 parts
+ * First we have to do all the compares in the packet and
+ * account for auto-anding.  Then, we can do the predicated
+ * jump.
+ */
+static inline int cmpnd_cmp_jump(void)
+{
+    int retval;
+    asm ("r5 = #7\n\t"
+         "r6 = #9\n\t"
+         "{\n\t"
+         "    p0 = cmp.eq(r5, #7)\n\t"
+         "    if (p0.new) jump:nt 1f\n\t"
+         "    p0 = cmp.eq(r6, #7)\n\t"
+         "}\n\t"
+         "%0 = #12\n\t"
+         "jump 2f\n\t"
+         "1:\n\t"
+         "%0 = #13\n\t"
+         "2:\n\t"
+         : "=r"(retval) :: "r5", "r6", "p0");
+    return retval;
+}
+
+static inline int test_clrtnew(int arg1, int old_val)
+{
+  int ret;
+  asm volatile("r5 = %2\n\t"
+               "{\n\t"
+                   "p0 = cmp.eq(%1, #1)\n\t"
+                   "if (p0.new) r5=#0\n\t"
+               "}\n\t"
+               "%0 = r5\n\t"
+               : "=r"(ret)
+               : "r"(arg1), "r"(old_val)
+               : "p0", "r5");
+  return ret;
+}
+
+int err;
+
+static void check(int val, int expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%04x != 0x%04x\n", val, expect);
+        err++;
+    }
+}
+
+uint32_t init[10] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+uint32_t array[10];
+
+uint32_t early_exit;
+
+/*
+ * Write this as a function because we can't guarantee the compiler will
+ * allocate a frame with just the SL2_return_tnew packet.
+ */
+static void SL2_return_tnew(int x);
+asm ("SL2_return_tnew:\n\t"
+     "   allocframe(#0)\n\t"
+     "   r1 = #1\n\t"
+     "   memw(##early_exit) = r1\n\t"
+     "   {\n\t"
+     "       p0 = cmp.eq(r0, #1)\n\t"
+     "       if (p0.new) dealloc_return:nt\n\t"    /* SL2_return_tnew */
+     "   }\n\t"
+     "   r1 = #0\n\t"
+     "   memw(##early_exit) = r1\n\t"
+     "   dealloc_return\n\t"
+    );
+
+static long long creg_pair(int x, int y)
+{
+    long long retval;
+    asm ("m0 = %1\n\t"
+         "m1 = %2\n\t"
+         "%0 = c7:6\n\t"
+         : "=r"(retval) : "r"(x), "r"(y) : "m0", "m1");
+    return retval;
+}
+
+int main()
+{
+
+    memcpy(array, init, sizeof(array));
+    S4_storerhnew_rr(array, 4, 0xffff);
+    check(array[4], 0xffff);
+
+    data = ~0;
+    check((uint32_t)S4_storerbnew_ap(0x12), (uint32_t)&data);
+    check(data, 0xffffff12);
+
+    data = ~0;
+    check((uint32_t)S4_storerhnew_ap(0x1234), (uint32_t)&data);
+    check(data, 0xffff1234);
+
+    data = ~0;
+    check((uint32_t)S4_storerinew_ap(0x12345678), (uint32_t)&data);
+    check(data, 0x12345678);
+
+    /* Byte */
+    memcpy(array, init, sizeof(array));
+    S4_storeirbt_io(&array[1], 1);
+    check(array[2], 27);
+    S4_storeirbt_io(&array[2], 0);
+    check(array[3], 3);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeirbf_io(&array[3], 0);
+    check(array[4], 27);
+    S4_storeirbf_io(&array[4], 1);
+    check(array[5], 5);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeirbtnew_io(&array[5], 1);
+    check(array[6], 27);
+    S4_storeirbtnew_io(&array[6], 0);
+    check(array[7], 7);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeirbfnew_io(&array[7], 0);
+    check(array[8], 27);
+    S4_storeirbfnew_io(&array[8], 1);
+    check(array[9], 9);
+
+    /* Half word */
+    memcpy(array, init, sizeof(array));
+    S4_storeirht_io(&array[1], 1);
+    check(array[2], 27);
+    S4_storeirht_io(&array[2], 0);
+    check(array[3], 3);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeirhf_io(&array[3], 0);
+    check(array[4], 27);
+    S4_storeirhf_io(&array[4], 1);
+    check(array[5], 5);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeirhtnew_io(&array[5], 1);
+    check(array[6], 27);
+    S4_storeirhtnew_io(&array[6], 0);
+    check(array[7], 7);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeirhfnew_io(&array[7], 0);
+    check(array[8], 27);
+    S4_storeirhfnew_io(&array[8], 1);
+    check(array[9], 9);
+
+    /* Word */
+    memcpy(array, init, sizeof(array));
+    S4_storeirit_io(&array[1], 1);
+    check(array[2], 27);
+    S4_storeirit_io(&array[2], 0);
+    check(array[3], 3);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeirif_io(&array[3], 0);
+    check(array[4], 27);
+    S4_storeirif_io(&array[4], 1);
+    check(array[5], 5);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeiritnew_io(&array[5], 1);
+    check(array[6], 27);
+    S4_storeiritnew_io(&array[6], 0);
+    check(array[7], 7);
+
+    memcpy(array, init, sizeof(array));
+    S4_storeirifnew_io(&array[7], 0);
+    check(array[8], 27);
+    S4_storeirifnew_io(&array[8], 1);
+    check(array[9], 9);
+
+    int x = cmpnd_cmp_jump();
+    check(x, 12);
+
+    SL2_return_tnew(0);
+    check(early_exit, 0);
+    SL2_return_tnew(1);
+    check(early_exit, 1);
+
+    long long pair = creg_pair(5, 7);
+    check((int)pair, 5);
+    check((int)(pair >> 32), 7);
+
+    int res = test_clrtnew(1, 7);
+    check(res, 0);
+    res = test_clrtnew(2, 7);
+    check(res, 7);
+
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
diff --git a/tests/tcg/hexagon/preg_alias.c b/tests/tcg/hexagon/preg_alias.c
new file mode 100644
index 0000000000..0cac469b78
--- /dev/null
+++ b/tests/tcg/hexagon/preg_alias.c
@@ -0,0 +1,169 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdio.h>
+
+static inline int preg_alias(int v0, int v1, int v2, int v3)
+{
+  int ret;
+  asm volatile("p0 = %1\n\t"
+               "p1 = %2\n\t"
+               "p2 = %3\n\t"
+               "p3 = %4\n\t"
+               "%0 = C4\n"
+               : "=r"(ret)
+               : "r"(v0), "r"(v1), "r"(v2), "r"(v3)
+               : "p0", "p1", "p2", "p3");
+  return ret;
+}
+
+static inline int preg_alias_pair(int v0, int v1, int v2, int v3)
+{
+  long long c54;
+  asm volatile("p0 = %1\n\t"
+               "p1 = %2\n\t"
+               "p2 = %3\n\t"
+               "p3 = %4\n\t"
+               "%0 = C5:4\n"
+               : "=r"(c54)
+               : "r"(v0), "r"(v1), "r"(v2), "r"(v3)
+               : "p0", "p1", "p2", "p3");
+  return (int)c54;
+}
+
+typedef union {
+    int creg;
+    struct {
+      unsigned char p0;
+      unsigned char p1;
+      unsigned char p2;
+      unsigned char p3;
+    } pregs;
+} PRegs;
+
+static inline void creg_alias(int cval, PRegs *pregs)
+{
+  unsigned char val;
+  asm volatile("c4 = %0" : : "r"(cval));
+
+  asm volatile("%0 = p0" : "=r"(val));
+  pregs->pregs.p0 = val;
+  asm volatile("%0 = p1" : "=r"(val));
+  pregs->pregs.p1 = val;
+  asm volatile("%0 = p2" : "=r"(val));
+  pregs->pregs.p2 = val;
+  asm volatile("%0 = p3" : "=r"(val));
+  pregs->pregs.p3 = val;
+}
+
+int err;
+
+static void check(int val, int expect)
+{
+    if (val != expect) {
+        printf("ERROR: 0x%08x != 0x%08x\n", val, expect);
+        err++;
+    }
+}
+
+static inline void creg_alias_pair(unsigned int cval, PRegs *pregs)
+{
+  unsigned long long cval_pair = (0xdeadbeefULL << 32) | cval;
+  unsigned char val;
+  int c5;
+  asm volatile("c5:4 = %0" : : "r"(cval_pair));
+
+  asm volatile("%0 = p0" : "=r"(val));
+  pregs->pregs.p0 = val;
+  asm volatile("%0 = p1" : "=r"(val));
+  pregs->pregs.p1 = val;
+  asm volatile("%0 = p2" : "=r"(val));
+  pregs->pregs.p2 = val;
+  asm volatile("%0 = p3" : "=r"(val));
+  pregs->pregs.p3 = val;
+  asm volatile("%0 = c5" : "=r"(c5));
+  check(c5, 0xdeadbeef);
+}
+
+int main()
+{
+    int c4;
+    PRegs pregs;
+
+    c4 = preg_alias(0xff, 0x00, 0xff, 0x00);
+    check(c4, 0x00ff00ff);
+    c4 = preg_alias(0xff, 0x00, 0x00, 0x00);
+    check(c4, 0x000000ff);
+    c4 = preg_alias(0x00, 0xff, 0x00, 0x00);
+    check(c4, 0x0000ff00);
+    c4 = preg_alias(0x00, 0x00, 0xff, 0x00);
+    check(c4, 0x00ff0000);
+    c4 = preg_alias(0x00, 0x00, 0x00, 0xff);
+    check(c4, 0xff000000);
+    c4 = preg_alias(0xff, 0xff, 0xff, 0xff);
+    check(c4, 0xffffffff);
+
+    c4 = preg_alias_pair(0xff, 0x00, 0xff, 0x00);
+    check(c4, 0x00ff00ff);
+      c4 = preg_alias_pair(0xff, 0x00, 0x00, 0x00);
+    check(c4, 0x000000ff);
+    c4 = preg_alias_pair(0x00, 0xff, 0x00, 0x00);
+    check(c4, 0x0000ff00);
+    c4 = preg_alias_pair(0x00, 0x00, 0xff, 0x00);
+    check(c4, 0x00ff0000);
+    c4 = preg_alias_pair(0x00, 0x00, 0x00, 0xff);
+    check(c4, 0xff000000);
+    c4 = preg_alias_pair(0xff, 0xff, 0xff, 0xff);
+    check(c4, 0xffffffff);
+
+    creg_alias(0x00ff00ff, &pregs);
+    check(pregs.creg, 0x00ff00ff);
+    creg_alias(0x00ffff00, &pregs);
+    check(pregs.creg, 0x00ffff00);
+    creg_alias(0x00000000, &pregs);
+    check(pregs.creg, 0x00000000);
+    creg_alias(0xff000000, &pregs);
+    check(pregs.creg, 0xff000000);
+    creg_alias(0x00ff0000, &pregs);
+    check(pregs.creg, 0x00ff0000);
+    creg_alias(0x0000ff00, &pregs);
+    check(pregs.creg, 0x0000ff00);
+    creg_alias(0x000000ff, &pregs);
+    check(pregs.creg, 0x000000ff);
+    creg_alias(0xffffffff, &pregs);
+    check(pregs.creg, 0xffffffff);
+
+    creg_alias_pair(0x00ff00ff, &pregs);
+    check(pregs.creg, 0x00ff00ff);
+    creg_alias_pair(0x00ffff00, &pregs);
+    check(pregs.creg, 0x00ffff00);
+    creg_alias_pair(0x00000000, &pregs);
+    check(pregs.creg, 0x00000000);
+    creg_alias_pair(0xff000000, &pregs);
+    check(pregs.creg, 0xff000000);
+    creg_alias_pair(0x00ff0000, &pregs);
+    check(pregs.creg, 0x00ff0000);
+    creg_alias_pair(0x0000ff00, &pregs);
+    check(pregs.creg, 0x0000ff00);
+    creg_alias_pair(0x000000ff, &pregs);
+    check(pregs.creg, 0x000000ff);
+    creg_alias_pair(0xffffffff, &pregs);
+    check(pregs.creg, 0xffffffff);
+
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 10b7c84813..a54e3c7503 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -28,3 +28,18 @@ endif
 
 
 CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
+
+HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
+VPATH += $(HEX_SRC)
+
+first: $(HEX_SRC)/first.S
+	$(CC) -static -mv67 -nostdlib $^ -o $@
+
+HEX_TESTS = first
+HEX_TESTS += misc
+HEX_TESTS += preg_alias
+HEX_TESTS += dual_stores
+HEX_TESTS += mem_noshuf
+HEX_TESTS += atomics
+
+TESTS += $(HEX_TESTS)
diff --git a/tests/tcg/hexagon/first.S b/tests/tcg/hexagon/first.S
new file mode 100644
index 0000000000..e9f2d963ec
--- /dev/null
+++ b/tests/tcg/hexagon/first.S
@@ -0,0 +1,56 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define SYS_write		 64
+#define SYS_exit_group           94
+#define SYS_exit                 93
+
+#define FD_STDOUT                1
+
+	.type	str,@object
+	.section	.rodata
+str:
+	.string	"Hello!\n"
+	.size	str, 8
+
+.text
+.global _start
+_start:
+	r6 = #SYS_write
+	r0 = #FD_STDOUT
+	r1 = ##str
+	r2 = #7
+	trap0(#1)
+
+	r0 = #0
+	r6 = #SYS_exit_group
+	trap0(#1)
+
+.section ".note.ABI-tag", "a"
+.align 4
+.long 1f - 0f          /* name length */
+.long 3f - 2f          /* data length */
+.long  1               /* note type */
+
+/*
+ * vendor name seems like this should be MUSL but lldb doesn't agree.
+ */
+0:     .asciz "GNU"
+1:     .align 4
+2:     .long 0 /* linux */
+       .long 3,0,0
+3:     .align 4
-- 
2.25.1


