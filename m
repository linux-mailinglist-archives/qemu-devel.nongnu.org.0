Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1652950B58A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:48:22 +0200 (CEST)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqpm-0003CI-Hs
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9l-0004LO-Rt
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9i-0002ba-Py
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c10so10334870wrb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9JIpRBTm63udjzml/qD9iCIGqEv/JkcdC9XjAHuZkOE=;
 b=FFPSsRmBZe7M8PMD8ERKoAdoQlu8NOnmSPokplAgiAg/w8fzf/TAlxXRrhmz411inL
 keBJSx+TV8bI0Ijg/laFf/8uQXAkbxbUf9Oh62FvFul9PjjtYkiO7YCxNbW32TdCFtHi
 f9hv3xus06BKZF7/KSYio2fcqLsJnSjOJJW7tD3WudGOx2IV6aByR29cL/DVO6dOK9Ih
 dHl7aEsT+lkaYI5p6oEj1t40vMyU1JGaGsvpLDLUb84AvEduxiHecCS/OVrFl/GcmCJf
 jn23q+EzWl/FeOHmMUErrqJaWF2XidQXKYV1AYRnYLvpew/20dlpzcHJeEou2/OXe6i7
 +Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JIpRBTm63udjzml/qD9iCIGqEv/JkcdC9XjAHuZkOE=;
 b=dtnlDmQ8xBH342qntCiwePc+I03fa+niO4HD66PIdzZb431JOc7I6O5ao5EHDs5MR/
 ASCkXU9jw5vbiSaQ6qLRWR6Zj7qN1qbs9JumJ3YtHJz/h2jwC6QE8QrwpLEy+aBsb00B
 fdUhLstmDOyy5aNfYirx74r6hOV+rqQpoiBriYR22hQNlIlNMOYiIgyJz4zzqh4KDLk7
 4zAPmu4rLwQo9ovcgVUnNFECLpn/DGIcQ0zG4M96dn9jthKk6pE66QuMWWaiGoCOmAvA
 CVuunR7lA7Y7KDtzHoUot39QLXiyUT/Ywr38nwUHsvhClxYB/pEhW+DFOo/qdD8mV209
 QkqQ==
X-Gm-Message-State: AOAM532cDFX3K8sHW2njPsi0N8JJjOEUGetQBV77nA4Zuwre2v+vp3vI
 yec/wY9LNS8bV3m5S2fzm/wSfbcQMRg0Ww==
X-Google-Smtp-Source: ABdhPJxxa+gz+//SHZct2GsflPsaF98uWRItXupbFFzfVDnp2JXt8aryCVPgnAOL4BoRSlqFrH0u1Q==
X-Received: by 2002:a5d:48c7:0:b0:20a:c72d:279b with SMTP id
 p7-20020a5d48c7000000b0020ac72d279bmr2808761wrs.379.1650621889271; 
 Fri, 22 Apr 2022 03:04:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/61] hw/intc/arm_gicv3_its: Implement VMOVP
Date: Fri, 22 Apr 2022 11:03:47 +0100
Message-Id: <20220422100432.2288247-17-peter.maydell@linaro.org>
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

Implement the GICv4 VMOVP command, which updates an entry in the vPE
table to change its rdbase field. This command is unique in the ITS
command set because its effects must be propagated to all the other
ITSes connected to the same GIC as the ITS which executes the VMOVP
command.

The GICv4 spec allows two implementation choices for handling the
propagation to other ITSes:
 * If GITS_TYPER.VMOVP is 1, the guest only needs to issue the command
   on one ITS, and the implementation handles the propagation to
   all ITSes
 * If GITS_TYPER.VMOVP is 0, the guest must issue the command on
   every ITS, and arrange for the ITSes to synchronize the updates
   with each other by setting ITSList and Sequence Number fields
   in the command packets

We choose the GITS_TYPER.VMOVP = 1 approach, and synchronously
execute the update on every ITS.

For GICv4.1 this command has extra fields in the command packet and
additional behaviour.  We define the 4.1-only fields with the FIELD
macro, but only implement the GICv4.0 version of the command.

Note that we don't update the reported GITS_TYPER value here;
we'll do that later in a commit which updates all the reported
feature bit and ID register values for GICv4.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-17-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h | 18 ++++++++++
 hw/intc/arm_gicv3_its.c  | 75 ++++++++++++++++++++++++++++++++++++++++
 hw/intc/trace-events     |  1 +
 3 files changed, 94 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 69a59daf867..c1467ce7263 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -329,6 +329,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_INVALL           0x0D
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_VMOVP            0x22
 #define GITS_CMD_VMAPP            0x29
 #define GITS_CMD_VMAPTI           0x2A
 #define GITS_CMD_VMAPI            0x2B
@@ -389,6 +390,14 @@ FIELD(VMAPP_2, V, 63, 1)
 FIELD(VMAPP_3, VPTSIZE, 0, 8) /* For GICv4.0, bits [7:6] are RES0 */
 FIELD(VMAPP_3, VPTADDR, 16, 36)
 
