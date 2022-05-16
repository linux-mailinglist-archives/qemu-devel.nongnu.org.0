Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE45291FF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:57:16 +0200 (CEST)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhmG-00057k-0v
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfo-0004J3-O7
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfm-0006Dc-DY
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4UBxdcKxuszpgF5ZZmRIY9Zu8EYEhLz3E45PYU63gM=;
 b=P/Uwq7nAPeKQDt24UYz0ANTmiBCAuahKfekVdFXIjCfGBvzb6FNbJS0M5b4qbFRccE3NwU
 Z08Yf7McFPWetMXWjcl7Ho7EVzo9C5nRh38nKYOQqHuChhQHZzasYgk9NBUu2pFISn2QcC
 AtF6FDUf/BKYOi4mNKnC8Q2uvIVGuWM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-HvJunQ55M5KRvf6Gw-ZhuQ-1; Mon, 16 May 2022 16:50:32 -0400
X-MC-Unique: HvJunQ55M5KRvf6Gw-ZhuQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 b3-20020aa7d483000000b004282ca95814so10413631edr.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=M4UBxdcKxuszpgF5ZZmRIY9Zu8EYEhLz3E45PYU63gM=;
 b=kNxKtiD2ssIPQzqcEpE41k+mzHzi4cqkMvgovWRJbpRjuR5v8TmbzvQpBDqt1LSEhe
 8WBRZWs3eB7oHHaD5Lz0RDpKd2b8PNdLnkwmL2fAHEoN/oDrppHiLtBWgWaG64SOoG0c
 y/oCmy6a9YINl1lfJudh36oZIbVcOFcMXyEWORe3gSQPMDb5liyVyFiTqRepu6bLKg9r
 uCNKo64kgZFyKSitN05hHfK/bJumVpbXKBHr3WD4cQCiveYDgLHw5wEe9qjA4udbHokh
 CtQgT+gJH8JkPltq3baB2JHHprDaIq+g3xD36FSU5bH47FaT/MohbC330A2vK4wNn0Sg
 lu4g==
X-Gm-Message-State: AOAM532RNpkjhK5mSCRpfP9G2ZjcSZRQBg/2Um5G+xMfkNhG5iwscWA1
 EuMCWRu2PDegOryrfNJIT/6HJTORfYwplvgZVJKRU0gJOk2ZMtTLlxsUm/TksNcc3X/enTkzQIo
 QzaLq4KSLJmSohDVVXUDyofi2MggiTJlMvmtF+xY6QLaOPoLSR4EGKhkC49V3
X-Received: by 2002:aa7:da08:0:b0:425:af3c:196a with SMTP id
 r8-20020aa7da08000000b00425af3c196amr15267196eds.69.1652734231355; 
 Mon, 16 May 2022 13:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHS2FfHkWIIHBshYywnFValNFyHKePqTCnMucCtDztBZ9k1NQhsX6az0pMJ0JPqqWDni19uQ==
X-Received: by 2002:aa7:da08:0:b0:425:af3c:196a with SMTP id
 r8-20020aa7da08000000b00425af3c196amr15267167eds.69.1652734230966; 
 Mon, 16 May 2022 13:50:30 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 b16-20020a170906729000b006fe50668941sm148264ejl.158.2022.05.16.13.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:30 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 07/86] hw/cxl/device: Implement the CAP array (8.2.8.1-2)
Message-ID: <20220516204913.542894-8-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

This implements all device MMIO up to the first capability. That
includes the CXL Device Capabilities Array Register, as well as all of
the CXL Device Capability Header Registers. The latter are filled in as
they are implemented in the following patches.

Endianness and alignment are managed by softmmu memory core.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-6-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h |  31 +++++++++-
 hw/cxl/cxl-device-utils.c   | 109 ++++++++++++++++++++++++++++++++++++
 hw/cxl/meson.build          |   1 +
 3 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 hw/cxl/cxl-device-utils.c

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 9513aaac77..599c887616 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -58,6 +58,8 @@
 #define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
 #define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
 #define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
+#define CXL_CAPS_SIZE \
+    (CXL_DEVICE_CAP_REG_SIZE * (CXL_DEVICE_CAPS_MAX + 1)) /* +1 for header */
 
 #define CXL_DEVICE_STATUS_REGISTERS_OFFSET 0x80 /* Read comment above */
 #define CXL_DEVICE_STATUS_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */
@@ -70,12 +72,22 @@
 #define CXL_MAILBOX_REGISTERS_LENGTH \
     (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
 
+#define CXL_MMIO_SIZE                                           \
+    (CXL_DEVICE_CAP_REG_SIZE + CXL_DEVICE_STATUS_REGISTERS_LENGTH + \
+     CXL_MAILBOX_REGISTERS_LENGTH)
+
 typedef struct cxl_device_state {
     MemoryRegion device_registers;
 
     /* mmio for device capabilities array - 8.2.8.2 */
     MemoryRegion device;
-    MemoryRegion caps;
+    struct {
+        MemoryRegion caps;
+        union {
+            uint32_t caps_reg_state32[CXL_CAPS_SIZE / 4];
+            uint64_t caps_reg_state64[CXL_CAPS_SIZE / 8];
+        };
+    };
 
     /* mmio for the mailbox registers 8.2.8.4 */
     MemoryRegion mailbox;
@@ -128,6 +140,23 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE_STATUS, CXL_DEVICE_CAP_HDR1_OFFSET)
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
                                                CXL_DEVICE_CAP_REG_SIZE)
 
