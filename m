Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E2E50B536
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:37:53 +0200 (CEST)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqfg-0005Y1-5E
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9k-0004I3-1w
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:52 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9h-0002bM-VU
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b19so10279727wrh.11
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DJiY/tgKJhJy8+LIvxeHxLLKq7rqsAI2KRSR0lukesA=;
 b=pyQy12zNdPlJp75X97973Usa8Q11fAliqGLkKs9Srdx+dpkBHvp8m97SmQz4wY+dEE
 RTGfPrA7nvfoPIR2P2/u+TG9ISxrpKWs5V9N/7Z41T2KbUJD6CF0LADjsBNf9/BTXKQ/
 jjYbvGFzfesMnaSSfQEUOl52J9uTOJ4fbGMYYce6jRGDCejd8Qlev9IOB2KRTpxqCgeL
 cIFXW4JMxv6dBDj1ISGm+Tr63zcawaPmv6CplUoBwBFXbQFN5/jj0gjvq8L+1o3QKW6n
 nswdIlpH0HA8NCJedJyqRQNS2RWxfBqv5CP9HctYWJMl1NfI0PwOV5c1MyPm6BbQH6pg
 k1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DJiY/tgKJhJy8+LIvxeHxLLKq7rqsAI2KRSR0lukesA=;
 b=IcM4w2Ay53rbSU/vcgUHNkksf2AJFv3x6s0WjCkF8C4lQLMfvM2Y9eBySrSPYXR1I1
 TZ5TI2c1Gnhvo5kySt2OREYJWFCFiDkpzajHnohQP6jsFIHMLrhFV+HGLjsbf3g4X265
 eNwit0RZLMFBkklevpPjx1tJifaMUHsJSOEUy9DuotxbNR8iKD7uUHQHMlvr/tmSvueg
 9hCjp6HkCKezBTOF3qtc4hBiJru5emObu4la4uxPDx+7EyxUWrm+pUrncYXjSPC0zn2M
 SIJ4/KUYSEv9bvWky8t6OtOrrgUJRlCSfcSH3itNycc7dA/MD99MrwPB1nPncRC1T9B2
 zhSQ==
X-Gm-Message-State: AOAM532TLv/O4jt/TkRxWFOr5I7G1GXABSpH+P+FgenozGMjdV9r04of
 gxdvTQaHM/zpmrO3KQlA5u+Uq93FgwgUhA==
X-Google-Smtp-Source: ABdhPJzKAPtj1XnPsZXkZmMmukhnjsTXRrmE6bD+5IzI9kV30rpCx7Kx1p7mVcY182on9JJlCEhvsA==
X-Received: by 2002:adf:e346:0:b0:205:97d0:50db with SMTP id
 n6-20020adfe346000000b0020597d050dbmr3071854wrj.257.1650621887429; 
 Fri, 22 Apr 2022 03:04:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/61] hw/intc/arm_gicv3_its: Handle virtual interrupts in
 process_its_cmd()
Date: Fri, 22 Apr 2022 11:03:45 +0100
Message-Id: <20220422100432.2288247-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

For GICv4, interrupt table entries read by process_its_cmd() may
indicate virtual LPIs which are to be directly injected into a VM.
Implement the ITS side of the code for handling this.  This is
similar to the existing handling of physical LPIs, but instead of
looking up a collection ID in a collection table, we look up a vPEID
in a vPE table.  As with the physical LPIs, we leave the rest of the
work to code in the redistributor device.

The redistributor half will be implemented in a later commit;
for now we just provide a stub function which does nothing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-15-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   | 17 +++++++
 hw/intc/arm_gicv3_its.c    | 99 +++++++++++++++++++++++++++++++++++++-
 hw/intc/arm_gicv3_redist.c |  9 ++++
 hw/intc/trace-events       |  2 +
 4 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index bbb8a20ce61..6e22c8072e9 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -527,6 +527,23 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
 void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
