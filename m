Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DD2208C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 00:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRllZ-0001jp-7F
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 18:55:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.bobek@gmail.com>) id 1hRlbN-0001MI-HK
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.bobek@gmail.com>) id 1hRlbL-0005hC-OU
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:21 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:37681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hRlbL-0005g0-IG
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:19 -0400
Received: by mail-yb1-xb41.google.com with SMTP id p134so3241429ybc.4
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 15:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GAv4G2PUfIt35FCB0/KIHsJkbnKZpm2yjnfZz6BlY9k=;
	b=e1/58Ttjfxq38pEBI0xyF0NC47hPdjqCkrBFIZgBjUNdEgKRb0hUrW48z50PbmB0TC
	miKhBCq2uEPZXuBWVw06U1i+3eHiDncvkmbnDF8jhOUZfWNZdriJqXPUtyVH0zh8Ab6u
	1w68Kq1Kf3Zp+8yWqRrZUyt0BF6O6Vhm9hfRCwYhp0oiYsqA8VH71w2xnign9WFynTWt
	w1bw9Otgz2VwjOGTR8Go/hBEPSi6Ke3COSxOHtZPfj+p3SZ04r8bAOT6HKYnY/rOld+D
	s+5mD4w4ckULIY4JB8+fvEviGbB/wmKMyoO+utswLGeBnRwUD+fPEd1s58bMRRSgn8mq
	B62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GAv4G2PUfIt35FCB0/KIHsJkbnKZpm2yjnfZz6BlY9k=;
	b=rQ7DpzuvNupTTEEJtmRV1VgQV708xh8iyjfHmZgByywAyYXF50QsFvnR1wjj7EvueL
	EJesf35Imp0X9KS3buoqpjVDKTyM3SGpUTiiZgldWJrn/9SFdZjeH9iKE9MqPBukNpaG
	Nw2eDVlJpNdoYQbRNLuoGUxn/Phx7217aIW1iJlhfy8REUP2WqgCLwIg2H4iuGK3+W7j
	y8o+RpxYkXDNuQ7Ehw19NWBTooI69pLeWm3htVxEG2CeEn7kfsWxKWFirQcuenMpx5lH
	dZ2LlPEXgA6RBeHSvb/s5vBHA9A6fTJQXfRQTegiCrPKgR2+XMFu88WQA31jaqdj2qZK
	+hqQ==
X-Gm-Message-State: APjAAAUcGEqeiN92MOc/SZBjIp2cG4h/4G5je25lgXdh1lLxeElCzMBr
	ezugpbNcuH1O4qV0gMiYhVw2OQKEqSLxzg==
X-Google-Smtp-Source: APXvYqwYBxDYOMp9yksnIWZTVZ4LKfZXOvYGI7pm4/wqWBaczJAbxWeNVHq/Q9lQxfgCs01Uao4saQ==
X-Received: by 2002:a25:420b:: with SMTP id p11mr26869175yba.179.1558133118784;
	Fri, 17 May 2019 15:45:18 -0700 (PDT)
