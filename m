Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADE7406DB5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:42:55 +0200 (CEST)
Received: from localhost ([::1]:32892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhjy-0005gt-4N
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh9-00025W-62
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:39:59 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:46762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh5-0002sE-QD
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:39:58 -0400
Received: by mail-qt1-x82b.google.com with SMTP id x5so1567461qtq.13
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VEJlChltItFUBMRm8OIekOZfLy6CqqjC++HhZdAufrg=;
 b=nQ4fQjYt0lPk0QQ+2Uj4erL//TPJprYE8JjH5hxx2sMb4Y/vkEyVS6COfE8rv/dWcs
 rnN7lnZh/sWQMI8CDbSGPDysgBnu2W0YO4e+dYqy/4rb9K0ZJq/WoUXq9vmsiU41TiHr
 iEcP9djqjb+OGm2rrFTvLc3dM2LHQTrKpyWLTMMu/GZZ+cvPK4sXwGlyxYS5mJ10IPSH
 Aj022J+9ZB3SFB2cBNWwUK3OVBlGTqKsn5ZZFulHN+qkaPCiwAthtDLWs5m5/k4Fty/9
 azjICClC3XBttGZPOI8x2/4/NWfotnnYSBoDreZb/+Bp0syYPifs7n72y+mk/iFT3CAN
 ARiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VEJlChltItFUBMRm8OIekOZfLy6CqqjC++HhZdAufrg=;
 b=S3bw1NocqBXr8KyCy/WS5hX5/XqSGz4vxZFFyLBk0sxbFjuvFctwLW3X2gE9wPnvW1
 n7lMFC0X5UMEGL35nRBZKH9hQTNSdODY2U1XrnmyunwWTJiMKXiQo1Zobhm0n5SUbaTD
 bO8GR80JQxQ03L6A7grhyzIFDaRLA2MGAT3o3LKOdn0hcthy0iKltJCkgMQMXuqTIe5d
 cSWgxCZ7Dxas1BBkCh7x6SihSPGxx8xoFChepA/6HFoZKKNOyuUCfUZxrLZwcPcE0YDx
 W2eMukoSL02a5YehOMrtPkGWDVRUkVUoWHMsj8giln5leXWh5sRspKa2Ga5jyNyOl48u
 dOxw==
X-Gm-Message-State: AOAM530LtaId8YcocP5Q1fj4UYaNN0qTLxIQ/Vn6hD4I8uwq01YCk0IN
 U7N4ncr7orAKILONZBVJIw7nOg==
X-Google-Smtp-Source: ABdhPJzpmcQ6cn3c12JykGUxjkRpo52BYvZSDI7aLnS4D/hOTzfcIVLi2yEe/KFmN7c5yuXhLrohYQ==
X-Received: by 2002:ac8:664e:: with SMTP id j14mr8220384qtp.194.1631284794769; 
 Fri, 10 Sep 2021 07:39:54 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id a9sm3827042qkk.82.2021.09.10.07.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:39:54 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v9 2/9] hw/intc: GICv3 ITS register definitions added
Date: Fri, 10 Sep 2021 10:39:44 -0400
Message-Id: <20210910143951.92242-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210910143951.92242-1-shashi.mallela@linaro.org>
References: <20210910143951.92242-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Defined descriptors for ITS device table,collection table and ITS
command queue entities.Implemented register read/write functions,
extract ITS table parameters and command queue parameters,extended
gicv3 common to capture qemu address space(which host the ITS table
platform memories required for subsequent ITS processing) and
initialize the same in ITS device.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 hw/intc/arm_gicv3_its.c                | 376 +++++++++++++++++++++++++
 hw/intc/gicv3_internal.h               |  29 ++
 include/hw/intc/arm_gicv3_common.h     |   3 +
 include/hw/intc/arm_gicv3_its_common.h |  23 ++
 4 files changed, 431 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 83ece7c4c1..8234939ccc 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -29,6 +29,160 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
