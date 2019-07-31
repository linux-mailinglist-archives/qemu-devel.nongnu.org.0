Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95987CEF2
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 22:42:58 +0200 (CEST)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsvR4-0004gz-5L
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 16:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60763)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hsvMg-0004ES-FT
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 16:38:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hsvMf-0003NM-Ep
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 16:38:26 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42595)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hsvMf-0003Mt-9Y
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 16:38:25 -0400
Received: by mail-pg1-x541.google.com with SMTP id t132so32632353pgb.9
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VC440BcwSuqOKz+Fo7ui0w+dupEF68UzkVylEVc+WDs=;
 b=I9uyMOU3oEdwC4uca/HtLL2zKp2V2rvHGUrb1UsT+oOlm1DEvz2TAK+0wpTiyUukX+
 BBfUCM+XSFoCKDZwKc0WTIlFyX4mk7eziMk3HgGDslZ3yQTRDf0zrVxE7hldTwZ4q6Zl
 Nwb8wjypqFtUFir+gZ2lbYle8UY09BKUXUxuJbSImbMnzznNPUjkGdOODCOkHwPVv17L
 ZKz5VWjIortAYA6H3X6Vrw73ZG9kbrScFVshp7eSCsM6mc5GSWG3PMhg0+mttZLRmP/9
 OeozOhiGC1hOjujJZz7LAg1mqcjBRxUIe6W5k10hgcsFdxEquKzjsL6ooDvAEqphzXVq
 aUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VC440BcwSuqOKz+Fo7ui0w+dupEF68UzkVylEVc+WDs=;
 b=QMPRt0qFk6Sm9uXlnSVh9mvmHyjN8TE/ElqqZbenZVYPrJtDv7Fc3788BAG0V6r+Db
 dHQxIuiFT0Pq3150sPYPWldL5YLmMhCbXkrfAOmubPNKGFmjwicZe2xg0aDSfkIdRN/A
 JDQUN95U/qp8dMlH4aKQqynEcUnwD7BnYKaztJ7W0zbNV8vDs0RX/6IRWKyBzHOC/BpZ
 CX3ZWpcgHM7ktmYK26n7rgy8hAZmDLNQHo3hwYaQOMizPTu+FeQ6YYWDYZvtAAfwM3Gh
 Ig40Mv+dyzGagWKEhvrHa3kew8wiKKPrZZ/uD+MYAKsq0LagQ9nkfTi4FNctfh7ax4Fx
 U10Q==
X-Gm-Message-State: APjAAAWDnfST4Xrc0HiYXP7uSlZS8CYIPJGOXfxTrIjHTAEyngS3ucYT
 YCRsnFcoEWcXLcGCG2CTTp20eDceGO0=
X-Google-Smtp-Source: APXvYqxrwIjjz+PLHlGQZcyrMabdgwhqnqTo3z5N8wLK59zia+OByOKST1v4zmMxJUlLtpWwLacpzg==
X-Received: by 2002:aa7:91cc:: with SMTP id z12mr49207441pfa.76.1564605504020; 
 Wed, 31 Jul 2019 13:38:24 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 13:38:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 13:37:48 -0700
Message-Id: <20190731203813.30765-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v2 07/32] target/arm: Enable HCR_E2H for VHE
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 7 -------
 target/arm/helper.c | 6 +++++-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e6a76d14c6..e37008a4f7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1366,13 +1366,6 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define HCR_ATA       (1ULL << 56)
 #define HCR_DCT       (1ULL << 57)
 
-/*
- * When we actually implement ARMv8.1-VHE we should add HCR_E2H to
- * HCR_MASK and then clear it again if the feature bit is not set in
- * hcr_write().
- */
-#define HCR_MASK      ((1ULL << 34) - 1)
-
 #define SCR_NS                (1U << 0)
 #define SCR_IRQ               (1U << 1)
 #define SCR_FIQ               (1U << 2)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 65e3ffbb43..9a18ecf8f6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4623,7 +4623,8 @@ static const ARMCPRegInfo el3_no_el2_v8_cp_reginfo[] = {
 static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
-    uint64_t valid_mask = HCR_MASK;
+    /* Begin with bits defined in base ARMv8.0.  */
+    uint64_t valid_mask = MAKE_64BIT_MASK(0, 34);
 
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         valid_mask &= ~HCR_HCD;
@@ -4637,6 +4638,9 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
          */
         valid_mask &= ~HCR_TSC;
     }
+    if (cpu_isar_feature(aa64_vh, cpu)) {
+        valid_mask |= HCR_E2H;
+    }
     if (cpu_isar_feature(aa64_lor, cpu)) {
         valid_mask |= HCR_TLOR;
     }
-- 
2.17.1


