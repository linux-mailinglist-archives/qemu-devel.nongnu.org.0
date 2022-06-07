Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9922541ADC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:39:44 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygvP-0003Gm-PW
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfx0-0007YC-0I
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:18 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwr-0008MM-4V
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:17 -0400
Received: by mail-pf1-x432.google.com with SMTP id u2so16519165pfc.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=q8spuEpNSiC5KQFE3GOsN7tYvcrEC/bl2kgFDlo/ElW12e4k7pylrE2D9twSnFWeYU
 X1tzK2EFh75lJs5PTpwVG7eCl9oCDxPnKZz9ZeMlkcv4OrEa8EZanBxWRj7OMNlMHlIX
 cza+ZHx6QaKRu/dkwVsUPXLL+ZdDCglXRwwx4SP5UHrTCuUe4MBFAM3OgaHETTVqwsWj
 9+hZJneML3V8njnfVxwjuhAPxtOfy4pzMxoY+UE0BiIpbDuWILEaUUPiRPa0lXOA4qk/
 SwDnU1swwLPtnf6XBoo/oLl0HGARQfCiwRMQnqKL/Ox9DYFprPOvNs1tAQECVInmQKu6
 j7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=WMqzDeM/z6iF/W/vYu0t/HvmARhYa1ldQlI98NKGE73TeNvZdCXyRG0E3yYlnM1h0W
 QMVcd9eYKzUgmuesGiEu1YjGwSgdEw+I3Ta66/CXNyufR53FnrpiNSCuxqJxmj+xTkCI
 yIrq+01TMB99IN+IMqzE9MTNj4Wx9fA0lPXuFMfRm5mU07lnLxM0zvARhUUMfUkyHEB9
 XY4Q8Xtys/W7m2p1EqKJZVsol8J1XXYh9POHJXrzXlfA+/RfPvLbnYtf2Gt3k0XFC5SP
 vjrORzjEcPRSsgmbQCphetLujfyHWxxe5cddhyXTVNCAk2TNiG5jfDrLacXxu6JkcHkr
 Z9kw==
X-Gm-Message-State: AOAM5336eqop6HarpCMBhtEkDOCjNXStyQlWA48SVdIO0carElNY6Fh2
 m6maPJioB4EotEtAiwlFvlUmXxMICazIlg==
X-Google-Smtp-Source: ABdhPJx6guHcnZFnR65GhHV2GLzF9iJNHQhw1yo583NNF7Tw+R37BvUL4P7cpkdTCiLRhDNI+0nwJg==
X-Received: by 2002:a63:f915:0:b0:3fd:876b:808e with SMTP id
 h21-20020a63f915000000b003fd876b808emr14116646pgi.403.1654634227784; 
 Tue, 07 Jun 2022 13:37:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 65/71] linux-user/aarch64: Move sve record checks into
 restore
Date: Tue,  7 Jun 2022 13:33:00 -0700
Message-Id: <20220607203306.657998-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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


