Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C452826C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:44:19 +0200 (CEST)
Received: from localhost ([::1]:49560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYD4-0006D8-Ot
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY4u-0005kv-OW
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY4s-00052n-US
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLHFEalNlKqumlMci78Jl5CbY0h9TorlDb5jQrCnN0s=;
 b=KRMHuRXrgruVC/L1NGwTUgJAitcQ3pIkKAbTKq2wUugV3G8iLEOMxTZPrQUs7EUG/+zSS7
 ovMGmpLZDPjnunMQV+2KP7TK9DIb+LPPPBBCS1MnbyCN8KMGVCDRAvr6O8HY8QGCDPqxF4
 zEf4mrRw6Lte3rZXCYuFswBJCDtho28=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-xKpYo57vP0q9P0DbtYu1gA-1; Mon, 16 May 2022 06:35:49 -0400
X-MC-Unique: xKpYo57vP0q9P0DbtYu1gA-1
Received: by mail-wm1-f70.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so6559117wma.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PLHFEalNlKqumlMci78Jl5CbY0h9TorlDb5jQrCnN0s=;
 b=AxKCjHpSnPQgBJEKUEdKJRn9+AQNG72oouDO29Ve1ryAwQZ5z5cYMWb3H0mzHDxMW9
 wR2n6O3E+n0r94K9Rd0x6S5Mi1bOtxwEZTnscPT3YGhrcKXvIkQpLHZh3GDag5DzklgG
 ZIkdOPX2UodP1XdRQMiTEkQPsWqp9zsXY4g92I8eWuk9SjETtd2w/aQVG8bQo34YcFMZ
 z52rM1lowG/A06Yk0rE0tP0oidvV0FpGuQF8XBFSfwBer8g56xmRnkdsZUuxlQ3+nOwY
 /l1AcBGpt92QHf2X6hMec4N33+fObBc6mP1qkrZLOKPxdMCheAdCzVvm8zAOP7wHzaa8
 RFrw==
X-Gm-Message-State: AOAM531u6nbRbZGn5b3C97eeHIwGfE8fO4GJ2rfQISGh0zzLjXfoItqb
 4LJ0r/hZzAVgFjuTIgPl4bTDRYVxix886uqCTrJe3lrHxNLQSMI7RZkUtsqE9f+NLyomli7xXnj
 i8gg+aazMVZgyUL6NV07mTozQ65xPXIcd7pHiycVElvUCh0yN7P1KQZihK12b
X-Received: by 2002:a05:600c:220e:b0:394:2695:ce9b with SMTP id
 z14-20020a05600c220e00b003942695ce9bmr15965499wml.64.1652697347905; 
 Mon, 16 May 2022 03:35:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbvi6taUWchhD2Be9jEvdBH9Nio2YY6Vo4bbODvKj+Rj26UC3J+3B0IGsIVifXZlPSTSCqkw==
X-Received: by 2002:a05:600c:220e:b0:394:2695:ce9b with SMTP id
 z14-20020a05600c220e00b003942695ce9bmr15965482wml.64.1652697347664; 
 Mon, 16 May 2022 03:35:47 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b00396fbf6f524sm4755569wms.1.2022.05.16.03.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:35:47 -0700 (PDT)
Date: Mon, 16 May 2022 06:35:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Adam Manzanares <a.manzanares@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 03/91] hw/pci/cxl: Add a CXL component type (interface)
Message-ID: <20220516095448.507876-4-mst@redhat.com>
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

A CXL component is a hardware entity that implements CXL component
registers from the CXL 2.0 spec (8.2.3). Currently these represent 3
general types.
1. Host Bridge
2. Ports (root, upstream, downstream)
3. Devices (memory, other)

A CXL component can be conceptually thought of as a PCIe device with
extra functionality when enumerated and enabled. For this reason, CXL
does here, and will continue to add on to existing PCI code paths.

Host bridges will typically need to be handled specially and so they can
implement this newly introduced interface or not. All other components
should implement this interface. Implementing this interface allows the
core PCI code to treat these devices as special where appropriate.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Adam Manzanares <a.manzanares@samsung.com>
Message-Id: <20220429144110.25167-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h |  8 ++++++++
 hw/pci/pci.c         | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 3a32b8dd40..98f0d1b844 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -194,6 +194,8 @@ enum {
     QEMU_PCIE_LNKSTA_DLLLA = (1 << QEMU_PCIE_LNKSTA_DLLLA_BITNR),
 #define QEMU_PCIE_EXTCAP_INIT_BITNR 9
     QEMU_PCIE_EXTCAP_INIT = (1 << QEMU_PCIE_EXTCAP_INIT_BITNR),
+#define QEMU_PCIE_CXL_BITNR 10
+    QEMU_PCIE_CAP_CXL = (1 << QEMU_PCIE_CXL_BITNR),
 };
 
 #define TYPE_PCI_DEVICE "pci-device"
@@ -201,6 +203,12 @@ typedef struct PCIDeviceClass PCIDeviceClass;
 DECLARE_OBJ_CHECKERS(PCIDevice, PCIDeviceClass,
                      PCI_DEVICE, TYPE_PCI_DEVICE)
 
+/*
+ * Implemented by devices that can be plugged on CXL buses. In the spec, this is
+ * actually a "CXL Component, but we name it device to match the PCI naming.
+ */
+#define INTERFACE_CXL_DEVICE "cxl-device"
+
 /* Implemented by devices that can be plugged on PCI Express buses */
 #define INTERFACE_PCIE_DEVICE "pci-express-device"
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 9c58f02853..eb884adef9 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -200,6 +200,11 @@ static const TypeInfo pci_bus_info = {
     .class_init = pci_bus_class_init,
 };
 
+static const TypeInfo cxl_interface_info = {
+    .name          = INTERFACE_CXL_DEVICE,
+    .parent        = TYPE_INTERFACE,
+};
+
 static const TypeInfo pcie_interface_info = {
     .name          = INTERFACE_PCIE_DEVICE,
     .parent        = TYPE_INTERFACE,
@@ -2182,6 +2187,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
     }
 
+    if (object_class_dynamic_cast(klass, INTERFACE_CXL_DEVICE)) {
+        pci_dev->cap_present |= QEMU_PCIE_CAP_CXL;
+    }
+
     pci_dev = do_pci_register_device(pci_dev,
                                      object_get_typename(OBJECT(qdev)),
                                      pci_dev->devfn, errp);
@@ -2938,6 +2947,7 @@ static void pci_register_types(void)
     type_register_static(&pci_bus_info);
     type_register_static(&pcie_bus_info);
     type_register_static(&conventional_pci_interface_info);
+    type_register_static(&cxl_interface_info);
     type_register_static(&pcie_interface_info);
     type_register_static(&pci_device_type_info);
 }
-- 
MST


