Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42133246E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:51:23 +0100 (CET)
Received: from localhost ([::1]:60934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJatW-0002bL-MT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanq-0008C8-Iw; Tue, 09 Mar 2021 06:45:30 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:55985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanj-0008RI-BE; Tue, 09 Mar 2021 06:45:30 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id C597E2705;
 Tue,  9 Mar 2021 06:45:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 09 Mar 2021 06:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zIy3kiHxQ2O5o
 5FnX7H5rOh8QOlkpl4fovEBrQep1tQ=; b=myngSvTL7qc2whkxpAEDLfA3G7b0v
 /+RxbGJPeY+Xi2DxErYqzDq2sW2CweFWEQG4eY5DdM+SrAGuI+WR0eqMJHDnJNxy
 OdgJDk+DWxc9eIaXkBLoG+ffdiZMJzXR7NwYh0tieJtPo3m1A94aujCZXGDgJUFM
 T2wDc6NkzGwCkzOavQrtKRtWnUDYbrUvCT9uAfeiHgC+JestZ9Ew0aR1sLQjLOFo
 D3ehmfwkN2cqcDTdvRNWrbOSdoXBjnDxFoVMHj8ceT2aalJlA6qRCSxpHAj/C9D6
 t+yew3evwxXD63ZqJxhYFrdGBRERkfBFwaeWwurN0T0IOWjpCZiL48dwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zIy3kiHxQ2O5o5FnX7H5rOh8QOlkpl4fovEBrQep1tQ=; b=rxzw6smQ
 N9dik13hOzyaWKSQRBpCVnHznXqE9si/U6yq/UQZcOugFGGFnhzipo0LFxhWgtXT
 j9pcKBcksT1t5FKgnQgY80QUsZQlWAOqMlAk8X+WRK4t+6UzmPmJu9+REwcgd9UY
 PLpZZviA/3LfEQiowhESlsNgOZywpRfeYJeV3yVTGb6vrdEkvkn9yPEl5dUKiark
 OCHSoTkI1SHIjDSw5HtgdRbewa95HdVpknZqyZd8cg0uV04E8Szgk87c3lGQ0ZuF
 lT1FmU1T1LutLTFszMzGlrtRgZf1XbjtqQ1+FWU9RSV2Uj+8Ysec8nhMsO16MB5N
 UWSwCgIWGI7wtQ==
X-ME-Sender: <xms:zV9HYJLEWjjgSM_ggxPiAxfdBkuZMdA9TdpXWiCpKIY891GrHyOgNA>
 <xme:zV9HYBfLgx_iK213zztmNxUdwMNkmPm35h90JElfaq95j_0RNO8D4ZC4GzpSM7sMo
 WZ-Wiv3L7kAefJ2YtM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeltdetfeegkefguedvtdduffejiedvjeejudejieelveekhfekvdefleeludev
 ffenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:zV9HYEcsxw3phWWXXNVytWRvfODINWJb-qeF_3722oOyejZT2_FRQw>
 <xmx:zV9HYMNDnQsJuXU5hFaDzfblXASdh9gwCSmnwAfa5B4B9DbauBg4zw>
 <xmx:zV9HYDIC5AL0Qxt7msNHyYeVhaLQFZgXRKfRkNYp4Qck3V2Ag7BFSQ>
 <xmx:zl9HYEk4rPzSIMnXrOOyt6qY478Nto85HjmoFgupV12YCrAlQWY0jieKpGk>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59B6924005A;
 Tue,  9 Mar 2021 06:45:16 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 01/38] hw/block/nvme: introduce nvme-subsys device
Date: Tue,  9 Mar 2021 12:44:35 +0100
Message-Id: <20210309114512.536489-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

To support multi-path in QEMU NVMe device model, We need to have NVMe
subsystem hierarchy to map controllers and namespaces to a NVMe
subsystem.

