Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46A50B523
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:35:21 +0200 (CEST)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqdE-0000yk-FX
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9f-0004Eg-6C
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9d-0002ah-F1
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c10so10334541wrb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5uD+m1v7OaY8Vt76UhAAZWA6827cTfQzBkx7Ps8s2No=;
 b=J9ddXcVxdyYgoyQintDV4POXii7agiIKzE+ReamVH9m9COd3zGDyGBCbcptb6Vtzl1
 696/BAFlN7Zi2ViRv9SfYdn9lHv3o0d+JdYectPdr9GIREVAbAxzei/VH2OLoYyEoTQE
 KaKlUUPvycfOZpBhyf6zdFU30XdJtTgD6bzd+MQc3ZidERPs3Att8SdGDqnxt0WqJMlt
 eEsxQxPu3fzfqKrgQmklKvJqL4V5hQ8DfGgAArs163d1b4HhaBvvARCcuuxcpr4remUH
 kQR5E4NasQ9VzBWtSscJSM6nYl1+aFNoN7Qa4eAC0P+l2xmTRQlJvQfyWZu79nZqnp/r
 LYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5uD+m1v7OaY8Vt76UhAAZWA6827cTfQzBkx7Ps8s2No=;
 b=LmTwJ7UjTIj3zmGo2ITt+ytxYXq4t6gFbT4ZCekg7YgYi0dMxzxq9q5JVVqpaY4oeo
 UGZwNN31Wzvev2OZJxxxOXZBzG1eqz4XgQi4/7fs3pVYOcsAHy20G4tgPujoS3kp64B0
 LI0350tJXZgbiHCJT/90dD4le8zZ3IH/kaWZCn5GNGw4BdFQr9i5ZM712qDjxn4jVpPn
 vPhOkf1yiO2g9fAecW0PyK5pgVVtjnjLsBkJcqTByQQFbPRWj2dhji9ExkKFsv22+o1m
 qjJcYAVl0lTYDn50NYhZKCOy6FYkQkK0nET8WZjAMklbQkCJKgdcyffHPFTAPIitlCA0
 wxdw==
X-Gm-Message-State: AOAM5327Pn4RA0ugiCLod7W8ovhbK/s7HwxfVLIKQ6wglGTkLbiIxLDj
 yozB7/BtGWrK93qYD3NaG6CpxlsxCV9STg==
X-Google-Smtp-Source: ABdhPJz0x9i5HECqVF3/aPi7uLwlT6iE+pbn4SnPd5rCSLkLBxw3BsCWZOH5Tc31H6QvcTyZij7/sg==
X-Received: by 2002:a5d:48ce:0:b0:20a:bb9b:62a3 with SMTP id
 p14-20020a5d48ce000000b0020abb9b62a3mr3050360wrs.307.1650621883994; 
 Fri, 22 Apr 2022 03:04:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/61] hw/intc/arm_gicv3_its: Distinguish success and error
 cases of CMD_CONTINUE
Date: Fri, 22 Apr 2022 11:03:41 +0100
Message-Id: <20220422100432.2288247-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

In the ItsCmdResult enum, we currently distinguish only CMD_STALL
(failure, stall processing of the command queue) and CMD_CONTINUE
(keep processing the queue), and we use the latter both for "there
was a parameter error, go on to the next command" and "the command
succeeded, go on to the next command".  Sometimes we would like to
distinguish those two cases, so add CMD_CONTINUE_OK to the enum to
represent the success situation, and use it in the relevant places.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-11-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 880bc6f647c..179a9b032c2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -78,11 +78,13 @@ typedef struct VTEntry {
  * and continue processing.
  * The process_* functions which handle individual ITS commands all
  * return an ItsCmdResult which tells process_cmdq() whether it should
- * stall or keep going.
+ * stall, keep going because of an error, or keep going because the
+ * command was a success.
  */
 typedef enum ItsCmdResult {
     CMD_STALL = 0,
     CMD_CONTINUE = 1,
+    CMD_CONTINUE_OK = 2,
 } ItsCmdResult;
 
 /* True if the ITS supports the GICv4 virtual LPI feature */
@@ -400,9 +402,9 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         ITEntry ite = {};
         /* remove mapping from interrupt translation table */
         ite.valid = false;
-        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
     }
-    return CMD_CONTINUE;
+    return CMD_CONTINUE_OK;
 }
 
 static ItsCmdResult process_its_cmd(GICv3ITSState *s, const uint64_t *cmdpkt,
@@ -495,7 +497,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     ite.icid = icid;
     ite.doorbell = INTID_SPURIOUS;
     ite.vpeid = 0;
-    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
@@ -574,7 +576,7 @@ static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     ite.icid = 0;
     ite.doorbell = doorbell;
     ite.vpeid = vpeid;
-    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -635,7 +637,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_cte(s, icid, &cte) ? CMD_CONTINUE : CMD_STALL;
+    return update_cte(s, icid, &cte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -696,7 +698,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_dte(s, devid, &dte) ? CMD_CONTINUE : CMD_STALL;
+    return update_dte(s, devid, &dte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
@@ -725,13 +727,13 @@ static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
 
     if (rd1 == rd2) {
         /* Move to same target must succeed as a no-op */
-        return CMD_CONTINUE;
+        return CMD_CONTINUE_OK;
     }
 
     /* Move all pending LPIs from redistributor 1 to redistributor 2 */
     gicv3_redist_movall_lpis(&s->gicv3->cpu[rd1], &s->gicv3->cpu[rd2]);
 
-    return CMD_CONTINUE;
+    return CMD_CONTINUE_OK;
 }
 
 static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
@@ -845,7 +847,7 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 
     /* Update the ICID field in the interrupt translation table entry */
     old_ite.icid = new_icid;
-    return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -924,7 +926,7 @@ static ItsCmdResult process_vmapp(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_vte(s, vpeid, &vte) ? CMD_CONTINUE : CMD_STALL;
+    return update_vte(s, vpeid, &vte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -963,7 +965,7 @@ static void process_cmdq(GICv3ITSState *s)
     }
 
     while (wr_offset != rd_offset) {
-        ItsCmdResult result = CMD_CONTINUE;
+        ItsCmdResult result = CMD_CONTINUE_OK;
         void *hostmem;
         hwaddr buflen;
         uint64_t cmdpkt[GITS_CMDQ_ENTRY_WORDS];
@@ -1055,7 +1057,8 @@ static void process_cmdq(GICv3ITSState *s)
             trace_gicv3_its_cmd_unknown(cmd);
             break;
         }
-        if (result == CMD_CONTINUE) {
+        if (result != CMD_STALL) {
+            /* CMD_CONTINUE or CMD_CONTINUE_OK */
             rd_offset++;
             rd_offset %= s->cq.num_entries;
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
-- 
2.25.1


