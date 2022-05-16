Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA852826D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:44:23 +0200 (CEST)
Received: from localhost ([::1]:49730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYD8-0006KC-Qj
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY56-0005se-Cb
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY54-00055l-D5
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOCVgiXEcu6OglfDOU3kAOpp8Pbt/gv9dnvBwmvk6A4=;
 b=BXqEdN4e8c5qPJXccpDahzgG+X6r4heaA9vLtgbpwXrd84khf5HQ8jMGq1oR/ab6szL6CO
 QxIW2Y4SCnLdysOfzVXVk1UZttTDT+SAxDDO31RbLCRENr/5L+99hbgCLfQUO2oLEnLqEp
 LGcZcO4PixPbDZWIFr4NWjyL+mBCjng=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-Hhsi98bFNt20bZHPMOYopQ-1; Mon, 16 May 2022 06:36:00 -0400
X-MC-Unique: Hhsi98bFNt20bZHPMOYopQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso5440948wmm.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MOCVgiXEcu6OglfDOU3kAOpp8Pbt/gv9dnvBwmvk6A4=;
 b=l8oMOAh4b3kn3vNap6PvEGoGBHdBzX5EBQY2ZgM16+WxiJDzLrlV05k4glROYmjqw9
 itC3HUQCiGtyTE8965MngTnsC/7//f5KtZYC4IQfQQoBWXi3qdL4vatHn/bVcMt/nhiG
 V2Hmm+rqb+6DDyqMdybvILU2mlgLx/hDAkiSbUlKNBdLPK5zDJ1SWv1KVivmrCmAXvOH
 QOPdsTmZz/PsZLiRbnbGS2LIu3fARtQEpBqt0STZC8PkVgq95CjeibPfhqrMZsKex2ST
 Ed+NyjWXfG6LN9413wJaYUNo9qoksOc5SeFYuXqNcxf068BBafUN9elGjf86O43Kc61L
 58kw==
X-Gm-Message-State: AOAM53105XlK2YKMwklVdLiGIYQlaJ6Le0ZGG/mcOVTxO+xCSAaL9nwe
 GzsMGmGw5VDGRoyLnN+XpmhcSzDW5wnA6/znZsXOK4FtrUDazZS3PsC/b9a5nCmUbw7Wr/Smnnp
 jL6LcDDLKJL/6sGP66Bpc1ZtQoquYkD8bQi2Xgj4ryqA2HZwdt4SZaxr7L7cT
X-Received: by 2002:a05:6000:1f8c:b0:20c:b1cf:2a1c with SMTP id
 bw12-20020a0560001f8c00b0020cb1cf2a1cmr13747565wrb.368.1652697359373; 
 Mon, 16 May 2022 03:35:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsc5Wffpixwf46g3vJb8uc1BTOtVFLG6+LVWuvs6MSv6dqkCPccle6MPTCllqIFUxoM6t+lw==
X-Received: by 2002:a05:6000:1f8c:b0:20c:b1cf:2a1c with SMTP id
 bw12-20020a0560001f8c00b0020cb1cf2a1cmr13747536wrb.368.1652697359077; 
 Mon, 16 May 2022 03:35:59 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 h12-20020adf9ccc000000b0020adc114136sm11287475wre.0.2022.05.16.03.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:35:58 -0700 (PDT)
Date: Mon, 16 May 2022 06:35:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Adam Manzanares <a.manzanares@samsung.com>
Subject: [PULL 06/91] hw/cxl/device: Introduce a CXL device (8.2.8)
Message-ID: <20220516095448.507876-7-mst@redhat.com>
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

A CXL device is a type of CXL component. Conceptually, a CXL device
would be a leaf node in a CXL topology. From an emulation perspective,
CXL devices are the most complex and so the actual implementation is
reserved for discrete commits.

This new device type is specifically catered towards the eventual
implementation of a Type3 CXL.mem device, 8.2.8.5 in the CXL 2.0
specification.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Adam Manzanares <a.manzanares@samsung.com>
Message-Id: <20220429144110.25167-5-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl.h        |   1 +
 include/hw/cxl/cxl_device.h | 166 ++++++++++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)
 create mode 100644 include/hw/cxl/cxl_device.h

diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 8c738c7a2b..b9d1ac3fad 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -12,5 +12,6 @@
 
 #include "cxl_pci.h"
 #include "cxl_component.h"
+#include "cxl_device.h"
 
 #endif
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
new file mode 100644
index 0000000000..9513aaac77
--- /dev/null
+++ b/include/hw/cxl/cxl_device.h
@@ -0,0 +1,166 @@
+/*
+ * QEMU CXL Devices
+ *
+ * Copyright (c) 2020 Intel
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef CXL_DEVICE_H
+#define CXL_DEVICE_H
+
+#include "hw/register.h"
+
+/*
+ * The following is how a CXL device's Memory Device registers are laid out.
+ * The only requirement from the spec is that the capabilities array and the
+ * capability headers start at offset 0 and are contiguously packed. The headers
+ * themselves provide offsets to the register fields. For this emulation, the
+ * actual registers  * will start at offset 0x80 (m == 0x80). No secondary
+ * mailbox is implemented which means that the offset of the start of the
+ * mailbox payload (n) is given by
+ * n = m + sizeof(mailbox registers) + sizeof(device registers).
+ *
+ *                       +---------------------------------+
+ *                       |                                 |
+ *                       |    Memory Device Registers      |
+ *                       |                                 |
+ * n + PAYLOAD_SIZE_MAX  -----------------------------------
+ *                  ^    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |         Mailbox Payload         |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  |    |                                 |
+ *                  n    -----------------------------------
+ *                  ^    |       Mailbox Registers         |
+ *                  |    |                                 |
+ *                  |    -----------------------------------
+ *                  |    |                                 |
+ *                  |    |        Device Registers         |
+ *                  |    |                                 |
+ *                  m    ---------------------------------->
+ *                  ^    |  Memory Device Capability Header|
+ *                  |    -----------------------------------
+ *                  |    |     Mailbox Capability Header   |
+ *                  |    -----------------------------------
+ *                  |    |     Device Capability Header    |
+ *                  |    -----------------------------------
+ *                  |    |     Device Cap Array Register   |
+ *                  0    +---------------------------------+
+ *
+ */
+
+#define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
+#define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
+#define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
+
+#define CXL_DEVICE_STATUS_REGISTERS_OFFSET 0x80 /* Read comment above */
+#define CXL_DEVICE_STATUS_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */
+
+#define CXL_MAILBOX_REGISTERS_OFFSET \
+    (CXL_DEVICE_STATUS_REGISTERS_OFFSET + CXL_DEVICE_STATUS_REGISTERS_LENGTH)
+#define CXL_MAILBOX_REGISTERS_SIZE 0x20 /* 8.2.8.4, Figure 139 */
+#define CXL_MAILBOX_PAYLOAD_SHIFT 11
+#define CXL_MAILBOX_MAX_PAYLOAD_SIZE (1 << CXL_MAILBOX_PAYLOAD_SHIFT)
+#define CXL_MAILBOX_REGISTERS_LENGTH \
+    (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
+
+typedef struct cxl_device_state {
+    MemoryRegion device_registers;
+
+    /* mmio for device capabilities array - 8.2.8.2 */
+    MemoryRegion device;
+    MemoryRegion caps;
+
+    /* mmio for the mailbox registers 8.2.8.4 */
+    MemoryRegion mailbox;
+
+    /* memory region for persistent memory, HDM */
+    uint64_t pmem_size;
+} CXLDeviceState;
+
+/* Initialize the register block for a device */
+void cxl_device_register_block_init(Object *obj, CXLDeviceState *dev);
+
+/* Set up default values for the register block */
+void cxl_device_register_init_common(CXLDeviceState *dev);
+
+/*
+ * CXL 2.0 - 8.2.8.1 including errata F4
+ * Documented as a 128 bit register, but 64 bit accesses and the second
+ * 64 bits are currently reserved.
+ */
+REG64(CXL_DEV_CAP_ARRAY, 0) /* Documented as 128 bit register but 64 byte accesses */
+    FIELD(CXL_DEV_CAP_ARRAY, CAP_ID, 0, 16)
+    FIELD(CXL_DEV_CAP_ARRAY, CAP_VERSION, 16, 8)
+    FIELD(CXL_DEV_CAP_ARRAY, CAP_COUNT, 32, 16)
+
+/*
+ * Helper macro to initialize capability headers for CXL devices.
+ *
+ * In the 8.2.8.2, this is listed as a 128b register, but in 8.2.8, it says:
+ * > No registers defined in Section 8.2.8 are larger than 64-bits wide so that
+ * > is the maximum access size allowed for these registers. If this rule is not
+ * > followed, the behavior is undefined
+ *
+ * CXL 2.0 Errata F4 states futher that the layouts in the specification are
+ * shown as greater than 128 bits, but implementations are expected to
+ * use any size of access up to 64 bits.
+ *
+ * Here we've chosen to make it 4 dwords. The spec allows any pow2 multiple
+ * access to be used for a register up to 64 bits.
+ */
+#define CXL_DEVICE_CAPABILITY_HEADER_REGISTER(n, offset)  \
+    REG32(CXL_DEV_##n##_CAP_HDR0, offset)                 \
+        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_ID, 0, 16)      \
+        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_VERSION, 16, 8) \
+    REG32(CXL_DEV_##n##_CAP_HDR1, offset + 4)             \
+        FIELD(CXL_DEV_##n##_CAP_HDR1, CAP_OFFSET, 0, 32)  \
+    REG32(CXL_DEV_##n##_CAP_HDR2, offset + 8)             \
+        FIELD(CXL_DEV_##n##_CAP_HDR2, CAP_LENGTH, 0, 32)
+
+CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE_STATUS, CXL_DEVICE_CAP_HDR1_OFFSET)
+CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
+                                               CXL_DEVICE_CAP_REG_SIZE)
+
+/* CXL 2.0 8.2.8.4.3 Mailbox Capabilities Register */
+REG32(CXL_DEV_MAILBOX_CAP, 0)
+    FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
+    FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)
+    FIELD(CXL_DEV_MAILBOX_CAP, BG_INT_CAP, 6, 1)
+    FIELD(CXL_DEV_MAILBOX_CAP, MSI_N, 7, 4)
+
+/* CXL 2.0 8.2.8.4.4 Mailbox Control Register */
+REG32(CXL_DEV_MAILBOX_CTRL, 4)
+    FIELD(CXL_DEV_MAILBOX_CTRL, DOORBELL, 0, 1)
+    FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 1)
+    FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
+
+/* CXL 2.0 8.2.8.4.5 Command Register */
+REG64(CXL_DEV_MAILBOX_CMD, 8)
+    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND, 0, 8)
+    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND_SET, 8, 8)
+    FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
+
+/* CXL 2.0 8.2.8.4.6 Mailbox Status Register */
+REG64(CXL_DEV_MAILBOX_STS, 0x10)
+    FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)
+    FIELD(CXL_DEV_MAILBOX_STS, ERRNO, 32, 16)
+    FIELD(CXL_DEV_MAILBOX_STS, VENDOR_ERRNO, 48, 16)
+
+/* CXL 2.0 8.2.8.4.7 Background Command Status Register */
+REG64(CXL_DEV_BG_CMD_STS, 0x18)
+    FIELD(CXL_DEV_BG_CMD_STS, OP, 0, 16)
+    FIELD(CXL_DEV_BG_CMD_STS, PERCENTAGE_COMP, 16, 7)
+    FIELD(CXL_DEV_BG_CMD_STS, RET_CODE, 32, 16)
+    FIELD(CXL_DEV_BG_CMD_STS, VENDOR_RET_CODE, 48, 16)
+
+/* CXL 2.0 8.2.8.4.8 Command Payload Registers */
+REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
+
+#endif
-- 
MST