This patch introduced a simple nvme-subsys device model.  The subsystem
will be prepared with subsystem NQN with <subsys_id> provided in
nvme-subsys device:

  ex) -device nvme-subsys,id=subsys0: nqn.2019-08.org.qemu:subsys0

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
[k.jensen: added 'nqn' device parameter per request]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 29 +++++++++++++++++
 hw/block/nvme-subsys.c | 70 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.c        | 12 ++++++++
 hw/block/meson.build   |  2 +-
 4 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 hw/block/nvme-subsys.h
 create mode 100644 hw/block/nvme-subsys.c

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
new file mode 100644
index 000000000000..fc86d01ff32e
--- /dev/null
+++ b/hw/block/nvme-subsys.h
@@ -0,0 +1,29 @@
+/*
+ * QEMU NVM Express Subsystem: nvme-subsys
+ *
+ * Copyright (c) 2021 Minwoo Im <minwoo.im.dev@gmail.com>
+ *
+ * This code is licensed under the GNU GPL v2.  Refer COPYING.
+ */
+
+#ifndef NVME_SUBSYS_H
+#define NVME_SUBSYS_H
+
+#define TYPE_NVME_SUBSYS "nvme-subsys"
+#define NVME_SUBSYS(obj) \
+    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
+
+#define NVME_SUBSYS_MAX_CTRLS   32
+
+typedef struct NvmeCtrl NvmeCtrl;
+typedef struct NvmeNamespace NvmeNamespace;
+typedef struct NvmeSubsystem {
+    DeviceState parent_obj;
+    uint8_t     subnqn[256];
+
+    struct {
+        char *nqn;
+    } params;
+} NvmeSubsystem;
+
+#endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
new file mode 100644
index 000000000000..840448bb13f1
--- /dev/null
+++ b/hw/block/nvme-subsys.c
@@ -0,0 +1,70 @@
+/*
+ * QEMU NVM Express Subsystem: nvme-subsys
+ *
+ * Copyright (c) 2021 Minwoo Im <minwoo.im.dev@gmail.com>
+ *
+ * This code is licensed under the GNU GPL v2.  Refer COPYING.
+ */
+
+#include "qemu/units.h"
+#include "qemu/osdep.h"
+#include "qemu/uuid.h"
+#include "qemu/iov.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-core.h"
+#include "hw/block/block.h"
+#include "block/aio.h"
+#include "block/accounting.h"
+#include "sysemu/sysemu.h"
+#include "hw/pci/pci.h"
+#include "nvme.h"
+#include "nvme-subsys.h"
+
+static void nvme_subsys_setup(NvmeSubsystem *subsys)
+{
+    const char *nqn = subsys->params.nqn ?
+        subsys->params.nqn : subsys->parent_obj.id;
+
+    snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
+             "nqn.2019-08.org.qemu:%s", nqn);
+}
+
+static void nvme_subsys_realize(DeviceState *dev, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYS(dev);
+
+    nvme_subsys_setup(subsys);
+}
+
+static Property nvme_subsystem_props[] = {
+    DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void nvme_subsys_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+
+    dc->realize = nvme_subsys_realize;
+    dc->desc = "Virtual NVMe subsystem";
+
+    device_class_set_props(dc, nvme_subsystem_props);
+}
+
+static const TypeInfo nvme_subsys_info = {
+    .name = TYPE_NVME_SUBSYS,
+    .parent = TYPE_DEVICE,
+    .class_init = nvme_subsys_class_init,
+    .instance_size = sizeof(NvmeSubsystem),
+};
+
+static void nvme_subsys_register_types(void)
+{
+    type_register_static(&nvme_subsys_info);
+}
+
+type_init(nvme_subsys_register_types)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index fb83636abdc1..98bd987abccf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -17,6 +17,7 @@
 /**
  * Usage: add options:
  *      -drive file=<file>,if=none,id=<drive_id>
+ *      -device nvme-subsys,id=<subsys_id>,nqn=<nqn_id>
  *      -device nvme,serial=<serial>,id=<bus_name>, \
  *              cmb_size_mb=<cmb_size_mb[optional]>, \
  *              [pmrdev=<mem_backend_file_id>,] \
@@ -38,6 +39,17 @@
  *
  * The PMR will use BAR 4/5 exclusively.
  *
+ * To place controller(s) and namespace(s) to a subsystem, then provide
+ * nvme-subsys device as above.
+ *
+ * nvme subsystem device parameters
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * - `nqn`
+ *   This parameter provides the `<nqn_id>` part of the string
+ *   `nqn.2019-08.org.qemu:<nqn_id>` which will be reported in the SUBNQN field
+ *   of subsystem controllers. Note that `<nqn_id>` should be unique per
+ *   subsystem, but this is not enforced by QEMU. If not specified, it will
+ *   default to the value of the `id` parameter (`<subsys_id>`).
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 4bf994c64ff9..549282915521 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -13,7 +13,7 @@ softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c'))
+softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c', 'nvme-subsys.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
 specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
-- 
2.30.1


