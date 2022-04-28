Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701BB51382F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:21:52 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5xn-0006Rv-Go
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K6-0005dr-6L
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:50 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K4-0006VR-EJ
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:49 -0400
Received: by mail-wr1-x434.google.com with SMTP id u3so7098562wrg.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mYyODwFcMHLdN9TkUuzBBFcMGJ14nt1LpKq9Utsp+38=;
 b=kw///7V2s7mfLTcZjEAa9r1DEw93Lra5NsRZn+Ik2MTM5OoWdk2lPHb5U1oaGFsfs+
 AG6dt1OSfMFbEKh8UKeXrhzlomjXvnDSmuDD7nvUvJ7iD5fdBspbbHqn0APUAldTM1Vu
 tR/Uo5Z9lErhQM5IqZDmwNu2k6opW9nkPRhz0mCG+A11vabAAz9WhHhuA/Uf5JWzsnmz
 SNJIQerXDNWyeUCfEJPRJHqIYADRxUdFI73kAw4YQw53hcVxIYFsCc5SL15gcUHFof5s
 UHVdHZgKjPVoUxU0gfdatWPTyBPQHdUHV1yZ1cyIIISIImRirxvdk/5wfvTJobP1Yy5N
 mQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mYyODwFcMHLdN9TkUuzBBFcMGJ14nt1LpKq9Utsp+38=;
 b=MzRL2XtGZmBnLdTcBAtML9cAnQI+NtPvwVHKQiy+VPvQS6nMbdkullpA+uewPn32c0
 tBBylqUeNs/8vgWdX/iNZEmJ26vEdESwL9ptG+wZqL6kMqDx9Cnp5lkWM/6XMo9kaATc
 HeBJakY2cuT2t/dJ8h5mBrWiH8DXIRIf9pESXVvG/jA/sWAblIdG1G89F8k6DZKEsyrW
 ZQT7bJv9TAzSVp/4Q6ADL1znIJjV9lOgXy5RRwBnMReO01/yIjvjhka/5zUMchdMhl8D
 CZcAGG7lNTllcKYWT6pVQ6R5NmJLHtswIzfw/LZP7kUQxe1D9YeSJHKux3jJ8Tuo8oXv
 CH4g==
X-Gm-Message-State: AOAM5315LknYoIaJmktyXZLYh4krQErAlkDT3USgE9mqnm1K3vQPgN5S
 4ozs5RO0Gp2KuzCr27vtPryp/+SblKIKKQ==
X-Google-Smtp-Source: ABdhPJyZNvADBvFlcI6Fj+RxM4NMUALAIdXWSq+MECO69BnL3E/dSAF65k5pMT63YoMTee+qoLq9OQ==
X-Received: by 2002:a5d:6d89:0:b0:20a:9beb:9477 with SMTP id
 l9-20020a5d6d89000000b0020a9beb9477mr26265827wrs.142.1651156847083; 
 Thu, 28 Apr 2022 07:40:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/54] target/arm: Use field names for accessing DBGWCRn
Date: Thu, 28 Apr 2022 15:39:53 +0100
Message-Id: <20220428143958.2451229-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

While defining these names, use the correct field width of 5 not 4 for
DBGWCR.MASK.  This typo prevented setting a watchpoint larger than 32k.

Reported-by: Chris Howard <cvz185@web.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220427051926.295223-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h    | 12 ++++++++++++
 target/arm/debug_helper.c | 10 +++++-----
 target/arm/helper.c       |  8 ++++----
 target/arm/kvm64.c        | 14 +++++++-------
 4 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 9556e3b29e4..255833479d4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -81,6 +81,18 @@ FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
  */
 #define FNC_RETURN_MIN_MAGIC 0xfefffffe
 
+/* Bit definitions for DBGWCRn and DBGWCRn_EL1 */
+FIELD(DBGWCR, E, 0, 1)
+FIELD(DBGWCR, PAC, 1, 2)
+FIELD(DBGWCR, LSC, 3, 2)
+FIELD(DBGWCR, BAS, 5, 8)
+FIELD(DBGWCR, HMC, 13, 1)
+FIELD(DBGWCR, SSC, 14, 2)
+FIELD(DBGWCR, LBN, 16, 4)
+FIELD(DBGWCR, WT, 20, 1)
+FIELD(DBGWCR, MASK, 24, 5)
+FIELD(DBGWCR, SSCE, 29, 1)
+
 /* We use a few fake FSR values for internal purposes in M profile.
  * M profile cores don't have A/R format FSRs, but currently our
  * get_phys_addr() code assumes A/R profile and reports failures via
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 32f3caec238..46893697cc7 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -143,9 +143,9 @@ static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
      * Non-Secure to simplify the code slightly compared to the full
      * table in the ARM ARM.
      */
