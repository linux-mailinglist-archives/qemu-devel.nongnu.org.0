Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A03399221
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:03:08 +0200 (CEST)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVCt-0002bG-Ty
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAi-00087C-Ll
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:52 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:33546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAc-0006Zf-M0
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:52 -0400
Received: by mail-qt1-x836.google.com with SMTP id a15so2519970qta.0
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IVN/8rF5fxlsc9q9B9yfI+apQaP68qFmGdTRKzvpgI=;
 b=cKjjGRwfHst5dCNTn1oSs7gs8pcb2pDFpXK7q8FWliW3Vps8KXq7TVm9WfBI8qgikz
 x1tHMmylHxmynOLZr94JIQtjfyB8LbtQ6xAIBxAF3geABDPckdpKnDefGuHovg0Hjl81
 aVG8W90DniG4bLvv6BV6ms3MeufPWAFN4x6XeWutjbacYbLYGR+wIvpCA7yymCLT1NRi
 p3xqZMF0FLtb7zAigxzRjhXQxZCQptRShQeSAtAP9gTUrP4YBXr4h4Zv/19mnS4Oubg7
 bdhSX8HqVHsGNlMRCR2PyFQqP1FZcz17LHWuOkBA3+nwIR/Qyf7SWiWSHXjeYfEo4SYw
 3CUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IVN/8rF5fxlsc9q9B9yfI+apQaP68qFmGdTRKzvpgI=;
 b=jPqmDhH9XNlmiIq+sencU/JxlasVnFAe1ejn20V4VSX9+/Uc0ZU7OpujZyeONg7Mv5
 Im7fZ7eBxn2nIQJLxWmhDNSifMVV+2uSRz+S2hKjsj6Mr9RK0HkveyAQXiM1bAZ6y9/O
 NVVeVoP1J1Mz4iaisrvhjHqIt6CA3D5Aq5IVHFdpbbStLR8BxbrDaQASOY/QbouphNyy
 umDVPSkFvP4KBExx8Dc1TAieU4JJh1JCc46sqnPzGMPL1ktZpkSEXWjwqnBrCBpdahdF
 kxgyInaaIUTOwvuvwhaPGU7f0PPtTOcq1vUj9Htxt0YVvKFspNrVUzC4mXegWxE42919
 u3Uw==
X-Gm-Message-State: AOAM530z+H+/I+JWDXAwkbXmtR4P7Cppa8kuc+lk2CxdJey2XqFsKwE5
 EGJjFsExD/44YUHEVIjZJU3w0g==
X-Google-Smtp-Source: ABdhPJwF0mLMYLJRjP55tUxsangWM2Ib62rRgEguapB5djX/xnJbn3XI404iVX9a04thg62do53dUg==
X-Received: by 2002:a05:622a:1055:: with SMTP id
 f21mr13672158qte.90.1622656845639; 
 Wed, 02 Jun 2021 11:00:45 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id 97sm273044qte.20.2021.06.02.11.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:45 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 2/8] hw/intc: GICv3 ITS register definitions added
Date: Wed,  2 Jun 2021 14:00:36 -0400
Message-Id: <20210602180042.111347-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602180042.111347-1-shashi.mallela@linaro.org>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x836.google.com
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

Defined descriptors for ITS device table,collection table and ITS
command queue entities.Implemented register read/write functions,
extract ITS table parameters and command queue parameters,extended
gicv3 common to capture qemu address space(which host the ITS table
platform memories required for subsequent ITS processing) and
initialize the same in ITS device.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c                | 335 +++++++++++++++++++++++++
 hw/intc/gicv3_internal.h               |  28 ++-
 include/hw/intc/arm_gicv3_common.h     |   3 +
 include/hw/intc/arm_gicv3_its_common.h |  30 +++
 4 files changed, 395 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 545cda3665..af60f19c98 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -28,6 +28,157 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