+#define cxl_device_cap_init(dstate, reg, cap_id)                           \
+    do {                                                                   \
+        uint32_t *cap_hdrs = dstate->caps_reg_state32;                     \
+        int which = R_CXL_DEV_##reg##_CAP_HDR0;                            \
+        cap_hdrs[which] =                                                  \
+            FIELD_DP32(cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0,          \
+                       CAP_ID, cap_id);                                    \
+        cap_hdrs[which] = FIELD_DP32(                                      \
+            cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_VERSION, 1);    \
+        cap_hdrs[which + 1] =                                              \
+            FIELD_DP32(cap_hdrs[which + 1], CXL_DEV_##reg##_CAP_HDR1,      \
+                       CAP_OFFSET, CXL_##reg##_REGISTERS_OFFSET);          \
+        cap_hdrs[which + 2] =                                              \
+            FIELD_DP32(cap_hdrs[which + 2], CXL_DEV_##reg##_CAP_HDR2,      \
+                       CAP_LENGTH, CXL_##reg##_REGISTERS_LENGTH);          \
+    } while (0)
+
 /* CXL 2.0 8.2.8.4.3 Mailbox Capabilities Register */
 REG32(CXL_DEV_MAILBOX_CAP, 0)
     FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
new file mode 100644
index 0000000000..241f9f82e3
--- /dev/null
+++ b/hw/cxl/cxl-device-utils.c
@@ -0,0 +1,109 @@
+/*
+ * CXL Utility library for devices
+ *
+ * Copyright(C) 2020 Intel Corporation.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/cxl/cxl.h"
+
+/*
+ * Device registers have no restrictions per the spec, and so fall back to the
+ * default memory mapped register rules in 8.2:
+ *   Software shall use CXL.io Memory Read and Write to access memory mapped
+ *   register defined in this section. Unless otherwise specified, software
+ *   shall restrict the accesses width based on the following:
+ *   • A 32 bit register shall be accessed as a 1 Byte, 2 Bytes or 4 Bytes
+ *     quantity.
+ *   • A 64 bit register shall be accessed as a 1 Byte, 2 Bytes, 4 Bytes or 8
+ *     Bytes
+ *   • The address shall be a multiple of the access width, e.g. when
+ *     accessing a register as a 4 Byte quantity, the address shall be
+ *     multiple of 4.
+ *   • The accesses shall map to contiguous bytes.If these rules are not
+ *     followed, the behavior is undefined
+ */
+
+static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    CXLDeviceState *cxl_dstate = opaque;
+
+    if (size == 4) {
+        return cxl_dstate->caps_reg_state32[offset / sizeof(*cxl_dstate->caps_reg_state32)];
+    } else {
+        return cxl_dstate->caps_reg_state64[offset / sizeof(*cxl_dstate->caps_reg_state64)];
+    }
+}
+
+static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    return 0;
+}
+
+static const MemoryRegionOps dev_ops = {
+    .read = dev_reg_read,
+    .write = NULL, /* status register is read only */
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+};
+
+static const MemoryRegionOps caps_ops = {
+    .read = caps_reg_read,
+    .write = NULL, /* caps registers are read only */
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+};
+
+void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
+{
+    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spec */
+    memory_region_init(&cxl_dstate->device_registers, obj, "device-registers",
+                       pow2ceil(CXL_MMIO_SIZE));
+
+    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
+                          "cap-array", CXL_CAPS_SIZE);
+    memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
+                          "device-status", CXL_DEVICE_STATUS_REGISTERS_LENGTH);
+
+    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
+                                &cxl_dstate->caps);
+    memory_region_add_subregion(&cxl_dstate->device_registers,
+                                CXL_DEVICE_STATUS_REGISTERS_OFFSET,
+                                &cxl_dstate->device);
+}
+
+static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
+
+void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
+{
+    uint64_t *cap_hdrs = cxl_dstate->caps_reg_state64;
+    const int cap_count = 1;
+
+    /* CXL Device Capabilities Array Register */
+    ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
+    ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
+    ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_COUNT, cap_count);
+
+    cxl_device_cap_init(cxl_dstate, DEVICE_STATUS, 1);
+    device_reg_init_common(cxl_dstate);
+}
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
index 3231b5de1e..dd7c6f8e5a 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -1,4 +1,5 @@
 softmmu_ss.add(when: 'CONFIG_CXL',
                if_true: files(
                    'cxl-component-utils.c',
+                   'cxl-device-utils.c',
                ))
-- 
MST


