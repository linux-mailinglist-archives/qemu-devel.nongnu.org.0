Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DB529279
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:08:51 +0200 (CEST)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhxS-0007De-OY
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfw-0004QX-Kt
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfu-0006F8-E5
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLEPVbhly/sJ9gkFSi3H6cGCXHWwu/4fK5qVGB2iO4Q=;
 b=IWLcvWqQs++/sf6swD7lvuBRkwmd5UMD0Xfbb63zVrBWHxOJqlb6C8T5j5iPEkXSYIXwaL
 BsVX5r70fHhuRMuPB619Q1f4v1PmvupnfKYJfTmKnJy3xRc6TrRQjSOdmzK3an1vvpXJnt
 CbUaR52fM42BBKsQN5P4+razF3OH8EI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-40zIdFCkMxOIc9yf9nZMiQ-1; Mon, 16 May 2022 16:50:40 -0400
X-MC-Unique: 40zIdFCkMxOIc9yf9nZMiQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sh14-20020a1709076e8e00b006f4a5de6888so6373783ejc.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iLEPVbhly/sJ9gkFSi3H6cGCXHWwu/4fK5qVGB2iO4Q=;
 b=DL7qe35ItWRc4LVi7w7xuE57RkhDpHibpCw2rwU92Vy2mRsvOY2LDV+Oezh3hbq87Y
 cuSbq5nM1U2hj7x6qCEVGyRh8VBUaMGII+4zitV9YWTFHUdCV6iS8hu20DQkGtcys16z
 FBWCh4mYUGVw1gihgM4SoF20+gIzboXoHKY3U6CB7qXqZb4nfgg4LD5McwbuK/Rk0EcQ
 LO4hd5MZY6bLPuyby4boNj6WhfN/+Lin59BEnS7seXesTB8Esu/fKbYEeeTFjOfAeOXq
 0jadSFjyn99j9QZrJibJMIsqP7wCSD4k0gVmmvrPzOJCUdLncL9p+Hh9CzalYqa78adB
 mvlQ==
X-Gm-Message-State: AOAM533pqKH7jQ3qMUjlHJXHL+oHl7OuuD0LjTpWTaZxuzhNlNWmyBHq
 12K3uLRRnZRRScwob+IqKl/3RjazCNK21DtAbNR0t9kyzs/SP/H8aGtwTGbdTNYYfWY+z0cbwN+
 XA9VjryHArJn/MOn9FdnotWmElc+zkQjZ4bt9tzC+ZSbPJUoyl++etREQIF4n
X-Received: by 2002:a05:6402:908:b0:428:11f5:509d with SMTP id
 g8-20020a056402090800b0042811f5509dmr15336999edz.253.1652734239091; 
 Mon, 16 May 2022 13:50:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJRWJa7m4HXWfLMH6u+Y4lBnwwj4I3PlcLt6iTjauJX84bT8e4G3ZQY0TaSSEDqtimIXTAdg==
X-Received: by 2002:a05:6402:908:b0:428:11f5:509d with SMTP id
 g8-20020a056402090800b0042811f5509dmr15336972edz.253.1652734238814; 
 Mon, 16 May 2022 13:50:38 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 e9-20020a056402104900b0042ac0e79bb6sm574479edu.45.2022.05.16.13.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:38 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 09/86] hw/cxl/device: Add memory device utilities
Message-ID: <20220516204913.542894-10-mst@redhat.com>
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

Memory devices implement extra capabilities on top of CXL devices. This
adds support for that.

