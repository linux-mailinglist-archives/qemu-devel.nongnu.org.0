Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574B550B4EF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:24:50 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqT2-0002QN-Ex
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9g-0004Ep-Qn
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9f-0002az-5u
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id t6so6881982wra.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oE4dJBqIPuYMUXDEJtYKoOIm9KCvHl6Yg1E7509GUMc=;
 b=PsPu23K77z2tyhpGM7sn2OMSoAQP+jjqJgU6WGh415xdJbwVdG6ZKB/2RIXsXB7i1/
 /L8uQZ/8yoKFfr1VpQA+gozcT9BjYsm854MwkzHUgJNJeDlBamabVPNyMv/fob/5hEai
 WfZNr0Y8zt5HZ4L3QH6Ub+cgXJ+Ltdqw8ycNNR8eoh8aWJDQzy3E7Yp/a8PbvXoZVedH
 dW1NoSi0tQ2EN8zsdJ/e+WUPBhdTEKmF+Qdf1omo9BPpIuYYuh8FXlkXD0yMm9+YyJ9R
 yj9bjwEj55lJ49FWYvpF6glknbdX+RDDwlR4ZPlJi/wafGS/7oAYaj3pFilgAvdyaTwb
 +dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oE4dJBqIPuYMUXDEJtYKoOIm9KCvHl6Yg1E7509GUMc=;
 b=ve1/6unCcVKH4EqKfQ/2VmHYlWYg5KEXgv1TIqFhtKhfHkGypMqrEQcUFyPBZF9APo
 yJJmxjCBqclrcv1+5dwwAWJw3WLndgogwXsKZ19bkQdNAS+qDqWJLYfiTpggf7FIdayt
 KEnW1HdzPu7eNuaf3oTuVKdAPSrvNmuHiuvVyCbqOlS5uM9aE/r5/LfMpoK6uAbAJ8uT
 oFJFOz5hCZAdvSLG8o2IdHcPRs9iReAW9+gZeWygCCgZcXTuy9dbTXVO3TDcoplySPNM
 qlIlOlk0Vb5AMVhO+uyMWcKEZjAeqgQUBf+ursAAdSD+e9VMgBxj/LfzA6jbRGv8N1sU
 JvWw==
X-Gm-Message-State: AOAM531TnNuIo8AHszF5TDcDdzxgByHCuXU0h9veANH7vsycl2hpSEzU
 aqMu34pxpvDNW6lG/fZ0CgjyWQV2Fjvocg==
X-Google-Smtp-Source: ABdhPJx1SKHBLAPjJVCDX92GlpkBK7LRDkOXrcdVz6gW+ZwQ/+ul1LBBsnxmo9ewKW7+mEPlAPHoUg==
X-Received: by 2002:a5d:4b45:0:b0:207:ab91:edd8 with SMTP id
 w5-20020a5d4b45000000b00207ab91edd8mr3099278wrs.168.1650621885766; 
 Fri, 22 Apr 2022 03:04:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/61] hw/intc/arm_gicv3_its: Factor out CTE lookup sequence
Date: Fri, 22 Apr 2022 11:03:43 +0100
Message-Id: <20220422100432.2288247-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Factor out the sequence of looking up a CTE from an ICID including
the validity and error checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-13-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 109 ++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 70 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 4a029d754ad..a2a4e3de56e 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -368,6 +368,36 @@ static ItsCmdResult lookup_ite(GICv3ITSState *s, const char *who,
     return CMD_CONTINUE_OK;
 }
 
+/*
+ * Given an ICID, look up the corresponding CTE, including checking for various
+ * invalid-value cases. If we find a valid CTE, fill in @cte and return
+ * CMD_CONTINUE_OK; otherwise return CMD_STALL or CMD_CONTINUE (and the
+ * contents of @cte should not be relied on).
+ *
+ * The string @who is purely for the LOG_GUEST_ERROR messages,
+ * and should indicate the name of the calling function or similar.
+ */
+static ItsCmdResult lookup_cte(GICv3ITSState *s, const char *who,
+                               uint32_t icid, CTEntry *cte)
+{
+    if (icid >= s->ct.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid ICID 0x%x\n", who, icid);
+        return CMD_CONTINUE;
+    }
+    if (get_cte(s, icid, cte) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte->valid) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid CTE\n", who);
+        return CMD_CONTINUE;
+    }
+    if (cte->rdbase >= s->gicv3->num_cpu) {
+        return CMD_CONTINUE;
+    }
+    return CMD_CONTINUE_OK;
+}
+
+
 /*
  * This function handles the processing of following commands based on
  * the ItsCmdType parameter passed:-
@@ -396,29 +426,9 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    if (ite.icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
-                      __func__, ite.icid);
-        return CMD_CONTINUE;
-    }
-
-    if (get_cte(s, ite.icid, &cte) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    if (!cte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: invalid CTE\n",
-                      __func__);
-        return CMD_CONTINUE;
-    }
-
-    /*
-     * Current implementation only supports rdbase == procnum
-     * Hence rdbase physical address is ignored
-     */
-    if (cte.rdbase >= s->gicv3->num_cpu) {
-        return CMD_CONTINUE;
+    cmdres = lookup_cte(s, __func__, ite.icid, &cte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
 
     if ((cmd == CLEAR) || (cmd == DISCARD)) {
@@ -792,54 +802,13 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    if (old_ite.icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
-                      __func__, old_ite.icid);
-        return CMD_CONTINUE;
+    cmdres = lookup_cte(s, __func__, old_ite.icid, &old_cte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
-
-    if (new_icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: ICID 0x%x\n",
-                      __func__, new_icid);
-        return CMD_CONTINUE;
-    }
-
-    if (get_cte(s, old_ite.icid, &old_cte) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    if (!old_cte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid CTE for old ICID 0x%x\n",
-                      __func__, old_ite.icid);
-        return CMD_CONTINUE;
-    }
-
-    if (get_cte(s, new_icid, &new_cte) != MEMTX_OK) {
-        return CMD_STALL;
-    }
-    if (!new_cte.valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid CTE for new ICID 0x%x\n",
-                      __func__, new_icid);
-        return CMD_CONTINUE;
-    }
-
-    if (old_cte.rdbase >= s->gicv3->num_cpu) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: CTE has invalid rdbase 0x%x\n",
-                      __func__, old_cte.rdbase);
-        return CMD_CONTINUE;
-    }
-
-    if (new_cte.rdbase >= s->gicv3->num_cpu) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: CTE has invalid rdbase 0x%x\n",
-                      __func__, new_cte.rdbase);
-        return CMD_CONTINUE;
+    cmdres = lookup_cte(s, __func__, new_icid, &new_cte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
     }
 
     if (old_cte.rdbase != new_cte.rdbase) {
-- 
2.25.1