+{
+    uint64_t result = 0;
+
+    switch (page_sz) {
+    case GITS_ITT_PAGE_SIZE_0:
+    case GITS_ITT_PAGE_SIZE_1:
+        result = value & R_GITS_BASER_PHYADDR_MASK;
+        break;
+
+    case GITS_ITT_PAGE_SIZE_2:
+        result = value & R_GITS_BASER_PHYADDRL_64K_MASK;
+        result |= FIELD_EX64(value, GITS_BASER, PHYADDRH_64K) << 48;
+        break;
+
+    default:
+        break;
+    }
+    return result;
+}
+
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
+            page_sz = GITS_ITT_PAGE_SIZE_0;
+            break;
+
+        case 1:
+            page_sz = GITS_ITT_PAGE_SIZE_1;
+            break;
+
+        case 2:
+        case 3:
+            page_sz = GITS_ITT_PAGE_SIZE_2;
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+
+        num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
+
+        type = FIELD_EX64(value, GITS_BASER, TYPE);
+
+        switch (type) {
+
+        case GITS_ITT_TYPE_DEVICE:
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
+                s->dt.max_entries = ((num_pages + 1) * page_sz) /
+                                     s->dt.entry_sz;
+            } else {
+                s->dt.max_entries = ((((num_pages + 1) * page_sz) /
+                                     L1TABLE_ENTRY_SIZE) *
+                                     (page_sz / s->dt.entry_sz));
+            }
+
+            s->dt.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
+                                DEVBITS) + 1));
+
+            s->dt.base_addr = baser_base_addr(value, page_sz);
+
+            break;
+
+        case GITS_ITT_TYPE_COLLECTION:
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
+                s->ct.max_entries = ((num_pages + 1) * page_sz) /
+                                     s->ct.entry_sz;
+            } else {
+                s->ct.max_entries = ((((num_pages + 1) * page_sz) /
+                                     L1TABLE_ENTRY_SIZE) *
+                                     (page_sz / s->ct.entry_sz));
+            }
+
+            if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
+                s->ct.max_collids = (1UL << (FIELD_EX64(s->typer,
+                                     GITS_TYPER, CIDBITS) + 1));
+            } else {
+                /* 16-bit CollectionId supported when CIL == 0 */
+                s->ct.max_collids = (1UL << 16);
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
+    num_pages = FIELD_EX64(value, GITS_CBASER, SIZE);
+
+    memset(&s->cq, 0 , sizeof(s->cq));
+    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
+
+    if (s->cq.valid) {
+        s->cq.max_entries = ((num_pages + 1) * GITS_ITT_PAGE_SIZE_0) /
+                             GITS_CMDQ_ENTRY_SIZE;
+        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
+        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
+    }
+}
+
 static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                                uint64_t data, unsigned size,
                                                MemTxAttrs attrs)
@@ -41,7 +192,73 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
                               uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
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
+        }
+        break;
+    case GITS_CBASER + 4:
+        /*
+         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 32, 32, value);
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = deposit64(s->cwriter, 0, 32,
+                               (value & ~R_GITS_CWRITER_RETRY_MASK));
+        break;
+    case GITS_CWRITER + 4:
+        s->cwriter = deposit64(s->cwriter, 32, 32,
+                               (value & ~R_GITS_CWRITER_RETRY_MASK));
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
+                s->baser[index] = deposit64(s->baser[index], 32, 32,
+                                            (value & ~GITS_BASER_VAL_MASK));
+            } else {
+                s->baser[index] = deposit64(s->baser[index], 0, 32,
+                                            (value & ~GITS_BASER_VAL_MASK));
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
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -49,7 +266,55 @@ static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
                              uint64_t *data, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
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
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -57,7 +322,42 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
 
+    switch (offset) {
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /*
+         * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);
+        }
+        break;
+    case GITS_CBASER:
+        /*
+         * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
+         *                 already enabled
+         */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = value;
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = value & ~R_GITS_CWRITER_RETRY_MASK;
+        break;
+    case GITS_CREADR:
+    case GITS_TYPER:
+        /* RO registers, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write to RO register at offset "
+                      TARGET_FMT_plx "\n", __func__, offset);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -65,7 +365,29 @@ static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
                               uint64_t *data, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
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
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -162,6 +484,9 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
 
     if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
+        address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
+                           "gicv3-its-sysmem");
+
         /* set the ITS default features supported */
         s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
                               GITS_TYPE_PHYSICAL);
