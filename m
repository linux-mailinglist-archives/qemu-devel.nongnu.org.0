Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE436F313
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:54:03 +0200 (CEST)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGTq-0001gu-Jx
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIO-0005d3-4n
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:12 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGIH-0004KQ-1e
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:42:11 -0400
Received: by mail-qv1-xf30.google.com with SMTP id 3so8751015qvp.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uuIVzuXRLyrPGMs385vV/RiAQlR7xwp7ktqNxmXgYZI=;
 b=A2c5CopaJzHXdrTnFyz29YAx6Px+JGvsSzT2XfxtTO8vwI4rVBi4X05dCrLNKpSgUh
 DcQjej72EDwdIR69wasibDNoOWKdkzJnC3oDmUkrYHzdUNcP/uybLHypT0V0VInCZc2d
 vRgeaf5jdpsXYQ0EFo7MJoqWLUSvr6vVhp+K2/7SHEIpWf/VKofYYlYoIRT08Cv5NRHk
 fi62fAzznANUbZWK/rNioemlvn4cNIg2TrxQ72D9eSVYRTNOrv4qlFCKspVE+JrgKHzb
 JwflSQEoczLV2uPVes9FBYgaq4rmDvdc/rlyDZBl6qARJ3XBbmG8GmK7FB5yABEZVL0G
 oRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uuIVzuXRLyrPGMs385vV/RiAQlR7xwp7ktqNxmXgYZI=;
 b=rsEoynj3ReJZHLBLJEONfEVgGYtldijEMPWoPnuyH5PvzUyxRn5Fge4LDXFZDmm9Qy
 ERCvhnWjlc0qa56gCEsEz1WlS2CljbEzKfjoRx0OEWV7qbilPm/5uwGM8ZZuccWOSrEZ
 gXJvmFArSI86lU3e8q3XC8/EWMqzUmA7DZ59j29d90Ei33LmPIOQmlHG3anCg5Tx1Tw8
 F8dPMyl848Mnr8vnLcqS+veymqtwoXTVNf6bDlcSLCTabHAEqOgDKjj4aXK2cyK4lUX8
 RQj7ZQkd0F5zdpgf7QVbgUocntARmBzirBiRgWukTBGR9vOI2AwlEQFUCMSQ0DG3xStW
 EUEA==
X-Gm-Message-State: AOAM531NnwaxTEAAhuZZKA4dIbpDS9DpnJsuiiG+FU9oXiratzPBuVDn
 QQPEvjpwhZIJD+ZvQjQobFQQRw==
X-Google-Smtp-Source: ABdhPJwQSR4OdorL7ZKsIVzIovDCtwCb1HeQAwBRiaG1qHrJETmB1f93z1+MA/gB6Fw2VOdZoMeNow==
X-Received: by 2002:ad4:4634:: with SMTP id x20mr2298873qvv.49.1619739723599; 
 Thu, 29 Apr 2021 16:42:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.googlemail.com with ESMTPSA id i2sm1093229qtg.0.2021.04.29.16.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:42:03 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 2/8] hw/intc: GICv3 ITS register definitions added
Date: Thu, 29 Apr 2021 19:41:55 -0400
Message-Id: <20210429234201.125565-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429234201.125565-1-shashi.mallela@linaro.org>
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf30.google.com
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
 hw/intc/arm_gicv3_its.c                | 333 +++++++++++++++++++++++++
 hw/intc/gicv3_internal.h               |  23 ++
 include/hw/intc/arm_gicv3_common.h     |   3 +
 include/hw/intc/arm_gicv3_its_common.h |  30 +++
 4 files changed, 389 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7b11330e01..a7ccb38a89 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -28,6 +28,162 @@ struct GICv3ITSClass {
     void (*parent_reset)(DeviceState *dev);
 };
 
