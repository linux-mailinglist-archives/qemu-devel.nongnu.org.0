Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194655BE84
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:51:36 +0200 (CEST)
Received: from localhost ([::1]:60102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o648N-0000qg-CW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kq-0002wY-OY
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:23:13 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62ko-0003y6-ES
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:23:12 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 128so10862369pfv.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=vCmVON94gl4G2Y+bZqxMm2Q6igB/O8sZ2JUs3RBmf801kLb5ANfdrNhXCBXTbrE6rW
 FWusndL4okxMTEPF4rG/gqF98GgFESQyNff6kLeV+YUKxUG0JQ3jB44UsmusDAIBDcri
 GyU5QzfdziOzDODjTHuV2TPgZ1fyaC3BsR+aF2KJISanHuZFu+qVYcC0a4VHyiKArgNz
 Yp2PcOtQwCMbv0w3bhXSXIGG1M2XfhfFFwooQn0jfaWrTn6YABzYS3KrWLcO66lKHnAE
 TA0l4mP5w8x1mEQrcNESjCGGIWstPNYEOQ8Ci5Ok/i1kPjvTzb9cQJXOE2S8irQZcWot
 6XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=1k0N6LaWqj0u0ThkIpAHAxpDLDBgdLlnaRkqc4G765IrbVCXoNppnvTEhZZBfPDjpe
 dvEUKC7GnK60Q0/r+Sxjlm6prWsIYJ34bOOWGYRx+D8BGG/0aDYOsQq/rFwVJcNJ7L+h
 /YyoK8x3F2WrZaJO1xxzVNM0nkaGoDCWdXF696Sc6RNl4VmxKZ/13y1J8eBcxU4jt9zb
 P2XPw5jUXL2UZaiDAI3BWPZ6nBYFZzyUl1O6JKVlIAq0hZwbVN++4wX79I1fhjk1MJlV
 FeIOVuvFcPVecZSU3pINDzv9B9J4ivo4sW8CL8PGh7if9nxUv7qUX3RMfH//vkqdXORn
 VKgw==
X-Gm-Message-State: AJIora9vdGNTZmZ6n6sKcxLxcgc3NYF9JSSxePKAe/k8Zs5NF4Bk60QH
 QXcg5ao1IkqrZKVYF8wYvlC4xiWgbzZMlQ==
X-Google-Smtp-Source: AGRyM1vD4Kr4MyesWIWXYFCX96gR/7VAL40Vhfp1QgF9NAI/pCZT8CnXyaHDOS0XIG1miIpPnPPbwA==
X-Received: by 2002:a63:1759:0:b0:40d:5aba:4bb0 with SMTP id
 25-20020a631759000000b0040d5aba4bb0mr16085440pgx.496.1656390175165; 
 Mon, 27 Jun 2022 21:22:55 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 39/45] linux-user/aarch64: Move sve record checks into
 restore
Date: Tue, 28 Jun 2022 09:51:11 +0530
Message-Id: <20220628042117.368549-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Move the checks out of the parsing loop and into the
restore function.  This more closely mirrors the code
structure in the kernel, and is slightly clearer.

Reject rather than silently skip incorrect VL and SVE record sizes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 9ff79da4be..22d0b8b4ec 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -250,12 +250,36 @@ static void target_restore_fpsimd_record(CPUARMState *env,
     }
 }
 
-static void target_restore_sve_record(CPUARMState *env,
-                                      struct target_sve_context *sve, int vq)
+static bool target_restore_sve_record(CPUARMState *env,
+                                      struct target_sve_context *sve,
+                                      int size)
 {
-    int i, j;
+    int i, j, vl, vq;
 
-    /* Note that SVE regs are stored as a byte stream, with each byte element
+    if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        return false;
+    }
+
+    __get_user(vl, &sve->vl);
+    vq = sve_vq(env);
+
+    /* Reject mismatched VL. */
+    if (vl != vq * TARGET_SVE_VQ_BYTES) {
+        return false;
+    }
+
+    /* Accept empty record -- used to clear PSTATE.SM. */
+    if (size <= sizeof(*sve)) {
+        return true;
+    }
+
+    /* Reject non-empty but incomplete record. */
+    if (size < TARGET_SVE_SIG_CONTEXT_SIZE(vq)) {
+        return false;
+    }
+
+    /*
+     * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
      * of our 64-bit hunks.
      */
@@ -277,6 +301,7 @@ static void target_restore_sve_record(CPUARMState *env,
             }
         }
     }
+    return true;
 }
 
 static int target_restore_sigframe(CPUARMState *env,
@@ -287,7 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    int vq = 0, sve_size = 0;
+    int sve_size = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -321,15 +346,9 @@ static int target_restore_sigframe(CPUARMState *env,
             if (sve || size < sizeof(struct target_sve_context)) {
                 goto err;
             }
-            if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = sve_vq(env);
-                sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (size == sve_size) {
-                    sve = (struct target_sve_context *)ctx;
-                    break;
-                }
-            }
-            goto err;
+            sve = (struct target_sve_context *)ctx;
+            sve_size = size;
+            break;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
@@ -362,8 +381,8 @@ static int target_restore_sigframe(CPUARMState *env,
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
-    if (sve) {
-        target_restore_sve_record(env, sve, vq);
+    if (sve && !target_restore_sve_record(env, sve, sve_size)) {
+        goto err;
     }
     unlock_user(extra, extra_datap, 0);
     return 0;
-- 
2.34.1


