Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7434569B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:16:34 +0100 (CET)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYT3-0002TH-EC
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPX-0000jH-2T
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:12:59 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:40473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lOYPM-0006bR-Fu
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:12:54 -0400
Received: by mail-qk1-x736.google.com with SMTP id 7so13099852qka.7
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sx/vdgfnG+PME1ucFZkuwoOuWJLopYMkS7wb7YTc8wo=;
 b=aDveTX7u+nvjHuDpVtcdtB+wXbdUl2EoRxvf3zRNmMy/M/KBtzjGUSl1kIMbE3r/sg
 RiPmeBBLonjhgLeb3i4HIVg3hA2wXSONbym2FDAFxEJH6Eu/11kpPBvg2n7tgsbVhb8F
 DEKA00fIxcovWF+7sg+MlyZAayzIzXVTkAIusoxLIbU+WgMnfLWjMnxokqWBeHohVKOw
 0kwinJYSVWVbmlIB9VhuD9hc4+HUmOTPm+rbwzUyYBZmL+y6C/O80vjFwwKPtqjfIGcM
 zefKCt7bTSUZQ0znef/0KtAaLQILUXa+xzMNCtnMbZCw1dI4ugaImgAzBRfZD9I8ejyT
 2v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sx/vdgfnG+PME1ucFZkuwoOuWJLopYMkS7wb7YTc8wo=;
 b=DOhweBZKe4DVQWEbaVxXc/GtdsTLRZoyIUXBV7W9A4rhbwVzSCIAHZ5vlL/Kp9aBAM
 yPdcq4Ybk/X9jJeOd1DQRul+TgMOoRcqR93R0Lp/fyH+7g9kcvrYQ+yHefEXq7YrTfNR
 n/QoEm+wtC4T7yKcYE3jpOWK73pgC22M67R0IPafyWPUMSS/foNvP0Pqy1vx3gFw+bJ0
 O8OoNtsnEqsQF41yusNGO/JFBg/cjuULrCgVBn62jHPOBCAeTr5F5MC8U2WkYJewzwfA
 Vrmiw+Sv+QJfc/QRINfA420FXqPKuK+dUiy+06W23UJGx8tHIwA1URdG7iL8li5Ox8WN
 Wjdg==
X-Gm-Message-State: AOAM531CTnncEw5JlMPU0pU6WlgIdWTESrU+WlYgV9s0/PTiJgsxZ50z
 V/A16UIxoNDQJpQgtwYYQycMUn8M99+MBw==
X-Google-Smtp-Source: ABdhPJyurkUfgn0f0P3CfIB1xvByqINzV6wPNH2H9tkMskJjt9CzUTEkdTspY+hQS1HfSq2ilB2JeA==
X-Received: by 2002:a05:620a:122b:: with SMTP id
 v11mr3474316qkj.461.1616472763101; 
 Mon, 22 Mar 2021 21:12:43 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id m21sm12601181qka.28.2021.03.22.21.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 21:12:42 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v1 4/8] hw/intc: GICv3 ITS Command processing
Date: Tue, 23 Mar 2021 00:12:34 -0400
Message-Id: <20210323041238.133835-5-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323041238.133835-1-shashi.mallela@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
translation which triggers an LPI via INT command as well as write
to GITS_TRANSLATER register,defined enum to differentiate between ITS
command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
Each of these commands make use of other functionalities implemented to
get device table entry,collection table entry or interrupt translation
table entry required for their processing.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c            | 371 +++++++++++++++++++-
 include/hw/intc/arm_gicv3_common.h |   2 +
 2 files changed, 372 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 9b094e1f0a..de2d179b5e 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -56,6 +56,158 @@ struct GICv3ITSClass {
     CmdQDesc      cq;
 };
 
