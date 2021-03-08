Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F410E330D70
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:28:06 +0100 (CET)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEzV-00056B-TI
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv1-0002yK-Rx; Mon, 08 Mar 2021 07:23:27 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:53727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEuv-0006rf-74; Mon, 08 Mar 2021 07:23:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 68F2D36CD;
 Mon,  8 Mar 2021 07:23:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=UzwDN883I+ZAg
 QWtgp5K2b8nTeqQITwZlIT/b700PVA=; b=1DZ5dOOqTz9jOJc2gtmpL5oy8ifNf
 nVss8TLsq9h0NGlV9PqMNp9eSRODnICxyXx2P9NEL30N12wRq0nM49pZWnq+95HT
 XRoGoYe1aAQwhjYmv2fuzzPF0e9l2h5sTHbUpikhyZAJSwTY+XzZQuOZPTVma/iy
 CplujVZgZVCMDzK3UzHCbZOgaGsDIAy+bt7wmTdIg3HG77J+JlN4+dTRfU00IcuT
 ehXib8ypehWjaNaec54GZZcSGLfgnO++bj4yZsCh8a9NBoYHNptO5fJ2qD9HzoAZ
 m/ipG3WhjzgxnHzYYpZfJx/Q9XEmEmfxJXzcEav5bOqLapxravZhNEsuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=UzwDN883I+ZAgQWtgp5K2b8nTeqQITwZlIT/b700PVA=; b=DlN/wW/4
 /foits4jml0jA4oomfq3selLX7Wa9CpML9wh+57PVLKVAwVuEhaNx0mDkBuw4tng
 4fl1eUJWcKhtUD9qmyfsOuLzQ6YgjngOgWaya9L+eZX/d7kosDnGhib2SVR2JWfy
 EitzjhiRtPwgIlHAomfOIgrFptQm0MWtKCX4H9w220hJfdggNKJGAPn0s/hFIf19
 YhKr2iQxRSX47DQDKwZdcbx5woQeajPiVP4rJtx6Ij6oS7c4drlyOvGmMNo+72LI
 h+vXqN0cS5IXxs7t8VqVyniPLEWeEODbZdbPMCnlYdKgICHUmqkEIMnWfmit00tL
 Ga6frJf8CpE+vg==
X-ME-Sender: <xms:NRdGYEP-Epyhze7MZat0ltpMlK6TWeRtWJrIvr6XPIjPPAOdJRElQA>
 <xme:NRdGYF6TepN3T3ty0GWEouVYCCkRHnjQStXxz2G4PZ0uVaOY-8htwpu9jlJWVTkws
 YMVs8CGZMDTayBAG_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeltdetfeegkefguedvtdduffejiedvjeejudejieelveekhfekvdefleeludev
 ffenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NRdGYKSpR1gDxbdFLSlwwTJ66Sx-a4mrpBbMSrsXMHUxz9uLGRcmig>
 <xmx:NRdGYCCX6pLIt61rYM_YdN2ZoahBULwt9poobjtEY5Ngl9hZODBNhA>
 <xmx:NRdGYKH0bE7D34ZbLnbo0teNWvuq8ZFb3k9noZMcU4Cqbp-etU6XAQ>
 <xmx:NhdGYO-8CGrDikDYUaG3i8BkJeIbSB8wAk0c5og0_r-tgQ06rznqNOO3UdM>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 753AC1080066;
 Mon,  8 Mar 2021 07:23:16 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 01/38] hw/block/nvme: introduce nvme-subsys device
Date: Mon,  8 Mar 2021 13:22:36 +0100
Message-Id: <20210308122313.286938-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 25 ++++++++++++++++++
 hw/block/nvme-subsys.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.c        |  3 +++
 hw/block/meson.build   |  2 +-
 4 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 hw/block/nvme-subsys.h
 create mode 100644 hw/block/nvme-subsys.c

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
new file mode 100644
index 000000000000..40f06a4c7db0
--- /dev/null
+++ b/hw/block/nvme-subsys.h
@@ -0,0 +1,25 @@
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
+} NvmeSubsystem;
+
+#endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
new file mode 100644
index 000000000000..aa82911b951c
--- /dev/null
+++ b/hw/block/nvme-subsys.c
@@ -0,0 +1,60 @@
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
+    snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
+             "nqn.2019-08.org.qemu:%s", subsys->parent_obj.id);
+}
+
+static void nvme_subsys_realize(DeviceState *dev, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYS(dev);
+
+    nvme_subsys_setup(subsys);
+}
+
+static void nvme_subsys_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+
+    dc->realize = nvme_subsys_realize;
+    dc->desc = "Virtual NVMe subsystem";
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
index fb83636abdc1..1950b34684cd 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -25,6 +25,7 @@
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>
+ *      -device nvme-subsys,id=<subsys_id>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now. By default, the
@@ -38,6 +39,8 @@
  *
  * The PMR will use BAR 4/5 exclusively.
  *
+ * To place controller(s) and namespace(s) to a subsystem, then provide
+ * nvme-subsys device as above.
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 602ca6c8541d..83ea2d37978d 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -13,7 +13,7 @@ softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('tc58128.c'))
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c'))
+softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c', 'nvme-subsys.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
 specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
-- 
2.30.1


