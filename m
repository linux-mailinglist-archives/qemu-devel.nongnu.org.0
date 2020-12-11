Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4D2D6DDB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 03:00:27 +0100 (CET)
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knXjO-0007p9-IX
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 21:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31dDSXwgKCsY86tm054ts00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--wuhaotsh.bounces.google.com>)
 id 1knXbf-0001hu-Ry
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:52:28 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:57106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31dDSXwgKCsY86tm054ts00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--wuhaotsh.bounces.google.com>)
 id 1knXbb-0007BJ-0k
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:52:27 -0500
Received: by mail-pg1-x54a.google.com with SMTP id z2so5390130pgb.23
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=cKCtRn1dkFOSwY3ieDqlEqe46CjfgnOoKtbkb72JIac=;
 b=iOoF3iSknyFAfnAqW3e3MzqsRKI7VlfXAo8EpS8JgDm2fuIe7q4XzUb6mnyW8qpwU7
 rl7UXbjJXrksi7FxMS3hSYF2EVdyfWwJcgK4To+lAstsz4q7/Nyn0Yyn5fQ+4+GYxtkr
 zszkO+q4GVOzIrXvfCGvF1A4XC6WaQRmbJdIzIM3lmTZEx8MCwgrB2ZjrXIkgpBFFehP
 bT9iN8a41v0tg6OF0TWl9ZQnv5gveL08GunuLUcw3weC8sgvDp2KI8EmZrQFD5xH3vV8
 7U8qtB98OMD62irdHuxz2VAVAPPKF59a1pGwp/cjdGcPCdFuR6nUN23PYScRX+y2UpiB
 NOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cKCtRn1dkFOSwY3ieDqlEqe46CjfgnOoKtbkb72JIac=;
 b=BQHOkN0WUZt1mGeWhrtMHp+Yj/IkgD6fZeBomnrQlk4yx0G8nw+Dnb6xbjeOnAkPNf
 Hcwn/2ru1cWFPLA+EHv6vy2Rs/CRgUT8tfQLJfCcCNhprheW3ha7kZSUN7EiKQoOpOLs
 hJZT4PkmdcTAJZtZkXxHiRNy474K+vll5XsXgSpCkj5p8n6JNmVpVPin4K3wQ4a0w5J3
 Tzfo0p7YVs9w33w6eSIFOXAb1PR7ZJywEgnWZRZXdfek8BNOd9GQfVBCG2PiMNViKE6a
 mndDMOgMt1L52BzKuz0jq6I4d+HKiwNp1fw/v+SVrbXwXzgmLVw/oJBoKCE/70176ff1
 9Lsg==
X-Gm-Message-State: AOAM5331BoKCueb7CHOcC1O3UMBDiSxVx8AFj1zXqKasn7oIp2P22FD8
 6SfqYZvQo8OgMN/bW9agXI3jOnXXNDy7Hg==
X-Google-Smtp-Source: ABdhPJzwf5RN2mEBMzRT/uUThoBhcIswoexZ/B9Z10MdeunXlmJ9wldYMXGRFHNYqKACz/0ULWPirj5Wqzeq8A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:8f82:b029:da:f37f:79bf with SMTP
 id z2-20020a1709028f82b02900daf37f79bfmr8976578plo.79.1607651541057; Thu, 10
 Dec 2020 17:52:21 -0800 (PST)
Date: Thu, 10 Dec 2020 17:51:54 -0800
In-Reply-To: <20201211015156.2053372-1-wuhaotsh@google.com>
Message-Id: <20201211015156.2053372-6-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201211015156.2053372-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 5/7] hw/ipmi: Add an IPMI host interface
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=31dDSXwgKCsY86tm054ts00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

The IPMI host interface is used to emulate IPMI related devices on a
System-on-Chip (SoC) used for Baseband Management Controller (BMC).
This interface consists of two components: IPMI host and IPMI responder.
An IPMI responder is a device to intercept reads and writes to the
system interface registers in the host. An IPMI host emulates the host
behavior on a BMC emulation.

For more information see docs/spec/ipmi.rst.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 default-configs/devices/arm-softmmu.mak |  2 +
 hw/ipmi/Kconfig                         |  5 ++
 hw/ipmi/ipmi_host.c                     | 40 +++++++++++++++
 hw/ipmi/meson.build                     |  1 +
 include/hw/ipmi/ipmi_host.h             | 56 +++++++++++++++++++++
 include/hw/ipmi/ipmi_responder.h        | 66 +++++++++++++++++++++++++
 6 files changed, 170 insertions(+)
 create mode 100644 hw/ipmi/ipmi_host.c
 create mode 100644 include/hw/ipmi/ipmi_host.h
 create mode 100644 include/hw/ipmi/ipmi_responder.h

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 08a32123b4..864bac4501 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -27,6 +27,8 @@ CONFIG_GUMSTIX=y
 CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
+CONFIG_IPMI=y
+CONFIG_IPMI_HOST=y
 CONFIG_NPCM7XX=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
diff --git a/hw/ipmi/Kconfig b/hw/ipmi/Kconfig
index 9befd4f422..9e487eb42f 100644
--- a/hw/ipmi/Kconfig
+++ b/hw/ipmi/Kconfig
@@ -6,6 +6,11 @@ config IPMI_LOCAL
     default y
     depends on IPMI
 
+config IPMI_HOST
+    bool
+    default y
+    depends on IPMI
+
 config IPMI_EXTERN
     bool
     default y
