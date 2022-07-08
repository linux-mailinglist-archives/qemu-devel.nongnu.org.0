Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A25156BE0F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:13:50 +0200 (CEST)
Received: from localhost ([::1]:49784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qc1-0003Rf-JH
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDT-0006Xf-IH
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDR-0002bj-QT
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:27 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so2311843pjm.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gkz60hItXrZkNCsstqfCphoprTGAep7xB2MfvanXt1s=;
 b=vQ0vn6lMzOSY8bE1bJ27YtqaxETWdngV19L7OhPVSGe8mwa8cEZXeI7o39TIrWQ1J4
 HpSSn725Vlq5IBcFVmKp8B5mnBc+abHk2erfFzkhfZsIU3I9vOQkD3ADiddLRYVPEF94
 RIde31578iVTd4gjlaoz6pmBZMVfM0ImVDf4U6X6SSMAwU8Wg4dx9pgAvWSJpFitOIhU
 bPWkRoKFpP/Fz502BvqNEZKjKz8r4gAufzTpSYIRqdKztEdtNbvBhv07msFHkfSul2H5
 xDhvQykmfLJKHq49x7Kcn0upa4aXhchFXEYsfVP5r2u0HoJVGBJoLhPQd3sR6uqUGnMw
 yWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gkz60hItXrZkNCsstqfCphoprTGAep7xB2MfvanXt1s=;
 b=jKVvSEGU7/hqFpopgyU0yDGHvOozlH+ekRSAgnLdCMthPJOW/Qk1bWxLNeWxRCTlxT
 kS/DTD6qzgxnBQz5ZcrttOhYJZqUmoE+AcreB+npaF3ddo5Z37KC4esabinmR7jNMa+8
 7U0qQsrnJOqEnr1DiR4QwROgBmJak/CB9pMuaYUsDgftFitwjKvCb845cMNKkX3Cs5p6
 zEg3E3ef6notrMFLVEdlacO3KWW+r+nmEVr8Gz2wgOQn8RgXFn4kkukqAWKt21e4HS9y
 y3R+3H3qDlC26IAhcfL06Sm4o4ejBVTvNicDqZ5w3Qo+DcCeBHFvLcuXkd2QgOdCIGLB
 fL5w==
X-Gm-Message-State: AJIora9fxlrdilLsjCclqFvGqYTwSAwjqkP8mGb15byBG+U52Dy9FqpO
 HaldAY/eIUiFzuZzqDKBkXPcUERZayvz91ye
X-Google-Smtp-Source: AGRyM1vH6C5aimmb2hsEbEvGQKwpU0JgDxaWC050V6MedN+ypelwnknnU8kRUWC/4K3SpOHmPvBf4Q==
X-Received: by 2002:a17:90a:dc01:b0:1ef:e3bd:a473 with SMTP id
 i1-20020a17090adc0100b001efe3bda473mr489405pjv.129.1657295304517; 
 Fri, 08 Jul 2022 08:48:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 26/29] ppc64: Clean up reginfo handling
Date: Fri,  8 Jul 2022 21:16:57 +0530
Message-Id: <20220708154700.18682-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Several of the gp_reg[] elements are not relevant -- e.g. orig r3,
which is related to system calls.  Omit those from the original
reginfo_init(), so that any differences are automatically hidden.

Do not only compare bit 4 of CCR -- this register is 32 bits wide
with 8 cr subfields.  We should compare all of them.

Tidy reginfo_dump() output.  Especially, do not dump the non-
relevant fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_ppc64.c | 114 +++++++++++++++++--------------------------
 1 file changed, 44 insertions(+), 70 deletions(-)

diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index 134a152..eeb0460 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -21,19 +21,30 @@
 #include "risu.h"
 #include "risu_reginfo_ppc64.h"
 
-#define XER 37
-#define CCR 38
+/* Names for indexes within gregset_t, ignoring those irrelevant here */
+enum {
+    NIP = 32,
+    MSR = 33,
+    CTR = 35,
+    LNK = 36,
+    XER = 37,
+    CCR = 38,
+};
 
 const struct option * const arch_long_opts;
 const char * const arch_extra_help;
 
 static const char * const greg_names[NGREG] = {
-    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
-    "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
-   "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
-   "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
-   [XER] = "xer",
-   [CCR] = "ccr",
+     "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
+     "r8",  "r9", "r10", "r11", "r12", "r13", "r14", "r15",
+    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
+    "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
+    [NIP] = "nip",
+    [MSR] = "msr",
+    [CTR] = "ctr",
+    [LNK] = "lnk",
+    [XER] = "xer",
+    [CCR] = "ccr",
 };
 
 void process_arch_opt(int opt, const char *arg)
@@ -61,8 +72,13 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
     ri->nip = uc->uc_mcontext.regs->nip - image_start_address;
 
     for (i = 0; i < NGREG; i++) {
-        ri->gregs[i] = uc->uc_mcontext.gp_regs[i];
+        /* Do not copy gp_reg entries not relevant to the context. */
+        if (greg_names[i]) {
+            ri->gregs[i] = uc->uc_mcontext.gp_regs[i];
+        }
     }
