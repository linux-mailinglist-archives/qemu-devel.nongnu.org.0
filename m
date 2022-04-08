Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFB54F9808
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:28:50 +0200 (CEST)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpbV-0006Eq-JJ
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPF-0006ue-T0
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:12 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPD-0002Hr-Ey
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id b19so13037739wrh.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esnamstNUY5Extqaiji5nDXYBcEE+qdCRY7G8wLUhCQ=;
 b=cE7TD4TgBdDNlSrCRxgZyzLAZv6DxQOufL3RDatiNUx1h4ab/qvdieAEOItz8jR3Hb
 j8o/+Mt/PN+WaBS8vzBSRJj96lHlsnrghtdDuMHOOhQ5rFv9nwHsENB09BD0nAVpCCxD
 5cgEGS3b/O63nlCHBPjF/j0paz8Z280NLhf9XEE9RAWIRXSlcsIGZn503zqnUXr5Utjw
 lrTNZoaVn8E+N2bBfp3xhIu6X4ZHfMxsXsihpY/5cuDdj4AB05YGLw7zCvw4kdloOyjX
 Jdh5h/M5WAJ/62r/Kwwl/cbiWczBSy+y6cXELKOOHGNQxDSng7OTX5tt/TX2L2DhEaWj
 viWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=esnamstNUY5Extqaiji5nDXYBcEE+qdCRY7G8wLUhCQ=;
 b=HMrDJoMNpX6Kp2ecb7qJnlPcY1I8a14RCEsueH4a5sJn7XnwOYhBx9GqFbYLA/GWa4
 xSnAjBwgK5SzW746HaDZOhF0rqma6zugfOuNDsafAddlVvWjkQ7By9GOHjv9bG7SaZbF
 pt9bLvd62mwdN0RhQlKowgfxM5NsoB1fepeYpBcHr3xjOVM5HqG/bCooWRrILmjVKMTH
 66S74uQQhekeoPvok1gmev0LfcqM2eLtKctYNSqelAUA0wysXCHntQVgGJvYg8IwW4XZ
 4jSfIdwaOYsC/0V27AXTlQRJY1Ra3tvrO2aJgJFcGw7eb+puI4vxoleOFBLnPfFPDGEK
 DK1Q==
X-Gm-Message-State: AOAM532TE7PSFUpEqVIZzGsexFDFrx4D9iJwjbUIj9zfOQ5aaeXAl7Up
 m9S4ZwK33P4Xw6+hFZg2lc3t3A==
X-Google-Smtp-Source: ABdhPJxyRHRzMavkvqRhgvSQr9QsRKVcNy4nbtJTsJ78Z3rjzr38SxpFZObDeVNQag7bok2em9K1xg==
X-Received: by 2002:a5d:6c67:0:b0:204:ff0:87a8 with SMTP id
 r7-20020a5d6c67000000b002040ff087a8mr15158165wrz.627.1649427366091; 
 Fri, 08 Apr 2022 07:16:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/41] hw/intc/arm_gicv3_its: Split out process_its_cmd()
 physical interrupt code
Date: Fri,  8 Apr 2022 15:15:22 +0100
Message-Id: <20220408141550.1271295-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split the part of process_its_cmd() which is specific to physical
interrupts into its own function.  This is the part which starts by
taking the ICID and looking it up in the collection table.  The
handling of virtual interrupts is significantly different (involving
a lookup in the vPE table) so structuring the code with one
sub-function for the physical interrupt case and one for the virtual
interrupt case will be clearer than putting both cases in one large
function.

The code for handling the "remove mapping from ITE" for the DISCARD
command remains in process_its_cmd() because it is common to both
virtual and physical interrupts.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 51 ++++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 2cbac76256d..8ea1fc366d3 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -397,6 +397,19 @@ static ItsCmdResult lookup_cte(GICv3ITSState *s, const char *who,
     return CMD_CONTINUE_OK;
 }
 
+static ItsCmdResult process_its_cmd_phys(GICv3ITSState *s, const ITEntry *ite,
+                                         int irqlevel)
+{
+    CTEntry cte;
+    ItsCmdResult cmdres;
+
+    cmdres = lookup_cte(s, __func__, ite->icid, &cte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+    gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite->intid, irqlevel);
+    return CMD_CONTINUE_OK;
+}
 
 /*
  * This function handles the processing of following commands based on
@@ -410,34 +423,36 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
     DTEntry dte;
-    CTEntry cte;
     ITEntry ite;
     ItsCmdResult cmdres;
+    int irqlevel;
 
     cmdres = lookup_ite(s, __func__, devid, eventid, &ite, &dte);
     if (cmdres != CMD_CONTINUE_OK) {
         return cmdres;
     }
 
-    if (ite.inttype != ITE_INTTYPE_PHYSICAL) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: invalid ITE\n",
-                      __func__);
-        return CMD_CONTINUE;
+    irqlevel = (cmd == CLEAR || cmd == DISCARD) ? 0 : 1;
+
+    switch (ite.inttype) {
+    case ITE_INTTYPE_PHYSICAL:
+        cmdres = process_its_cmd_phys(s, &ite, irqlevel);
+        break;
+    case ITE_INTTYPE_VIRTUAL:
+        if (!its_feature_virtual(s)) {
+            /* Can't happen unless guest is illegally writing to table memory */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid type %d in ITE (table corrupted?)\n",
+                          __func__, ite.inttype);
+            return CMD_CONTINUE;
+        }
+        /* The GICv4 virtual interrupt handling will go here */
+        g_assert_not_reached();
+    default:
+        g_assert_not_reached();
     }
 
-    cmdres = lookup_cte(s, __func__, ite.icid, &cte);
-    if (cmdres != CMD_CONTINUE_OK) {
-        return cmdres;
-    }
-
-    if ((cmd == CLEAR) || (cmd == DISCARD)) {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid, 0);
-    } else {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid, 1);
-    }
-
-    if (cmd == DISCARD) {
+    if (cmdres == CMD_CONTINUE_OK && cmd == DISCARD) {
         ITEntry ite = {};
         /* remove mapping from interrupt translation table */
         ite.valid = false;
-- 
2.25.1