Received: from dionysus.attlocal.net
	(69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
	by smtp.gmail.com with ESMTPSA id
	u73sm2480260ywf.62.2019.05.17.15.45.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 15:45:18 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 18:44:48 -0400
Message-Id: <20190517224450.15566-10-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517224450.15566-1-jan.bobek@gmail.com>
References: <20190517224450.15566-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: [Qemu-devel] [RISU v2 09/11] i386: Add avx512 state to reginfo_t
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
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The state expected for a given test must be specifically requested
with the --xfeatures=mask command-line argument.  This is recorded
with the saved state so that it is obvious if the apprentice is given
a different argument.  Any features beyond what are present on the
running cpu will read as zero.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_i386.h |  14 +++
 risu_reginfo_i386.c | 228 ++++++++++++++++++++++++++++++++++++++++++--
 test_i386.S         |  39 ++++++++
 3 files changed, 273 insertions(+), 8 deletions(-)

diff --git a/risu_reginfo_i386.h b/risu_reginfo_i386.h
index e350f01..b468f79 100644
--- a/risu_reginfo_i386.h
+++ b/risu_reginfo_i386.h
@@ -12,6 +12,10 @@
 #ifndef RISU_REGINFO_I386_H
 #define RISU_REGINFO_I386_H
 
+struct avx512_reg {
+    uint64_t q[8];
+};
+
 /*
  * This is the data structure we pass over the socket.
  * It is a simplified and reduced subset of what can
@@ -19,7 +23,17 @@
  */
 struct reginfo {
     uint32_t faulting_insn;
+    uint32_t mxcsr;
+    uint64_t xfeatures;
+
     gregset_t gregs;
+
+#ifdef __x86_64__
+    struct avx512_reg vregs[32];
+#else
+    struct avx512_reg vregs[8];
+#endif
+    uint64_t kregs[8];
 };
 
 /*
diff --git a/risu_reginfo_i386.c b/risu_reginfo_i386.c
index c4dc14a..35ff7c8 100644
--- a/risu_reginfo_i386.c
+++ b/risu_reginfo_i386.c
@@ -11,19 +11,32 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <stddef.h>
 #include <string.h>
 #include <ucontext.h>
 #include <assert.h>
+#include <cpuid.h>
 
 #include "risu.h"
 #include "risu_reginfo_i386.h"
 
-const struct option * const arch_long_opts;
-const char * const arch_extra_help;
+#include <asm/sigcontext.h>
+
+static uint64_t xfeatures = 3;  /* SSE */
+
+static const struct option extra_ops[] = {
+    {"xfeatures", required_argument, NULL, FIRST_ARCH_OPT },
+    {0, 0, 0, 0}
+};
+
+const struct option * const arch_long_opts = extra_ops;
+const char * const arch_extra_help
+    = "  --xfeatures=<mask>  Use features in mask for XSAVE\n";
 
 void process_arch_opt(int opt, const char *arg)
 {
-    abort();
+    assert(opt == FIRST_ARCH_OPT);
+    xfeatures = strtoull(arg, 0, 0);
 }
 
 const int reginfo_size(void)
@@ -31,13 +44,37 @@ const int reginfo_size(void)
     return sizeof(struct reginfo);
 }
 
