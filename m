Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F4D50B57E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:44:48 +0200 (CEST)
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqmN-0007lw-Sy
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA3-0004xw-1C
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:11 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9x-0002pn-J3
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id r19so4805432wmq.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Fd3KVJcBKmzClgCV6dFquqvBXsUvGLaOK7cLjXe1F7c=;
 b=BLXX2csiLGOBJC0uhGqiuzQG5ybKZPT78oJ5pqQCEHb6oobkX0HEV83QFnTYZStJnU
 WGzgl9boRn8VWGSXh8P4seUQUGFP7ZMshXHxR+4tOoljmLvCfxUJj9RBnHWxFkXmjIB9
 9JgMmbLyGpc+fJ1ecxB6zumd1TvK01v15ikC1FZRNgyv9RIFmT+dLvAdG27KWyRLsjI7
 V6K12NYZdB7GpOMwpN0UjSxJ3CYbUEqbIB1XGnnw8eTi18UZNlPUyiZlysgZ+GWYB9M3
 iDJFVDCxDVvLePpX5+wRhwOC486A0CHN2z1Np7S6PZ6O6ipEljz70qYYcNspafABkN6/
 UX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fd3KVJcBKmzClgCV6dFquqvBXsUvGLaOK7cLjXe1F7c=;
 b=Ge0ZjIqQ910uVD5B287QC1CI2hJ0b49k6hvhdb9P3u2u58N1uSumTqbXyszuZUY5gg
 mCHwDjh+qqOdoLBqnFAlSQg1rFEC+pXwTpo4YwALp2WxN/BIBwzdUqnfJVsTaneX8Nci
 y96fFct9aTl6I7YVAueX9y51tabSS6bOytb6W7Y6BIBsU1ZrhOPsMtmw4D8n/rmIAn83
 z4Yd8tQCUnvJxL6yJ/27kWaqkb2gTNsR9Wv0QmF+F0ghYFK2up9GRrqq/qKqNq25jpJ3
 lTnU7yp2HLpawBSwAzRWs+De6bLIJ7wa8Jofc6TlCNPlj5XbsGRXMNvvsuAb7imD2CF6
 TXuw==
X-Gm-Message-State: AOAM533718NbcQCFo8aXeVdgJboyROVx+I02bo4iWWjgn5T+CN/bBppj
 0XNJmiNB7S86YX3aYHiR48Trrt4dnkkodQ==
X-Google-Smtp-Source: ABdhPJyeH6xZNMLr3mO5DUGVdIXFbpOtBlVHt4TqRHDEUnCdSkSfk07loeTjxjToQU+tx4RGIhsa6Q==
X-Received: by 2002:a05:600c:a06:b0:392:a4f2:2097 with SMTP id
 z6-20020a05600c0a0600b00392a4f22097mr12706970wmp.97.1650621904141; 
 Fri, 22 Apr 2022 03:05:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/61] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vlpi_pending()
Date: Fri, 22 Apr 2022 11:04:03 +0100
Message-Id: <20220422100432.2288247-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Implement the function gicv3_redist_vlpi_pending(), which was
previously left as a stub.  This is the function that is called by
the CPU interface when it changes the state of a vLPI.  It's similar
to gicv3_redist_process_vlpi(), but we know that the vCPU is
definitely resident on the redistributor and the irq is in range, so
it is a bit simpler.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-33-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 1ed251b87be..0fbb04f9986 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1009,9 +1009,28 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
 void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
 {
     /*
-     * The redistributor handling for changing the pending state
-     * of a vLPI will be added in a subsequent commit.
+     * Change the pending state of the specified vLPI.
+     * Unlike gicv3_redist_process_vlpi(), we know here that the
+     * vCPU is definitely resident on this redistributor, and that
+     * the irq is in range.
      */
+    uint64_t vptbase, ctbase;
+
+    vptbase = FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, PHYADDR) << 16;
+
+    if (set_pending_table_bit(cs, vptbase, irq, level)) {
+        if (level) {
+            /* Check whether this vLPI is now the best */
+            ctbase = cs->gicr_vpropbaser & R_GICR_VPROPBASER_PHYADDR_MASK;
+            update_for_one_lpi(cs, irq, ctbase, true, &cs->hppvlpi);
+            gicv3_cpuif_virt_irq_fiq_update(cs);
+        } else {
+            /* Only need to recalculate if this was previously the best vLPI */
+            if (irq == cs->hppvlpi.irq) {
+                gicv3_redist_update_vlpi(cs);
+            }
+        }
+    }
 }
 
 void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
-- 
2.25.1


