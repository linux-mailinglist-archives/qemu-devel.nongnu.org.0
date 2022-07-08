Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B256BE58
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:52:01 +0200 (CEST)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9rCy-0000y7-5j
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDG-000618-0j
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:14 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDD-0002VH-PQ
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:13 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s27so22651756pga.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwqfXs1ctqU0QGS8GCRxY+Fnt9l80nbupzRO9DnIL6Y=;
 b=v0tapvvjc/RSRu8EnB650HvpopRNbuUYSXh6pl4cfi/QTYviVdu9TzuHKXJ59YqFCv
 qFjTx5+QZHe6TGX7HgibiT3dzzUXwU3vtfScGb4Qo2iPYeZFhsKsnZ0LaUQi0hRHYrHw
 MwHD+RNE7vNM0uXMKfEPjW8QE8u33wdcEikX6w0z8axIY92/q7jzLuF6zrj8UUtHiX/h
 hlBahTo7hl3B0BTzqWJVnuoLOHSapnB/2+M5oL8eWL6PSzUFr7c0+YtK31sWDsaKAL9a
 v9wKVVi3Bd8kWi9RIu3yi0NQxL3JPMbdspw+k0vIb8e4Squr23zJVdkUPH7TSHA+ZV7/
 AMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwqfXs1ctqU0QGS8GCRxY+Fnt9l80nbupzRO9DnIL6Y=;
 b=m9wdXQ/qSq8+ZjmWIh9cEyPAykZgJ4XKNKrdHs26qJYHBZl8a/TwIXPxEGfSjRyWqs
 4+BB4X/Zrwzk+p3B7SlgnrveguPoBIL+or2nbCEWoV/CtDykGxFRuf+a6E2PI5+xKoRf
 S318bPclOSFXYoXetk1TpJenkE6dAGZ13s0mzV0E942SFzmp9ZJiHAIHGn84DGkhiNnI
 0WSQRyUglTdCQewbS668U77N81dCEmPlTL3vXpPU0jY5gqLGd+bLuYKYjPZWA1gJDlJp
 ll8cQxbnL9K4RJwh/HxoCZcJAx8QNxpb5asyGLWsR54BHFh1I5CX3O58UPIAu0CkLIcV
 doMA==
X-Gm-Message-State: AJIora/Ie7AX1zPgIxSmUYZFDP1ZEjV0p8QPCZ3zFYsr3Af+EcN95KdN
 +9oruta7maPasGvUkA/YEdr5+qiZPk36gF+r
X-Google-Smtp-Source: AGRyM1vqd7nO7YcyTDCFfHK2ndJAIXjElMmdlpAItGHBFx8ecIN9DVWv7dqhJ0wKOENi6cnEXPYAwA==
X-Received: by 2002:a05:6a00:f0e:b0:528:1b63:c9be with SMTP id
 cr14-20020a056a000f0e00b005281b63c9bemr4562339pfb.61.1657295290997; 
 Fri, 08 Jul 2022 08:48:10 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 21/29] aarch64: Use arch_init to configure sve
Date: Fri,  8 Jul 2022 21:16:52 +0530
Message-Id: <20220708154700.18682-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Adjust some of the aarch64 code to look at the reginfo struct
instead of looking at test_sve, so that we do not need to pass
the --test-sve option in order to dump sve trace files.

Diagnose EINVAL as either cpu or kernel does not support SVE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h                 |  1 +
 risu.c                 |  3 +++
 risu_reginfo_aarch64.c | 31 ++++++++++++++++++++-----------
 risu_reginfo_arm.c     |  4 ++++
 risu_reginfo_i386.c    |  4 ++++
 risu_reginfo_m68k.c    |  4 ++++
 risu_reginfo_ppc64.c   |  4 ++++
 7 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/risu.h b/risu.h
index 3cad3d5..bdb70c1 100644
--- a/risu.h
+++ b/risu.h
@@ -23,6 +23,7 @@
 extern const struct option * const arch_long_opts;
 extern const char * const arch_extra_help;
 void process_arch_opt(int opt, const char *arg);