+/* VMOVP command fields */
+FIELD(VMOVP_0, SEQNUM, 32, 16) /* not used for GITS_TYPER.VMOVP == 1 */
+FIELD(VMOVP_1, ITSLIST, 0, 16) /* not used for GITS_TYPER.VMOVP == 1 */
+FIELD(VMOVP_1, VPEID, 32, 16)
+FIELD(VMOVP_2, RDBASE, 16, 36)
+FIELD(VMOVP_2, DB, 63, 1) /* GICv4.1 only */
+FIELD(VMOVP_3, DEFAULT_DOORBELL, 0, 32) /* GICv4.1 only */
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
@@ -718,4 +727,13 @@ static inline void gicv3_add_its(GICv3State *s, DeviceState *its)
     g_ptr_array_add(s->itslist, its);
 }
 
+/*
+ * The ITS can use this for operations that must be performed on
+ * every ITS connected to the same GIC that it is
+ */
+static inline void gicv3_foreach_its(GICv3State *s, GFunc func, void *opaque)
+{
+    g_ptr_array_foreach(s->itslist, func, opaque);
+}
+
 #endif /* QEMU_ARM_GICV3_INTERNAL_H */
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 46d9e0169f9..8bc93295fb5 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1012,6 +1012,78 @@ static ItsCmdResult process_vmapp(GICv3ITSState *s, const uint64_t *cmdpkt)
     return update_vte(s, vpeid, &vte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
+typedef struct VmovpCallbackData {
+    uint64_t rdbase;
+    uint32_t vpeid;
+    /*
+     * Overall command result. If more than one callback finds an
+     * error, STALL beats CONTINUE.
+     */
+    ItsCmdResult result;
+} VmovpCallbackData;
+
+static void vmovp_callback(gpointer data, gpointer opaque)
+{
+    /*
+     * This function is called to update the VPEID field in a VPE
+     * table entry for this ITS. This might be because of a VMOVP
+     * command executed on any ITS that is connected to the same GIC
+     * as this ITS.  We need to read the VPE table entry for the VPEID
+     * and update its RDBASE field.
+     */
+    GICv3ITSState *s = data;
+    VmovpCallbackData *cbdata = opaque;
+    VTEntry vte;
+    ItsCmdResult cmdres;
+
+    cmdres = lookup_vte(s, __func__, cbdata->vpeid, &vte);
+    switch (cmdres) {
+    case CMD_STALL:
+        cbdata->result = CMD_STALL;
+        return;
+    case CMD_CONTINUE:
+        if (cbdata->result != CMD_STALL) {
+            cbdata->result = CMD_CONTINUE;
+        }
+        return;
+    case CMD_CONTINUE_OK:
+        break;
+    }
+
+    vte.rdbase = cbdata->rdbase;
+    if (!update_vte(s, cbdata->vpeid, &vte)) {
+        cbdata->result = CMD_STALL;
+    }
+}
+
+static ItsCmdResult process_vmovp(GICv3ITSState *s, const uint64_t *cmdpkt)
+{
+    VmovpCallbackData cbdata;
+
+    if (!its_feature_virtual(s)) {
+        return CMD_CONTINUE;
+    }
+
+    cbdata.vpeid = FIELD_EX64(cmdpkt[1], VMOVP_1, VPEID);
+    cbdata.rdbase = FIELD_EX64(cmdpkt[2], VMOVP_2, RDBASE);
+
+    trace_gicv3_its_cmd_vmovp(cbdata.vpeid, cbdata.rdbase);
+
+    if (cbdata.rdbase >= s->gicv3->num_cpu) {
+        return CMD_CONTINUE;
+    }
+
+    /*
+     * Our ITS implementation reports GITS_TYPER.VMOVP == 1, which means
+     * that when the VMOVP command is executed on an ITS to change the
+     * VPEID field in a VPE table entry the change must be propagated
+     * to all the ITSes connected to the same GIC.
+     */
+    cbdata.result = CMD_CONTINUE_OK;
+    gicv3_foreach_its(s->gicv3, vmovp_callback, &cbdata);
+    return cbdata.result;
+}
+
 /*
  * Current implementation blocks until all
  * commands are processed
@@ -1136,6 +1208,9 @@ static void process_cmdq(GICv3ITSState *s)
         case GITS_CMD_VMAPP:
             result = process_vmapp(s, cmdpkt);
             break;
+        case GITS_CMD_VMOVP:
+            result = process_vmovp(s, cmdpkt);
+            break;
         default:
             trace_gicv3_its_cmd_unknown(cmd);
             break;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index d529914eca2..a2dd1bdb6c3 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -190,6 +190,7 @@ gicv3_its_cmd_movi(uint32_t devid, uint32_t eventid, uint32_t icid) "GICv3 ITS:
 gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x Dbell_pINTID 0x%x"
 gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t vintid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x vINTID 0x%x Dbell_pINTID 0x%x"
 gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr, uint32_t vptsize) "GICv3 ITS: command VMAPP vPEID 0x%x RDbase 0x%" PRIx64 " V %d VPT_addr 0x%" PRIx64 " VPT_size 0x%x"
+gicv3_its_cmd_vmovp(uint32_t vpeid, uint64_t rdbase) "GICv3 ITS: command VMOVP vPEID 0x%x RDbase 0x%" PRIx64
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1