+{
+    uint64_t result = 0;
+
+    switch (page_sz) {
+    case GITS_PAGE_SIZE_4K:
+    case GITS_PAGE_SIZE_16K:
+        result = FIELD_EX64(value, GITS_BASER, PHYADDR) << 12;
+        break;
+
+    case GITS_PAGE_SIZE_64K:
+        result = FIELD_EX64(value, GITS_BASER, PHYADDRL_64K) << 16;
+        result |= FIELD_EX64(value, GITS_BASER, PHYADDRH_64K) << 48;
+        break;
+
+    default:
+        break;
+    }
+    return result;
+}
+
+/*
+ * This function extracts the ITS Device and Collection table specific
+ * parameters (like base_addr, size etc) from GITS_BASER register.
+ * It is called during ITS enable and also during post_load migration
+ */
+static void extract_table_params(GICv3ITSState *s)
+{
+    uint16_t num_pages = 0;
+    uint8_t  page_sz_type;
+    uint8_t type;
+    uint32_t page_sz = 0;
+    uint64_t value;
+
+    for (int i = 0; i < 8; i++) {
+        value = s->baser[i];
+
+        if (!value) {
+            continue;
+        }
+
+        page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
+
+        switch (page_sz_type) {
+        case 0:
+            page_sz = GITS_PAGE_SIZE_4K;
+            break;
+
+        case 1:
+            page_sz = GITS_PAGE_SIZE_16K;
+            break;
+
+        case 2:
+        case 3:
+            page_sz = GITS_PAGE_SIZE_64K;
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+
+        num_pages = FIELD_EX64(value, GITS_BASER, SIZE) + 1;
+
+        type = FIELD_EX64(value, GITS_BASER, TYPE);
+
+        switch (type) {
+
+        case GITS_BASER_TYPE_DEVICE:
+            memset(&s->dt, 0 , sizeof(s->dt));
+            s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
+
+            if (!s->dt.valid) {
+                return;
+            }
+
+            s->dt.page_sz = page_sz;
+            s->dt.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+            s->dt.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+
+            if (!s->dt.indirect) {
+                s->dt.max_entries = (num_pages * page_sz) / s->dt.entry_sz;
+            } else {
+                s->dt.max_entries = (((num_pages * page_sz) /
+                                     L1TABLE_ENTRY_SIZE) *
+                                     (page_sz / s->dt.entry_sz));
+            }
+
+            s->dt.maxids.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
+                                       DEVBITS) + 1));
+
+            s->dt.base_addr = baser_base_addr(value, page_sz);
+
+            break;
+
+        case GITS_BASER_TYPE_COLLECTION:
+            memset(&s->ct, 0 , sizeof(s->ct));
+            s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
+
+            /*
+             * GITS_TYPER.HCC is 0 for this implementation
+             * hence writes are discarded if ct.valid is 0
+             */
+            if (!s->ct.valid) {
+                return;
+            }
+
+            s->ct.page_sz = page_sz;
+            s->ct.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+            s->ct.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+
+            if (!s->ct.indirect) {
+                s->ct.max_entries = (num_pages * page_sz) / s->ct.entry_sz;
+            } else {
+                s->ct.max_entries = (((num_pages * page_sz) /
+                                     L1TABLE_ENTRY_SIZE) *
+                                     (page_sz / s->ct.entry_sz));
+            }
+
+            if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
+                s->ct.maxids.max_collids = (1UL << (FIELD_EX64(s->typer,
+                                            GITS_TYPER, CIDBITS) + 1));
+            } else {
+                /* 16-bit CollectionId supported when CIL == 0 */
+                s->ct.maxids.max_collids = (1UL << 16);
+            }
+
+            s->ct.base_addr = baser_base_addr(value, page_sz);
+
+            break;
+
+        default:
+            break;
+        }
+    }
+}
+
+static void extract_cmdq_params(GICv3ITSState *s)
+{
+    uint16_t num_pages = 0;
+    uint64_t value = s->cbaser;
+
+    num_pages = FIELD_EX64(value, GITS_CBASER, SIZE) + 1;
+
+    memset(&s->cq, 0 , sizeof(s->cq));
+    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
+
+    if (s->cq.valid) {
+        s->cq.max_entries = (num_pages * GITS_PAGE_SIZE_4K) /
+                             GITS_CMDQ_ENTRY_SIZE;
+        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
+        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
+    }
+}
+
 static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                                uint64_t data, unsigned size,
                                                MemTxAttrs attrs)