@@ -208,6 +533,14 @@ static void gicv3_its_reset(DeviceState *dev)
     }
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
@@ -218,10 +551,12 @@ static void gicv3_its_class_init(ObjectClass *klass, void *data)
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
index e0b06930a7..d6aaa94e4c 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -238,7 +238,7 @@ FIELD(GITS_BASER, PAGESIZE, 8, 2)
 FIELD(GITS_BASER, SHAREABILITY, 10, 2)
 FIELD(GITS_BASER, PHYADDR, 12, 36)
 FIELD(GITS_BASER, PHYADDRL_64K, 16, 32)
-FIELD(GITS_BASER, PHYADDRH_64K, 48, 4)
+FIELD(GITS_BASER, PHYADDRH_64K, 12, 4)
 FIELD(GITS_BASER, ENTRYSIZE, 48, 5)
 FIELD(GITS_BASER, OUTERCACHE, 53, 3)
 FIELD(GITS_BASER, TYPE, 56, 3)
@@ -246,6 +246,17 @@ FIELD(GITS_BASER, INNERCACHE, 59, 3)
 FIELD(GITS_BASER, INDIRECT, 62, 1)
 FIELD(GITS_BASER, VALID, 63, 1)
 
+FIELD(GITS_CBASER, SIZE, 0, 8)
+FIELD(GITS_CBASER, SHAREABILITY, 10, 2)
+FIELD(GITS_CBASER, PHYADDR, 12, 40)
+FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
+FIELD(GITS_CBASER, INNERCACHE, 59, 3)
+FIELD(GITS_CBASER, VALID, 63, 1)
+
+FIELD(GITS_CWRITER, RETRY, 0, 1)
+FIELD(GITS_CWRITER, OFFSET, 5, 15)
+
+FIELD(GITS_CTLR, ENABLED, 0, 1)
 FIELD(GITS_CTLR, QUIESCENT, 31, 1)
 
 FIELD(GITS_TYPER, PHYSICAL, 0, 1)
@@ -257,6 +268,13 @@ FIELD(GITS_TYPER, PTA, 19, 1)
 FIELD(GITS_TYPER, CIDBITS, 32, 4)
 FIELD(GITS_TYPER, CIL, 36, 1)
 
+#define GITS_IDREGS           0xFFD0
+
+#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
+
+#define GITS_BASER_VAL_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK | \
+                                              R_GITS_BASER_TYPE_MASK)
+
 #define GITS_BASER_PAGESIZE_4K                0
 #define GITS_BASER_PAGESIZE_16K               1
 #define GITS_BASER_PAGESIZE_64K               2
@@ -264,6 +282,14 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_ITT_TYPE_DEVICE                  1ULL
 #define GITS_ITT_TYPE_COLLECTION              4ULL
 
+#define GITS_ITT_PAGE_SIZE_0      0x1000
+#define GITS_ITT_PAGE_SIZE_1      0x4000
+#define GITS_ITT_PAGE_SIZE_2      0x10000
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
index 65d1191db1..78b1ba7e6b 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -41,6 +41,32 @@
 
 #define GITS_TRANSLATER  0x0040
 
+typedef struct {
+    bool valid;
+    bool indirect;
+    uint16_t entry_sz;
+    uint32_t page_sz;
+    uint32_t max_entries;
+    uint32_t max_devids;
+    uint64_t base_addr;
+} DevTableDesc;
+
+typedef struct {
+    bool valid;
+    bool indirect;
+    uint16_t entry_sz;
+    uint32_t page_sz;
+    uint32_t max_entries;
+    uint32_t max_collids;
+    uint64_t base_addr;
+} CollTableDesc;
+
+typedef struct {
+    bool valid;
+    uint32_t max_entries;
+    uint64_t base_addr;
+} CmdQDesc;
+
 struct GICv3ITSState {
     SysBusDevice parent_obj;
 
@@ -63,6 +89,10 @@ struct GICv3ITSState {
     uint64_t creadr;
     uint64_t baser[8];
 
+    DevTableDesc  dt;
+    CollTableDesc ct;
+    CmdQDesc      cq;
+
     Error *migration_blocker;
 };
 
-- 
2.27.0


