Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298EE52826E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:44:51 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYDa-0006gC-4n
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY52-0005rB-IL
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY4x-00052y-CN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZw+g2VBLH273X4MZnHWkOWP9e6bQs17rrsbKAb8NNk=;
 b=IYWH8kYUiehJ9e0oXZz5wkQDBZoheHqwVUsW4a7NL2eseJnOJr4pqt40WckJg96FQr+Vli
 KmvZdGEMktIrQRfspDYv8TV9ragfTJZRQFu/b+daXx7Farrh11BYd/3gr7CsJn8C5pg4CD
 V1oGD816Sm40CIxhH8jmDL4DoK2YyyU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-33MnBbVJMo6t6pB0GIHu2A-1; Mon, 16 May 2022 06:35:53 -0400
X-MC-Unique: 33MnBbVJMo6t6pB0GIHu2A-1
Received: by mail-wm1-f72.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso10138800wma.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TZw+g2VBLH273X4MZnHWkOWP9e6bQs17rrsbKAb8NNk=;
 b=YEBbA1lQ9dNiyWipHbbd1qmwXH4jvNRZiQj3mRmIIjUxKdp+vqc6QKD8/ihMNidfj0
 RBIa+0BaS84JaeFvzKcuDCYKYNIWIJXjqX+9aeUm1rpu5H3gv+Q0D9OHDwJBv36UsP2t
 sOV9EzTlzZFLZfuGHVd3O24295A4NRaZUnM9ASsSyu5GsYHnI9+JKVanYUnzZXIfiasg
 cvmZKttLmtjeO4ewarZsozPcr3pUEkf6R29Ei6UvsNDSNeOH9QT0n6h8Q4D4+5OUgt6l
 CfadjZfmUNABl+47gyz/V3cjtI/9708fPUgS6ptNvGONaBNxB5J3nTptbKZl/Bm21ssu
 7Hgw==
X-Gm-Message-State: AOAM531NxrqK7rGIEamnII0rG6oSFze74TBRISHbzKFthMuGjatlgRYT
 9YGkQnW2JM4sUt+HSMn7xGk2YpXvJ3n7iqTzUiG3HQlpaD+Q2jb6S4OqZsq4pznKucJq9n0Az3T
 SGJbnSSCOUZf0+vN/2KZlse8wNYWM7C0YWynue7Zj9bSKKRTfVWLKUuQZiKAZ
X-Received: by 2002:a5d:4045:0:b0:20a:cac6:d33d with SMTP id
 w5-20020a5d4045000000b0020acac6d33dmr14042758wrp.657.1652697351753; 
 Mon, 16 May 2022 03:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrcRSZHrvXb8gj1tQn/BfB4S4La6S+qQ76pBRtZfpeZewo6ay82IktQZJ6e4DbXuv24yPwyw==
X-Received: by 2002:a5d:4045:0:b0:20a:cac6:d33d with SMTP id
 w5-20020a5d4045000000b0020acac6d33dmr14042718wrp.657.1652697351220; 
 Mon, 16 May 2022 03:35:51 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c4e0c00b003948f4e750fsm12878163wmq.23.2022.05.16.03.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:35:50 -0700 (PDT)
Date: Mon, 16 May 2022 06:35:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Adam Manzanares <a.manzanares@samsung.com>
Subject: [PULL 04/91] hw/cxl/component: Introduce CXL components (8.1.x, 8.2.5)
Message-ID: <20220516095448.507876-5-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ben Widawsky <ben.widawsky@intel.com>

A CXL 2.0 component is any entity in the CXL topology. All components
have a analogous function in PCIe. Except for the CXL host bridge, all
have a PCIe config space that is accessible via the common PCIe
mechanisms. CXL components are enumerated via DVSEC fields in the
extended PCIe header space. CXL components will minimally implement some
subset of CXL.mem and CXL.cache registers defined in 8.2.5 of the CXL
2.0 specification. Two headers and a utility library are introduced to
support the minimum functionality needed to enumerate components.

The cxl_pci header manages bits associated with PCI, specifically the
DVSEC and related fields. The cxl_component.h variant has data
structures and APIs that are useful for drivers implementing any of the
CXL 2.0 components. The library takes care of making use of the DVSEC
bits and the CXL.[mem|cache] registers. Per spec, the registers are
little endian.

None of the mechanisms required to enumerate a CXL capable hostbridge
are introduced at this point.

