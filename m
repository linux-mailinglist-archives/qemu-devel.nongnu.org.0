Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B193C3F3F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:40:31 +0200 (CEST)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gFa-0006R9-JU
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3a-0004YC-Tn; Sun, 11 Jul 2021 16:28:07 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3X-00033E-Vf; Sun, 11 Jul 2021 16:28:06 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3B2723200201;
 Sun, 11 Jul 2021 16:28:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 11 Jul 2021 16:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=p628K/cVIOKqD
 l9bgic2q9Dr8HRS2yD8wYlwNPoN++A=; b=QFlLDumfqJ0B66mSv1/nR9ptVA0X5
 5fcHWRQ8o+os5KozZ92pquomuzBA/jpVPGG6fBj6b06hg0i8vEgkVybG2h55u/NR
 3C2T9qDHTnewA52XJudGC3xuPOfD2VPy5GIOk27PPikvfCgianKGCiwyTyBom/Iz
 zZA252JZn1qpnAIfKH+h8L6srib4NQD8VNXy7zl8Rfe3pdQuV7Hsfc160aaJVYm3
 u9oXF2753GCV8khfVcvdQ4f5KyHKEMImiM+/2SGCjV5xMFs5e3QSRS8DNpPzj/I4
 8Io1kjTHx2j+unSY9f1LjkTQnCahjFkmSdCkkW0ftEa3jnQ7YdDPw1cew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=p628K/cVIOKqDl9bgic2q9Dr8HRS2yD8wYlwNPoN++A=; b=al9NYAp1
 SRnCewv3d5J5OOtjKgWn5nqowcfYyUDJt+XzSb1A7sRpQwq96cUjkY4g4hZBvNrs
 Tsmqd6CyQEj9+hWXjmqQFTmtp2+UFRMZYZYmWFXJvZMa0rzTc/B3dpRh+m1V2nr2
 c/CTor2Fu8f6vxf6ivhMLGKB/lYVw5R2gENbrU1gr41ohlRjjE+O2lWO8NCSBMFK
 bNBkwZoMeib46xc+/iaS4GtpzNY4Ee43tpPrfGCSF8xjptlaGRqVUoMgr7UkjCm7
 /etPWuV7uHruwipsY4mS7ugkKa+7qlUtHS3azOLHjuAQZAU1MXNlNABB4r0BKdlH
 ezRrxa8TnHT82A==
X-ME-Sender: <xms:UVTrYJNAetcfIJvrwWz-z-S5bR0tpppa9-NykrefyyqSCkE433HZ4Q>
 <xme:UVTrYL-si95HixFC7naEKYtWrMSsia1Dgh0jc5Z0rkPqvF47tEkU5p3W3wS-807mn
 6amRONxyXCjEHOxbCs>
X-ME-Received: <xmr:UVTrYIR_IBjhe5dUeJBZj3DMM3zgRJhAZPEKgBMZAxYb1xUMlnkc0gbnqlXCgdSO-xxDzPrv8B1CmFAgyC57Uw5t9jtnqq2DD1jz4jVK3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtgddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:UVTrYFtP-sLLvv32-UPwV3VAHXNxd6W7w2eXDm1s1hDY6W9hWZu0oA>
 <xmx:UVTrYBdQBzbglM1cO25GIHwu7rF_YFz0REj5EofDHdKhHdVggc6HTg>
 <xmx:UVTrYB1gLNuxj_yULrug9_xFhS-lf86AzPmvZM9zYsQm6EiyTNJVmg>
 <xmx:UVTrYKGR4u_D4xCso2HjLZZZgvUYXWAe-nlcRSaaeZhGXBzCOlFNgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jul 2021 16:27:59 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/6] hw/nvme: fix controller hot unplugging
Date: Sun, 11 Jul 2021 22:27:36 +0200
Message-Id: <20210711202736.591334-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711202736.591334-1-its@irrelevant.dk>
References: <20210711202736.591334-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Prior to this patch the nvme-ns devices are always children of the
NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
unrealized when the parent device is removed. However, when subsystems
are involved, this is not what we want since the namespaces may be
attached to other controllers as well.

This patch adds an additional NvmeBus on the subsystem device. When
nvme-ns devices are realized, if the parent controller device is linked
to a subsystem, the parent bus is set to the subsystem one instead. This
makes sure that namespaces are kept alive and not unrealized.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h   | 15 ++++++++-------
 hw/nvme/ctrl.c   | 14 ++++++--------
 hw/nvme/ns.c     | 18 ++++++++++++++++++
 hw/nvme/subsys.c |  3 +++
 4 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index c4065467d877..83ffabade4cf 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -33,12 +33,20 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
 
+#define TYPE_NVME_BUS "nvme-bus"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
+
+typedef struct NvmeBus {
+    BusState parent_bus;
+} NvmeBus;
+
 #define TYPE_NVME_SUBSYS "nvme-subsys"
 #define NVME_SUBSYS(obj) \
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 
 typedef struct NvmeSubsystem {
     DeviceState parent_obj;
+    NvmeBus     bus;
     uint8_t     subnqn[256];
 
     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
@@ -365,13 +373,6 @@ typedef struct NvmeCQueue {
     QTAILQ_HEAD(, NvmeRequest) req_list;
 } NvmeCQueue;
 
-#define TYPE_NVME_BUS "nvme-bus"
-#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
-
-typedef struct NvmeBus {
-    BusState parent_bus;
-} NvmeBus;
-
 #define TYPE_NVME "nvme"
 #define NVME(obj) \
         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index ead7531bde5e..2f0524e12a36 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6527,16 +6527,14 @@ static void nvme_exit(PCIDevice *pci_dev)
 
     nvme_ctrl_reset(n);
 
-    for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
-        ns = nvme_ns(n, i);
-        if (!ns) {
-            continue;
+    if (n->subsys) {
+        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+            ns = nvme_ns(n, i);
+            if (ns) {
+                ns->attached--;
+            }
         }
 
-        nvme_ns_cleanup(ns);
-    }
-
-    if (n->subsys) {
         nvme_subsys_unregister_ctrl(n->subsys, n);
     }
 
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 3c4f5b8c714a..b7cf1494e75b 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -441,6 +441,15 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
     }
 }
 
+static void nvme_ns_unrealize(DeviceState *dev)
+{
+    NvmeNamespace *ns = NVME_NS(dev);
+
+    nvme_ns_drain(ns);
+    nvme_ns_shutdown(ns);
+    nvme_ns_cleanup(ns);
+}
+
 static void nvme_ns_realize(DeviceState *dev, Error **errp)
 {
     NvmeNamespace *ns = NVME_NS(dev);
@@ -462,6 +471,14 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
                        "linked to an nvme-subsys device");
             return;
         }
+    } else {
+        /*
+         * If this namespace belongs to a subsystem (through a link on the
+         * controller device), reparent the device.
+         */
+        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
+            return;
+        }
     }
 
     if (nvme_ns_setup(ns, errp)) {
@@ -552,6 +569,7 @@ static void nvme_ns_class_init(ObjectClass *oc, void *data)
 
     dc->bus_type = TYPE_NVME_BUS;
     dc->realize = nvme_ns_realize;
+    dc->unrealize = nvme_ns_unrealize;
     device_class_set_props(dc, nvme_ns_props);
     dc->desc = "Virtual NVMe namespace";
 }
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 92caa604a280..93c35950d69d 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -50,6 +50,9 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
 {
     NvmeSubsystem *subsys = NVME_SUBSYS(dev);
 
+    qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
+                        dev->id);
+
     nvme_subsys_setup(subsys);
 }
 
-- 
2.32.0


