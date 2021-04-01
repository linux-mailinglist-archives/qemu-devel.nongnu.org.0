Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7EB350CC4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 04:44:14 +0200 (CEST)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRnJc-0004Vx-0L
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 22:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHV-0002gP-6Q
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:42:01 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:34307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRnHQ-00037i-Vw
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 22:42:00 -0400
Received: by mail-qk1-x72e.google.com with SMTP id g20so933743qkk.1
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 19:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8rJ40ECxRHqo1oLNI78S+uMTmTvVDhyimY6qm14khE=;
 b=dbVJnfuCFBVplsAcIPrmgylBwpwkPH9fmUEqy8hkHWgnWLcUy+Rvg5BLrQ0R0Pa8YK
 Udsr9vZRsuAnAOGrw3dID8yLGJGcvywWjPA7R53lJHWaHgQAbNerxafuSDcqOuBvO4VJ
 /aswkSpL9RSl75rrBxWQMokD3VRMz8kHgskFZKoOHNZt0tNmIzNLivV+BYPhd9H4HjbJ
 yVJGpO83m0Lq/briM6ex48gVVXd/h9UTWy/5/wFH02W7QiOZduLgQpTncfGATht5a0RD
 M0DocDSWcE7XMTQ3eeTIfn7NBwqHBFojsXGX+hTlwuJN6hDIuS+4+phxh/4oSBcwiHim
 EFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8rJ40ECxRHqo1oLNI78S+uMTmTvVDhyimY6qm14khE=;
 b=Phq9LWdEFDk6dQKKnZR6iAUZ7ag3wNwSjSeMwEf15n1N1mRz2ayd9rL9oMTLHfGUAf
 xmFlF1X109jJ6DVck93YqtKU1nAGq3lEXGeMrmRpmVPi3fszVIEF6knnzIr4PV80tV8P
 PoOObwXuJVtkiiJLVUhHuSskJ1h4LZOD7ScdirGljH+OS01jaV1sYJpRARmOsYnXssei
 raFPaUJfYVHge80OS0986+dQP+a86Ww84Hrw1/xZYpDrHrX7na9uD1yS/HHoGmXjXNoI
 rGv/pYYbOhVF1pIzncCJ2IYfif4yUDH7NxSUJXWhDgyQu08cPtpLHDOn/rfbkY0AKj2N
 kptQ==
X-Gm-Message-State: AOAM530cMJI8DanmMsyVpfXBPSIrkbVzd4EQ6md+kcsRSvn5IxWyUNh9
 hqWl1GZs9eWejEit0T+pazFoCQ==
X-Google-Smtp-Source: ABdhPJwFWAA05oTiemZHKe++Us+aBd7bQNedOAi/fv7G2jW216HsMIF5RyLGAOGBnVVb95sMFPg17Q==
X-Received: by 2002:a37:a48c:: with SMTP id n134mr6453326qke.490.1617244915886; 
 Wed, 31 Mar 2021 19:41:55 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id a8sm2525707qtx.9.2021.03.31.19.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:41:55 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 2/8] hw/intc: GICv3 ITS register definitions added
Date: Wed, 31 Mar 2021 22:41:46 -0400
Message-Id: <20210401024152.203896-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210401024152.203896-1-shashi.mallela@linaro.org>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72e.google.com
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
initialize the same in its device.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_its.c                | 313 +++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |  42 ++++
 hw/intc/gicv3_internal.h               |  33 ++-
 include/hw/intc/arm_gicv3_common.h     |   4 +
 include/hw/intc/arm_gicv3_its_common.h |  28 +++
 5 files changed, 414 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 209120d102..81373f049d 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -28,6 +28,131 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+static bool extract_table_params(GICv3ITSState *s, int index)
