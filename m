Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2532C50B51C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:32:24 +0200 (CEST)
Received: from localhost ([::1]:39006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqaM-0006eT-U9
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9b-0004E4-Ar
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9Z-0002Zs-Gt
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:43 -0400
Received: by mail-wr1-x430.google.com with SMTP id e2so4041351wrh.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KP3EMe4IHC9X6u7x67z2Ghb+uxnwdwXPMr6nFHH0Zg4=;
 b=lpsm4YiMnsxOUzslWJMTZLakAC9jrY8ESrIASr6CXFDm1ADr32DzSbV7XGLARF8Wwf
 18Vk7hEG9G2W4zXBJeLqE5glyTAyRoFDLNPo+pYJYwDLc1OpTpgI+ewMAU5h+ox2Nhgg
 i+52DZiAWfoENz1BOXZFYiqN/v4jqXz+ugGXY7umKnAQuVz/wzTQZFiZEuh5+9RPZYOg
 pQ9NCwB1cGV0UkkO7r5ipN+FebwKa33LoYqa/ttb7bV7ICjJHSn5FvPdKBLZ5rTU/+mX
 eGnVsGrtwcXJvnj0d33GFl/8q69Ybb80WHziPZxJA3L3rWrzzFg4kwkWGWwlEPTmatlZ
 YIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KP3EMe4IHC9X6u7x67z2Ghb+uxnwdwXPMr6nFHH0Zg4=;
 b=4hefZUVq4E/MylQkE0ACr2w89x3YQMgQMwF4kKljl0LAU7wk11IQCYxMQwkIvSCdo9
 UpppNFZPC0EMaKyRHhW+dnALu2cRl1/ZE+HU83ZxRZHQ5Ko1jD4lVQp9U8altGIvIoeo
 LNiFYvOjvRMij3hpRPQ5nnyeXtZ0M65AKGDnlM77xijCNBEcx7urZrrlF1GCuehX2AMX
 KTal5+p0GtrlFndo1jRkOh251upf5BlUAnmz0gNEGPGFnHUWAq/EV9enpcLz2+oCsGEP
 Rrp+MF/kEWLuz3Jkgjw+so959jyvfLUCoP9rHRVFqYtq7ZpZHXF0cOSQiM+xM4aqco5A
 RXBw==
X-Gm-Message-State: AOAM532NRLPeU66MlSki8vC2RIM/qbkELGnHU9mznvugmRFBzgYIYSxg
 ovQI+7nh0F188YAVuQUGdmWzSbBLnC+ajw==
X-Google-Smtp-Source: ABdhPJxyN5cNOXtXL3gyq1O8ZMGS55mn4TVpSPanS7agVje4YCXABBHV5cRN1uSbNtm/PoeOKJ8qxQ==
X-Received: by 2002:a05:6000:1c8:b0:207:af9e:a4ec with SMTP id
 t8-20020a05600001c800b00207af9ea4ecmr3031721wrx.9.1650621880259; 
 Fri, 22 Apr 2022 03:04:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/61] hw/intc/arm_gicv3_its: Factor out "is intid a valid LPI
 ID?"
Date: Fri, 22 Apr 2022 11:03:37 +0100
Message-Id: <20220422100432.2288247-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In process_mapti() we check interrupt IDs to see whether they are
in the valid LPI range. Factor this out into its own utility
function, as we're going to want it elsewhere too for GICv4.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-7-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f8467b61ec5..a2462098445 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -79,6 +79,12 @@ typedef enum ItsCmdResult {
     CMD_CONTINUE = 1,
 } ItsCmdResult;
 
+static inline bool intid_in_lpi_range(uint32_t id)
+{
+    return id >= GICV3_LPI_INTID_START &&
+        id < (1 << (GICD_TYPER_IDBITS + 1));
+}
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -410,7 +416,6 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
     uint64_t num_eventids;
-    uint32_t num_intids;
     uint16_t icid = 0;
     DTEntry dte;
     ITEntry ite;
@@ -438,7 +443,6 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
         return CMD_STALL;
     }
     num_eventids = 1ULL << (dte.size + 1);
-    num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
     if (icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -460,7 +464,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
         return CMD_CONTINUE;
     }
 
-    if (pIntid < GICV3_LPI_INTID_START || pIntid >= num_intids) {
+    if (!intid_in_lpi_range(pIntid)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid interrupt ID 0x%x\n", __func__, pIntid);
         return CMD_CONTINUE;
-- 
2.25.1