diff --git a/hw/ipmi/ipmi_host.c b/hw/ipmi/ipmi_host.c
new file mode 100644
index 0000000000..7a6d4eb323
--- /dev/null
+++ b/hw/ipmi/ipmi_host.c
@@ -0,0 +1,40 @@
+/*
+ * IPMI Host emulation
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "hw/ipmi/ipmi_host.h"
+#include "hw/ipmi/ipmi_responder.h"
+
+static TypeInfo ipmi_responder_type_info = {
+    .name = TYPE_IPMI_RESPONDER,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(IPMIResponderClass),
+};
+
+static TypeInfo ipmi_host_type_info = {
+    .name = TYPE_IPMI_HOST,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(IPMIHost),
+    .abstract = true,
+    .class_size = sizeof(IPMIHostClass),
+};
+
+static void ipmi_register_types(void)
+{
+    type_register_static(&ipmi_responder_type_info);
+    type_register_static(&ipmi_host_type_info);
+}
+
+type_init(ipmi_register_types)
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index 9622ea2a2c..9ec4dcb957 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -7,5 +7,6 @@ ipmi_ss.add(when: 'CONFIG_PCI_IPMI_KCS', if_true: files('pci_ipmi_kcs.c'))
 ipmi_ss.add(when: 'CONFIG_ISA_IPMI_BT', if_true: files('isa_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
+ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
diff --git a/include/hw/ipmi/ipmi_host.h b/include/hw/ipmi/ipmi_host.h
new file mode 100644
index 0000000000..a703cc3854
--- /dev/null
+++ b/include/hw/ipmi/ipmi_host.h
@@ -0,0 +1,56 @@
+/*
+ * IPMI host interface
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef HW_IPMI_HOST_H
+#define HW_IPMI_HOST_H
+
+#include "hw/ipmi/ipmi_responder.h"
+
+#define TYPE_IPMI_HOST "ipmi-host"
+#define IPMI_HOST(obj) \
+     OBJECT_CHECK(IPMIHost, (obj), TYPE_IPMI_HOST)
+#define IPMI_HOST_CLASS(obj_class) \
+     OBJECT_CLASS_CHECK(IPMIHostClass, (obj_class), TYPE_IPMI_HOST)
+#define IPMI_HOST_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(IPMIHostClass, (obj), TYPE_IPMI_HOST)
+
+/**
+ * struct IPMIHost defines an IPMI host interface. It can be a simulator or a
+ * connection to an emulated or real host.
+ * @responder: The IPMI responder that handles an IPMI message.
+ */
+typedef struct IPMIHost {
+    DeviceState parent;
+
+    IPMIResponder *responder;
+} IPMIHost;
+
+/**
+ * struct IPMIHostClass defines an IPMI host class.
+ * @handle_command: Handle a command to the host.
+ */
+typedef struct IPMIHostClass {
+    DeviceClass parent;
+
+    /*
+     * Handle a command to the bmc.
+     */
+    void (*handle_command)(struct IPMIHost *s,
+                           uint8_t *cmd, unsigned int cmd_len,
+                           unsigned int max_cmd_len, uint8_t msg_id);
+} IPMIHostClass;
+
+#endif /* HW_IPMI_HOST_H */
diff --git a/include/hw/ipmi/ipmi_responder.h b/include/hw/ipmi/ipmi_responder.h
new file mode 100644
index 0000000000..e3e4ef39d4
--- /dev/null
+++ b/include/hw/ipmi/ipmi_responder.h
@@ -0,0 +1,66 @@
+/*
+ * IPMI responder interface
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef HW_IPMI_RESPONDER_H
+#define HW_IPMI_RESPONDER_H
+
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+#include "qom/object.h"
+
+#define TYPE_IPMI_RESPONDER_PREFIX "ipmi-responder-"
+#define TYPE_IPMI_RESPONDER "ipmi-responder"
+#define IPMI_RESPONDER(obj) \
+     INTERFACE_CHECK(IPMIResponder, (obj), TYPE_IPMI_RESPONDER)
+#define IPMI_RESPONDER_CLASS(class) \
+     OBJECT_CLASS_CHECK(IPMIResponderClass, (class), TYPE_IPMI_RESPONDER)
+#define IPMI_RESPONDER_GET_CLASS(class) \
+     OBJECT_GET_CLASS(IPMIResponderClass, (class), TYPE_IPMI_RESPONDER)
+
+struct IPMIHost;
+
+/**
+ * This interface is implemented by each IPMI responder device (KCS, BT, PCI,
+ * etc.) An IPMI host device uses it to transfer data to the emulated BMC.
+ */
+typedef struct IPMIResponder IPMIResponder;
+
+/**
+ * struct IPMIResponderClass implemented by an IPMI responder device like KCS to
+ * handle commands from connected IPMI host device.
+ * @get_host: Return the IPMI host (e.g. ipmi-host-extern) that uses this
+ *  responder.
+ * @set_host: Set the IPMI host (e.g. ipmi-host-extern) that uses this
+ *  responder.
+ * @get_backend_data: Return the backend device (e.g. KCS, BT) of the
+ *  corresponding responder.
+ * @handle_req: The IPMI Host device calls this function when it receives a sane
+ *  IPMI message. A responder should handle this message.
+ */
+typedef struct IPMIResponderClass {
+    InterfaceClass parent;
+
+    struct IPMIHost *(*get_host)(struct IPMIResponder *s);
+
+    void (*set_host)(struct IPMIResponder *s, struct IPMIHost *h);
+
+    void *(*get_backend_data)(struct IPMIResponder *s);
+
+    void (*handle_req)(struct IPMIResponder *s, uint8_t msg_id,
+            unsigned char *req, unsigned req_len);
+} IPMIResponderClass;
+
+#endif /* HW_IPMI_RESPONDER_H */
-- 
2.29.2.684.gfbc64c5ab5-goog