+{
+    uint16_t num_pages = 0;
+    uint8_t  page_sz_type;
+    uint8_t type;
+    uint32_t page_sz = 0;
+    uint64_t value = s->baser[index];
+
+    num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
+    page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
+
+    if (page_sz_type == 0) {
+        page_sz = GITS_ITT_PAGE_SIZE_0;
+    } else if (page_sz_type == 0) {
+        page_sz = GITS_ITT_PAGE_SIZE_1;
+    } else if (page_sz_type == 2) {
+        page_sz = GITS_ITT_PAGE_SIZE_2;
+    } else {
+        return false;
+    }
+
+    type = FIELD_EX64(value, GITS_BASER, TYPE);
+
+    if (type == GITS_ITT_TYPE_DEVICE) {
+        s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
+
+        if (s->dt.valid) {
+            s->dt.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+            s->dt.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+
+            if (!s->dt.indirect) {
+                s->dt.max_entries = ((num_pages + 1) * page_sz) /
+                                                       s->dt.entry_sz;
+            } else {
+                s->dt.max_entries = ((((num_pages + 1) * page_sz) /
+                                        L1TABLE_ENTRY_SIZE) *
+                                    (page_sz / s->dt.entry_sz));
+            }
+
+            s->dt.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
+                                                    DEVBITS) + 1));
+
+            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
+                    (page_sz == GITS_ITT_PAGE_SIZE_1)) {
+                s->dt.base_addr = FIELD_EX64(value, GITS_BASER, PHYADDR);
+                s->dt.base_addr <<= R_GITS_BASER_PHYADDR_SHIFT;
+            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
+                s->dt.base_addr = FIELD_EX64(value, GITS_BASER, PHYADDRL_64K) <<
+                                  R_GITS_BASER_PHYADDRL_64K_SHIFT;
+                  s->dt.base_addr |= ((value >> R_GITS_BASER_PHYADDR_SHIFT) &
+                                       R_GITS_BASER_PHYADDRH_64K_MASK) <<
+                                       R_GITS_BASER_PHYADDRH_64K_SHIFT;
+            }
+        }
+    } else if (type == GITS_ITT_TYPE_COLLECTION) {
+        s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
+
+        /*
+         * GITS_TYPER.HCC is 0 for this implementation
+         * hence writes are discarded if ct.valid is 0
+         */
+        if (s->ct.valid) {
+            s->ct.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+            s->ct.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+
+            if (!s->ct.indirect) {
+                s->ct.max_entries = ((num_pages + 1) * page_sz) /
+                                      s->ct.entry_sz;
+            } else {
+                s->ct.max_entries = ((((num_pages + 1) * page_sz) /
+                                      L1TABLE_ENTRY_SIZE) *
+                                      (page_sz / s->ct.entry_sz));
+            }
+
+            if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
+                s->ct.max_collids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
+                                                         CIDBITS) + 1));
+            } else {
+                /* 16-bit CollectionId supported when CIL == 0 */
+                s->ct.max_collids = (1UL << 16);
+            }
+
+            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
+                 (page_sz == GITS_ITT_PAGE_SIZE_1)) {
+                s->ct.base_addr = FIELD_EX64(value, GITS_BASER, PHYADDR);
+                s->ct.base_addr <<= R_GITS_BASER_PHYADDR_SHIFT;
+            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
+                s->ct.base_addr = FIELD_EX64(value, GITS_BASER, PHYADDRL_64K) <<
+                                    R_GITS_BASER_PHYADDRL_64K_SHIFT;
+                s->ct.base_addr |= ((value >> R_GITS_BASER_PHYADDR_SHIFT) &
+                                     R_GITS_BASER_PHYADDRH_64K_MASK) <<
+                                     R_GITS_BASER_PHYADDRH_64K_SHIFT;
+            }
+        }
+    } else {
+        /* unsupported ITS table type */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unsupported ITS table type %d",
+                         __func__, type);
+        return false;
+    }
+    return true;
+}
+
+static bool extract_cmdq_params(GICv3ITSState *s)
+{
+    uint16_t num_pages = 0;
+    uint64_t value = s->cbaser;
+
+    num_pages = FIELD_EX64(value, GITS_CBASER, SIZE);
+
+    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
+
+    if (!num_pages || !s->cq.valid) {
+        return false;
+    }
+
+    if (s->cq.valid) {
+        s->cq.max_entries = ((num_pages + 1) * GITS_ITT_PAGE_SIZE_0) /
+                                                GITS_CMDQ_ENTRY_SIZE;
+        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
+        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
+    }
+    return true;
+}
+
 static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
@@ -126,7 +251,75 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
+    uint64_t temp = 0;
 
