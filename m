Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2414A697E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 02:12:37 +0100 (CET)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF4CK-00071d-7d
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 20:12:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytK-0001rK-Kw
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:39 -0500
Received: from [2a00:1450:4864:20::335] (port=40652
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytH-0002XY-2p
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:38 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l129-20020a1c2587000000b0035394fedf14so2721920wml.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ySqmSUe+pqKU2/8QTA7TiGVv/mwkYf9L8c4E7rJVGHU=;
 b=KQY7SNl1o+xanxUO64cGKa1UnOuHrm3wcbHPJvPZbdQ3/7ua6uc1rNbxWlFI64JhQG
 HHmbKViSBImkww+wAhE55CFfn4Z2S6UVjBle1HbwmcM85S4LmjXuSFI6L3Zb+WNv3UDo
 V9CdTmr00y2w3V7/jEQXjqDwf08ppbQh29fVnZQYDMLx4vwVGRex0U2PSl++EuxPdOBM
 xacUUdpES+Qszy70qpAGwnSjpbj76doIzasn+wy+iA1lWHGYQAOICrR+NLcdeQ09sDMq
 KLHCRxM/eQNRDH93Deym2CLicSBXnk6q/iGuQ0/J7UyTzvN0KbSrpfM5FAnue/PxljOQ
 tDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ySqmSUe+pqKU2/8QTA7TiGVv/mwkYf9L8c4E7rJVGHU=;
 b=BrZ8Vvp5n8RVOfnZ4gDv0igzfh548w8DXVOlL00V0lCUueKgHKCPZMZotdFvHcDeAv
 NJsDMkzVFI3g7EmYnZOvAZU2/tD+0kvr40WFcYH0zSc9h6a6cqG0dlOxYp4/p3PWGNGN
 VLxG0hkzHEVwADCBsEIxkr5SvFpbD/YphmSBB6yP3Wb2b9BLAt/uPyIHxyc+2OKjwWzt
 hc+oKQVqbF/pvqD/BMD0S+UdN9yiVT1fOqrn+rDujhDW2t3VWfttlj7zjP4x824EZWc2
 hjRI61D6OyhjYB4LPSbapCT08UucMHThHThzM6pnDfB+AkTm7KZ2RbeF6StyezXPYJn5
 tVdA==
X-Gm-Message-State: AOAM530ZB+uJbApTsf9DtmzFJO9MchKZos46rfS8iZOpsvCf+LjZBWRU
 /0psxoYBY2BmbjkUwT3+q0fx7g==
X-Google-Smtp-Source: ABdhPJzj2V6ZlqMCK/7AHfhygOHgX9l+HPSCUuk9mwLtaxccpWHU9DGWglMkuTCS6R2l82IHPhfgYQ==
X-Received: by 2002:a05:600c:25a:: with SMTP id
 26mr3060727wmj.184.1643743937597; 
 Tue, 01 Feb 2022 11:32:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/13] hw/intc/arm_gicv3_its: Make update_ite() use ITEntry
Date: Tue,  1 Feb 2022 19:32:03 +0000
Message-Id: <20220201193207.2771604-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the update_ite() struct use the new ITEntry struct, so that
callers don't need to assemble the in-memory ITE data themselves, and
only get_ite() and update_ite() need to care about that in-memory
layout.  We can then drop the no-longer-used IteEntry struct
definition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 62 +++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index bd741085022..e3b63efddcc 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -41,11 +41,6 @@ typedef enum ItsCmdType {
     INTERRUPT = 3,
 } ItsCmdType;
 
-typedef struct {
-    uint32_t iteh;
-    uint64_t itel;
-} IteEntry;
-
 typedef struct DTEntry {
     bool valid;
     unsigned size;
@@ -178,24 +173,35 @@ static MemTxResult get_cte(GICv3ITSState *s, uint16_t icid, CTEntry *cte)
     return MEMTX_OK;
 }
 
+/*
+ * Update the Interrupt Table entry at index @evinted in the table specified
+ * by the dte @dte. Returns true on success, false if there was a memory
+ * access error.
+ */
 static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
-                       IteEntry ite)
+                       const ITEntry *ite)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
     hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
+    uint64_t itel = 0;
+    uint32_t iteh = 0;
 
-    address_space_stq_le(as, iteaddr, ite.itel, MEMTXATTRS_UNSPECIFIED, &res);
-
-    if (res == MEMTX_OK) {
-        address_space_stl_le(as, iteaddr + 8, ite.iteh,
-                             MEMTXATTRS_UNSPECIFIED, &res);
+    if (ite->valid) {
+        itel = FIELD_DP64(itel, ITE_L, VALID, 1);
+        itel = FIELD_DP64(itel, ITE_L, INTTYPE, ite->inttype);
+        itel = FIELD_DP64(itel, ITE_L, INTID, ite->intid);
+        itel = FIELD_DP64(itel, ITE_L, ICID, ite->icid);
+        itel = FIELD_DP64(itel, ITE_L, VPEID, ite->vpeid);
+        iteh = FIELD_DP32(iteh, ITE_H, DOORBELL, ite->doorbell);
     }
+
+    address_space_stq_le(as, iteaddr, itel, MEMTXATTRS_UNSPECIFIED, &res);
     if (res != MEMTX_OK) {
         return false;
-    } else {
-        return true;
     }
+    address_space_stl_le(as, iteaddr + 8, iteh, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
 }
 
 /*
@@ -346,9 +352,10 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     }
 
     if (cmd == DISCARD) {
-        IteEntry itee = {};
+        ITEntry ite = {};
         /* remove mapping from interrupt translation table */
-        return update_ite(s, eventid, &dte, itee) ? CMD_CONTINUE : CMD_STALL;
+        ite.valid = false;
+        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
     }
     return CMD_CONTINUE;
 }
@@ -370,8 +377,8 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     uint64_t num_eventids;
     uint32_t num_intids;
     uint16_t icid = 0;
-    IteEntry ite = {};
     DTEntry dte;
+    ITEntry ite;
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
     eventid = cmdpkt[1] & EVENTID_MASK;
@@ -415,13 +422,13 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     }
 
     /* add ite entry to interrupt translation table */
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, true);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, icid);
-    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
-
-    return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    ite.valid = true;
+    ite.inttype = ITE_INTTYPE_PHYSICAL;
+    ite.intid = pIntid;
+    ite.icid = icid;
+    ite.doorbell = INTID_SPURIOUS;
+    ite.vpeid = 0;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
@@ -585,7 +592,6 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     uint32_t devid, eventid;
     uint16_t new_icid;
     uint64_t num_eventids;
-    IteEntry ite = {};
     DTEntry dte;
     CTEntry old_cte, new_cte;
     ITEntry old_ite;
@@ -689,12 +695,8 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     }
 
     /* Update the ICID field in the interrupt translation table entry */
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, 1);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, old_ite.intid);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, new_icid);
-    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
-    return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    old_ite.icid = new_icid;
+    return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1


