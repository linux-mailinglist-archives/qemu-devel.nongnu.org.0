Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C656850B4EC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:23:15 +0200 (CEST)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqRW-0000Mf-QL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9d-0004EB-Bm
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9b-0002aH-GR
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id m14so10319703wrb.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Iyy9EqxwlVZCqOVtM7LRAHzdMyn2Ivljkfto580g+2g=;
 b=V5ApZ4u71jJ8zljRy5kZSeA2kRKvjcwHbeefpY38/rUG747cmZoDUo15/KFPpCGxpY
 YSfbPhLfYdykesy/yxULWZfsESkY3/pA61vHA7hmZDTHMHcmwS6AwVpgKvG4LNnktAeL
 mfmdbNerrp9tW6FVSIdsTnowntfQ15Ga3qCNwlfHkGrp5WiiOTEm9D/QjHebtYkbQ+tB
 VoV7OdLdEGDeie4ERgeR38QeFUcoLlfGn1ACzaB4/3y21b4DQpegPKLbWagfZQoDU8Np
 bCSFNfusUjwWMvxq6IINzntIRmXX53As9rodoeBUWa9GVVmusoRmP+kSt3zO8jk75gW4
 jHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iyy9EqxwlVZCqOVtM7LRAHzdMyn2Ivljkfto580g+2g=;
 b=3zRTfZXYXzzOf7AOEd+q0gHIkPh81QHRPU5yEUXVkuCB6kx1l6HwR1KMwhI5YRPijI
 HaQC+fHySIiUlLJBsZfzI35ESmd8Tr0jagg+u0MJ3JPGEqMNUkv0fI9GPWqgd0mnCyAD
 sQ40QhGV/2jYFQdx95ybbd6K2PaTbQ7P/DKO58fhn/COur/wtOAU7EHsSNHbDGLTEkFu
 a3PJi7gOJpRF/baN2duo4VkHiwcUs9DpoGLfDJaujT8zpoY8YCYJUMMDtO1NHj1IHhqb
 1NibdkE/Y5ZhOMVI+xn3kRtnXFXii4sejNEst58qL6HSVUgqu4+alfZ/BMMahEPg7uV2
 CRGw==
X-Gm-Message-State: AOAM531c4U9nLQFM1RLTCpy5MCFs8e7vG1ljI/53Pwdbp8EX598X3RJG
 I7lnjQ+eQoPL5OGwrDtDl1o5Fysjw68o6g==
X-Google-Smtp-Source: ABdhPJxQ4d7vcuXl/+KeRxl73TcD36dcBXI4gKjDQULxTuPYqLr0ebWdj/mFI9938sA7AcsmlabcMg==
X-Received: by 2002:a5d:4ed2:0:b0:207:b7f7:d02f with SMTP id
 s18-20020a5d4ed2000000b00207b7f7d02fmr3154723wrv.593.1650621882029; 
 Fri, 22 Apr 2022 03:04:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/61] hw/intc/arm_gicv3_its: Implement VMAPI and VMAPTI
Date: Fri, 22 Apr 2022 11:03:39 +0100
Message-Id: <20220422100432.2288247-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Implement the GICv4 VMAPI and VMAPTI commands. These write
an interrupt translation table entry that maps (DeviceID,EventID)
to (vPEID,vINTID,doorbell). The only difference between VMAPI
and VMAPTI is that VMAPI assumes vINTID == EventID rather than
both being specified in the command packet.

(This code won't be reachable until we allow the GIC version to be
set to 4.  Support for reading this new virtual-interrupt DTE and
handling it correctly will be implemented in a later commit.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-9-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h |  9 ++++
 hw/intc/arm_gicv3_its.c  | 91 ++++++++++++++++++++++++++++++++++++++++
 hw/intc/trace-events     |  2 +
 3 files changed, 102 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 4613b9e59ba..d3670a8894e 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -329,6 +329,8 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_INVALL           0x0D
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_VMAPTI           0x2A
+#define GITS_CMD_VMAPI            0x2B
 
 /* MAPC command fields */
 #define ICID_LENGTH                  16
@@ -368,6 +370,13 @@ FIELD(MOVI_0, DEVICEID, 32, 32)
 FIELD(MOVI_1, EVENTID, 0, 32)
 FIELD(MOVI_2, ICID, 0, 16)
 
+/* VMAPI, VMAPTI command fields */
+FIELD(VMAPTI_0, DEVICEID, 32, 32)
+FIELD(VMAPTI_1, EVENTID, 0, 32)
+FIELD(VMAPTI_1, VPEID, 32, 16)
+FIELD(VMAPTI_2, VINTID, 0, 32) /* VMAPTI only */
+FIELD(VMAPTI_2, DOORBELL, 32, 32)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f9704c07591..8aed57e7040 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -91,6 +91,12 @@ static inline bool intid_in_lpi_range(uint32_t id)
         id < (1 << (GICD_TYPER_IDBITS + 1));
 }
 