+static bool extract_table_params(GICv3ITSState *s)
+{
+    bool result = true;
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
+            result = false;
+            break;
+        }
+
+        if (result) {
+            num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
+
+            type = FIELD_EX64(value, GITS_BASER, TYPE);
+
+            switch (type) {
+
+            case GITS_ITT_TYPE_DEVICE:
+                memset(&s->dt, 0 , sizeof(s->dt));
+                s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
+
+                if (s->dt.valid) {
+                    s->dt.page_sz = page_sz;
+                    s->dt.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+                    s->dt.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+
+                    if (!s->dt.indirect) {
+                        s->dt.max_entries = ((num_pages + 1) * page_sz) /
+                                                       s->dt.entry_sz;
+                    } else {
+                        s->dt.max_entries = ((((num_pages + 1) * page_sz) /
+                                        L1TABLE_ENTRY_SIZE) *
+                                    (page_sz / s->dt.entry_sz));
+                    }
+
+                    s->dt.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
+                                                    DEVBITS) + 1));
+
+                    if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
+                        (page_sz == GITS_ITT_PAGE_SIZE_1)) {
+                        s->dt.base_addr = FIELD_EX64(value, GITS_BASER,
+                                                      PHYADDR);
+                        s->dt.base_addr <<= R_GITS_BASER_PHYADDR_SHIFT;
+                    } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
+                        s->dt.base_addr = FIELD_EX64(value, GITS_BASER,
+                                           PHYADDRL_64K) <<
+                                           R_GITS_BASER_PHYADDRL_64K_SHIFT;
+                        s->dt.base_addr |= ((value >>
+                                             R_GITS_BASER_PHYADDR_SHIFT) &
+                                             R_GITS_BASER_PHYADDRH_64K_MASK) <<
+                                             R_GITS_BASER_PHYADDRH_64K_SHIFT;
+                    }
+                }
+                break;
+
+            case GITS_ITT_TYPE_COLLECTION:
+                memset(&s->ct, 0 , sizeof(s->ct));
+                s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
+
+                /*
+                 * GITS_TYPER.HCC is 0 for this implementation
+                 * hence writes are discarded if ct.valid is 0
+                 */
+                if (s->ct.valid) {
+                    s->ct.page_sz = page_sz;
+                    s->ct.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+                    s->ct.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+
+                    if (!s->ct.indirect) {
+                        s->ct.max_entries = ((num_pages + 1) * page_sz) /
+                                              s->ct.entry_sz;
+                    } else {
+                        s->ct.max_entries = ((((num_pages + 1) * page_sz) /
+                                              L1TABLE_ENTRY_SIZE) *
+                                              (page_sz / s->ct.entry_sz));
+                    }
+
+                    if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
+                        s->ct.max_collids = (1UL << (FIELD_EX64(s->typer,
+                                                     GITS_TYPER, CIDBITS) + 1));
+                    } else {
+                        /* 16-bit CollectionId supported when CIL == 0 */
+                        s->ct.max_collids = (1UL << 16);
+                    }
+
+                    if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
+                         (page_sz == GITS_ITT_PAGE_SIZE_1)) {
+                        s->ct.base_addr = FIELD_EX64(value, GITS_BASER,
+                                                     PHYADDR);
+                        s->ct.base_addr <<= R_GITS_BASER_PHYADDR_SHIFT;
+                    } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
+                        s->ct.base_addr = FIELD_EX64(value, GITS_BASER,
+                                                PHYADDRL_64K) <<
+                                                R_GITS_BASER_PHYADDRL_64K_SHIFT;
+                        s->ct.base_addr |= ((value >>
+                                             R_GITS_BASER_PHYADDR_SHIFT) &
+                                             R_GITS_BASER_PHYADDRH_64K_MASK) <<
+                                             R_GITS_BASER_PHYADDRH_64K_SHIFT;
+                    }
+                }
+                break;
+
+            default:
+                break;
+            }
+        }
+    }
+    return result;
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
+                                                GITS_CMDQ_ENTRY_SIZE;
+        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
+        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
+    }
+    return;
+}
+
 static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
                                uint64_t data, unsigned size, MemTxAttrs attrs)
 {
@@ -40,7 +196,70 @@ static MemTxResult its_writel(GICv3ITSState *s, hwaddr offset,
                                uint64_t value, MemTxAttrs attrs)
 {
     MemTxResult result = MEMTX_OK;
+    int index;
+    uint64_t temp = 0;
 
+    switch (offset) {
+    case GITS_CTLR:
+        s->ctlr |= (value & ~(s->ctlr));
+
+        if (s->ctlr & ITS_CTLR_ENABLED) {
+            if (!extract_table_params(s)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                    "%s: error extracting GITS_BASER parameters "
+                    TARGET_FMT_plx "\n", __func__, offset);
+            } else {
+                extract_cmdq_params(s);
+                s->creadr = 0;
+            }
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
+        s->cwriter = deposit64(s->cwriter, 0, 32, value);
+        break;
+    case GITS_CWRITER + 4:
+        s->cwriter = deposit64(s->cwriter, 32, 32, value);
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
+                temp = s->baser[index];
+                temp = deposit64(temp, 32, 32, (value & ~GITS_BASER_VAL_MASK));
+                s->baser[index] |= temp;
+            } else {
+                s->baser[index] =  deposit64(s->baser[index], 0, 32, value);
+            }
+        }
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -48,7 +267,54 @@ static MemTxResult its_readl(GICv3ITSState *s, hwaddr offset,
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
+    case GITS_PIDR2:
+        *data = gicv3_idreg(offset - GITS_PIDR2);
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
 
@@ -56,7 +322,35 @@ static MemTxResult its_writell(GICv3ITSState *s, hwaddr offset,
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
+        s->cwriter = value;
+        break;
+    default:
+        result = MEMTX_ERROR;
+        break;
+    }
     return result;
 }
 
@@ -64,7 +358,29 @@ static MemTxResult its_readll(GICv3ITSState *s, hwaddr offset,
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
 
@@ -161,6 +477,9 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
 
     if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
+        address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
+                           "gicv3-its-sysmem");
+
         /* set the ITS default features supported */
         s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
                                        GITS_TYPE_PHYSICAL);
