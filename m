Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB04F9871
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:44:22 +0200 (CEST)
Received: from localhost ([::1]:35576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpqX-0004oa-N0
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0007AN-Qy
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPU-0002Qp-Dq
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v2so2199332wrv.13
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wpIByKslkvTJxYsYScwOMJpdk5pjHsxRK95xfG0789k=;
 b=URmm8zLvhnhaNtRBq6dMCHm2MZzdbzqw0qTKFcHyJXcz5TRGwmsSk1utsj0KclXTy/
 HAFJpTN8ZKJ+u7+nUVP6HbNFzZ6TNkn9xCnf4tSlktwAvP5JdJndKaV0+/KoRqil9Xp/
 f0j54EvbTcwk/MmUFMyIj7AEiYyv0OoeH1uz0b6r3qwm2iN0EVCmkVCQyrrRMohGHqUb
 ar8JndPEGS8icEs4lpl9KPQsGAZcwpQOyhhJCFu3kq2gXml/IXdK/UiJnbceLHzaxeUq
 V9WNT6FGlunCk7dp/aw6M07vMdFLtkG+apuYDiNeUoYSdayQ5RaYErEXY6CcSEh6GBSk
 I9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpIByKslkvTJxYsYScwOMJpdk5pjHsxRK95xfG0789k=;
 b=ivmlybucrHHUPB4TIeWF9H2JHrd2qmBM1jyASmZ7xiYSSqWpffVYwTQ/nNp0BktoLz
 mwDxwpXHlKfYBcBkeVjfpQIfyvvA7u6eZg1AoLKC1Kq18DP/GTtOFp+LluiIyd4+2coC
 VC1CQBH6fEmQX9t9JkTFhLel83FueetzEFc1HbpFGfHBJhBkNCkXWoolMQmGn11Tjv7f
 7KmEe6LC0CFFrainYYmuzafPeQTDpV9A1u/SLs7n6d+v15KB54+c3AtEtGULXx3MUjNE
 Hm05Km58oVccNxrJTNuIB/NRM2MPBpuo01UVbSHAwyIs9pZWbY6ZJVP53PZ/nnXYcNSj
 Kokw==
X-Gm-Message-State: AOAM532/3UDgp5/DouU/IWvPVDRhbW8CLahWA73mqid5MuzHsPJe7DtG
 5BRf5O6F15iaFm8zQTWIqf5zww==
X-Google-Smtp-Source: ABdhPJwFWWOsuvKAmwejlVWS+lAcpCfRa3rdUobehhebMVrJbcTLGGmum4nzkwXv+DZYz1gzBBOjig==
X-Received: by 2002:a05:6000:12c6:b0:206:100e:16f2 with SMTP id
 l6-20020a05600012c600b00206100e16f2mr14733206wrx.644.1649427381955; 
 Fri, 08 Apr 2022 07:16:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 31/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_process_vlpi()
Date: Fri,  8 Apr 2022 15:15:40 +0100
Message-Id: <20220408141550.1271295-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the function gicv3_redist_process_vlpi(), which was left as
just a stub earlier.  This function deals with being handed a VLPI by
the ITS.  It must set the bit in the pending table.  If the vCPU is
currently resident we must recalculate the highest priority pending
vLPI; otherwise we may need to ring a "doorbell" interrupt to let the
hypervisor know it might want to reschedule the vCPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 48 ++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 64e5d96ac36..be36978b45c 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -60,6 +60,19 @@ static uint32_t gicr_read_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
     return reg;
 }
 
+static bool vcpu_resident(GICv3CPUState *cs, uint64_t vptaddr)
+{
+    /*
+     * Return true if a vCPU is resident, which is defined by
+     * whether the GICR_VPENDBASER register is marked VALID and
+     * has the right virtual pending table address.
+     */
+    if (!FIELD_EX64(cs->gicr_vpendbaser, GICR_VPENDBASER, VALID)) {
+        return false;
+    }
+    return vptaddr == (cs->gicr_vpendbaser & R_GICR_VPENDBASER_PHYADDR_MASK);
+}
+
 /**
  * update_for_one_lpi: Update pending information if this LPI is better
  *
@@ -1004,10 +1017,37 @@ void gicv3_redist_vlpi_pending(GICv3CPUState *cs, int irq, int level)
 void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
                                int doorbell, int level)
 {
-    /*
-     * The redistributor handling for being handed a VLPI by the ITS
-     * will be added in a subsequent commit.
-     */
+    bool bit_changed;
+    bool resident = vcpu_resident(cs, vptaddr);
+    uint64_t ctbase;
+
+    if (resident) {
+        uint32_t idbits = FIELD_EX64(cs->gicr_vpropbaser, GICR_VPROPBASER, IDBITS);
+        if (irq >= (1ULL << (idbits + 1))) {
+            return;
+        }
+    }
+
+    bit_changed = set_pending_table_bit(cs, vptaddr, irq, level);
+    if (resident && bit_changed) {
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
+
+    if (!resident && level && doorbell != INTID_SPURIOUS &&
+        (cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
+        /* vCPU is not currently resident: ring the doorbell */
+        gicv3_redist_process_lpi(cs, doorbell, 1);
+    }
 }
 
 void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
-- 
2.25.1


