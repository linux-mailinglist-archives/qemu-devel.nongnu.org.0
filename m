Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D14954DE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:28:14 +0100 (CET)
Received: from localhost ([::1]:35242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAd6T-0003jO-2T
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:28:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgr-0004OL-1R
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:21 -0500
Received: from [2a00:1450:4864:20::32b] (port=39742
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgp-0003Lg-4Y
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:20 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso7095139wmh.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ja/e/QQhMRKCgDYJ7X1qYQSfnXtQJx0WGC51Wae/Efc=;
 b=LKJ9m4KZnWeJNJ876466maCrRm9VvyTBxX5PEj/p6preshrd3kl4tzmUlLUaOuL0oY
 WbZz8GTGexpn/H9w8AFPV7M0MVey0N7r77XOoMd/o/QPBsXJodMd/FAdC+PNACVSpb8d
 v9RURKvkEDgkixIaYq8XnwiOeQ1703C1BhsL8pc5frgy0b3DIv1aL3mJ2b1UNH36Rmbq
 hnspHHTz2iRgmQZhs23Pgv9mq/OWNczvlqCC/Srw/0zE1AcBBBz3ooUVi8KXq/mnA1CC
 fpqgBGAWNI/nv4TXfNnwCTednOzoPuZNLicMY+Jg20d6vUbcV8NAY+do9lYMJZ/ObU1e
 zdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ja/e/QQhMRKCgDYJ7X1qYQSfnXtQJx0WGC51Wae/Efc=;
 b=OjxRkXC6uw+J3tJANydOzTDT6384wEGWSAHl5nKQhyzf68k2ckKzsAvBjwAhaB6RFN
 4y+2DMQ0t5x/Ei5ZIuIJu/uE8MKKKtrMf1rKy7ELM8KakiTlRS2D+bpUbZLLaeEiwRuB
 N3PsIPIdow+Q39pAvvCCRsMJN7on1YNcV9pDKzVz7EFkkXLVX8TiSGHGSTRDOg98BeCM
 v3Db104uuwPGZDyBlItps4XwK9dlYmot1wSwlE1P67wNFBM3a3ry0yXo6NGVZRZ00wO2
 /X9hVSBUGaRkG+42Am5qpB/WVfYMdJnrOWzxcKE4A1nnJtAefLqUA1GHG1utgiCjLjKR
 wu3g==
X-Gm-Message-State: AOAM533ijRg2Hq02Qz9VkWZ/+/3hd6L9pcg1sRuFCk6Kqtwn74ZnpWIE
 +3GZuoYa+UxFjNCbK5e7hpDwlwZrq4vVCg==
X-Google-Smtp-Source: ABdhPJxoAL5b+wsChekRmKo1pgpQ0L1ROaPw7VIWBzBjmeCiTYfi0eV/vqJjFVWKY87Pt1ObezN2Rg==
X-Received: by 2002:a5d:4b07:: with SMTP id v7mr9426329wrq.48.1642682237856;
 Thu, 20 Jan 2022 04:37:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/38] hw/intc/arm_gicv3_its: Factor out "find address of table
 entry" code
Date: Thu, 20 Jan 2022 12:36:27 +0000
Message-Id: <20220120123630.267975-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The ITS has several tables which all share a similar format,
described by the TableDesc struct: the guest may configure them
to be a single-level table or a two-level table. Currently we
open-code the process of finding the table entry in all the
functions which read or write the device table or the collection
table. Factor out the "get the address of the table entry"
logic into a new function, so that the code which needs to
read or write a table entry only needs to call table_entry_addr()
and then perform a suitable load or store to that address.

Note that the error handling is slightly complicated because
we want to handle two cases differently:
 * failure to read the L1 table entry should end up causing
   a command stall, like other kinds of DMA error
 * an L1 table entry that says there is no L2 table for this
   index (ie whose valid bit is 0) must result in us treating
   the table entry as not-valid on read, and discarding
   writes (this is mandated by the spec)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220111171048.3545974-12-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 212 +++++++++++++---------------------------
 1 file changed, 70 insertions(+), 142 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 917201c148f..985e316eda9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -83,44 +83,62 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
     return result;
 }
 
+static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
+                                 uint32_t idx, MemTxResult *res)
+{
+    /*
+     * Given a TableDesc describing one of the ITS in-guest-memory
+     * tables and an index into it, return the guest address
+     * corresponding to that table entry.
+     * If there was a memory error reading the L1 table of an
+     * indirect table, *res is set accordingly, and we return -1.
+     * If the L1 table entry is marked not valid, we return -1 with
+     * *res set to MEMTX_OK.
+     *
+     * The specification defines the format of level 1 entries of a
+     * 2-level table, but the format of level 2 entries and the format
+     * of flat-mapped tables is IMPDEF.
+     */
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t l2idx;
+    uint64_t l2;
+    uint32_t num_l2_entries;
+
+    *res = MEMTX_OK;
+
+    if (!td->indirect) {
+        /* Single level table */
+        return td->base_addr + idx * td->entry_sz;
+    }
+
+    /* Two level table */
+    l2idx = idx / (td->page_sz / L1TABLE_ENTRY_SIZE);
+
+    l2 = address_space_ldq_le(as,
+                              td->base_addr + (l2idx * L1TABLE_ENTRY_SIZE),
+                              MEMTXATTRS_UNSPECIFIED, res);
+    if (*res != MEMTX_OK) {
+        return -1;
+    }
+    if (!(l2 & L2_TABLE_VALID_MASK)) {
+        return -1;
+    }
+
+    num_l2_entries = td->page_sz / td->entry_sz;
+    return (l2 & ((1ULL << 51) - 1)) + (idx % num_l2_entries) * td->entry_sz;
+}
+
 static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
                     MemTxResult *res)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t l2t_addr;
