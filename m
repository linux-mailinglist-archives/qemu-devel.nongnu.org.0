Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77850B4FA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:26:50 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqUz-00036R-B2
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA0-0004um-OX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:08 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9z-0002qS-5J
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:08 -0400
Received: by mail-wm1-x332.google.com with SMTP id r19so4805479wmq.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l5uJxy4WfAzOW7qSBnV+0WxIG9WxiypmDb7cHj2F97M=;
 b=n4HQ57pzA89rxgqy9XnftRnmfbPKrlkiPHcoU57SL6YE3GU2knV/MWH3LtS8tQdHZ3
 XlobWnsboUmB15JFZ+PAbZ7/qNx2iF7kMOnMSxwNoaiO4yv+h+RcHShu95Bdlrx0DCFS
 3GSWI+mcQ7DZM2klgSOTmzrWav7esYRtQ6HGW26FRoqG41KnqrR5vucawmgMRsnhmKUA
 gmWlqC+/rA7iuh/eL0ZMrClaqotj8R9AHcAjBxpQxjrKaTu/ojVgUqvKqzRg5NC6HQt7
 YK6HxB7t+hG1GptKkE5PDBJ41bhS5pH3kpINwpsbVUZOyfwx4fPXbMDi7BYCI1/RuGwc
 PcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5uJxy4WfAzOW7qSBnV+0WxIG9WxiypmDb7cHj2F97M=;
 b=G2RlnRc0D9R989kftBzgR6Mdrcky3wkqNQhYJALCHUuoSnL4751vG1J0hHcTzxxg7E
 mLVUMuSIiJ9cr+3Vbov2KbHEBdrUrNm1jOpWeQa+KJyKTJlUnjDENfp04DIK920vk1P2
 bufVhrD+jI93sXbc3AA99Y66VMJRzd/r/wW7QzH2uwaqQDD8v0WGvbb7Vg22yWa2FD1/
 Az8iblFT1KRbUMDljyigPn3X6ZB2T/TueHHKVKThHcCTW94v3uGhX/SVHc58qiwHYYUI
 B40DlMHuYBs94TUAW0z9ZMp/VKjnAam0aih4W8OMCCYwsMYTRfA+/QxwxF1VBTmGfDpe
 IxnA==
X-Gm-Message-State: AOAM532pp5TZYaHvPXYaXPTBty52+8Z/Lk8nJ1oEIL/9xN0BSu/QXBQ0
 kjQn3G039851Pwfj8AiKMYRZ7PADLmRpgw==
X-Google-Smtp-Source: ABdhPJyCoj8SNUi4OxGNdnNp5CAjL4T7UCWukYJ7oFlpnJSvpztawKVwrZwjmJRJv5hOdnFHaGEEsg==
X-Received: by 2002:a1c:2904:0:b0:37b:ea53:4cbf with SMTP id
 p4-20020a1c2904000000b0037bea534cbfmr3428761wmp.46.1650621905830; 
 Fri, 22 Apr 2022 03:05:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/61] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_mov_vlpi()
Date: Fri, 22 Apr 2022 11:04:05 +0100
Message-Id: <20220422100432.2288247-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Implement the gicv3_redist_mov_vlpi() function (previously left as a
stub).  This function handles the work of a VMOVI command: it marks
the vLPI not-pending on the source and pending on the destination.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-35-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 2c4a87318bc..78dcdcc7621 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1067,9 +1067,25 @@ void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
                            int irq, int doorbell)
 {
     /*
-     * The redistributor handling for moving a VLPI will be added
-     * in a subsequent commit.
+     * Move the specified vLPI's pending state from the source redistributor
+     * to the destination.
      */
+    if (!set_pending_table_bit(src, src_vptaddr, irq, 0)) {
+        /* Not pending on source, nothing to do */
+        return;
+    }
+    if (vcpu_resident(src, src_vptaddr) && irq == src->hppvlpi.irq) {
+        /*
+         * Update src's cached highest-priority pending vLPI if we just made
+         * it not-pending
+         */
+        gicv3_redist_update_vlpi(src);
+    }
+    /*
+     * Mark the vLPI pending on the destination (ringing the doorbell
+     * if the vCPU isn't resident)
+     */
+    gicv3_redist_process_vlpi(dest, irq, dest_vptaddr, doorbell, irq);
 }
 
 void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
-- 
2.25.1