+    ri->gregs[1] = 0xdeadbeef;   /* sp */
+    ri->gregs[13] = 0xdeadbeef;  /* gp */
 
     memcpy(ri->fpregs, uc->uc_mcontext.fp_regs, 32 * sizeof(double));
     ri->fpscr = uc->uc_mcontext.fp_regs[32];
@@ -76,79 +92,37 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 /* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
 int reginfo_is_eq(struct reginfo *m, struct reginfo *a)
 {
-    int i;
-    for (i = 0; i < 32; i++) {
-        if (i == 1 || i == 13) {
-            continue;
-        }
-
-        if (m->gregs[i] != a->gregs[i]) {
-            return 0;
-        }
-    }
-
-    if (m->gregs[XER] != a->gregs[XER]) {
-        return 0;
-    }
-
-    if ((m->gregs[CCR] & 0x10) != (a->gregs[CCR] & 0x10)) {
-        return 0;
-    }
-
-    for (i = 0; i < 32; i++) {
-        if (m->fpregs[i] != a->fpregs[i]) {
-            return 0;
-        }
-    }
-
-    for (i = 0; i < 32; i++) {
-        if (m->vrregs.vrregs[i][0] != a->vrregs.vrregs[i][0] ||
-            m->vrregs.vrregs[i][1] != a->vrregs.vrregs[i][1] ||
-            m->vrregs.vrregs[i][2] != a->vrregs.vrregs[i][2] ||
-            m->vrregs.vrregs[i][3] != a->vrregs.vrregs[i][3]) {
-            return 0;
-        }
-    }
-    return 1;
+    return memcmp(m, a, sizeof(*m)) == 0;
 }
 
 /* reginfo_dump: print state to a stream */
 void reginfo_dump(struct reginfo *ri, FILE * f)
 {
-    int i;
+    const char *sep;
+    int i, j;
 
-    fprintf(f, "  faulting insn 0x%x\n", ri->faulting_insn);
-    fprintf(f, "  prev insn     0x%x\n", ri->prev_insn);
-    fprintf(f, "  prev addr    0x%" PRIx64 "\n\n", ri->nip);
+    fprintf(f, "%6s: %08x\n", "insn", ri->faulting_insn);
+    fprintf(f, "%6s: %016lx\n", "pc", ri->nip);
 
-    for (i = 0; i < 16; i++) {
-        fprintf(f, "\tr%2d: %16lx\tr%2d: %16lx\n", i, ri->gregs[i],
-                i + 16, ri->gregs[i + 16]);
+    sep = "";
+    for (i = j = 0; i < NGREG; i++) {
+        if (greg_names[i] != NULL) {
+            fprintf(f, "%s%6s: %016lx", sep, greg_names[i], ri->gregs[i]);
+            sep = (++j & 1 ? "  " : "\n");
+        }
     }
 
-    fprintf(f, "\n");
-    fprintf(f, "\tnip    : %16lx\n", ri->gregs[32]);
-    fprintf(f, "\tmsr    : %16lx\n", ri->gregs[33]);
-    fprintf(f, "\torig r3: %16lx\n", ri->gregs[34]);
-    fprintf(f, "\tctr    : %16lx\n", ri->gregs[35]);
-    fprintf(f, "\tlnk    : %16lx\n", ri->gregs[36]);
-    fprintf(f, "\txer    : %16lx\n", ri->gregs[37]);
-    fprintf(f, "\tccr    : %16lx\n", ri->gregs[38]);
-    fprintf(f, "\tmq     : %16lx\n", ri->gregs[39]);
-    fprintf(f, "\ttrap   : %16lx\n", ri->gregs[40]);
-    fprintf(f, "\tdar    : %16lx\n", ri->gregs[41]);
-    fprintf(f, "\tdsisr  : %16lx\n", ri->gregs[42]);
-    fprintf(f, "\tresult : %16lx\n", ri->gregs[43]);
-    fprintf(f, "\tdscr   : %16lx\n\n", ri->gregs[44]);
-
-    for (i = 0; i < 16; i++) {
-        fprintf(f, "\tf%2d: %016lx\tf%2d: %016lx\n", i, ri->fpregs[i],
-                i + 16, ri->fpregs[i + 16]);
+    sep = "\n";
+    for (i = j = 0; i < 32; i++) {
+        fprintf(f, "%s%*s%d: %016lx",
+                sep, 6 - (i < 10 ? 1 : 2), "f", i, ri->fpregs[i]);
+        sep = (++j & 1 ? "  " : "\n");
     }
-    fprintf(f, "\tfpscr: %016lx\n\n", ri->fpscr);
+    fprintf(f, "\n%6s: %016lx\n", "fpscr", ri->fpscr);
 
     for (i = 0; i < 32; i++) {
-        fprintf(f, "vr%02d: %8x, %8x, %8x, %8x\n", i,
+        fprintf(f, "%*s%d: %08x %08x %08x %08x\n",
+                6 - (i < 10 ? 1 : 2), "vr", i,
                 ri->vrregs.vrregs[i][0], ri->vrregs.vrregs[i][1],
                 ri->vrregs.vrregs[i][2], ri->vrregs.vrregs[i][3]);
     }
-- 
2.34.1