-    uint64_t value;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr = table_entry_addr(s, &s->ct, icid, res);
 
-    if (s->ct.indirect) {
-        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->ct.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
-
-        if (*res == MEMTX_OK) {
-            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-            if (valid_l2t) {
-                num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
-
-                l2t_addr = value & ((1ULL << 51) - 1);
-
-                *cte =  address_space_ldq_le(as, l2t_addr +
-                                    ((icid % num_l2_entries) * GITS_CTE_SIZE),
-                                    MEMTXATTRS_UNSPECIFIED, res);
-           }
-       }
-    } else {
-        /* Flat level table */
-        *cte =  address_space_ldq_le(as, s->ct.base_addr +
-                                     (icid * GITS_CTE_SIZE),
-                                      MEMTXATTRS_UNSPECIFIED, res);
+    if (entry_addr == -1) {
+        return false; /* not valid */
     }
 
+    *cte = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
     return FIELD_EX64(*cte, CTE, VALID);
 }
 
@@ -189,41 +207,12 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
 static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t l2t_addr;
-    uint64_t value;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr = table_entry_addr(s, &s->dt, devid, res);
 
-    if (s->dt.indirect) {
-        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->dt.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
-
-        if (*res == MEMTX_OK) {
-            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-            if (valid_l2t) {
-                num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
-
-                l2t_addr = value & ((1ULL << 51) - 1);
-
-                value =  address_space_ldq_le(as, l2t_addr +
-                                   ((devid % num_l2_entries) * GITS_DTE_SIZE),
-                                   MEMTXATTRS_UNSPECIFIED, res);
-            }
-        }
-    } else {
-        /* Flat level table */
-        value = address_space_ldq_le(as, s->dt.base_addr +
-                                     (devid * GITS_DTE_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
+    if (entry_addr == -1) {
+        return 0; /* a DTE entry with the Valid bit clear */
     }
-
-    return value;
+    return address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
 }
 
 /*
@@ -426,11 +415,7 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
                        uint64_t rdbase)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t value;
-    uint64_t l2t_addr;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr;
     uint64_t cte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -444,44 +429,18 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
         cte = FIELD_DP64(cte, CTE, RDBASE, rdbase);
     }
 
-    /*
-     * The specification defines the format of level 1 entries of a
-     * 2-level table, but the format of level 2 entries and the format
-     * of flat-mapped tables is IMPDEF.
-     */
-    if (s->ct.indirect) {
-        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->ct.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, &res);
-
-        if (res != MEMTX_OK) {
-            return false;
-        }
-
-        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-        if (valid_l2t) {
-            num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
-
-            l2t_addr = value & ((1ULL << 51) - 1);
-
-            address_space_stq_le(as, l2t_addr +
-                                 ((icid % num_l2_entries) * GITS_CTE_SIZE),
-                                 cte, MEMTXATTRS_UNSPECIFIED, &res);
-        }
-    } else {
-        /* Flat level table */
-        address_space_stq_le(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
-                             cte, MEMTXATTRS_UNSPECIFIED, &res);
-    }
+    entry_addr = table_entry_addr(s, &s->ct, icid, &res);
     if (res != MEMTX_OK) {
+        /* memory access error: stall */
         return false;
-    } else {
+    }
+    if (entry_addr == -1) {
+        /* No L2 table for this index: discard write and continue */
         return true;
     }
+
+    address_space_stq_le(as, entry_addr, cte, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
@@ -529,11 +488,7 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
                        uint8_t size, uint64_t itt_addr)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t value;
-    uint64_t l2t_addr;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr;
     uint64_t dte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -548,44 +503,17 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
         return true;
     }
 
-    /*
-     * The specification defines the format of level 1 entries of a
-     * 2-level table, but the format of level 2 entries and the format
-     * of flat-mapped tables is IMPDEF.
-     */
-    if (s->dt.indirect) {
-        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->dt.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, &res);
-
-        if (res != MEMTX_OK) {
-            return false;
-        }
-
-        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-        if (valid_l2t) {
-            num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
-
-            l2t_addr = value & ((1ULL << 51) - 1);
-
-            address_space_stq_le(as, l2t_addr +
-                                 ((devid % num_l2_entries) * GITS_DTE_SIZE),
-                                 dte, MEMTXATTRS_UNSPECIFIED, &res);
-        }
-    } else {
-        /* Flat level table */
-        address_space_stq_le(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
-                             dte, MEMTXATTRS_UNSPECIFIED, &res);
-    }
+    entry_addr = table_entry_addr(s, &s->dt, devid, &res);
     if (res != MEMTX_OK) {
+        /* memory access error: stall */
         return false;
-    } else {
+    }
+    if (entry_addr == -1) {
+        /* No L2 table for this index: discard write and continue */
         return true;
     }
+    address_space_stq_le(as, entry_addr, dte, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
-- 
2.25.1


