Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9396849FDBA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:11:52 +0100 (CET)
Received: from localhost ([::1]:55390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTqp-00054E-Ng
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDL-0002Eo-J7
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:03 -0500
Received: from [2a00:1450:4864:20::32f] (port=44992
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDJ-0006RD-50
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:03 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4288050wms.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o98uoL9Xfap+v4Tl1MPsf7fANnXlxiPhbqLzhPhwRCg=;
 b=utdGr22wTbp2fgcfiT5n8sY/Lr9AquSZb0A1KAfyHrQbIA3X6rLcQmRZ/w66F5+rHr
 i4dwHc2R9nDlTB3cjUaGJVREzEol7gBOVh6IZAOKpZoZTyuJmE2oX2KrnuYlQozHFu4i
 txpJs8XlE1mXniRxiqgeO3n2jUvp5PnvDnrUHQ7qX696iQmW7L0euBOcTiciZjH2kIJG
 Udw8tjSQ5gVxzNVr15EE6FGCedGmdiGC7Ll9du9r5+ZRwSHhu6m9VgH2MxRK2rqS7eKf
 x1atrpPsqeTEsenu5X4Fjsr5m9K7T7qTTk+NgbyNT+AkIpnEikff8zX7IV4qgXhse17T
 ZRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o98uoL9Xfap+v4Tl1MPsf7fANnXlxiPhbqLzhPhwRCg=;
 b=FiaUhIKGB/LSHRcRCxSBy9l9ykuuI/YHH9Upj+LR9AvcHN0ELpZj+rrz3uWVG/mBzw
 VKoovumbZl9b5uPIp6KrKV1Dp3XoZB1XxGnnCXX52AoIcRDbK1KAnz97+Qb6Pi98lSjd
 qETFODvmF8h+iwB5mhZyD8gM13hmrYG/kiLwl4QfA6/QxS0ERhjw75ZGAYFocPr2hjID
 MTm4Y3FJBB/PvOU/Czq7ywwKKdjnSymEMOk2RfeteY/ntX9kh5FCNNHc4DtGiODM1Ddj
 IK9XzBZfkErjE94Lhjd7BYVXtnF9a7FBUUxgiIGDu0NFdczpeHYpK9mbNTpa6zxXoZi3
 ARQA==
X-Gm-Message-State: AOAM531oEMw17HhSkpKwlkDEr1hAyLznT2AHWuJV2k2ftH+RKrKQBaTh
 hwg6g196/1lyvW/YMIkganO3VykCb+x/UQ==
X-Google-Smtp-Source: ABdhPJygCiacyNTTcZ2MsLjIJk7qY650eSZyZFHezsHdByiupi19RL799n9iG3ihNd29248QSO/CKQ==
X-Received: by 2002:a05:600c:17d5:: with SMTP id
 y21mr8126882wmo.102.1643383841793; 
 Fri, 28 Jan 2022 07:30:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/32] hw/intc/arm_gicv3_its: Implement MOVI
Date: Fri, 28 Jan 2022 15:30:07 +0000
Message-Id: <20220128153009.2467560-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Implement the ITS MOVI command. This command specifies a (physical) LPI
by DeviceID and EventID and provides a new ICID for it. The ITS must
find the interrupt translation table entry for the LPI, which will
tell it the old ICID. It then moves the pending state of the LPI from
the old redistributor to the new one and updates the ICID field in
the translation table entry.

This is another GICv3 ITS command that we forgot to implement.  Linux
does use this one, but only if the guest powers off one of its CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-15-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   |  16 ++++
 hw/intc/arm_gicv3_its.c    | 146 +++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c |  53 ++++++++++++++
 3 files changed, 215 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index da45975d92b..b1af26df9f4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -315,6 +315,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define CMD_MASK                  0xff
 
 /* ITS Commands */
+#define GITS_CMD_MOVI             0x01
 #define GITS_CMD_INT              0x03
 #define GITS_CMD_CLEAR            0x04
 #define GITS_CMD_SYNC             0x05
@@ -360,6 +361,11 @@ FIELD(MAPC, RDBASE, 16, 32)
 FIELD(MOVALL_2, RDBASE1, 16, 36)
 FIELD(MOVALL_3, RDBASE2, 16, 36)
 
+/* MOVI command fields */
+FIELD(MOVI_0, DEVICEID, 32, 32)
+FIELD(MOVI_1, EVENTID, 0, 32)
+FIELD(MOVI_2, ICID, 0, 16)
+
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
@@ -502,6 +508,16 @@ void gicv3_redist_update_lpi(GICv3CPUState *cs);
  * an incoming migration has loaded new state.
  */
 void gicv3_redist_update_lpi_only(GICv3CPUState *cs);
+/**
+ * gicv3_redist_mov_lpi:
+ * @src: source redistributor
+ * @dest: destination redistributor
+ * @irq: LPI to update
+ *
+ * Move the pending state of the specified LPI from @src to @dest,
+ * as required by the ITS MOVI command.
+ */
+void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq);
 /**
  * gicv3_redist_movall_lpis:
  * @src: source redistributor
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ebc0403b3c7..51d9be4ae6f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -634,6 +634,149 @@ static ItsCmdResult process_movall(GICv3ITSState *s, uint64_t value,
     return CMD_CONTINUE;
 }
 
+static ItsCmdResult process_movi(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    MemTxResult res = MEMTX_OK;
+    uint32_t devid, eventid, intid;
+    uint16_t old_icid, new_icid;
+    uint64_t old_cte, new_cte;
+    uint64_t old_rdbase, new_rdbase;
+    uint64_t dte;
+    bool dte_valid, ite_valid, cte_valid;
+    uint64_t num_eventids;
+    IteEntry ite = {};
+
+    devid = FIELD_EX64(value, MOVI_0, DEVICEID);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    eventid = FIELD_EX64(value, MOVI_1, EVENTID);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    new_icid = FIELD_EX64(value, MOVI_2, ICID);
+
+    if (devid >= s->dt.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_entries);
+        return CMD_CONTINUE;
+    }
+    dte = get_dte(s, devid, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    dte_valid = FIELD_EX64(dte, DTE, VALID);
+    if (!dte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid dte: %"PRIx64" for %d\n",
+                      __func__, dte, devid);
+        return CMD_CONTINUE;
+    }
+
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n",
+                      __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
+    ite_valid = get_ite(s, eventid, dte, &old_icid, &intid, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!ite_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: invalid ITE\n",
+                      __func__);
+        return CMD_CONTINUE;
+    }
+
+    if (old_icid >= s->ct.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
+                      __func__, old_icid);
+        return CMD_CONTINUE;
+    }
+
+    if (new_icid >= s->ct.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: ICID 0x%x\n",
+                      __func__, new_icid);
+        return CMD_CONTINUE;
+    }
+
+    cte_valid = get_cte(s, old_icid, &old_cte, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid cte: %"PRIx64"\n",
+                      __func__, old_cte);
+        return CMD_CONTINUE;
+    }
+
+    cte_valid = get_cte(s, new_icid, &new_cte, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid cte: %"PRIx64"\n",
+                      __func__, new_cte);
+        return CMD_CONTINUE;
+    }
+
+    old_rdbase = FIELD_EX64(old_cte, CTE, RDBASE);
+    if (old_rdbase >= s->gicv3->num_cpu) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: CTE has invalid rdbase 0x%"PRIx64"\n",
+                      __func__, old_rdbase);
+        return CMD_CONTINUE;
+    }
+
+    new_rdbase = FIELD_EX64(new_cte, CTE, RDBASE);
+    if (new_rdbase >= s->gicv3->num_cpu) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: CTE has invalid rdbase 0x%"PRIx64"\n",
+                      __func__, new_rdbase);
+        return CMD_CONTINUE;
+    }
+
+    if (old_rdbase != new_rdbase) {
+        /* Move the LPI from the old redistributor to the new one */
+        gicv3_redist_mov_lpi(&s->gicv3->cpu[old_rdbase],
+                             &s->gicv3->cpu[new_rdbase],
+                             intid);
+    }
+
+    /* Update the ICID field in the interrupt translation table entry */
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, 1);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, intid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, new_icid);
+    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+}
+
 /*
  * Current implementation blocks until all
  * commands are processed
@@ -731,6 +874,9 @@ static void process_cmdq(GICv3ITSState *s)
                 gicv3_redist_update_lpi(&s->gicv3->cpu[i]);
             }
             break;
+        case GITS_CMD_MOVI:
+            result = process_movi(s, data, cq_offset);
+            break;
         case GITS_CMD_MOVALL:
             result = process_movall(s, data, cq_offset);
             break;
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index d1645ba22c6..412a04f59cf 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -681,6 +681,59 @@ void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level)
     gicv3_redist_lpi_pending(cs, irq, level);
 }
 
+void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq)
+{
+    /*
+     * Move the specified LPI's pending state from the source redistributor
+     * to the destination.
+     *
+     * If LPIs are disabled on dest this is CONSTRAINED UNPREDICTABLE:
+     * we choose to NOP. If LPIs are disabled on source there's nothing
+     * to be transferred anyway.
+     */
+    AddressSpace *as = &src->gic->dma_as;
+    uint64_t idbits;
+    uint32_t pendt_size;
+    uint64_t src_baddr;
+    uint8_t src_pend;
+
+    if (!(src->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) ||
+        !(dest->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
+        return;
+    }
+
+    idbits = MIN(FIELD_EX64(src->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 GICD_TYPER_IDBITS);
+    idbits = MIN(FIELD_EX64(dest->gicr_propbaser, GICR_PROPBASER, IDBITS),
+                 idbits);
+
+    pendt_size = 1ULL << (idbits + 1);
+    if ((irq / 8) >= pendt_size) {
+        return;
+    }
+
+    src_baddr = src->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
+
+    address_space_read(as, src_baddr + (irq / 8),
+                       MEMTXATTRS_UNSPECIFIED, &src_pend, sizeof(src_pend));
+    if (!extract32(src_pend, irq % 8, 1)) {
+        /* Not pending on source, nothing to do */
+        return;
+    }
+    src_pend &= ~(1 << (irq % 8));
+    address_space_write(as, src_baddr + (irq / 8),
+                        MEMTXATTRS_UNSPECIFIED, &src_pend, sizeof(src_pend));
+    if (irq == src->hpplpi.irq) {
+        /*
+         * We just made this LPI not-pending so only need to update
+         * if it was previously the highest priority pending LPI
+         */
+        gicv3_redist_update_lpi(src);
+    }
+    /* Mark it pending on the destination */
+    gicv3_redist_lpi_pending(dest, irq, 1);
+}
+
 void gicv3_redist_movall_lpis(GICv3CPUState *src, GICv3CPUState *dest)
 {
     /*
-- 
2.25.1