@@ -207,6 +526,18 @@ static void gicv3_its_reset(DeviceState *dev)
     }
 }
 
+static void gicv3_its_post_load(GICv3ITSState *s)
+{
+    if (s->ctlr & ITS_CTLR_ENABLED) {
+        if (!extract_table_params(s)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: error extracting GITS_BASER parameters\n", __func__);
+        } else {
+            extract_cmdq_params(s);
+        }
+    }
+}
+
 static Property gicv3_its_props[] = {
     DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "arm-gicv3",
                      GICv3State *),
@@ -217,10 +548,12 @@ static void gicv3_its_class_init(ObjectClass *klass, void *data)
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
index e0b06930a7..bfabd5ad62 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -246,6 +246,14 @@ FIELD(GITS_BASER, INNERCACHE, 59, 3)
 FIELD(GITS_BASER, INDIRECT, 62, 1)
 FIELD(GITS_BASER, VALID, 63, 1)
 
+FIELD(GITS_CBASER, SIZE, 0, 8)
+FIELD(GITS_CBASER, SHAREABILITY, 10, 2)
+FIELD(GITS_CBASER, PHYADDR, 12, 40)
+FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
+FIELD(GITS_CBASER, INNERCACHE, 59, 3)
+FIELD(GITS_CBASER, VALID, 63, 1)
+
+FIELD(GITS_CTLR, ENABLED, 0, 1)
 FIELD(GITS_CTLR, QUIESCENT, 31, 1)
 
 FIELD(GITS_TYPER, PHYSICAL, 0, 1)
@@ -257,6 +265,13 @@ FIELD(GITS_TYPER, PTA, 19, 1)
 FIELD(GITS_TYPER, CIDBITS, 32, 4)
 FIELD(GITS_TYPER, CIL, 36, 1)
 
+#define GITS_PIDR2           0xFFE8
+
+#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
+
+#define GITS_BASER_VAL_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK | \
+                                              R_GITS_BASER_TYPE_MASK)
+
 #define GITS_BASER_PAGESIZE_4K                0
 #define GITS_BASER_PAGESIZE_16K               1
 #define GITS_BASER_PAGESIZE_64K               2
@@ -264,6 +279,14 @@ FIELD(GITS_TYPER, CIL, 36, 1)
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
index 03fc3963f3..140b3ad2be 100644
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
 
@@ -62,6 +88,10 @@ struct GICv3ITSState {
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