@@ -40,7 +194,99 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
                               uint64_t value, MemTxAttrs attrs)
 {
     bool result = true;
+    int index;
 
+    switch (offset) {
+    case GITS_CTLR:
+        s->ctlr |= (value & ~(s->ctlr));
+
+        if (s->ctlr & ITS_CTLR_ENABLED) {
+            extract_table_params(s);
+            extract_cmdq_params(s);
+            s->creadr = 0;
+        }
+        break;
+    case GITS_CBASER:
+        /*
+         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 0, 32, value);
+            s->creadr = 0;
+            s->cwriter = s->creadr;
+        }
+        break;
+    case GITS_CBASER + 4:
+        /*
+         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 32, 32, value);
+            s->creadr = 0;
+            s->cwriter = s->creadr;
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = deposit64(s->cwriter, 0, 32,
+                               (value & ~R_GITS_CWRITER_RETRY_MASK));
+        break;
+    case GITS_CWRITER + 4:
+        s->cwriter = deposit64(s->cwriter, 32, 32, value);
+        break;
+    case GITS_CREADR:
+        if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
+            s->creadr = deposit64(s->creadr, 0, 32,
+                                  (value & ~R_GITS_CREADR_STALLED_MASK));
+        } else {
+            /* RO register, ignore the write */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid guest write to RO register at offset "
+                          TARGET_FMT_plx "\n", __func__, offset);
+        }
+        break;
+    case GITS_CREADR + 4:
+        if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
+            s->creadr = deposit64(s->creadr, 32, 32, value);
+        } else {
+            /* RO register, ignore the write */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid guest write to RO register at offset "
+                          TARGET_FMT_plx "\n", __func__, offset);
+        }
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /*
+         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+
+            if (offset & 7) {
+                value <<= 32;
+                value &= ~GITS_BASER_RO_MASK;
+                s->baser[index] &= GITS_BASER_RO_MASK | MAKE_64BIT_MASK(0, 32);
+                s->baser[index] |= value;
+            } else {
+                value &= ~GITS_BASER_RO_MASK;
+                s->baser[index] &= GITS_BASER_RO_MASK | MAKE_64BIT_MASK(32, 32);
+                s->baser[index] |= value;
+            }
+        }
+        break;
+    case GITS_IIDR:
+    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
+        /* RO registers, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write to RO register at offset "
+                      TARGET_FMT_plx "\n", __func__, offset);
+        break;
+    default:
+        result = false;
+        break;
+    }
     return result;
 }
 
@@ -48,7 +294,55 @@ static bool its_readl(GICv3ITSState *s, hwaddr offset,
                              uint64_t *data, MemTxAttrs attrs)
 {
     bool result = true;
+    int index;
 
+    switch (offset) {
+    case GITS_CTLR:
+        *data = s->ctlr;
+        break;
+    case GITS_IIDR:
+        *data = gicv3_iidr();
+        break;
+    case GITS_IDREGS ... GITS_IDREGS + 0x2f:
+        /* ID registers */
+        *data = gicv3_idreg(offset - GITS_IDREGS);
+        break;
+    case GITS_TYPER:
+        *data = extract64(s->typer, 0, 32);
+        break;
+    case GITS_TYPER + 4:
+        *data = extract64(s->typer, 32, 32);
+        break;
+    case GITS_CBASER:
+        *data = extract64(s->cbaser, 0, 32);
+        break;
+    case GITS_CBASER + 4:
+        *data = extract64(s->cbaser, 32, 32);
+        break;
+    case GITS_CREADR:
+        *data = extract64(s->creadr, 0, 32);
+        break;
+    case GITS_CREADR + 4:
+        *data = extract64(s->creadr, 32, 32);
+        break;
+    case GITS_CWRITER:
+        *data = extract64(s->cwriter, 0, 32);
+        break;
+    case GITS_CWRITER + 4:
+        *data = extract64(s->cwriter, 32, 32);
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        index = (offset - GITS_BASER) / 8;
+        if (offset & 7) {
+            *data = extract64(s->baser[index], 32, 32);
+        } else {
+            *data = extract64(s->baser[index], 0, 32);
+        }
+        break;
+    default:
+        result = false;
+        break;
+    }
     return result;
 }
 
@@ -56,7 +350,54 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     bool result = true;
+    int index;
 
+    switch (offset) {
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /*
+         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+            s->baser[index] &= GITS_BASER_RO_MASK;
+            s->baser[index] |= (value & ~GITS_BASER_RO_MASK);
+        }
+        break;
+    case GITS_CBASER:
+        /*
+         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = value;
+            s->creadr = 0;
+            s->cwriter = s->creadr;
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
+        break;
+    case GITS_CREADR:
+        if (s->gicv3->gicd_ctlr & GICD_CTLR_DS) {
+            s->creadr = value & ~R_GITS_CREADR_STALLED_MASK;
+        } else {
+            /* RO register, ignore the write */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: invalid guest write to RO register at offset "
+                          TARGET_FMT_plx "\n", __func__, offset);
+        }
+        break;
+    case GITS_TYPER:
+        /* RO registers, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write to RO register at offset "
+                      TARGET_FMT_plx "\n", __func__, offset);
+        break;
+    default:
+        result = false;
+        break;
+    }
     return result;
 }
 
@@ -64,7 +405,29 @@ static bool its_readll(GICv3ITSState *s, hwaddr offset,
                               uint64_t *data, MemTxAttrs attrs)
 {
     bool result = true;
+    int index;
 
+    switch (offset) {
+    case GITS_TYPER:
+        *data = s->typer;
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        index = (offset - GITS_BASER) / 8;
+        *data = s->baser[index];
+        break;
+    case GITS_CBASER:
+        *data = s->cbaser;
+        break;
+    case GITS_CREADR:
+        *data = s->creadr;
+        break;
+    case GITS_CWRITER:
+        *data = s->cwriter;
+        break;
+    default:
+        result = false;
+        break;
+    }
     return result;
 }
 
@@ -166,6 +529,9 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
 
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
 
+    address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
+                       "gicv3-its-sysmem");
+
     /* set the ITS default features supported */
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
                           GITS_TYPE_PHYSICAL);