-    pac = extract64(cr, 1, 2);
-    hmc = extract64(cr, 13, 1);
-    ssc = extract64(cr, 14, 2);
+    pac = FIELD_EX64(cr, DBGWCR, PAC);
+    hmc = FIELD_EX64(cr, DBGWCR, HMC);
+    ssc = FIELD_EX64(cr, DBGWCR, SSC);
 
     switch (ssc) {
     case 0:
@@ -184,8 +184,8 @@ static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
         g_assert_not_reached();
     }
 
-    wt = extract64(cr, 20, 1);
-    lbn = extract64(cr, 16, 4);
+    wt = FIELD_EX64(cr, DBGWCR, WT);
+    lbn = FIELD_EX64(cr, DBGWCR, LBN);
 
     if (wt && !linked_bp_matches(cpu, lbn)) {
         return false;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 63397bbac1d..5a244c3ed93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6320,12 +6320,12 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         env->cpu_watchpoint[n] = NULL;
     }
 
-    if (!extract64(wcr, 0, 1)) {
+    if (!FIELD_EX64(wcr, DBGWCR, E)) {
         /* E bit clear : watchpoint disabled */
         return;
     }
 
-    switch (extract64(wcr, 3, 2)) {
+    switch (FIELD_EX64(wcr, DBGWCR, LSC)) {
     case 0:
         /* LSC 00 is reserved and must behave as if the wp is disabled */
         return;
@@ -6344,7 +6344,7 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
      * CONSTRAINED UNPREDICTABLE; we opt to ignore BAS in this case,
      * thus generating a watchpoint for every byte in the masked region.
      */
-    mask = extract64(wcr, 24, 4);
+    mask = FIELD_EX64(wcr, DBGWCR, MASK);
     if (mask == 1 || mask == 2) {
         /* Reserved values of MASK; we must act as if the mask value was
          * some non-reserved value, or as if the watchpoint were disabled.
@@ -6361,7 +6361,7 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         wvr &= ~(len - 1);
     } else {
         /* Watchpoint covers bytes defined by the byte address select bits */
-        int bas = extract64(wcr, 5, 8);
+        int bas = FIELD_EX64(wcr, DBGWCR, BAS);
         int basstart;
 
         if (extract64(wvr, 2, 1)) {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 17dd2f77d9f..b8cfaf5782a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -208,7 +208,7 @@ static int insert_hw_watchpoint(target_ulong addr,
                                 target_ulong len, int type)
 {
     HWWatchpoint wp = {
-        .wcr = 1, /* E=1, enable */
+        .wcr = R_DBGWCR_E_MASK, /* E=1, enable */
         .wvr = addr & (~0x7ULL),
         .details = { .vaddr = addr, .len = len }
     };
@@ -221,19 +221,19 @@ static int insert_hw_watchpoint(target_ulong addr,
      * HMC=0 SSC=0 PAC=3 will hit EL0 or EL1, any security state,
      * valid whether EL3 is implemented or not
      */
-    wp.wcr = deposit32(wp.wcr, 1, 2, 3);
+    wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, PAC, 3);
 
     switch (type) {
     case GDB_WATCHPOINT_READ:
-        wp.wcr = deposit32(wp.wcr, 3, 2, 1);
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 1);
         wp.details.flags = BP_MEM_READ;
         break;
     case GDB_WATCHPOINT_WRITE:
-        wp.wcr = deposit32(wp.wcr, 3, 2, 2);
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 2);
         wp.details.flags = BP_MEM_WRITE;
         break;
     case GDB_WATCHPOINT_ACCESS:
-        wp.wcr = deposit32(wp.wcr, 3, 2, 3);
+        wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, LSC, 3);
         wp.details.flags = BP_MEM_ACCESS;
         break;
     default:
@@ -252,8 +252,8 @@ static int insert_hw_watchpoint(target_ulong addr,
             int bits = ctz64(len);
 
             wp.wvr &= ~((1 << bits) - 1);
-            wp.wcr = deposit32(wp.wcr, 24, 4, bits);
-            wp.wcr = deposit32(wp.wcr, 5, 8, 0xff);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, MASK, bits);
+            wp.wcr = FIELD_DP64(wp.wcr, DBGWCR, BAS, 0xff);
         } else {
             return -ENOBUFS;
         }
-- 
2.25.1


