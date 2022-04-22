Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08C50B4D4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:16:54 +0200 (CEST)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqLN-0007lI-4d
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9f-0004Ei-VW
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:50 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9e-0002ar-7U
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id x18so10354818wrc.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jWdp/zYXmce0jcV8IFNr0A3WhWo/fJGJjHVaToScuuU=;
 b=WpitD8p+xH3MqcBqvNdfqAoOI9S9fK9JCeRxNPDjnYMU2VnWpj51ggPPGxhGrMuuMy
 BYPs/Ykl1e1Tw07KsF+gL5nRuUyuIwKKNnPGu/7u5D3YASgi/Z6Jnvmlqx3wOqrn9+69
 mxC8f5JheI3CQ+ANz45j/hpyyJSG+RMahukhP4zr/7gpAJLu0ie+bD2Qc7TKdnKrdp9f
 i6APQ+5fqMywabb1veLNpTg8cO3U0RKW3nSPmQUWuPD8P8afNgTVz6dafo30dpD9xQXt
 3YtMTs1wqcVvqd1su0QtDhZaot2SVgR+gtg32CqdWXMZ9wK5MChyiibvkXFX5wKcesrM
 PXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jWdp/zYXmce0jcV8IFNr0A3WhWo/fJGJjHVaToScuuU=;
 b=2B8NgAd+fPf327JVEJ8xJ6F5ad/EZcmu4e3UOKlGFmaTGgzwS/MPdvu37+up+NaUPC
 vhkUxoRWEc+d+qShA1emymxsnxklkiw4P1ABSlzHtMznMa9dzNiocG2vrCZoZtQCPBGv
 Fa7hP5xHAzJRbMCIRC10amRHIo3qZalLz84SRWgBvKccJp2SIbp7r3b5ZTyAYL64Djao
 isubWJIrjmkY2gojN+3746wJWlpzI4BvIfp+61SiR/0XAwLFp6k335NDzvN8L2G5GH5E
 1lFm1PC2l/pFt9jzE5X0SHL3j4o3moqArqKZNO2MoMHmHmr6WZ16zNsbhTWfj6PksG/S
 oJig==
X-Gm-Message-State: AOAM532k7zhphzU6D40NguO2Rvt4acwyFOa1szc4RYdjd75W/Bl9e8We
 l98M6rXtjFdawk8x0WzyIe95FEiXyClYNQ==
X-Google-Smtp-Source: ABdhPJydqqaqF2xWSsBjCJPjyAjsZTRvAdxVrShqybn/AZregDfcmrL26B2WTXknYiShZ1yJ0bAFbQ==
X-Received: by 2002:a05:6000:1809:b0:20a:cafc:fd39 with SMTP id
 m9-20020a056000180900b0020acafcfd39mr1441204wrh.255.1650621884952; 
 Fri, 22 Apr 2022 03:04:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/61] hw/intc/arm_gicv3_its: Factor out "find ITE given devid,
 eventid"
Date: Fri, 22 Apr 2022 11:03:42 +0100
Message-Id: <20220422100432.2288247-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

The operation of finding an interrupt table entry given a (DeviceID,
EventID) pair is necessary in multiple different ITS commands.  The
process requires first using the DeviceID as an index into the device
table to find the DTE, and then useng the EventID as an index into
the interrupt table specified by that DTE to find the ITE.  We also
need to handle all the possible error cases: indexes out of range,
table memory not readable, table entries not valid.

Factor this out into a separate lookup_ite() function which we
can then call from the places where we were previously open-coding
this sequence. We'll also need this for some of the new GICv4.0
commands.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-12-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 124 +++++++++++++++++++++-------------------
 1 file changed, 64 insertions(+), 60 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 179a9b032c2..4a029d754ad 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -314,6 +314,60 @@ out:
     return res;
 }
 
+/*
+ * Given a (DeviceID, EventID), look up the corresponding ITE, including
+ * checking for the various invalid-value cases. If we find a valid ITE,
+ * fill in @ite and @dte and return CMD_CONTINUE_OK. Otherwise return
+ * CMD_STALL or CMD_CONTINUE as appropriate (and the contents of @ite
+ * should not be relied on).
+ *
+ * The string @who is purely for the LOG_GUEST_ERROR messages,
+ * and should indicate the name of the calling function or similar.
+ */
+static ItsCmdResult lookup_ite(GICv3ITSState *s, const char *who,
+                               uint32_t devid, uint32_t eventid, ITEntry *ite,
+                               DTEntry *dte)
+{
+    uint64_t num_eventids;
+
+    if (devid >= s->dt.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      who, devid, s->dt.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    if (get_dte(s, devid, dte) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!dte->valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid dte for %d\n", who, devid);
+        return CMD_CONTINUE;
+    }
+
+    num_eventids = 1ULL << (dte->size + 1);
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n", who, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
+    if (get_ite(s, eventid, dte, ite) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!ite->valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: invalid ITE\n", who);
+        return CMD_CONTINUE;
+    }
+
+    return CMD_CONTINUE_OK;
+}
+
 /*
  * This function handles the processing of following commands based on
  * the ItsCmdType parameter passed:-
@@ -325,42 +379,17 @@ out:
 static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
-    uint64_t num_eventids;
     DTEntry dte;
     CTEntry cte;
     ITEntry ite;
+    ItsCmdResult cmdres;
 
-    if (devid >= s->dt.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_entries);
-        return CMD_CONTINUE;
+    cmdres = lookup_ite(s, __func__, devid, eventid, &ite, &dte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
 
-    if (get_dte(s, devid, &dte) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    if (!dte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid dte for %d\n", __func__, devid);
-        return CMD_CONTINUE;
-    }
-
-    num_eventids = 1ULL << (dte.size + 1);
-    if (eventid >= num_eventids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d >= %"
-                      PRId64 "\n",
-                      __func__, eventid, num_eventids);
-        return CMD_CONTINUE;
-    }
-
-    if (get_ite(s, eventid, &dte, &ite) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    if (!ite.valid || ite.inttype != ITE_INTTYPE_PHYSICAL) {
+    if (ite.inttype != ITE_INTTYPE_PHYSICAL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: invalid ITE\n",
                       __func__);
@@ -740,10 +769,10 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid;
     uint16_t new_icid;
-    uint64_t num_eventids;
     DTEntry dte;
     CTEntry old_cte, new_cte;
     ITEntry old_ite;
+    ItsCmdResult cmdres;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
@@ -751,37 +780,12 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 
     trace_gicv3_its_cmd_movi(devid, eventid, new_icid);
 
-    if (devid >= s->dt.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_entries);
-        return CMD_CONTINUE;
-    }
-    if (get_dte(s, devid, &dte) != MEMTX_OK) {
-        return CMD_STALL;
+    cmdres = lookup_ite(s, __func__, devid, eventid, &old_ite, &dte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
 
-    if (!dte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid dte for %d\n", __func__, devid);
-        return CMD_CONTINUE;
-    }
-
-    num_eventids = 1ULL << (dte.size + 1);
-    if (eventid >= num_eventids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d >= %"
-                      PRId64 "\n",
-                      __func__, eventid, num_eventids);
-        return CMD_CONTINUE;
-    }
-
-    if (get_ite(s, eventid, &dte, &old_ite) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-
-    if (!old_ite.valid || old_ite.inttype != ITE_INTTYPE_PHYSICAL) {
+    if (old_ite.inttype != ITE_INTTYPE_PHYSICAL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: invalid ITE\n",
                       __func__);
-- 
2.25.1


