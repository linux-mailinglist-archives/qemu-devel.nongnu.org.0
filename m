Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B4436F30F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:49:27 +0200 (CEST)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGPO-0004qw-FM
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIV-0005kl-At
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:19 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:42828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIJ-0004Kf-1E
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:18 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id b14so7970546qvf.9
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HokplI3cHkd62Jic7ekWm9yZ2dG4oqaLi9Z4gIWgay0=;
 b=PO7ydwQIBMX0uL/rUlSR2t49OXiTqWZTDSJUaqF0nrhqQDxTOeDoM1RyC0enqqZp/s
 LKJ3n4RcRh1P1saQ1Ry8SRgBRgWCaNBu0w/dTx80dp3KBR7TiUOekZLHjFG4avDCZX6B
 k28i7RKtNqlr4f1s47bxyw2DweBHLRNWqUsRIIDOAWl0VOL0cgLvl/g/88UXKTl+V6NI
 kK7vTxAz81FRADoxSqIXnVtJFOtexy0uGfDMV8cG2xI0MdZxCsBgxXkbBPuoRugE1Ewo
 p62zakyBMWSXvCa9uEVlK9DJKP/qGzsef11P3iIoG8Mfl8UV5TbL9aMvnZ4CQPITROh5
 CRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HokplI3cHkd62Jic7ekWm9yZ2dG4oqaLi9Z4gIWgay0=;
 b=M0xdaHLPz7r24T1Ky5JLUGwFWCGS76Of7UzdBtfPXQ+DnP8UM0FyHxlwY0ZM6MrN+k
 xWBRTPF2+AC0DLcv8qMPhaC5OofG8FKPH59MsckI7W4REhZxYUp4Kg4xKw9yMBCgYxja
 YbPdJ44xeMLdvr9LpxfkkkT/HkubbgshNP27QKray2/eGmPbsdD9O21tpdwDXVCdRtvb
 HTsbLEUN50W44oNjYaFFbqCuTsCgQJWLtWEbiJM41DcUHSqXRVBmE1SgjgKLTun9VvPZ
 zDMmHBs0LcpK8p5qlsYNhD0+R01Chs6A6+ie/yWxxuLPMUDs5YT5EEG4H5XNZVpFKz6j
 xHSg==
X-Gm-Message-State: AOAM5320DjhZudfgsfHIagHwAw6YAG3xQXHMMm38Bg5MqooKH4E6H1cr
 PaibIwWqQZyvrjAdjDbtMHZBpw==
X-Google-Smtp-Source: ABdhPJyqOjHX0NF2Q18BUHAa3C6GJVh9e1KK0Ae478gMDSR7kkpEftAr+zePIYrdACiDOWiPUW55xA==
X-Received: by 2002:ad4:420c:: with SMTP id k12mr2572732qvp.14.1619739724223; 
 Thu, 29 Apr 2021 16:42:04 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:04 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 3/8] hw/intc: GICv3 ITS command queue framework
