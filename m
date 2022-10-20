Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D5606B64
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:43:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleGB-0004Pd-2R
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:43:31 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleAS-0000Uc-5c
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleAH-0000F0-U9
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:26 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA7-00017g-Iu
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:37:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id z20so612541plb.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TRvaNvsxkIyI+6L2sKpSFAFlaxf212k23hAjvLhwT4=;
 b=l5y5Xj6QjYjejFuDIfDO3pzPlVOAyDhiJlLDTsdsqRR3/V5duR4ODLpXgmPq+mKBL1
 01hMO1cBdLZEnBhYOLQh4IfPZnQFz1rwRO9EVJA9fJ9GxWe0ljp5areZkXnQtbDUWUsR
 lsrJmJLzXzO0zp+GGQv5YoqGig22Wk5UqER2HsCNz2zfPlUKJlGNUJf5MiKAtuVuWEc4
 nTGyc/nDMP6dY1YHgl5Hjv2M0BA4E1htJ9AiZJhWRn8bhrgUTcG9erJs08M+7tK0Payd
 BkrmVAM6nH3C/6tsl2jxiG3m8jdfii1YEZ4OY3ORYoFLEGfrq1HMgo0FdyFp2UUc9wud
 F6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TRvaNvsxkIyI+6L2sKpSFAFlaxf212k23hAjvLhwT4=;
 b=WdqcKTZMUaV707hi9WmNc6XsrR5dJD8+UODQZHo7OP3D/BYez2q3hsej3ol6Z9+Dpm
 KHSfLm2RizF6FAKgFsyRiJZN+zdrViVv1XtfeOQA8ESyXKNliTPeWgQpxKwjDeaPDRSR
 uKD7QYRFJZa6lpvWaIf/t8/WUK72kdpnF4NiWoEMSrvaxa1L/PKEsE49cL1ZJ7eAZmAm
 7mQrlag2bcEBVhMpqbTrXd1ihybr2CvdVRLfe6sL19Na9FfFiOWaM5wrNCYXLTq8JrIE
 A+8wmS42mGv2xVCl06KbLyY125UFiYaxy/P6KoZotVHfOlpXZzAfUb14YWZ7PzMVuOg7
 8sFw==
X-Gm-Message-State: ACrzQf3N7usTX4lExqXdY7UfoKELs5F90I/jEyRqfX2mtc8jT9J0/+mF
 RW0MUVpL2HK8xSoWmnaZZoyNPrsn6e2YUdO0
X-Google-Smtp-Source: AMsMyM6vegigWZuyjLyt8suFKUUsyuie+9ptUR5bR5J3D6HmUlyejCxyChylKsoyOMn2K6ThKYVLuw==
X-Received: by 2002:a17:90a:d390:b0:20d:3b10:3811 with SMTP id
 q16-20020a17090ad39000b0020d3b103811mr54938873pju.211.1666305432956; 
 Thu, 20 Oct 2022 15:37:12 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:37:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 14/14] target/arm: Use the max page size in a 2-stage ptw
Date: Fri, 21 Oct 2022 08:35:48 +1000
Message-Id: <20221020223548.2310496-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

We had only been reporting the stage2 page size.  This causes
problems if stage1 is using a larger page size (16k, 2M, etc),
but stage2 is using a smaller page size, because cputlb does
not set large_page_{addr,mask} properly.

Fix by using the max of the two page sizes.

Reported-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1c1f0bfa1a..26aeea8507 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2589,7 +2589,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    ARMMMUFaultInfo *fi)
 {
     hwaddr ipa;
-    int s1_prot;
+    int s1_prot, s1_lgpgsz;
     bool is_secure = ptw->in_secure;
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
@@ -2625,6 +2625,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
      * Save the stage1 results so that we may merge prot and cacheattrs later.
      */
     s1_prot = result->f.prot;
+    s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
@@ -2639,6 +2640,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         return ret;
     }
 
+    /*
+     * Use the maximum of the S1 & S2 page size, so that invalidation
+     * of pages > TARGET_PAGE_SIZE works correctly.
+     */
+    if (result->f.lg_page_size < s1_lgpgsz) {
+        result->f.lg_page_size = s1_lgpgsz;
+    }
+
     /* Combine the S1 and S2 cache attributes. */
     hcr = arm_hcr_el2_eff_secstate(env, is_secure);
     if (hcr & HCR_DC) {
-- 
2.34.1