+static void *xsave_feature_buf(struct _xstate *xs, int feature)
+{
+    unsigned int eax, ebx, ecx, edx;
+    int ok;
+
+    /*
+     * Get the location of the XSAVE feature from the cpuid leaf.
+     * Given that we know the xfeature bit is set, this must succeed.
+     */
+    ok = __get_cpuid_count(0xd, feature, &eax, &ebx, &ecx, &edx);
+    assert(ok);
+
+    /* Sanity check that the frame stored by the kernel contains the data. */
+    assert(xs->fpstate.sw_reserved.extended_size >= eax + ebx);
+
+    return (void *)xs + ebx;
+}
+
 /* reginfo_init: initialize with a ucontext */
 void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 {
-    int i;
+    int i, nvecregs;
+    struct _fpstate *fp;
+    struct _xstate *xs;
+    uint64_t features;
 
     memset(ri, 0, sizeof(*ri));
 
+    /* Require master and apprentice to be given the same arguments.  */
+    ri->xfeatures = xfeatures;
+
     for (i = 0; i < NGREG; i++) {
         switch (i) {
         case REG_E(IP):
@@ -79,12 +116,89 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
      * distinguish 'do compare' from 'stop'.
      */
     ri->faulting_insn = *(uint32_t *)uc->uc_mcontext.gregs[REG_E(IP)];
+
+    /*
+     * FP state is omitted if unused (aka in init state).
+     * Use the <asm/sigcontext.h> struct for access to AVX state.
+     */
+
+    fp = (struct _fpstate *)uc->uc_mcontext.fpregs;
+    if (fp == NULL) {
+        return;
+    }
+
+#ifdef __x86_64__
+    nvecregs = 16;
+#else
+    /* We don't (currently) care about the 80387 state, only SSE+.  */
+    if (fp->magic != X86_FXSR_MAGIC) {
+        return;
+    }
+    nvecregs = 8;
+#endif
+
+    /*
+     * Now we know that _fpstate contains FXSAVE data.
+     */
+    ri->mxcsr = fp->mxcsr;
+
+    for (i = 0; i < nvecregs; ++i) {
+#ifdef __x86_64__
+        memcpy(&ri->vregs[i], &fp->xmm_space[i], 16);
+#else
+        memcpy(&ri->vregs[i], &fp->_xmm[i * 4], 16);
+#endif
+    }
+
+    if (fp->sw_reserved.magic1 != FP_XSTATE_MAGIC1) {
+        return;
+    }
+    xs = (struct _xstate *)fp;
+    features = xfeatures & xs->xstate_hdr.xfeatures;
+
+    /*
+     * Now we know that _fpstate contains XSAVE data.
+     */
+
+    if (features & (1 << 2)) {
+        /* YMM_Hi128 state */
+        void *buf = xsave_feature_buf(xs, 2);
+        for (i = 0; i < nvecregs; ++i) {
+            memcpy(&ri->vregs[i].q[2], buf + 16 * i, 16);
+        }
+    }
+
+    if (features & (1 << 5)) {
+        /* Opmask state */
+        uint64_t *buf = xsave_feature_buf(xs, 5);
+        for (i = 0; i < 8; ++i) {
+            ri->kregs[i] = buf[i];
+        }
+    }
+
+    if (features & (1 << 6)) {
+        /* ZMM_Hi256 state */
+        void *buf = xsave_feature_buf(xs, 6);
+        for (i = 0; i < nvecregs; ++i) {
+            memcpy(&ri->vregs[i].q[4], buf + 32 * i, 32);
+        }
+    }
+
+#ifdef __x86_64__
+    if (features & (1 << 7)) {
+        /* Hi16_ZMM state */
+        void *buf = xsave_feature_buf(xs, 7);
+        for (i = 0; i < 16; ++i) {
+            memcpy(&ri->vregs[i + 16], buf + 64 * i, 64);
+        }
+    }
+#endif
 }
 
 /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
 int reginfo_is_eq(struct reginfo *m, struct reginfo *a)
 {
-    return 0 == memcmp(m, a, sizeof(*m));
+    return !memcmp(m, a, sizeof(*m));
 }
 
 static const char *const regname[NGREG] = {
@@ -126,28 +240,126 @@ static const char *const regname[NGREG] = {
 # define PRIxREG   "%08x"
 #endif
 
+static int get_nvecregs(uint64_t features)
+{
+#ifdef __x86_64__
+    return features & (1 << 7) ? 32 : 16;
+#else
+    return 8;
+#endif
+}
+
+static int get_nvecquads(uint64_t features)
+{
+    if (features & (1 << 6)) {
+        return 8;
+    } else if (features & (1 << 2)) {
+        return 4;
+    } else {
+        return 2;
+    }
+}
+
+static char get_vecletter(uint64_t features)
+{
+    if (features & (1 << 6 | 1 << 7)) {
+        return 'z';
+    } else if (features & (1 << 2)) {
+        return 'y';
+    } else {
+        return 'x';
+    }
+}
+
 /* reginfo_dump: print state to a stream, returns nonzero on success */
 int reginfo_dump(struct reginfo *ri, FILE *f)
 {
-    int i;
+    uint64_t features;
+    int i, j, n, w;
+    char r;
+
     fprintf(f, "  faulting insn %x\n", ri->faulting_insn);
     for (i = 0; i < NGREG; i++) {
         if (regname[i]) {
             fprintf(f, "  %-6s: " PRIxREG "\n", regname[i], ri->gregs[i]);
         }
     }
+
+    fprintf(f, "  mxcsr : %x\n", ri->mxcsr);
+    fprintf(f, "  xfeat : %" PRIx64 "\n", ri->xfeatures);
+
+    features = ri->xfeatures;
+    n = get_nvecregs(features);
+    w = get_nvecquads(features);
+    r = get_vecletter(features);
+
+    for (i = 0; i < n; i++) {
+        fprintf(f, "  %cmm%-3d: ", r, i);
+        for (j = w - 1; j >= 0; j--) {
+            fprintf(f, "%016" PRIx64 "%c",
+                    ri->vregs[i].q[j], j == 0 ? '\n' : ' ');
+        }
+    }
+
+    if (features & (1 << 5)) {
+        for (i = 0; i < 8; i++) {
+            fprintf(f, "  k%-5d: %016" PRIx64 "\n", i, ri->kregs[i]);
+        }
+    }
+
     return !ferror(f);
 }
 
 int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
 {
-    int i;
+    int i, j, n, w;
+    uint64_t features;
+    char r;
+
+    fprintf(f, "Mismatch (master v apprentice):\n");
+
     for (i = 0; i < NGREG; i++) {
         if (m->gregs[i] != a->gregs[i]) {
             assert(regname[i]);
-            fprintf(f, "Mismatch: %s: " PRIxREG " v " PRIxREG "\n",
+            fprintf(f, "  %-6s: " PRIxREG " v " PRIxREG "\n",
                     regname[i], m->gregs[i], a->gregs[i]);
         }
     }
+
+    if (m->mxcsr != a->mxcsr) {
+        fprintf(f, "  mxcsr : %x v %x\n", m->mxcsr, a->mxcsr);
+    }
+    if (m->xfeatures != a->xfeatures) {
+        fprintf(f, "  xfeat : %" PRIx64 " v %" PRIx64 "\n",
+                m->xfeatures, a->xfeatures);
+    }
+
+    features = m->xfeatures;
+    n = get_nvecregs(features);
+    w = get_nvecquads(features);
+    r = get_vecletter(features);
+
+    for (i = 0; i < n; i++) {
+        if (memcmp(&m->vregs[i], &a->vregs[i], w * 8)) {
+            fprintf(f, "  %cmm%-3d: ", r, i);
+            for (j = w - 1; j >= 0; j--) {
+                fprintf(f, "%016" PRIx64 "%c",
+                        m->vregs[i].q[j], j == 0 ? '\n' : ' ');
+            }
+            fprintf(f, "       v: ");
+            for (j = w - 1; j >= 0; j--) {
+                fprintf(f, "%016" PRIx64 "%c",
+                        a->vregs[i].q[j], j == 0 ? '\n' : ' ');
+            }
+        }
+    }
+
+    for (i = 0; i < 8; i++) {
+        if (m->kregs[i] != a->kregs[i]) {
+            fprintf(f, "  k%-5d: %016" PRIx64 " v %016" PRIx64 "\n",
+                    i, m->kregs[i], a->kregs[i]);
+        }
+    }
+
     return !ferror(f);
 }
diff --git a/test_i386.S b/test_i386.S
index 456b99c..05344d7 100644
--- a/test_i386.S
+++ b/test_i386.S
@@ -12,6 +12,37 @@
 /* A trivial test image for x86 */
 
 /* Initialise the registers to avoid spurious mismatches */
+
+#ifdef __x86_64__
+#define BASE	%rax
+	lea	2f(%rip), BASE
+#else
+#define BASE	%eax
+	call	1f
+1:	pop	BASE
+	add	$2f-1b, BASE
+#endif
+
+	movdqa	0(BASE), %xmm0
+	movdqa	1*16(BASE), %xmm1
+	movdqa	2*16(BASE), %xmm2
+	movdqa	3*16(BASE), %xmm3
+	movdqa	4*16(BASE), %xmm4
+	movdqa	5*16(BASE), %xmm5
+	movdqa	6*16(BASE), %xmm6
+	movdqa	7*16(BASE), %xmm7
+
+#ifdef __x86_64__
+	movdqa	8*16(BASE), %xmm8
+	movdqa	9*16(BASE), %xmm9
+	movdqa	10*16(BASE), %xmm10
+	movdqa	11*16(BASE), %xmm11
+	movdqa	12*16(BASE), %xmm12
+	movdqa	13*16(BASE), %xmm13
+	movdqa	14*16(BASE), %xmm14
+	movdqa	15*16(BASE), %xmm15
+#endif
+
 	xor	%eax, %eax
 	sahf				/* init eflags */
 
@@ -39,3 +70,11 @@
 
 /* exit test */
 	ud1	%ecx, %eax
+
+	.p2align 16
+2:
+	.set	i, 0
+	.rept	256
+	.byte	i
+	.set	i, i + 1
+	.endr
-- 
2.20.1