Date: Thu, 29 Apr 2021 19:41:56 -0400
Message-Id: <20210429234201.125565-4-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Added functionality to trigger ITS command queue processing on
write to CWRITE register and process each command queue entry to
identify the command type and handle commands like MAPD,MAPC,SYNC.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c  | 327 +++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h |  41 +++++
 2 files changed, 368 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index a7ccb38a89..7cb465813a 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -28,6 +28,327 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+static MemTxResult process_sync(GICv3ITSState *s, uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t rdbase;
+    uint64_t value;
+    MemTxResult res = MEMTX_OK;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+
+    rdbase = (value >> RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
+
+    if (rdbase < (s->gicv3->num_cpu)) {
+        /*
+         * Current implementation makes a blocking synchronous call
+         * for every command issued earlier,hence the internal state
+         * is already consistent by the time SYNC command is executed.
+         */
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    return res;
+}
+
+static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
+    uint64_t rdbase)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t value;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
+    uint64_t cte = 0;
+    MemTxResult res = MEMTX_OK;
+
+    if (s->ct.valid) {
+        if (valid) {
+            /* add mapping entry to collection table */
+            cte = (valid & VALID_MASK) |
+                  ((rdbase & RDBASE_PROCNUM_MASK) << 1ULL);
+        }
+    } else {
+        return res;
+    }
+
+    /*
+     * The specification defines the format of level 1 entries of a
+     * 2-level table, but the format of level 2 entries and the format
+     * of flat-mapped tables is IMPDEF.
+     */
+    if (s->ct.indirect) {
+        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->ct.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+
+        if (res != MEMTX_OK) {
+            return res;
+        }
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
+
+            l2t_addr = value & ((1ULL << 51) - 1);
+
+            address_space_stq_le(as, l2t_addr +
+                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                 cte, MEMTXATTRS_UNSPECIFIED, &res);
+        }
+    } else {
+        /* Flat level table */
+        address_space_stq_le(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
+                             cte, MEMTXATTRS_UNSPECIFIED, &res);
+    }
+    return res;
+}
+
+static MemTxResult process_mapc(GICv3ITSState *s, uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint16_t icid;
+    uint64_t rdbase;
+    bool valid;
+    MemTxResult res = MEMTX_OK;
+    uint64_t value;
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    icid = value & ICID_MASK;
+
+    rdbase = (value >> RDBASE_SHIFT) & RDBASE_PROCNUM_MASK;
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3->num_cpu)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "ITS MAPC: invalid collection table attributes "
+            "icid %d rdbase %lu\n",  icid, rdbase);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        res = update_cte(s, icid, valid, rdbase);
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
+static MemTxResult update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
+    uint8_t size, uint64_t itt_addr)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint64_t value;
+    uint64_t l2t_addr;
+    bool valid_l2t;
+    uint32_t l2t_id;
+    uint32_t max_l2_entries;
+    uint64_t dte = 0;
+    MemTxResult res = MEMTX_OK;
+
+    if (s->dt.valid) {
+        if (valid) {
+            /* add mapping entry to device table */
+            dte = (valid & VALID_MASK) |
+                  ((size & SIZE_MASK) << 1U) |
+                  ((itt_addr & ITTADDR_MASK) << 6ULL);
+        }
+    } else {
+        return res;
+    }
+
+    /*
+     * The specification defines the format of level 1 entries of a
+     * 2-level table, but the format of level 2 entries and the format
+     * of flat-mapped tables is IMPDEF.
+     */
+    if (s->dt.indirect) {
+        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
+
+        value = address_space_ldq_le(as,
+                                     s->dt.base_addr +
+                                     (l2t_id * L1TABLE_ENTRY_SIZE),
+                                     MEMTXATTRS_UNSPECIFIED, &res);
+
+        if (res != MEMTX_OK) {
+            return res;
+        }
+
+        valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
+
+        if (valid_l2t) {
+            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+
+            l2t_addr = value & ((1ULL << 51) - 1);
+
+            address_space_stq_le(as, l2t_addr +
+                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                 dte, MEMTXATTRS_UNSPECIFIED, &res);
+        }
+    } else {
+        /* Flat level table */
+        address_space_stq_le(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
+                             dte, MEMTXATTRS_UNSPECIFIED, &res);
+    }
+    return res;
+}
+
+static MemTxResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
+{
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t devid;
+    uint8_t size;
+    uint64_t itt_addr;
+    bool valid;
+    MemTxResult res = MEMTX_OK;
+
+    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    size = (value & SIZE_MASK);
+
+    offset += NUM_BYTES_IN_DW;
+    value = address_space_ldq_le(as, s->cq.base_addr + offset,
+                                 MEMTXATTRS_UNSPECIFIED, &res);
+
+    if (res != MEMTX_OK) {
+        return res;
+    }
+
+    itt_addr = (value >> ITTADDR_SHIFT) & ITTADDR_MASK;
+
+    valid = (value >> VALID_SHIFT) & VALID_MASK;
+
+    if ((devid > s->dt.max_devids) ||
+        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "ITS MAPD: invalid device table attributes "
+            "devid %d or size %d\n", devid, size);
+        /*
+         * in this implementation,in case of error
+         * we ignore this command and move onto the next
+         * command in the queue
+         */
+    } else {
+        if (res == MEMTX_OK) {
+            res = update_dte(s, devid, valid, size, itt_addr);
+        }
+    }
+
+    offset += NUM_BYTES_IN_DW;
+    offset += NUM_BYTES_IN_DW;
+
+    return res;
+}
+
+/*
+ * Current implementation blocks until all
+ * commands are processed
+ */
+static MemTxResult process_cmdq(GICv3ITSState *s)
+{
+    uint32_t wr_offset = 0;
+    uint32_t rd_offset = 0;
+    uint32_t cq_offset = 0;
+    uint64_t data;
+    AddressSpace *as = &s->gicv3->dma_as;
+    MemTxResult res = MEMTX_OK;
+    uint8_t cmd;
+
+    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        return res;
+    }
+
+    wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
+
+    if (wr_offset > s->cq.max_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: invalid write offset "
+                        "%d\n", __func__, wr_offset);
+        res = MEMTX_ERROR;
+        return res;
+    }
+
+    rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
+
+    while (wr_offset != rd_offset) {
+        cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
+        data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
+                                      MEMTXATTRS_UNSPECIFIED, &res);
+        cmd = (data & CMD_MASK);
+
+        switch (cmd) {
+        case GITS_CMD_INT:
+            break;
+        case GITS_CMD_CLEAR:
+            break;
+        case GITS_CMD_SYNC:
+            res = process_sync(s, cq_offset);
+            break;
+        case GITS_CMD_MAPD:
+            res = process_mapd(s, data, cq_offset);
+            break;
+        case GITS_CMD_MAPC:
+            res = process_mapc(s, cq_offset);
+            break;
+        case GITS_CMD_MAPTI:
+            break;
+        case GITS_CMD_MAPI:
+            break;
+        case GITS_CMD_DISCARD:
+            break;
+        default:
+            break;
+        }
+        if (res == MEMTX_OK) {
+            rd_offset++;
+            rd_offset %= s->cq.max_entries;
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
+        } else {
+            /*
+             * in this implementation,in case of dma read/write error
+             * we stall the command processing
+             */
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: %x cmd processing failed!!\n", __func__, cmd);
+            break;
+        }
+    }
+    return res;
+}
+
 static bool extract_table_params(GICv3ITSState *s)
 {
     bool result = true;
@@ -235,6 +556,9 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = deposit64(s->cwriter, 0, 32, value);
+        if (s->cwriter != s->creadr) {
+            result = process_cmdq(s);
+        }
         break;
     case GITS_CWRITER + 4:
         s->cwriter = deposit64(s->cwriter, 32, 32, value);
@@ -346,6 +670,9 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
         break;
     case GITS_CWRITER:
         s->cwriter = value;
+        if (s->cwriter != s->creadr) {
+            result = process_cmdq(s);
+        }
         break;
     default:
         result = MEMTX_ERROR;
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index bfabd5ad62..3b8e1e85c6 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -253,6 +253,12 @@ FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
 FIELD(GITS_CBASER, INNERCACHE, 59, 3)
 FIELD(GITS_CBASER, VALID, 63, 1)
 
+FIELD(GITS_CREADR, STALLED, 0, 1)
+FIELD(GITS_CREADR, OFFSET, 5, 15)
+
+FIELD(GITS_CWRITER, RETRY, 0, 1)
+FIELD(GITS_CWRITER, OFFSET, 5, 15)
+
 FIELD(GITS_CTLR, ENABLED, 0, 1)
 FIELD(GITS_CTLR, QUIESCENT, 31, 1)
 
@@ -286,6 +292,41 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define L1TABLE_ENTRY_SIZE         8
 
 #define GITS_CMDQ_ENTRY_SIZE               32
+#define NUM_BYTES_IN_DW                     8
+
+#define CMD_MASK                  0xff
+
+/* ITS Commands */
+#define GITS_CMD_CLEAR            0x04
+#define GITS_CMD_DISCARD          0x0F
+#define GITS_CMD_INT              0x03
+#define GITS_CMD_MAPC             0x09
+#define GITS_CMD_MAPD             0x08
+#define GITS_CMD_MAPI             0x0B
+#define GITS_CMD_MAPTI            0x0A
+#define GITS_CMD_SYNC             0x05
+
+/* MAPC command fields */
+#define ICID_LENGTH                  16
+#define ICID_MASK                 ((1U << ICID_LENGTH) - 1)
+#define RDBASE_LENGTH                32
+#define RDBASE_SHIFT                 16
+#define RDBASE_MASK               ((1ULL << RDBASE_LENGTH) - 1)
+#define RDBASE_PROCNUM_LENGTH        16
+#define RDBASE_PROCNUM_MASK       ((1ULL << RDBASE_PROCNUM_LENGTH) - 1)
+
+#define DEVID_SHIFT                  32
+#define DEVID_LENGTH                 32
+#define DEVID_MASK                ((1ULL << DEVID_LENGTH) - 1)
+
+/* MAPD command fields */
+#define ITTADDR_LENGTH               44
+#define ITTADDR_SHIFT                 8
+#define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) - 1)
+#define SIZE_MASK                 0x1f
+
+#define VALID_SHIFT               63
+#define VALID_MASK                0x1
 
 /**
  * Default features advertised by this version of ITS
-- 
2.27.0


