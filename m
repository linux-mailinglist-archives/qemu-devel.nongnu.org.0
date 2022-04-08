Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D34F980F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:30:09 +0200 (CEST)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpcm-0000I9-NU
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPF-0006ub-Pi
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPC-0002He-Ne
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w4so13008346wrg.12
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WYbE6n09x98/8r6NZVq0wUWihXF3pXJgeidd4roSBuo=;
 b=z64kQepBrFBkUSwLDHJCNaUw50Mbv4pTJsOJmdDlxA1lrfDqEQDVgcwUJXNyyqPu4y
 1ZN5ob6Geeff/EfPyQo9YVFbLHmwdg9u7/Y+NnQGTdzF1KKiFg+KjXRfCQoED1nnGx15
 T2diGwPvDUMWyMcrmpdwQXpQ2kMzzMYXJhBb5CNe3WEpkxQtOp4O2KAhTN7VavhEcI+u
 9FBA2kppm9O7C6/u22PJcmc+sf9zqPr1ulO1JpHbN9BEXKWOhskbg1Cztvu8v4Z7KtQi
 aTxEGXXUcrYmXqODO6uFIKzgIbQlJFoakOqaF5xCPKQ773idIcMqPIdFHiff10HZdhjZ
 KXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WYbE6n09x98/8r6NZVq0wUWihXF3pXJgeidd4roSBuo=;
 b=JqYKIOMe0S52iwAmFWMFfoDzWvxSTizQTpLlHhuglANygB8nRdRA32NjMM6sKTrpH4
 gGbISpGxjc2VTUKWayZ335bVIpGMFfs2fWVlZ8EXf7P577wkibnrgXXwynn41Ui+vlQf
 gVQ8l7gNRKff99xMGtKnTFNy42oBFbqyBNwys0syEyAc4xiwut63W3j2tDHsdjxpi3fG
 zKELfZGwDHOmqiPdlM2xCfKKoIU8WwLIxntzqh07ZmMIkpuLcapYBWReRAAzm/cPb5XZ
 t8rxVpIL/X7anxr2KwH+xJqH+/dgpIA30rMmEERb0S/MoNlImJEACQ1pL3u6Q+kqGPII
 9uJw==
X-Gm-Message-State: AOAM531WJ1ByJnkvxE5LX7Z+RPwSCQpwIa+c1NQgjFANdLnJX3B6qq0J
 /ks0gRCQTbkv4G+Km0hJgqMLvg==
X-Google-Smtp-Source: ABdhPJyrp3lyqKpQ+JeUXnbIYQ/w/uKYAsXAs030laSTo5P+ZZYB0n3QWO4EDdMIKMdjrdGAX4PG+g==
X-Received: by 2002:a5d:5009:0:b0:206:f24:b659 with SMTP id
 e9-20020a5d5009000000b002060f24b659mr15034996wrt.476.1649427365095; 
 Fri, 08 Apr 2022 07:16:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/41] hw/intc/arm_gicv3_its: Factor out CTE lookup sequence
Date: Fri,  8 Apr 2022 15:15:21 +0100
Message-Id: <20220408141550.1271295-13-peter.maydell@linaro.org>
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

Factor out the sequence of looking up a CTE from an ICID including
the validity and error checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think process_movi() in particular is now a lot cleaner
to read with all the error-checking factored out.
---
 hw/intc/arm_gicv3_its.c | 109 ++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 70 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index fe1bea2dd81..2cbac76256d 100644
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