+typedef enum ItsCmdType {
+    NONE = 0, /* internal indication for GITS_TRANSLATER write */
+    CLEAR = 1,
+    DISCARD = 2,
+    INT = 3,
+} ItsCmdType;
+
+static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+    bool status = false;
+
+    if (c->ct.indirect) {
+        /* 2 level table */
+        page_sz_type = (s->baser[0] >>
+                        GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } else if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = icid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     c->ct.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / c->ct.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51 - page_sz_type)) - 1);
+
+            address_space_read(as, l2t_addr +
+                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 cte, sizeof(*cte));
+       }
+    } else {
+        /* Flat level table */
+        address_space_read(as, c->ct.base_addr + (icid * GITS_CTE_SIZE),
+                            MEMTXATTRS_UNSPECIFIED, cte,
+                            sizeof(*cte));
+    }
+
+    if (*cte & VALID_MASK) {
+        status = true;
+    }
+
+    return status;
+}
+
+static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+                      uint16_t *icid, uint32_t *pIntid)
+{
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t buff[GITS_TYPER_ITT_ENTRY_SIZE];
+    uint64_t itt_addr;
+    bool status = false;
+
+    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+    itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+    address_space_read(as, itt_addr + (eventid * sizeof(buff)),
+                MEMTXATTRS_UNSPECIFIED, &buff,
+                sizeof(buff));
+
+    if (buff[0] & VALID_MASK) {
+        if ((buff[0] >> 1U) & GITS_TYPER_PHYSICAL) {
+            memcpy(pIntid, &buff[1], 3);
+            memcpy(icid, &buff[7], sizeof(*icid));
+            status = true;
+        }
+    }
+
+    return status;
+}
+
+static uint64_t get_dte(GICv3ITSState *s, uint32_t devid)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint8_t  page_sz_type;
+    uint64_t l2t_addr;
+    uint64_t value;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t page_sz = 0;
+    uint32_t max_l2_entries;
+
+    if (c->ct.indirect) {
+        /* 2 level table */
+        page_sz_type = (s->baser[0] >>
+                        GITS_BASER_PAGESIZE_OFFSET) &
+                        GITS_BASER_PAGESIZE_MASK;
+
+        if (page_sz_type == 0) {
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+        } else if (page_sz_type == 1) {
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+        } else if (page_sz_type == 2) {
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+        }
+
+        l2t_id = devid / (page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     c->dt.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, NULL);
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = page_sz / c->dt.entry_sz;
+
+            l2t_addr = (value >> page_sz_type) &
+                        ((1ULL << (51 - page_sz_type)) - 1);
+
+            value = 0;
+            address_space_read(as, l2t_addr +
+                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                 MEMTXATTRS_UNSPECIFIED,
+                                 &value, sizeof(value));
+        }
+    } else {
+        /* Flat level table */
+        value = 0;
+        address_space_read(as, c->dt.base_addr + (devid * GITS_DTE_SIZE),
+                            MEMTXATTRS_UNSPECIFIED, &value,
+                            sizeof(value));
+    }
+
+    return value;
+}
+
 static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
 {
     GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
@@ -95,6 +247,192 @@ static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
     return res;
 }
 