A large part of memory devices is the mailbox/command interface. All of
the mailbox handling is done in the mailbox-utils library. Longer term,
new CXL devices that are being emulated may want to handle commands
differently, and therefore would need a mechanism to opt in/out of the
specific generic handlers. As such, this is considered sufficient for
now, but may need more depth in the future.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220429144110.25167-8-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h | 21 +++++++++++++++++---
 hw/cxl/cxl-device-utils.c   | 38 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 35489f635a..954205653e 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -72,15 +72,20 @@
 #define CXL_MAILBOX_REGISTERS_LENGTH \
     (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
 
-#define CXL_MMIO_SIZE                                           \
-    (CXL_DEVICE_CAP_REG_SIZE + CXL_DEVICE_STATUS_REGISTERS_LENGTH + \
-     CXL_MAILBOX_REGISTERS_LENGTH)
+#define CXL_MEMORY_DEVICE_REGISTERS_OFFSET \
+    (CXL_MAILBOX_REGISTERS_OFFSET + CXL_MAILBOX_REGISTERS_LENGTH)
+#define CXL_MEMORY_DEVICE_REGISTERS_LENGTH 0x8
+
+#define CXL_MMIO_SIZE                                                   \
+    (CXL_DEVICE_CAP_REG_SIZE + CXL_DEVICE_STATUS_REGISTERS_LENGTH +     \
+     CXL_MAILBOX_REGISTERS_LENGTH + CXL_MEMORY_DEVICE_REGISTERS_LENGTH)
 
 typedef struct cxl_device_state {
     MemoryRegion device_registers;
 
     /* mmio for device capabilities array - 8.2.8.2 */
     MemoryRegion device;
+    MemoryRegion memory_device;
     struct {
         MemoryRegion caps;
         union {
@@ -153,6 +158,9 @@ REG64(CXL_DEV_CAP_ARRAY, 0) /* Documented as 128 bit register but 64 byte access
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE_STATUS, CXL_DEVICE_CAP_HDR1_OFFSET)
 CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
                                                CXL_DEVICE_CAP_REG_SIZE)
+CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MEMORY_DEVICE,
+                                      CXL_DEVICE_CAP_HDR1_OFFSET +
+                                          CXL_DEVICE_CAP_REG_SIZE * 2)
 
 int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate);
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
@@ -209,4 +217,11 @@ REG64(CXL_DEV_BG_CMD_STS, 0x18)
 /* CXL 2.0 8.2.8.4.8 Command Payload Registers */
 REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
 
+REG64(CXL_MEM_DEV_STS, 0)
+    FIELD(CXL_MEM_DEV_STS, FATAL, 0, 1)
+    FIELD(CXL_MEM_DEV_STS, FW_HALT, 1, 1)
+    FIELD(CXL_MEM_DEV_STS, MEDIA_STATUS, 2, 2)
+    FIELD(CXL_MEM_DEV_STS, MBOX_READY, 4, 1)
+    FIELD(CXL_MEM_DEV_STS, RESET_NEEDED, 5, 3)
+
 #endif
diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index f6c3e0f095..687759b301 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -131,6 +131,31 @@ static void mailbox_reg_write(void *opaque, hwaddr offset, uint64_t value,
     }
 }
 
+static uint64_t mdev_reg_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t retval = 0;
+
+    retval = FIELD_DP64(retval, CXL_MEM_DEV_STS, MEDIA_STATUS, 1);
+    retval = FIELD_DP64(retval, CXL_MEM_DEV_STS, MBOX_READY, 1);
+
+    return retval;
+}
+
+static const MemoryRegionOps mdev_ops = {
+    .read = mdev_reg_read,
+    .write = NULL, /* memory device register is read only */
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .impl = {
+        .min_access_size = 8,
+        .max_access_size = 8,
+    },
+};
+
 static const MemoryRegionOps mailbox_ops = {
     .read = mailbox_reg_read,
     .write = mailbox_reg_write,
@@ -188,6 +213,9 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
                           "device-status", CXL_DEVICE_STATUS_REGISTERS_LENGTH);
     memory_region_init_io(&cxl_dstate->mailbox, obj, &mailbox_ops, cxl_dstate,
                           "mailbox", CXL_MAILBOX_REGISTERS_LENGTH);
+    memory_region_init_io(&cxl_dstate->memory_device, obj, &mdev_ops,
+                          cxl_dstate, "memory device caps",
+                          CXL_MEMORY_DEVICE_REGISTERS_LENGTH);
 
     memory_region_add_subregion(&cxl_dstate->device_registers, 0,
                                 &cxl_dstate->caps);
@@ -197,6 +225,9 @@ void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dstate)
     memory_region_add_subregion(&cxl_dstate->device_registers,
                                 CXL_MAILBOX_REGISTERS_OFFSET,
                                 &cxl_dstate->mailbox);
+    memory_region_add_subregion(&cxl_dstate->device_registers,
+                                CXL_MEMORY_DEVICE_REGISTERS_OFFSET,
+                                &cxl_dstate->memory_device);
 }
 
 static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
@@ -209,10 +240,12 @@ static void mailbox_reg_init_common(CXLDeviceState *cxl_dstate)
     cxl_dstate->payload_size = CXL_MAILBOX_MAX_PAYLOAD_SIZE;
 }
 
+static void memdev_reg_init_common(CXLDeviceState *cxl_dstate) { }
+
 void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
 {
     uint64_t *cap_hdrs = cxl_dstate->caps_reg_state64;
-    const int cap_count = 2;
+    const int cap_count = 3;
 
     /* CXL Device Capabilities Array Register */
     ARRAY_FIELD_DP64(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
@@ -225,5 +258,8 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
     cxl_device_cap_init(cxl_dstate, MAILBOX, 2);
     mailbox_reg_init_common(cxl_dstate);
 
+    cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
+    memdev_reg_init_common(cxl_dstate);
+
     assert(cxl_initialize_mailbox(cxl_dstate) == 0);
 }
-- 
MST