Note that the CXL.mem and CXL.cache registers used are always 4B wide.
It's possible in the future that this constraint will not hold.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Adam Manzanares <a.manzanares@samsung.com>
Message-Id: <20220429144110.25167-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h           |  16 ++
 include/hw/cxl/cxl_component.h | 213 ++++++++++++++++++++++
 include/hw/cxl/cxl_pci.h       | 146 +++++++++++++++
 hw/cxl/cxl-component-utils.c   | 313 +++++++++++++++++++++++++++++++++
 hw/Kconfig                     |   1 +
 hw/cxl/Kconfig                 |   3 +
 hw/cxl/meson.build             |   4 +
 hw/meson.build                 |   1 +
 8 files changed, 697 insertions(+)
 create mode 100644 include/hw/cxl/cxl.h
 create mode 100644 include/hw/cxl/cxl_component.h
 create mode 100644 include/hw/cxl/cxl_pci.h
 create mode 100644 hw/cxl/cxl-component-utils.c
 create mode 100644 hw/cxl/Kconfig
 create mode 100644 hw/cxl/meson.build

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
new file mode 100644
index 0000000000..8c738c7a2b
--- /dev/null
+++ b/include/hw/cxl/cxl.h
@@ -0,0 +1,16 @@
+/*
+ * QEMU CXL Support
+ *
+ * Copyright (c) 2020 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_H
+#define CXL_H
+
+#include "cxl_pci.h"
+#include "cxl_component.h"
+
+#endif
diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
new file mode 100644
index 0000000000..7d8f395cbe
--- /dev/null
+++ b/include/hw/cxl/cxl_component.h
@@ -0,0 +1,213 @@
+/*
+ * QEMU CXL Component
+ *
+ * Copyright (c) 2020 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_COMPONENT_H
+#define CXL_COMPONENT_H
+
+/* CXL 2.0 - 8.2.4 */
+#define CXL2_COMPONENT_IO_REGION_SIZE 0x1000
+#define CXL2_COMPONENT_CM_REGION_SIZE 0x1000
+#define CXL2_COMPONENT_BLOCK_SIZE 0x10000
+
+#include "qemu/compiler.h"
+#include "qemu/range.h"
+#include "qemu/typedefs.h"
+#include "hw/register.h"
+
+enum reg_type {
+    CXL2_DEVICE,
+    CXL2_TYPE3_DEVICE,
+    CXL2_LOGICAL_DEVICE,
+    CXL2_ROOT_PORT,
+    CXL2_UPSTREAM_PORT,
+    CXL2_DOWNSTREAM_PORT
+};
+
+/*
+ * Capability registers are defined at the top of the CXL.cache/mem region and
+ * are packed. For our purposes we will always define the caps in the same
+ * order.
+ * CXL 2.0 - 8.2.5 Table 142 for details.
+ */
+
+/* CXL 2.0 - 8.2.5.1 */
+REG32(CXL_CAPABILITY_HEADER, 0)
+    FIELD(CXL_CAPABILITY_HEADER, ID, 0, 16)
+    FIELD(CXL_CAPABILITY_HEADER, VERSION, 16, 4)
+    FIELD(CXL_CAPABILITY_HEADER, CACHE_MEM_VERSION, 20, 4)
+    FIELD(CXL_CAPABILITY_HEADER, ARRAY_SIZE, 24, 8)
+
+#define CXLx_CAPABILITY_HEADER(type, offset)                  \
+    REG32(CXL_##type##_CAPABILITY_HEADER, offset)             \
+        FIELD(CXL_##type##_CAPABILITY_HEADER, ID, 0, 16)      \
+        FIELD(CXL_##type##_CAPABILITY_HEADER, VERSION, 16, 4) \
+        FIELD(CXL_##type##_CAPABILITY_HEADER, PTR, 20, 12)
+CXLx_CAPABILITY_HEADER(RAS, 0x4)
+CXLx_CAPABILITY_HEADER(LINK, 0x8)
+CXLx_CAPABILITY_HEADER(HDM, 0xc)
+CXLx_CAPABILITY_HEADER(EXTSEC, 0x10)
+CXLx_CAPABILITY_HEADER(SNOOP, 0x14)
+
+/*
+ * Capability structures contain the actual registers that the CXL component
+ * implements. Some of these are specific to certain types of components, but
+ * this implementation leaves enough space regardless.
+ */
+/* 8.2.5.9 - CXL RAS Capability Structure */
+
+/* Give ample space for caps before this */
+#define CXL_RAS_REGISTERS_OFFSET 0x80
+#define CXL_RAS_REGISTERS_SIZE   0x58
+REG32(CXL_RAS_UNC_ERR_STATUS, CXL_RAS_REGISTERS_OFFSET)
+REG32(CXL_RAS_UNC_ERR_MASK, CXL_RAS_REGISTERS_OFFSET + 0x4)
+REG32(CXL_RAS_UNC_ERR_SEVERITY, CXL_RAS_REGISTERS_OFFSET + 0x8)
+REG32(CXL_RAS_COR_ERR_STATUS, CXL_RAS_REGISTERS_OFFSET + 0xc)
+REG32(CXL_RAS_COR_ERR_MASK, CXL_RAS_REGISTERS_OFFSET + 0x10)
+REG32(CXL_RAS_ERR_CAP_CTRL, CXL_RAS_REGISTERS_OFFSET + 0x14)
+/* Offset 0x18 - 0x58 reserved for RAS logs */
+
+/* 8.2.5.10 - CXL Security Capability Structure */
+#define CXL_SEC_REGISTERS_OFFSET \
+    (CXL_RAS_REGISTERS_OFFSET + CXL_RAS_REGISTERS_SIZE)
+#define CXL_SEC_REGISTERS_SIZE   0 /* We don't implement 1.1 downstream ports */
+
+/* 8.2.5.11 - CXL Link Capability Structure */
+#define CXL_LINK_REGISTERS_OFFSET \
+    (CXL_SEC_REGISTERS_OFFSET + CXL_SEC_REGISTERS_SIZE)
+#define CXL_LINK_REGISTERS_SIZE   0x38
+
+/* 8.2.5.12 - CXL HDM Decoder Capability Structure */
+#define HDM_DECODE_MAX 10 /* 8.2.5.12.1 */
+#define CXL_HDM_REGISTERS_OFFSET \
+    (CXL_LINK_REGISTERS_OFFSET + CXL_LINK_REGISTERS_SIZE)
+#define CXL_HDM_REGISTERS_SIZE (0x10 + 0x20 * HDM_DECODE_MAX)
+#define HDM_DECODER_INIT(n)                                                    \
+  REG32(CXL_HDM_DECODER##n##_BASE_LO,                                          \
+        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x10)                          \
+            FIELD(CXL_HDM_DECODER##n##_BASE_LO, L, 28, 4)                      \
+  REG32(CXL_HDM_DECODER##n##_BASE_HI,                                          \
+        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x14)                          \
+  REG32(CXL_HDM_DECODER##n##_SIZE_LO,                                          \
+        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x18)                          \
+  REG32(CXL_HDM_DECODER##n##_SIZE_HI,                                          \
+        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x1C)                          \
+  REG32(CXL_HDM_DECODER##n##_CTRL,                                             \
+        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x20)                          \
+            FIELD(CXL_HDM_DECODER##n##_CTRL, IG, 0, 4)                         \
+            FIELD(CXL_HDM_DECODER##n##_CTRL, IW, 4, 4)                         \
+            FIELD(CXL_HDM_DECODER##n##_CTRL, LOCK_ON_COMMIT, 8, 1)             \
+            FIELD(CXL_HDM_DECODER##n##_CTRL, COMMIT, 9, 1)                     \
+            FIELD(CXL_HDM_DECODER##n##_CTRL, COMMITTED, 10, 1)                 \
+            FIELD(CXL_HDM_DECODER##n##_CTRL, ERR, 11, 1)                       \
+            FIELD(CXL_HDM_DECODER##n##_CTRL, TYPE, 12, 1)                      \
+  REG32(CXL_HDM_DECODER##n##_TARGET_LIST_LO,                                   \
+        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x24)                          \
+  REG32(CXL_HDM_DECODER##n##_TARGET_LIST_HI,                                   \
+        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x28)
+
+REG32(CXL_HDM_DECODER_CAPABILITY, CXL_HDM_REGISTERS_OFFSET)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, DECODER_COUNT, 0, 4)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 4, 4)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, INTERLEAVE_256B, 8, 1)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, INTERLEAVE_4K, 9, 1)
+    FIELD(CXL_HDM_DECODER_CAPABILITY, POISON_ON_ERR_CAP, 10, 1)
+REG32(CXL_HDM_DECODER_GLOBAL_CONTROL, CXL_HDM_REGISTERS_OFFSET + 4)
+    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, POISON_ON_ERR_EN, 0, 1)
+    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, HDM_DECODER_ENABLE, 1, 1)
+
+HDM_DECODER_INIT(0);
+
+/* 8.2.5.13 - CXL Extended Security Capability Structure (Root complex only) */
+#define EXTSEC_ENTRY_MAX        256
+#define CXL_EXTSEC_REGISTERS_OFFSET \
+    (CXL_HDM_REGISTERS_OFFSET + CXL_HDM_REGISTERS_SIZE)
+#define CXL_EXTSEC_REGISTERS_SIZE   (8 * EXTSEC_ENTRY_MAX + 4)
+
+/* 8.2.5.14 - CXL IDE Capability Structure */
+#define CXL_IDE_REGISTERS_OFFSET \
+    (CXL_EXTSEC_REGISTERS_OFFSET + CXL_EXTSEC_REGISTERS_SIZE)
+#define CXL_IDE_REGISTERS_SIZE   0x20
+
+/* 8.2.5.15 - CXL Snoop Filter Capability Structure */
+#define CXL_SNOOP_REGISTERS_OFFSET \
+    (CXL_IDE_REGISTERS_OFFSET + CXL_IDE_REGISTERS_SIZE)
+#define CXL_SNOOP_REGISTERS_SIZE   0x8
+
+QEMU_BUILD_BUG_MSG((CXL_SNOOP_REGISTERS_OFFSET + CXL_SNOOP_REGISTERS_SIZE) >= 0x1000,
+                   "No space for registers");
+
+typedef struct component_registers {
+    /*
+     * Main memory region to be registered with QEMU core.
+     */
+    MemoryRegion component_registers;
+
+    /*
+     * 8.2.4 Table 141:
+     *   0x0000 - 0x0fff CXL.io registers
+     *   0x1000 - 0x1fff CXL.cache and CXL.mem
+     *   0x2000 - 0xdfff Implementation specific
+     *   0xe000 - 0xe3ff CXL ARB/MUX registers
+     *   0xe400 - 0xffff RSVD
+     */
+    uint32_t io_registers[CXL2_COMPONENT_IO_REGION_SIZE >> 2];
+    MemoryRegion io;
+
+    uint32_t cache_mem_registers[CXL2_COMPONENT_CM_REGION_SIZE >> 2];
+    uint32_t cache_mem_regs_write_mask[CXL2_COMPONENT_CM_REGION_SIZE >> 2];
+    MemoryRegion cache_mem;
+
+    MemoryRegion impl_specific;
+    MemoryRegion arb_mux;
+    MemoryRegion rsvd;
+
+    /* special_ops is used for any component that needs any specific handling */
+    MemoryRegionOps *special_ops;
+} ComponentRegisters;
+
+/*
+ * A CXL component represents all entities in a CXL hierarchy. This includes,
+ * host bridges, root ports, upstream/downstream switch ports, and devices
+ */
+typedef struct cxl_component {
+    ComponentRegisters crb;
+    union {
+        struct {
+            Range dvsecs[CXL20_MAX_DVSEC];
+            uint16_t dvsec_offset;
+            struct PCIDevice *pdev;
+        };
+    };
+} CXLComponentState;
+
+void cxl_component_register_block_init(Object *obj,
+                                       CXLComponentState *cxl_cstate,
+                                       const char *type);
+void cxl_component_register_init_common(uint32_t *reg_state,
+                                        uint32_t *write_msk,
+                                        enum reg_type type);
+
+void cxl_component_create_dvsec(CXLComponentState *cxl_cstate,
+                                enum reg_type cxl_dev_type, uint16_t length,
+                                uint16_t type, uint8_t rev, uint8_t *body);
+
+static inline int cxl_decoder_count_enc(int count)
+{
+    switch (count) {
+    case 1: return 0;
+    case 2: return 1;
+    case 4: return 2;
+    case 6: return 3;
+    case 8: return 4;
+    case 10: return 5;
+    }
+    return 0;
+}
+
+#endif
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
new file mode 100644
index 0000000000..3f7e44daac
--- /dev/null
+++ b/include/hw/cxl/cxl_pci.h
@@ -0,0 +1,146 @@
+/*
+ * QEMU CXL PCI interfaces
+ *
+ * Copyright (c) 2020 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_PCI_H
+#define CXL_PCI_H
+
+#include "qemu/compiler.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie.h"
+
+#define CXL_VENDOR_ID 0x1e98
+
+#define PCIE_DVSEC_HEADER1_OFFSET 0x4 /* Offset from start of extend cap */
+#define PCIE_DVSEC_ID_OFFSET 0x8
+
+#define PCIE_CXL_DEVICE_DVSEC_LENGTH 0x38
+#define PCIE_CXL1_DEVICE_DVSEC_REVID 0
+#define PCIE_CXL2_DEVICE_DVSEC_REVID 1
+
+#define EXTENSIONS_PORT_DVSEC_LENGTH 0x28
+#define EXTENSIONS_PORT_DVSEC_REVID 0
+
+#define GPF_PORT_DVSEC_LENGTH 0x10
+#define GPF_PORT_DVSEC_REVID  0
+
+#define GPF_DEVICE_DVSEC_LENGTH 0x10
+#define GPF_DEVICE_DVSEC_REVID 0
+
+#define PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0 0x14
+#define PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0  1
+
+#define REG_LOC_DVSEC_LENGTH 0x24
+#define REG_LOC_DVSEC_REVID  0
+
+enum {
+    PCIE_CXL_DEVICE_DVSEC      = 0,
+    NON_CXL_FUNCTION_MAP_DVSEC = 2,
+    EXTENSIONS_PORT_DVSEC      = 3,
+    GPF_PORT_DVSEC             = 4,
+    GPF_DEVICE_DVSEC           = 5,
+    PCIE_FLEXBUS_PORT_DVSEC    = 7,
+    REG_LOC_DVSEC              = 8,
+    MLD_DVSEC                  = 9,
+    CXL20_MAX_DVSEC
+};
+
+typedef struct DVSECHeader {
+    uint32_t cap_hdr;
+    uint32_t dv_hdr1;
+    uint16_t dv_hdr2;
+} QEMU_PACKED DVSECHeader;
+QEMU_BUILD_BUG_ON(sizeof(DVSECHeader) != 10);
+
+/*
+ * CXL 2.0 devices must implement certain DVSEC IDs, and can [optionally]
+ * implement others.
+ *
+ * CXL 2.0 Device: 0, [2], 5, 8
+ * CXL 2.0 RP: 3, 4, 7, 8
+ * CXL 2.0 Upstream Port: [2], 7, 8
+ * CXL 2.0 Downstream Port: 3, 4, 7, 8
+ */
+
+/* CXL 2.0 - 8.1.5 (ID 0003) */
+typedef struct CXLDVSECPortExtensions {
+    DVSECHeader hdr;
+    uint16_t status;
+    uint16_t control;
+    uint8_t alt_bus_base;
+    uint8_t alt_bus_limit;
+    uint16_t alt_memory_base;
+    uint16_t alt_memory_limit;
+    uint16_t alt_prefetch_base;
+    uint16_t alt_prefetch_limit;
+    uint32_t alt_prefetch_base_high;
+    uint32_t alt_prefetch_limit_high;
+    uint32_t rcrb_base;
+    uint32_t rcrb_base_high;
+} CXLDVSECPortExtensions;
+QEMU_BUILD_BUG_ON(sizeof(CXLDVSECPortExtensions) != 0x28);
+
+#define PORT_CONTROL_OFFSET          0xc
+#define PORT_CONTROL_UNMASK_SBR      1
+#define PORT_CONTROL_ALT_MEMID_EN    4
+
+/* CXL 2.0 - 8.1.6 GPF DVSEC (ID 0004) */
+typedef struct CXLDVSECPortGPF {
+    DVSECHeader hdr;
+    uint16_t rsvd;
+    uint16_t phase1_ctrl;
+    uint16_t phase2_ctrl;
+} CXLDVSECPortGPF;
+QEMU_BUILD_BUG_ON(sizeof(CXLDVSECPortGPF) != 0x10);
+
+/* CXL 2.0 - 8.1.7 GPF DVSEC for CXL Device */
+typedef struct CXLDVSECDeviceGPF {
+    DVSECHeader hdr;
+    uint16_t phase2_duration;
+    uint32_t phase2_power;
+} CXLDVSECDeviceGPF;
+QEMU_BUILD_BUG_ON(sizeof(CXLDVSECDeviceGPF) != 0x10);
+
+/* CXL 2.0 - 8.1.8/8.2.1.3 Flex Bus DVSEC (ID 0007) */
+typedef struct CXLDVSECPortFlexBus {
+    DVSECHeader hdr;
+    uint16_t cap;
+    uint16_t ctrl;
+    uint16_t status;
+    uint32_t rcvd_mod_ts_data_phase1;
+} CXLDVSECPortFlexBus;
+QEMU_BUILD_BUG_ON(sizeof(CXLDVSECPortFlexBus) != 0x14);
+
+/* CXL 2.0 - 8.1.9 Register Locator DVSEC (ID 0008) */
+typedef struct CXLDVSECRegisterLocator {
+    DVSECHeader hdr;
+    uint16_t rsvd;
+    uint32_t reg0_base_lo;
+    uint32_t reg0_base_hi;
+    uint32_t reg1_base_lo;
+    uint32_t reg1_base_hi;
+    uint32_t reg2_base_lo;
+    uint32_t reg2_base_hi;
+} CXLDVSECRegisterLocator;
+QEMU_BUILD_BUG_ON(sizeof(CXLDVSECRegisterLocator) != 0x24);
+
+/* BAR Equivalence Indicator */
+#define BEI_BAR_10H 0
+#define BEI_BAR_14H 1
+#define BEI_BAR_18H 2
+#define BEI_BAR_1cH 3
+#define BEI_BAR_20H 4
+#define BEI_BAR_24H 5
+
+/* Register Block Identifier */
+#define RBI_EMPTY          0
+#define RBI_COMPONENT_REG  (1 << 8)
+#define RBI_BAR_VIRT_ACL   (2 << 8)
+#define RBI_CXL_DEVICE_REG (3 << 8)
+
+#endif
diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
new file mode 100644
index 0000000000..9457a1b029
--- /dev/null
+++ b/hw/cxl/cxl-component-utils.c
@@ -0,0 +1,313 @@
+/*
+ * CXL Utility library for components
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/pci/pci.h"
+#include "hw/cxl/cxl.h"
+
+static uint64_t cxl_cache_mem_read_reg(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    CXLComponentState *cxl_cstate = opaque;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+
+    if (size == 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "CXL 8 byte cache mem registers not implemented\n");
+        return 0;
+    }
+
+    if (cregs->special_ops && cregs->special_ops->read) {
+        return cregs->special_ops->read(cxl_cstate, offset, size);
+    } else {
+        return cregs->cache_mem_registers[offset / sizeof(*cregs->cache_mem_registers)];
+    }
+}
+
+static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_t value,
+                                    unsigned size)
+{
+    CXLComponentState *cxl_cstate = opaque;
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    uint32_t mask;
+
+    if (size == 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "CXL 8 byte cache mem registers not implemented\n");
+        return;
+    }
+    mask = cregs->cache_mem_regs_write_mask[offset / sizeof(*cregs->cache_mem_regs_write_mask)];
+    value &= mask;
+    /* RO bits should remain constant. Done by reading existing value */
+    value |= ~mask & cregs->cache_mem_registers[offset / sizeof(*cregs->cache_mem_registers)];
+    if (cregs->special_ops && cregs->special_ops->write) {
+        cregs->special_ops->write(cxl_cstate, offset, value, size);
+    } else {
+        cregs->cache_mem_registers[offset / sizeof(*cregs->cache_mem_registers)] = value;
+    }
+}
+
+/*
+ * 8.2.3
+ *   The access restrictions specified in Section 8.2.2 also apply to CXL 2.0
+ *   Component Registers.
+ *
+ * 8.2.2
+ *   • A 32 bit register shall be accessed as a 4 Bytes quantity. Partial
+ *   reads are not permitted.
+ *   • A 64 bit register shall be accessed as a 8 Bytes quantity. Partial
+ *   reads are not permitted.
+ *
+ * As of the spec defined today, only 4 byte registers exist.
+ */
+static const MemoryRegionOps cache_mem_ops = {
+    .read = cxl_cache_mem_read_reg,
+    .write = cxl_cache_mem_write_reg,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+};
+
+void cxl_component_register_block_init(Object *obj,
+                                       CXLComponentState *cxl_cstate,
+                                       const char *type)
+{
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+
+    memory_region_init(&cregs->component_registers, obj, type,
+                       CXL2_COMPONENT_BLOCK_SIZE);
+
+    /* io registers controls link which we don't care about in QEMU */
+    memory_region_init_io(&cregs->io, obj, NULL, cregs, ".io",
+                          CXL2_COMPONENT_IO_REGION_SIZE);
+    memory_region_init_io(&cregs->cache_mem, obj, &cache_mem_ops, cregs,
+                          ".cache_mem", CXL2_COMPONENT_CM_REGION_SIZE);
+
+    memory_region_add_subregion(&cregs->component_registers, 0, &cregs->io);
+    memory_region_add_subregion(&cregs->component_registers,
+                                CXL2_COMPONENT_IO_REGION_SIZE,
+                                &cregs->cache_mem);
+}
+
+static void ras_init_common(uint32_t *reg_state, uint32_t *write_msk)
+{
+    /*
+     * Error status is RW1C but given bits are not yet set, it can
+     * be handled as RO.
+     */
+    reg_state[R_CXL_RAS_UNC_ERR_STATUS] = 0;
+    /* Bits 12-13 and 17-31 reserved in CXL 2.0 */
+    reg_state[R_CXL_RAS_UNC_ERR_MASK] = 0x1cfff;
+    write_msk[R_CXL_RAS_UNC_ERR_MASK] = 0x1cfff;
+    reg_state[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1cfff;
+    write_msk[R_CXL_RAS_UNC_ERR_SEVERITY] = 0x1cfff;
+    reg_state[R_CXL_RAS_COR_ERR_STATUS] = 0;
+    reg_state[R_CXL_RAS_COR_ERR_MASK] = 0x7f;
+    write_msk[R_CXL_RAS_COR_ERR_MASK] = 0x7f;
+    /* CXL switches and devices must set */
+    reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0x00;
+}
+
+static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
+{
+    int decoder_count = 1;
+    int i;
+
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, DECODER_COUNT,
+                     cxl_decoder_count_enc(decoder_count));
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, INTERLEAVE_256B, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, INTERLEAVE_4K, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, POISON_ON_ERR_CAP, 0);
+    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_GLOBAL_CONTROL,
+                     HDM_DECODER_ENABLE, 0);
+    write_msk[R_CXL_HDM_DECODER_GLOBAL_CONTROL] = 0x3;
+    for (i = 0; i < decoder_count; i++) {
+        write_msk[R_CXL_HDM_DECODER0_BASE_LO + i * 0x20] = 0xf0000000;
+        write_msk[R_CXL_HDM_DECODER0_BASE_HI + i * 0x20] = 0xffffffff;
+        write_msk[R_CXL_HDM_DECODER0_SIZE_LO + i * 0x20] = 0xf0000000;
+        write_msk[R_CXL_HDM_DECODER0_SIZE_HI + i * 0x20] = 0xffffffff;
+        write_msk[R_CXL_HDM_DECODER0_CTRL + i * 0x20] = 0x13ff;
+    }
+}
+
+void cxl_component_register_init_common(uint32_t *reg_state, uint32_t *write_msk,
+                                        enum reg_type type)
+{
+    int caps = 0;
+
+    /*
+     * In CXL 2.0 the capabilities required for each CXL component are such that,
+     * with the ordering chosen here, a single number can be used to define
+     * which capabilities should be provided.
+     */
+    switch (type) {
+    case CXL2_DOWNSTREAM_PORT:
+    case CXL2_DEVICE:
+        /* RAS, Link */
+        caps = 2;
+        break;
+    case CXL2_UPSTREAM_PORT:
+    case CXL2_TYPE3_DEVICE:
+    case CXL2_LOGICAL_DEVICE:
+        /* + HDM */
+        caps = 3;
+        break;
+    case CXL2_ROOT_PORT:
+        /* + Extended Security, + Snoop */
+        caps = 5;
+        break;
+    default:
+        abort();
+    }
+
+    memset(reg_state, 0, CXL2_COMPONENT_CM_REGION_SIZE);
+
+    /* CXL Capability Header Register */
+    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, ID, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, VERSION, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, CACHE_MEM_VERSION, 1);
+    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, ARRAY_SIZE, caps);
+
+#define init_cap_reg(reg, id, version)                                        \
+    QEMU_BUILD_BUG_ON(CXL_##reg##_REGISTERS_OFFSET == 0);                     \
+    do {                                                                      \
+        int which = R_CXL_##reg##_CAPABILITY_HEADER;                          \
+        reg_state[which] = FIELD_DP32(reg_state[which],                       \
+                                      CXL_##reg##_CAPABILITY_HEADER, ID, id); \
+        reg_state[which] =                                                    \
+            FIELD_DP32(reg_state[which], CXL_##reg##_CAPABILITY_HEADER,       \
+                       VERSION, version);                                     \
+        reg_state[which] =                                                    \
+            FIELD_DP32(reg_state[which], CXL_##reg##_CAPABILITY_HEADER, PTR,  \
+                       CXL_##reg##_REGISTERS_OFFSET);                         \
+    } while (0)
+
+    init_cap_reg(RAS, 2, 2);
+    ras_init_common(reg_state, write_msk);
+
+    init_cap_reg(LINK, 4, 2);
+
+    if (caps < 3) {
+        return;
+    }
+
+    init_cap_reg(HDM, 5, 1);
+    hdm_init_common(reg_state, write_msk);
+
+    if (caps < 5) {
+        return;
+    }
+
+    init_cap_reg(EXTSEC, 6, 1);
+    init_cap_reg(SNOOP, 8, 1);
+
+#undef init_cap_reg
+}
+
+/*
+ * Helper to creates a DVSEC header for a CXL entity. The caller is responsible
+ * for tracking the valid offset.
+ *
+ * This function will build the DVSEC header on behalf of the caller and then
+ * copy in the remaining data for the vendor specific bits.
+ * It will also set up appropriate write masks.
+ */
+void cxl_component_create_dvsec(CXLComponentState *cxl,
+                                enum reg_type cxl_dev_type, uint16_t length,
+                                uint16_t type, uint8_t rev, uint8_t *body)
+{
+    PCIDevice *pdev = cxl->pdev;
+    uint16_t offset = cxl->dvsec_offset;
+    uint8_t *wmask = pdev->wmask;
+
+    assert(offset >= PCI_CFG_SPACE_SIZE &&
+           ((offset + length) < PCI_CFG_SPACE_EXP_SIZE));
+    assert((length & 0xf000) == 0);
+    assert((rev & ~0xf) == 0);
+
+    /* Create the DVSEC in the MCFG space */
+    pcie_add_capability(pdev, PCI_EXT_CAP_ID_DVSEC, 1, offset, length);
+    pci_set_long(pdev->config + offset + PCIE_DVSEC_HEADER1_OFFSET,
+                 (length << 20) | (rev << 16) | CXL_VENDOR_ID);
+    pci_set_word(pdev->config + offset + PCIE_DVSEC_ID_OFFSET, type);
+    memcpy(pdev->config + offset + sizeof(DVSECHeader),
+           body + sizeof(DVSECHeader),
+           length - sizeof(DVSECHeader));
+
+    /* Configure write masks */
+    switch (type) {
+    case PCIE_CXL_DEVICE_DVSEC:
+        break;
+    case NON_CXL_FUNCTION_MAP_DVSEC:
+        break; /* Not yet implemented */
+    case EXTENSIONS_PORT_DVSEC:
+        wmask[offset + offsetof(CXLDVSECPortExtensions, control)] = 0x0F;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, control) + 1] = 0x40;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_bus_base)] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_bus_limit)] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_memory_base)] = 0xF0;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_memory_base) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_memory_limit)] = 0xF0;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_memory_limit) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_base)] = 0xF0;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_base) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_limit)] = 0xF0;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_limit) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_base_high)] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_base_high) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_base_high) + 2] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_base_high) + 3] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_limit_high)] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_limit_high) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_limit_high) + 2] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECPortExtensions, alt_prefetch_limit_high) + 3] = 0xFF;
+        break;
+    case GPF_PORT_DVSEC:
+        wmask[offset + offsetof(CXLDVSECPortGPF, phase1_ctrl)] = 0x0F;
+        wmask[offset + offsetof(CXLDVSECPortGPF, phase1_ctrl) + 1] = 0x0F;
+        wmask[offset + offsetof(CXLDVSECPortGPF, phase2_ctrl)] = 0x0F;
+        wmask[offset + offsetof(CXLDVSECPortGPF, phase2_ctrl) + 1] = 0x0F;
+        break;
+    case GPF_DEVICE_DVSEC:
+        wmask[offset + offsetof(CXLDVSECDeviceGPF, phase2_duration)] = 0x0F;
+        wmask[offset + offsetof(CXLDVSECDeviceGPF, phase2_duration) + 1] = 0x0F;
+        wmask[offset + offsetof(CXLDVSECDeviceGPF, phase2_power)] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDeviceGPF, phase2_power) + 1] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDeviceGPF, phase2_power) + 2] = 0xFF;
+        wmask[offset + offsetof(CXLDVSECDeviceGPF, phase2_power) + 3] = 0xFF;
+        break;
+    case PCIE_FLEXBUS_PORT_DVSEC:
+        switch (cxl_dev_type) {
+        case CXL2_ROOT_PORT:
+            /* No MLD */
+            wmask[offset + offsetof(CXLDVSECPortFlexBus, ctrl)] = 0xbd;
+            break;
+        case CXL2_DOWNSTREAM_PORT:
+            wmask[offset + offsetof(CXLDVSECPortFlexBus, ctrl)] = 0xfd;
+            break;
+        default: /* Registers are RO for other component types */
+            break;
+        }
+        /* There are rw1cs bits in the status register but never set currently */
+        break;
+    }
+
+    /* Update state for future DVSEC additions */
+    range_init_nofail(&cxl->dvsecs[type], cxl->dvsec_offset, length);
+    cxl->dvsec_offset += length;
+}
diff --git a/hw/Kconfig b/hw/Kconfig
index ad20cce0a9..50e0952889 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -6,6 +6,7 @@ source audio/Kconfig
 source block/Kconfig
 source char/Kconfig
 source core/Kconfig
+source cxl/Kconfig
 source display/Kconfig
 source dma/Kconfig
 source gpio/Kconfig
diff --git a/hw/cxl/Kconfig b/hw/cxl/Kconfig
new file mode 100644
index 0000000000..8e67519b16
--- /dev/null
+++ b/hw/cxl/Kconfig
@@ -0,0 +1,3 @@
+config CXL
+    bool
+    default y if PCI_EXPRESS
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
new file mode 100644
index 0000000000..3231b5de1e
--- /dev/null
+++ b/hw/cxl/meson.build
@@ -0,0 +1,4 @@
+softmmu_ss.add(when: 'CONFIG_CXL',
+               if_true: files(
+                   'cxl-component-utils.c',
+               ))
diff --git a/hw/meson.build b/hw/meson.build
index b3366c888e..9992c5101e 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -6,6 +6,7 @@ subdir('block')
 subdir('char')
 subdir('core')
 subdir('cpu')
+subdir('cxl')
 subdir('display')
 subdir('dma')
 subdir('gpio')
-- 
MST