+void arch_init(void);
 #define FIRST_ARCH_OPT   0x100
 
 /* GCC computed include to pull in the correct risu_reginfo_*.h for
diff --git a/risu.c b/risu.c
index a70b778..1c096a8 100644
--- a/risu.c
+++ b/risu.c
@@ -617,6 +617,9 @@ int main(int argc, char **argv)
 
     load_image(imgfile);
 
+    /* E.g. select requested SVE vector length. */
+    arch_init();
+
     if (ismaster) {
         return master();
     } else {
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 81a77ba..be47980 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -19,6 +19,7 @@
 #include <stdbool.h>
 #include <inttypes.h>
 #include <assert.h>
+#include <errno.h>
 #include <sys/prctl.h>
 
 #include "risu.h"
@@ -37,8 +38,6 @@ const char * const arch_extra_help
 
 void process_arch_opt(int opt, const char *arg)
 {
-    long want, got;
-
     assert(opt == FIRST_ARCH_OPT);
     test_sve = strtol(arg, 0, 10);
 
@@ -46,16 +45,26 @@ void process_arch_opt(int opt, const char *arg)
         fprintf(stderr, "Invalid value for VQ (1-%d)\n", SVE_VQ_MAX);
         exit(EXIT_FAILURE);
     }
-    want = sve_vl_from_vq(test_sve);
-    got = prctl(PR_SVE_SET_VL, want);
-    if (want != got) {
-        if (got < 0) {
-            perror("prctl PR_SVE_SET_VL");
-        } else {
-            fprintf(stderr, "Unsupported value for VQ (%d != %d)\n",
-                    test_sve, (int)sve_vq_from_vl(got));
+}
+
+void arch_init(void)
+{
+    long want, got;
+
+    if (test_sve) {
+        want = sve_vl_from_vq(test_sve);
+        got = prctl(PR_SVE_SET_VL, want);
+        if (want != got) {
+            if (got >= 0) {
+                fprintf(stderr, "Unsupported VQ for SVE (%d != %d)\n",
+                        test_sve, (int)sve_vq_from_vl(got));
+            } else if (errno == EINVAL) {
+                fprintf(stderr, "System does not support SVE\n");
+            } else {
+                perror("prctl PR_SVE_SET_VL");
+            }
+            exit(EXIT_FAILURE);
         }
-        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/risu_reginfo_arm.c b/risu_reginfo_arm.c
index 47c52e8..202120b 100644
--- a/risu_reginfo_arm.c
+++ b/risu_reginfo_arm.c
@@ -36,6 +36,10 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
+void arch_init(void)
+{
+}
+
 int reginfo_size(struct reginfo *ri)
 {
     return sizeof(*ri);
diff --git a/risu_reginfo_i386.c b/risu_reginfo_i386.c
index 50505ab..e9730be 100644
--- a/risu_reginfo_i386.c
+++ b/risu_reginfo_i386.c
@@ -74,6 +74,10 @@ void process_arch_opt(int opt, const char *arg)
     }
 }
 
+void arch_init(void)
+{
+}
+
 int reginfo_size(struct reginfo *ri)
 {
     return sizeof(*ri);
diff --git a/risu_reginfo_m68k.c b/risu_reginfo_m68k.c
index 4eb30cd..4c25e77 100644
--- a/risu_reginfo_m68k.c
+++ b/risu_reginfo_m68k.c
@@ -23,6 +23,10 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
+void arch_init(void)
+{
+}
+
 int reginfo_size(struct reginfo *ri)
 {
     return sizeof(*ri);
diff --git a/risu_reginfo_ppc64.c b/risu_reginfo_ppc64.c
index 39e8f1c..c80e387 100644
--- a/risu_reginfo_ppc64.c
+++ b/risu_reginfo_ppc64.c
@@ -32,6 +32,10 @@ void process_arch_opt(int opt, const char *arg)
     abort();
 }
 
+void arch_init(void)
+{
+}
+
 int reginfo_size(struct reginfo *ri)
 {
     return sizeof(*ri);
-- 
2.34.1