+    switch (offset) {
+    case GITS_CTLR:
+        s->ctlr |= (value & ~(s->ctlr));
+        break;
+    case GITS_CBASER:
+        /* GITS_CBASER register becomes RO if ITS is already enabled */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 0, 32, value);
+            s->creadr = 0;
+        }
+        break;
+    case GITS_CBASER + 4:
+        /* GITS_CBASER register becomes RO if ITS is already enabled */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = deposit64(s->cbaser, 32, 32, value);
+            if (!extract_cmdq_params(s)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: error extracting GITS_CBASER parameters "
+                       TARGET_FMT_plx "\n", __func__, offset);
+                s->cbaser = 0;
+                result = MEMTX_ERROR;
+            } else {
+                s->creadr = 0;
+            }
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = deposit64(s->cwriter, 0, 32, value);
+        break;
+    case GITS_CWRITER + 4:
+        s->cwriter = deposit64(s->cwriter, 32, 32, value);
+        break;
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /* GITS_BASERn registers become RO if ITS is already enabled */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+
+            if (offset & 7) {
+                temp = s->baser[index];
+                temp = deposit64(temp, 32, 32, (value & ~GITS_BASER_VAL_MASK));
+                s->baser[index] |= temp;
+
+                if (!extract_table_params(s, index)) {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: error extracting GITS_BASER parameters "
+                        TARGET_FMT_plx "\n", __func__, offset);
+                    s->baser[index] = 0;
+                    result = MEMTX_ERROR;
+                }
+            } else {
+                s->baser[index] =  deposit64(s->baser[index], 0, 32, value);
+            }
+        }
+        break;
+    case GITS_IIDR:
+    case GITS_TYPER:
+    case GITS_CREADR:
+        /* RO registers, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: invalid guest write to RO register at offset "
+            TARGET_FMT_plx "\n", __func__, offset);
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -134,7 +327,54 @@ static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
                                uint64_t *data, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
 
+    switch (offset) {
+    case GITS_CTLR:
+        *data = s->ctlr;
+        break;
+    case GITS_IIDR:
+        *data = s->iidr;
+        break;
+    case GITS_PIDR2:
+        *data = 0x30; /* GICv3 */
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
+            *data = s->baser[index] >> 32;
+        } else {
+            *data = (uint32_t)s->baser[index];
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -142,7 +382,52 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
 
+    switch (offset) {
+    case GITS_BASER ... GITS_BASER + 0x3f:
+        /* GITS_BASERn registers become RO if ITS is already enabled */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            index = (offset - GITS_BASER) / 8;
+            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);
+            if (!extract_table_params(s, index)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: error extracting GITS_BASER parameters "
+                        TARGET_FMT_plx "\n", __func__, offset);
+                s->baser[index] = 0;
+                result = MEMTX_ERROR;
+            }
+        }
+        break;
+    case GITS_CBASER:
+        /* GITS_CBASER register becomes RO if ITS is already enabled */
+        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+            s->cbaser = value;
+            if (!extract_cmdq_params(s)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                       "%s: error extracting GITS_CBASER parameters "
+                       TARGET_FMT_plx "\n", __func__, offset);
+                s->cbaser = 0;
+                result = MEMTX_ERROR;
+            } else {
+                s->creadr = 0;
+            }
+        }
+        break;
+    case GITS_CWRITER:
+        s->cwriter = value;
+        break;
+    case GITS_TYPER:
+    case GITS_CREADR:
+        /* RO register, ignore the write */
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
 
@@ -150,7 +435,29 @@ static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
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
 
@@ -250,6 +557,9 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
     GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
 
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
+
+    address_space_init(&s->gicv3->sysmem_as, s->gicv3->sysmem,
+                        "gicv3-its-sysmem");
 }
 
 static void gicv3_its_reset(DeviceState *dev)
@@ -259,6 +569,9 @@ static void gicv3_its_reset(DeviceState *dev)
 
     if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
         c->parent_reset(dev);