+static MemTxResult process_int(GICv3ITSState *s, uint64_t value,
+                                uint32_t offset, ItsCmdType cmd)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint32_t devid, eventid;
+    MemTxResult res = MEMTX_OK;
+    bool dte_valid;
+    uint64_t dte = 0;
+    uint32_t max_eventid;
+    uint16_t icid = 0;
+    uint32_t pIntid = 0;
+    bool ite_valid = false;
+    uint64_t cte = 0;
+    bool cte_valid = false;
+    uint8_t buff[GITS_TYPER_ITT_ENTRY_SIZE];
+    uint64_t itt_addr;
+
+    if (cmd == NONE) {
+        devid = offset;
+    } else {
+        devid = (value >> DEVID_OFFSET) & DEVID_MASK;
+
+        offset += NUM_BYTES_IN_DW;
+        value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+    }
+
+    eventid = (value & EVENTID_MASK);
+
+    dte = get_dte(s, devid);
+    dte_valid = dte & VALID_MASK;
+
+    if (dte_valid) {
+        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid);
+
+        if (ite_valid) {
+            cte_valid = get_cte(s, icid, &cte);
+        }
+    }
+
+    if ((devid > c->dt.max_devids) || !dte_valid || !ite_valid ||
+            !cte_valid || (eventid > max_eventid)) {
+        if ((s->typer >> GITS_TYPER_SEIS_OFFSET) &
+                         GITS_TYPER_SEIS_MASK) {
+            /*
+             * Generate System Error here if supported
+             * for each of the individual error cases
+             */
+        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid interrupt translation table attributes "
+            "devid %d or eventid %d\n",
+            __func__, devid, eventid);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        if ((s->typer >> GITS_TYPER_PTA_OFFSET) & GITS_TYPER_PTA_MASK) {
+            /*
+             * only bits[47:16] are considered instead of bits [51:16]
+             * since with a physical address the target address must be
+             * 64KB aligned
+             */
+
+            /*
+             * Current implementation only supports rdbase == procnum
+             * Hence rdbase physical address is ignored
+             */
+        } else {
+
+            if (cmd == DISCARD) {
+                /* remove mapping from interrupt translation table */
+                memset(buff, 0, sizeof(buff));
+
+                itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+                itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+                address_space_write(as, itt_addr + (eventid * sizeof(buff)),
+                                    MEMTXATTRS_UNSPECIFIED, &buff,
+                                    sizeof(buff));
+            }
+        }
+    }
+
+    if (cmd != NONE) {
+        offset += NUM_BYTES_IN_DW;
+        offset += NUM_BYTES_IN_DW;
+    }
+
+    return res;
+}
+
+static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
+                                    uint32_t offset, bool ignore_pInt)
+{
+    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
+    AddressSpace *as = &s->gicv3->sysmem_as;
+    uint32_t devid, eventid;
+    uint32_t pIntid = 0;
+    uint32_t max_eventid, max_Intid;
+    bool dte_valid;
+    MemTxResult res = MEMTX_OK;
+    uint16_t icid = 0;
+    uint64_t dte = 0;
+    uint64_t itt_addr;
+    uint8_t buff[GITS_TYPER_ITT_ENTRY_SIZE];
+    uint32_t int_spurious = INTID_SPURIOUS;
+
+    devid = (value >> DEVID_OFFSET) & DEVID_MASK;
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    eventid = (value & EVENTID_MASK);
+
+    if (!ignore_pInt) {
+        pIntid = (value >> pINTID_OFFSET) & pINTID_MASK;
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, c->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    icid = value & ICID_MASK;
+
+    dte = get_dte(s, devid);
+    dte_valid = dte & VALID_MASK;
+
+    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+
+    if (!ignore_pInt) {
+        max_Intid = (1UL << (((s->typer >> GITS_TYPER_IDBITS_OFFSET) &
+                      GITS_TYPER_IDBITS_MASK) + 1));
+    }
+
+    if ((devid > c->dt.max_devids) || (icid > c->ct.max_collids) ||
+            !dte_valid || (eventid > max_eventid) ||
+            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START) ||
+               (pIntid > max_Intid)))) {
+        if ((s->typer >> GITS_TYPER_SEIS_OFFSET) &
+                         GITS_TYPER_SEIS_MASK) {
+            /*
+             * Generate System Error here if supported
+             * for each of the individual error cases
+             */
+        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid interrupt translation table attributes "
+            "devid %d or icid %d or eventid %d or pIntid %d\n",
+            __func__, devid, icid, eventid, pIntid);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        /* add entry to interrupt translation table */
+        memset(buff, 0, sizeof(buff));
+        buff[0] = (dte_valid & VALID_MASK) | (GITS_TYPER_PHYSICAL << 1U);
+        if (ignore_pInt) {
+            memcpy(&buff[1], &eventid, 3);
+        } else {
+            memcpy(&buff[1], &pIntid, 3);
+        }
+        memcpy(&buff[4], &int_spurious, 3);
+        memcpy(&buff[7], &icid, sizeof(icid));
+
+        itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
+        itt_addr <<= ITTADDR_OFFSET; /* 256 byte aligned */
+
+        address_space_write(as, itt_addr + (eventid * sizeof(buff)),
+                    MEMTXATTRS_UNSPECIFIED, &buff,
+                    sizeof(buff));
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
 static void update_cte(GICv3ITSState *s, uint16_t icid, uint64_t cte)
 {
     GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
@@ -276,7 +614,7 @@ static void update_dte(GICv3ITSState *s, uint32_t devid, uint64_t dte)
 }
 
 static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
-                                 uint32_t offset)
+                                  uint32_t offset)
 {
     GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
     AddressSpace *as = &s->gicv3->sysmem_as;
@@ -378,8 +716,10 @@ static MemTxResult process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
+            res = process_int(s, data, cq_offset, INT);
             break;
         case GITS_CMD_CLEAR:
+            res = process_int(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             res = process_sync(s, cq_offset);
@@ -391,10 +731,13 @@ static MemTxResult process_cmdq(GICv3ITSState *s)
             res = process_mapc(s, cq_offset);
             break;
         case GITS_CMD_MAPTI:
+            res = process_mapti(s, data, cq_offset, false);
             break;
         case GITS_CMD_MAPI:
+            res = process_mapti(s, data, cq_offset, true);
             break;
         case GITS_CMD_DISCARD:
+            res = process_int(s, data, cq_offset, DISCARD);
             break;
         default:
             break;
@@ -556,7 +899,20 @@ static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    uint32_t devid = 0;
 
+    switch (offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & GITS_CTLR_ENABLED) {
+            s->translater = (value & 0x0000FFFFU);
+            devid = attrs.requester_id;
+            result = process_int(s, s->translater, devid, NONE);
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -564,7 +920,20 @@ static MemTxResult its_trans_writel(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    uint32_t devid = 0;
 
+    switch (offset) {
+    case GITS_TRANSLATER:
+        if (s->ctlr & GITS_CTLR_ENABLED) {
+            s->translater = value;
+            devid = attrs.requester_id;
+            result = process_int(s, s->translater, devid, NONE);
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index b0f2414fa3..3a710592a9 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -36,6 +36,8 @@
 #define GICV3_MAXIRQ 1020
 #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
 
+#define GICV3_LPI_INTID_START 8192
+
 #define GICV3_REDIST_SIZE 0x20000
 
 /* Number of SGI target-list bits */
-- 
2.27.0


