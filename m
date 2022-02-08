Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F5B4ADB78
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:46:10 +0100 (CET)
Received: from localhost ([::1]:52766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRkv-0003D0-Fi
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-00016C-4I
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:44 -0500
Received: from [2a00:1450:4864:20::32b] (port=44559
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqz-0002Ln-T0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so1399883wms.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pDKWDRaOnUkRnKvjdAk2YeqA1RSpMi3f12OGrjJ3J00=;
 b=MvUcPyWnRsJQ+JoDMD6sw9mQGhX9dqGa9Vb9qiCO/g7bS/PfIJmy/qti9njmfFeO3y
 uNCNzN923bx5Urq1wMhgLhc76PVm/0vqXB6gcxFMNjhc0jl/nYmV8J9S2uq271UDiojl
 /OA8vKbERY47SdYsMj9HIF0r3GsJQ+wSJ6UDD4k5EjHbAVtDmdTKz+309KrLijhYehcN
 2NZ1ohW7RL0a5e7tIXp6yj30F4weqWTsurW4YO4mVl4Wh+GeLfzy8cYKfqVS05ACk/3J
 0yYzOC5yxkC5ZyXWxdEkDCWxVkNYJHKuYgbJDCn+McYPLT1Yw3Cs84ecwuotJe/qfOMr
 crqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pDKWDRaOnUkRnKvjdAk2YeqA1RSpMi3f12OGrjJ3J00=;
 b=dBY9Alcr2083wDyWeFUEqhdNiAhLCuePBWWDvBDdnXsn4pB1rDL+kY7BsHNjBXHK9i
 2EcdwREYb5XdvnrPxCRTXIvMENuwtlb2KccNT40vXtb9BzjyQfSTk/AGZ+LOtCVAN5Nl
 yvebTCy9AhVrz3xD061fwGDPD8Uww/O4vv2VCmnYwwsrYA2P6LSgHtAqaG1dsxWlnlOv
 Di6sk/1ZxRRTqak5Tpy5NdIw7PSsPVgL9Fcf2R4fV3ppOnnLzfwcQvxDDDJ2H+phRuwu
 QJQck10R7qfwijbJmMHkjNQk5tRkZ1OrjxMKYiLoVZQ17QZNWOXO2jXXtTXzind1iF9Z
 bHbw==
X-Gm-Message-State: AOAM532ZcszzuF0ebHbgfBta37NMw6a46f0LSGgYMYmmLq3oFQLjhyrI
 WinhCuxF3N3fw0fu6k6lJIoXuV6N4KH56Q==
X-Google-Smtp-Source: ABdhPJwscaGtN0sUeXSHs41XLqxp3Dgqal0r4QEjvqhT3hIepU4konLlkiHexhf8ivIhKTPAbv/waA==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr767134wmc.119.1644320412610; 
 Tue, 08 Feb 2022 03:40:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/39] hw/intc/arm_gicv3_its: Make update_ite() use ITEntry
Date: Tue,  8 Feb 2022 11:39:43 +0000
Message-Id: <20220208113948.3217356-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the update_ite() struct use the new ITEntry struct, so that
callers don't need to assemble the in-memory ITE data themselves, and
only get_ite() and update_ite() need to care about that in-memory
layout.  We can then drop the no-longer-used IteEntry struct
definition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-10-peter.maydell@linaro.org
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