+        memset(&s->dt, 0, sizeof(s->dt));
+        memset(&s->ct, 0, sizeof(s->ct));
+        memset(&s->cq, 0, sizeof(s->cq));
 
         /* set the ITS default features supported */
         s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 80cc9ec6d8..9c5c71f350 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -48,6 +48,42 @@ static int gicv3_its_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static const VMStateDescription vmstate_its_dtdesc = {
+    .name = "arm_gicv3_its_dtdesc",
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(valid, DevTableDesc),
+        VMSTATE_BOOL(indirect, DevTableDesc),
+        VMSTATE_UINT16(entry_sz, DevTableDesc),
+        VMSTATE_UINT32(max_entries, DevTableDesc),
+        VMSTATE_UINT32(max_devids, DevTableDesc),
+        VMSTATE_UINT64(base_addr, DevTableDesc),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static const VMStateDescription vmstate_its_ctdesc = {
+    .name = "arm_gicv3_its_ctdesc",
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(valid, CollTableDesc),
+        VMSTATE_BOOL(indirect, CollTableDesc),
+        VMSTATE_UINT16(entry_sz, CollTableDesc),
+        VMSTATE_UINT32(max_entries, CollTableDesc),
+        VMSTATE_UINT32(max_collids, CollTableDesc),
+        VMSTATE_UINT64(base_addr, CollTableDesc),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static const VMStateDescription vmstate_its_cqdesc = {
+    .name = "arm_gicv3_its_cqdesc",
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(valid, CmdQDesc),
+        VMSTATE_UINT32(max_entries, CmdQDesc),
+        VMSTATE_UINT64(base_addr, CmdQDesc),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
 static const VMStateDescription vmstate_its = {
     .name = "arm_gicv3_its",
     .version_id = 1,
@@ -56,6 +92,12 @@ static const VMStateDescription vmstate_its = {
     .post_load = gicv3_its_post_load,
     .priority = MIG_PRI_GICV3_ITS,
     .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(dt, GICv3ITSState, 0, vmstate_its_dtdesc,
+                        DevTableDesc),
+        VMSTATE_STRUCT(ct, GICv3ITSState, 0, vmstate_its_ctdesc,
+                        CollTableDesc),
+        VMSTATE_STRUCT(cq, GICv3ITSState, 0, vmstate_its_cqdesc,
+                        CmdQDesc),
         VMSTATE_UINT32(ctlr, GICv3ITSState),
         VMSTATE_UINT32(translater, GICv3ITSState),
         VMSTATE_UINT32(iidr, GICv3ITSState),
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 96cfe2dff9..b7701e8ca5 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -246,13 +246,14 @@ FIELD(GITS_BASER, INNERCACHE, 59, 3)
 FIELD(GITS_BASER, INDIRECT, 62, 1)
 FIELD(GITS_BASER, VALID, 63, 1)
 
-#define GITS_BASER_PAGESIZE_4K                0
-#define GITS_BASER_PAGESIZE_16K               1
-#define GITS_BASER_PAGESIZE_64K               2
-
-#define GITS_ITT_TYPE_DEVICE                  1ULL
-#define GITS_ITT_TYPE_COLLECTION              4ULL
+FIELD(GITS_CBASER, SIZE, 0, 8)
+FIELD(GITS_CBASER, SHAREABILITY, 10, 2)
+FIELD(GITS_CBASER, PHYADDR, 12, 40)
+FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
+FIELD(GITS_CBASER, INNERCACHE, 59, 3)
+FIELD(GITS_CBASER, VALID, 63, 1)
 
+FIELD(GITS_CTLR, ENABLED, 0, 1)
 FIELD(GITS_CTLR, QUIESCENT, 31, 1)
 
 FIELD(GITS_TYPER, PHYSICAL, 0, 1)
@@ -264,6 +265,26 @@ FIELD(GITS_TYPER, PTA, 19, 1)
 FIELD(GITS_TYPER, CIDBITS, 32, 4)
 FIELD(GITS_TYPER, CIL, 36, 1)
 
+#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
+
+#define GITS_BASER_VAL_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK | \
+                                              R_GITS_BASER_TYPE_MASK)
+
+#define GITS_BASER_PAGESIZE_4K                0
+#define GITS_BASER_PAGESIZE_16K               1
+#define GITS_BASER_PAGESIZE_64K               2
+
+#define GITS_ITT_TYPE_DEVICE                  1ULL
+#define GITS_ITT_TYPE_COLLECTION              4ULL
+
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
index 91491a2f66..b0f2414fa3 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -226,12 +226,16 @@ struct GICv3State {
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
 
+    MemoryRegion *sysmem;
+    AddressSpace sysmem_as;
+
     /* Distributor */
 
     /* for a GIC with the security extensions the NS banked version of this
      * register is just an alias of bit 1 of the S banked version.
      */
     uint32_t gicd_ctlr;
+    uint32_t gicd_typer;
     uint32_t gicd_statusr[2];
     GIC_DECLARE_BITMAP(group);        /* GICD_IGROUPR */
     GIC_DECLARE_BITMAP(grpmod);       /* GICD_IGRPMODR */
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 08bc5652ed..b7eca57221 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -43,6 +43,30 @@
 
 #define GITS_PIDR2       0xFFE8
 
+typedef struct {
+    bool valid;
+    bool indirect;
+    uint16_t entry_sz;
+    uint32_t max_entries;
+    uint32_t max_devids;
+    uint64_t base_addr;
+} DevTableDesc;
+
+typedef struct {
+    bool valid;
+    bool indirect;
+    uint16_t entry_sz;
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
 
@@ -66,6 +90,10 @@ struct GICv3ITSState {
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


