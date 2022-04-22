Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A8650B4F0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:24:52 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqT5-0002ZS-QW
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9n-0004NQ-8w
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9l-0002cV-Gq
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m14so10320308wrb.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wi2fGPBxkZ6i5KbZuM7Jvw/j5gXrJnvmG9yJChG88LE=;
 b=LyuES/afO9uQgr9431a6ZqVpd2IgD95wzC17/xrplFaDNpXBofL+gyVOqqzTWaJn7l
 9wfLF53mUmjkTQhQKv8QMtRkcoVrnf7mV1M9p+SE1/aoHIe5vEW6UuUlJLW2W4ERdPj9
 dH1sXQFXNNKSAogur2Xo1//66Tv5nsmukGkRLAjRsQfUYkewBnMrYvoY9147Jl776Vav
 rG8s+L2P1VxKz4R5AA6UsOyC/o79Bfzbf/hQmCd0XE/4+YefDCfBwjUOBSYi+5NW2uyI
 6myAGzembiQHhL7lGjHhgizYZl3sAjLzg3s6mG6q+p3AILL3t6vcJw5+gK5lX7y8w23L
 wccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wi2fGPBxkZ6i5KbZuM7Jvw/j5gXrJnvmG9yJChG88LE=;
 b=sctpKIYEunazIHgIzCWmydorRZWP+buSLkcistLJJ4ZYeLmOj754CirwltHeUmkq7Z
 QMN1fPKMvsRayE6GDhQjVHWiUW1ov4evVwnsEClc8LwL3wF/5YyUDsAH5T8LuDvOUJQ1
 E6+mSPXB+0MJqFrPy17FWtBVoxM7H9SDxB+7FK6X4S2oz81/3cC+OBFFRiN8krwD9vD5
 /ycISOoQS1H1xjI+fzwv4fCt19qhltqi3Oe9lAnoTAe9VtytFoD/2CU6IPk7VZ13dQCL
 PQbrBjYv/tPzWkBR4m/Xeg5U57XYtDAadsUIVnI+1IFHzSd+v0IaAMyKJkkzkNCbchRw
 Wp/Q==
X-Gm-Message-State: AOAM530TkNdF0GhxroEmIHImGhOXcr5+jF4PamcAaJsoptY46OvLnsdg
 lyNCoKLz/RzO9cjH4O/G3Qb40sBIyvoZEg==
X-Google-Smtp-Source: ABdhPJwWROb7sVc1yP7/2nWUd/9JeORxS5J/vlFGly2Xcg8a68EsETGAsRuUF5xYvdmJF8asSSvZMA==
X-Received: by 2002:a05:6000:18a8:b0:20a:8a58:1639 with SMTP id
 b8-20020a05600018a800b0020a8a581639mr3020545wri.483.1650621891820; 
 Fri, 22 Apr 2022 03:04:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/61] hw/intc/arm_gicv3_its: Implement INV for virtual
 interrupts
Date: Fri, 22 Apr 2022 11:03:50 +0100
Message-Id: <20220422100432.2288247-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
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

Implement the ITS side of the handling of the INV command for
virtual interrupts; as usual this calls into a redistributor
function which we leave as a stub to fill in later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-20-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   |  9 +++++++++
 hw/intc/arm_gicv3_its.c    | 16 ++++++++++++++--
 hw/intc/arm_gicv3_redist.c |  8 ++++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 25ea19de385..2f653a9b917 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -585,6 +585,15 @@ void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
  * Forget or update any cached information associated with this LPI.
  */
 void gicv3_redist_inv_lpi(GICv3CPUState *cs, int irq);
+/**
+ * gicv3_redist_inv_vlpi:
+ * @cs: GICv3CPUState
+ * @irq: vLPI to invalidate cached information for
+ * @vptaddr: (guest) address of vLPI table
+ *
+ * Forget or update any cached information associated with this vLPI.
+ */
+void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr);
 /**
  * gicv3_redist_mov_lpi:
  * @src: source redistributor
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index aa0a62510e5..f7c01c2be19 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1090,6 +1090,7 @@ static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
     ITEntry ite;
     DTEntry dte;
     CTEntry cte;
+    VTEntry vte;
     ItsCmdResult cmdres;
 
     devid = FIELD_EX64(cmdpkt[0], INV_0, DEVICEID);
@@ -1118,8 +1119,19 @@ static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
                           __func__, ite.inttype);
             return CMD_CONTINUE;
         }
-        /* We will implement the vLPI invalidation in a later commit */
-        g_assert_not_reached();
+
+        cmdres = lookup_vte(s, __func__, ite.vpeid, &vte);
+        if (cmdres != CMD_CONTINUE_OK) {
+            return cmdres;
+        }
+        if (!intid_in_lpi_range(ite.intid) ||
+            ite.intid >= (1ULL << (vte.vptsize + 1))) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: intid 0x%x out of range\n",
+                          __func__, ite.intid);
+            return CMD_CONTINUE;
+        }
+        gicv3_redist_inv_vlpi(&s->gicv3->cpu[vte.rdbase], ite.intid,
+                              vte.vptaddr << 16);
         break;
     default:
         g_assert_not_reached();
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 78650a3bb4c..856494b4e8f 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -808,6 +808,14 @@ void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
      */
 }
 
+void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
+{
+    /*
+     * The redistributor handling for invalidating cached information
+     * about a VLPI will be added in a subsequent commit.
+     */
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
-- 
2.25.1