+/**
+ * gicv3_redist_process_vlpi:
+ * @cs: GICv3CPUState
+ * @irq: (virtual) interrupt number
+ * @vptaddr: (guest) address of VLPI table
+ * @doorbell: doorbell (physical) interrupt number (1023 for "no doorbell")
+ * @level: level to set @irq to
+ *
+ * Process a virtual LPI being directly injected by the ITS. This function
+ * will update the VLPI table specified by @vptaddr and @vptsize. If the
+ * vCPU corresponding to that VLPI table is currently running on
+ * the CPU associated with this redistributor, directly inject the VLPI
+ * @irq. If the vCPU is not running on this CPU, raise the doorbell
+ * interrupt instead.
+ */
+void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
+                               int doorbell, int level);
 void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
 /**
  * gicv3_redist_update_lpi:
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e7e1769fa41..d2c0ca5f726 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -314,6 +314,42 @@ out:
     return res;
 }
 
+/*
+ * Read the vPE Table entry at index @vpeid. On success (including
+ * successfully determining that there is no valid entry for this index),
+ * we return MEMTX_OK and populate the VTEntry struct accordingly.
+ * If there is an error reading memory then we return the error code.
+ */
+static MemTxResult get_vte(GICv3ITSState *s, uint32_t vpeid, VTEntry *vte)
+{
+    MemTxResult res = MEMTX_OK;
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t entry_addr = table_entry_addr(s, &s->vpet, vpeid, &res);
+    uint64_t vteval;
+
+    if (entry_addr == -1) {
+        /* No L2 table entry, i.e. no valid VTE, or a memory error */
+        vte->valid = false;
+        goto out;
+    }
+    vteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        goto out;
+    }
+    vte->valid = FIELD_EX64(vteval, VTE, VALID);
+    vte->vptsize = FIELD_EX64(vteval, VTE, VPTSIZE);
+    vte->vptaddr = FIELD_EX64(vteval, VTE, VPTADDR);
+    vte->rdbase = FIELD_EX64(vteval, VTE, RDBASE);
+out:
+    if (res != MEMTX_OK) {
+        trace_gicv3_its_vte_read_fault(vpeid);
+    } else {
+        trace_gicv3_its_vte_read(vpeid, vte->valid, vte->vptsize,
+                                 vte->vptaddr, vte->rdbase);
+    }
+    return res;
+}
+
 /*
  * Given a (DeviceID, EventID), look up the corresponding ITE, including
  * checking for the various invalid-value cases. If we find a valid ITE,
@@ -397,6 +433,38 @@ static ItsCmdResult lookup_cte(GICv3ITSState *s, const char *who,
     return CMD_CONTINUE_OK;
 }
 
+/*
+ * Given a VPEID, look up the corresponding VTE, including checking
+ * for various invalid-value cases. if we find a valid VTE, fill in @vte
+ * and return CMD_CONTINUE_OK; otherwise return CMD_STALL or CMD_CONTINUE
+ * (and the contents of @vte should not be relied on).
+ *
+ * The string @who is purely for the LOG_GUEST_ERROR messages,
+ * and should indicate the name of the calling function or similar.
+ */
+static ItsCmdResult lookup_vte(GICv3ITSState *s, const char *who,
+                               uint32_t vpeid, VTEntry *vte)
+{
+    if (vpeid >= s->vpet.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid VPEID 0x%x\n", who, vpeid);
+        return CMD_CONTINUE;
+    }
+
+    if (get_vte(s, vpeid, vte) != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!vte->valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid VTE for VPEID 0x%x\n", who, vpeid);
+        return CMD_CONTINUE;
+    }
+
+    if (vte->rdbase >= s->gicv3->num_cpu) {
+        return CMD_CONTINUE;
+    }
+    return CMD_CONTINUE_OK;
+}
+
 static ItsCmdResult process_its_cmd_phys(GICv3ITSState *s, const ITEntry *ite,
                                          int irqlevel)
 {
@@ -411,6 +479,33 @@ static ItsCmdResult process_its_cmd_phys(GICv3ITSState *s, const ITEntry *ite,
     return CMD_CONTINUE_OK;
 }
 
+static ItsCmdResult process_its_cmd_virt(GICv3ITSState *s, const ITEntry *ite,
+                                         int irqlevel)
+{
+    VTEntry vte;
+    ItsCmdResult cmdres;
+
+    cmdres = lookup_vte(s, __func__, ite->vpeid, &vte);
+    if (cmdres != CMD_CONTINUE_OK) {
+        return cmdres;
+    }
+
+    if (!intid_in_lpi_range(ite->intid) ||
+        ite->intid >= (1ULL << (vte.vptsize + 1))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: intid 0x%x out of range\n",
+                      __func__, ite->intid);
+        return CMD_CONTINUE;
+    }
+
+    /*
+     * For QEMU the actual pending of the vLPI is handled in the
+     * redistributor code
+     */
+    gicv3_redist_process_vlpi(&s->gicv3->cpu[vte.rdbase], ite->intid,
+                              vte.vptaddr << 16, ite->doorbell, irqlevel);
+    return CMD_CONTINUE_OK;
+}
+
 /*
  * This function handles the processing of following commands based on
  * the ItsCmdType parameter passed:-
@@ -446,8 +541,8 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                           __func__, ite.inttype);
             return CMD_CONTINUE;
         }
-        /* The GICv4 virtual interrupt handling will go here */
-        g_assert_not_reached();
+        cmdres = process_its_cmd_virt(s, &ite, irqlevel);
+        break;
     default:
         g_assert_not_reached();
     }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index dc9729e8395..b08b599c887 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -788,6 +788,15 @@ void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
     gicv3_redist_update_lpi(dest);
 }
 
+void gicv3_redist_process_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr,
+                               int doorbell, int level)
+{
+    /*
+     * The redistributor handling for being handed a VLPI by the ITS
+     * will be added in a subsequent commit.
+     */
+}
+
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 {
     /* Update redistributor state for a change in an external PPI input line */
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 2fcc9e40e55..d529914eca2 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -200,6 +200,8 @@ gicv3_its_ite_write(uint64_t ittaddr, uint32_t eventid, int valid, int inttype,
 gicv3_its_dte_read(uint32_t devid, int valid, uint32_t size, uint64_t ittaddr) "GICv3 ITS: Device Table read for DeviceID 0x%x: valid %d size 0x%x ITTaddr 0x%" PRIx64
 gicv3_its_dte_write(uint32_t devid, int valid, uint32_t size, uint64_t ittaddr) "GICv3 ITS: Device Table write for DeviceID 0x%x: valid %d size 0x%x ITTaddr 0x%" PRIx64
 gicv3_its_dte_read_fault(uint32_t devid) "GICv3 ITS: Device Table read for DeviceID 0x%x: faulted"
+gicv3_its_vte_read(uint32_t vpeid, int valid, uint32_t vptsize, uint64_t vptaddr, uint32_t rdbase) "GICv3 ITS: vPE Table read for vPEID 0x%x: valid %d VPTsize 0x%x VPTaddr 0x%" PRIx64 " RDbase 0x%x"
+gicv3_its_vte_read_fault(uint32_t vpeid) "GICv3 ITS: vPE Table read for vPEID 0x%x: faulted"
 gicv3_its_vte_write(uint32_t vpeid, int valid, uint32_t vptsize, uint64_t vptaddr, uint32_t rdbase) "GICv3 ITS: vPE Table write for vPEID 0x%x: valid %d VPTsize 0x%x VPTaddr 0x%" PRIx64 " RDbase 0x%x"
 
 # armv7m_nvic.c
-- 
2.25.1