+static inline bool valid_doorbell(uint32_t id)
+{
+    /* Doorbell fields may be an LPI, or 1023 to mean "no doorbell" */
+    return id == INTID_SPURIOUS || intid_in_lpi_range(id);
+}
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -486,6 +492,85 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
+static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
+                                   bool ignore_vintid)
+{
+    uint32_t devid, eventid, vintid, doorbell, vpeid;
+    uint32_t num_eventids;
+    DTEntry dte;
+    ITEntry ite;
+
+    if (!its_feature_virtual(s)) {
+        return CMD_CONTINUE;
+    }
+
+    devid = FIELD_EX64(cmdpkt[0], VMAPTI_0, DEVICEID);
+    eventid = FIELD_EX64(cmdpkt[1], VMAPTI_1, EVENTID);
+    vpeid = FIELD_EX64(cmdpkt[1], VMAPTI_1, VPEID);
+    doorbell = FIELD_EX64(cmdpkt[2], VMAPTI_2, DOORBELL);
+    if (ignore_vintid) {
+        vintid = eventid;
+        trace_gicv3_its_cmd_vmapi(devid, eventid, vpeid, doorbell);
+    } else {
+        vintid = FIELD_EX64(cmdpkt[2], VMAPTI_2, VINTID);
+        trace_gicv3_its_cmd_vmapti(devid, eventid, vpeid, vintid, doorbell);
+    }
+
+    if (devid >= s->dt.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid DeviceID 0x%x (must be less than 0x%x)\n",
+                      __func__, devid, s->dt.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    if (get_dte(s, devid, &dte) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!dte.valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: no entry in device table for DeviceID 0x%x\n",
+                      __func__, devid);
+        return CMD_CONTINUE;
+    }
+
+    num_eventids = 1ULL << (dte.size + 1);
+
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: EventID 0x%x too large for DeviceID 0x%x "
+                      "(must be less than 0x%x)\n",
+                      __func__, eventid, devid, num_eventids);
+        return CMD_CONTINUE;
+    }
+    if (!intid_in_lpi_range(vintid)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: VIntID 0x%x not a valid LPI\n",
+                      __func__, vintid);
+        return CMD_CONTINUE;
+    }
+    if (!valid_doorbell(doorbell)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Doorbell %d not 1023 and not a valid LPI\n",
+                      __func__, doorbell);
+        return CMD_CONTINUE;
+    }
+    if (vpeid >= s->vpet.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: VPEID 0x%x out of range (must be less than 0x%x)\n",
+                      __func__, vpeid, s->vpet.num_entries);
+        return CMD_CONTINUE;
+    }
+    /* add ite entry to interrupt translation table */
+    ite.valid = true;
+    ite.inttype = ITE_INTTYPE_VIRTUAL;
+    ite.intid = vintid;
+    ite.icid = 0;
+    ite.doorbell = doorbell;
+    ite.vpeid = vpeid;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+}
+
 /*
  * Update the Collection Table entry for @icid to @cte. Returns true
  * on success, false if there was a memory access error.
@@ -872,6 +957,12 @@ static void process_cmdq(GICv3ITSState *s)
         case GITS_CMD_MOVALL:
             result = process_movall(s, cmdpkt);
             break;
+        case GITS_CMD_VMAPTI:
+            result = process_vmapti(s, cmdpkt, false);
+            break;
+        case GITS_CMD_VMAPI:
+            result = process_vmapti(s, cmdpkt, true);
+            break;
         default:
             trace_gicv3_its_cmd_unknown(cmd);
             break;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 53414aa1979..c6b2b9ab459 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -187,6 +187,8 @@ gicv3_its_cmd_mapti(uint32_t devid, uint32_t eventid, uint32_t icid, uint32_t in
 gicv3_its_cmd_inv(void) "GICv3 ITS: command INV or INVALL"
 gicv3_its_cmd_movall(uint64_t rd1, uint64_t rd2) "GICv3 ITS: command MOVALL RDbase1 0x%" PRIx64 " RDbase2 0x%" PRIx64
 gicv3_its_cmd_movi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS: command MOVI DeviceID 0x%x EventID 0x%x ICID 0x%x"
+gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x Dbell_pINTID 0x%x"
+gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t vintid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x vINTID 0x%x Dbell_pINTID 0x%x"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1