@@ -209,6 +575,14 @@ static void gicv3_its_reset(DeviceState *dev)
                              GITS_CTE_SIZE - 1);
 }
 
+static void gicv3_its_post_load(GICv3ITSState *s)
+{
+    if (s->ctlr & ITS_CTLR_ENABLED) {
+        extract_table_params(s);
+        extract_cmdq_params(s);
+    }
+}
+
 static Property gicv3_its_props[] = {
     DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
                      GICv3State *),
@@ -219,10 +593,12 @@ static void gicv3_its_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     GICv3ITSClass *ic = ARM_GICV3_ITS_CLASS(klass);
+    GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
 
     dc->realize = gicv3_arm_its_realize;
     device_class_set_props(dc, gicv3_its_props);
     device_class_set_parent_reset(dc, gicv3_its_reset, &ic->parent_reset);
+    icc->post_load = gicv3_its_post_load;
 }
 
 static const TypeInfo gicv3_its_info = {
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index b99bf9db46..92e0a4fa68 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -258,6 +258,20 @@ FIELD(GITS_BASER, INNERCACHE, 59, 3)
 FIELD(GITS_BASER, INDIRECT, 62, 1)
 FIELD(GITS_BASER, VALID, 63, 1)
 
+FIELD(GITS_CBASER, SIZE, 0, 8)
+FIELD(GITS_CBASER, SHAREABILITY, 10, 2)
+FIELD(GITS_CBASER, PHYADDR, 12, 40)
+FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
+FIELD(GITS_CBASER, INNERCACHE, 59, 3)
+FIELD(GITS_CBASER, VALID, 63, 1)
+
+FIELD(GITS_CREADR, STALLED, 0, 1)
+FIELD(GITS_CREADR, OFFSET, 5, 15)
+
+FIELD(GITS_CWRITER, RETRY, 0, 1)
+FIELD(GITS_CWRITER, OFFSET, 5, 15)
+
+FIELD(GITS_CTLR, ENABLED, 0, 1)
 FIELD(GITS_CTLR, QUIESCENT, 31, 1)
 
 FIELD(GITS_TYPER, PHYSICAL, 0, 1)
@@ -269,6 +283,13 @@ FIELD(GITS_TYPER, PTA, 19, 1)
 FIELD(GITS_TYPER, CIDBITS, 32, 4)
 FIELD(GITS_TYPER, CIL, 36, 1)
 
+#define GITS_IDREGS           0xFFD0
+
+#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
+
+#define GITS_BASER_RO_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK | \
+                                              R_GITS_BASER_TYPE_MASK)
+
 #define GITS_BASER_PAGESIZE_4K                0
 #define GITS_BASER_PAGESIZE_16K               1
 #define GITS_BASER_PAGESIZE_64K               2
@@ -276,6 +297,14 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_BASER_TYPE_DEVICE               1ULL
 #define GITS_BASER_TYPE_COLLECTION           4ULL
 
+#define GITS_PAGE_SIZE_4K       0x1000
+#define GITS_PAGE_SIZE_16K      0x4000
+#define GITS_PAGE_SIZE_64K      0x10000
+
+#define L1TABLE_ENTRY_SIZE         8
+
+#define GITS_CMDQ_ENTRY_SIZE               32
+
 /**
  * Default features advertised by this version of ITS
  */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 91491a2f66..1fd5cedbbd 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -226,6 +226,9 @@ struct GICv3State {
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
 
+    MemoryRegion *dma;
+    AddressSpace dma_as;
+
     /* Distributor */
 
     /* for a GIC with the security extensions the NS banked version of this
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 65d1191db1..4e79145dde 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -41,6 +41,25 @@
 
 #define GITS_TRANSLATER  0x0040
 
+typedef struct {
+    bool valid;
+    bool indirect;
+    uint16_t entry_sz;
+    uint32_t page_sz;
+    uint32_t max_entries;
+    union {
+        uint32_t max_devids;
+        uint32_t max_collids;
+    } maxids;
+    uint64_t base_addr;
+} TableDesc;
+
+typedef struct {
+    bool valid;
+    uint32_t max_entries;
+    uint64_t base_addr;
+} CmdQDesc;
+
 struct GICv3ITSState {
     SysBusDevice parent_obj;
 
@@ -63,6 +82,10 @@ struct GICv3ITSState {
     uint64_t creadr;
     uint64_t baser[8];
 
+    TableDesc  dt;
+    TableDesc  ct;
+    CmdQDesc   cq;
+
     Error *migration_blocker;
 };
 
-- 
2.27.0


