Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A3D6A7CDD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHg-0007Ak-UR; Thu, 02 Mar 2023 03:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHb-0006QB-8a
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHZ-0002fA-1W
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3t5jQqODDajtK+7mIy/cbeToTBQURm+FACwk2b/4bzM=;
 b=ZrW+yNAKG3VTRO8P3GPBmmhNG9lPkopAuFy4kGXLZhKJBijlAAQbH10fjckjZ2YwmFK+/r
 YdK5Lf93ndpvWciMJNz/IvOKqR5L3WiWhuLsxfW6RurfvNjkjvON0PQbmWmRnwUwoo5ffE
 iYxHc5Hxs/l2iWTdSDHS900jSXTxc2c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-lxxLT5waOwWVxZ7g1xPN8w-1; Thu, 02 Mar 2023 03:27:19 -0500
X-MC-Unique: lxxLT5waOwWVxZ7g1xPN8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so5459969wmb.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745637;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3t5jQqODDajtK+7mIy/cbeToTBQURm+FACwk2b/4bzM=;
 b=2S6maHJnhdwNDB4qVdiIoZDTU0iqsDXA4uNBHmst6q6r82CB56y2tOrQfn0CPE2ETB
 Ijs7Or5FM81EMgiVIstok2dUOG0F4OZjlXhCNMEtMHphVRnvQkNOpeX5k4EFqYuEfVWr
 1w4yNU99TO+kKmUZ4Jw3fcYXCPEdW33exRYqXr5N/SjHjtB3v28VRoUzUHm+G8Ui4CiY
 vam7ojp4eISlL2c4IH/o2+D56S/8huXAukfWvHiNJa2c3zgZgk9zCYUvCBMPsv45CiHV
 d8SA8qfdKqPX7lhKFL/KTw7prsfgw13imJX0hkfO5orArKcvBqCHwvcoUOviUfTn0MaP
 3Rng==
X-Gm-Message-State: AO0yUKV2eDhdEgmdc09M0FL6R9pUG6vebgdgEeJeP118bszSrvLm7uKo
 qxtvqccky6K0ayMXf6EYpVRG2LJkJ2AeFcP5+gQ/f6RokWyRGyjb+f1xAlUjFOeR37ZvZ3v6Hfv
 CuujpqOo3aN1bsdp0G4r+bDWr0hxML03ai5T3MMZlFEGmf9mCKH1KfPEhoDK3kvPHCg==
X-Received: by 2002:a05:600c:3088:b0:3ea:f75d:4626 with SMTP id
 g8-20020a05600c308800b003eaf75d4626mr6752476wmn.38.1677745637710; 
 Thu, 02 Mar 2023 00:27:17 -0800 (PST)
X-Google-Smtp-Source: AK7set9Oz2OCJLdVrBpoK2OmajwJP13VZd/8UwVi/lLuJ9HSw16sz7xS2OudM/XCpFff2F2cEL+mmQ==
X-Received: by 2002:a05:600c:3088:b0:3ea:f75d:4626 with SMTP id
 g8-20020a05600c308800b003eaf75d4626mr6752456wmn.38.1677745637349; 
 Thu, 02 Mar 2023 00:27:17 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b002c551f7d452sm14893007wru.98.2023.03.02.00.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:27:16 -0800 (PST)
Date: Thu, 2 Mar 2023 03:27:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ira Weiny <ira.weiny@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gregory Price <gregory.price@memverge.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 52/53] hw/cxl/mailbox: Use new UUID network order define for
 cel_uuid
Message-ID: <20230302082343.560446-53-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ira Weiny <ira.weiny@intel.com>

The cel_uuid was programatically generated previously because there was
no static initializer for network order UUIDs.

Use the new network order initializer for cel_uuid.  Adjust
cxl_initialize_mailbox() because it can't fail now.

Update specification reference.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Message-Id: <20230206172816.8201-11-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h |  2 +-
 hw/cxl/cxl-device-utils.c   |  2 +-
 hw/cxl/cxl-mailbox-utils.c  | 13 ++++++-------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 250adf18b2..7e5ad65c1d 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -170,7 +170,7 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MEMORY_DEVICE,
                                       CXL_DEVICE_CAP_HDR1_OFFSET +
                                           CXL_DEVICE_CAP_REG_SIZE * 2)
 
-int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate);
+void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate);
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate);
 
 #define cxl_device_cap_init(dstate, reg, cap_id)                           \
diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 83ce7a8270..4c5e88aaf5 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -267,5 +267,5 @@ void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
     cxl_device_cap_init(cxl_dstate, MEMORY_DEVICE, 0x4000);
     memdev_reg_init_common(cxl_dstate);
 
-    assert(cxl_initialize_mailbox(cxl_dstate) == 0);
+    cxl_initialize_mailbox(cxl_dstate);
 }
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 3f67b665f5..206e04a4b8 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -193,7 +193,11 @@ static ret_code cmd_timestamp_set(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
-static QemuUUID cel_uuid;
+/* CXL 3.0 8.2.9.5.2.1 Command Effects Log (CEL) */
+static const QemuUUID cel_uuid = {
+    .data = UUID(0x0da9c0b5, 0xbf41, 0x4b78, 0x8f, 0x79,
+                 0x96, 0xb1, 0x62, 0x3b, 0x3f, 0x17)
+};
 
 /* 8.2.9.4.1 */
 static ret_code cmd_logs_get_supported(struct cxl_cmd *cmd,
@@ -458,11 +462,8 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
                      DOORBELL, 0);
 }
 
-int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
+void cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
 {
-    /* CXL 2.0: Table 169 Get Supported Logs Log Entry */
-    const char *cel_uuidstr = "0da9c0b5-bf41-4b78-8f79-96b1623b3f17";
-
     for (int set = 0; set < 256; set++) {
         for (int cmd = 0; cmd < 256; cmd++) {
             if (cxl_cmd_set[set][cmd].handler) {
@@ -476,6 +477,4 @@ int cxl_initialize_mailbox(CXLDeviceState *cxl_dstate)
             }
         }
     }
-
-    return qemu_uuid_parse(cel_uuidstr, &cel_uuid);
 }
-- 
MST


