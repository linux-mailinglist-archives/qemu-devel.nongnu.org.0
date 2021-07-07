Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0A3BEBA3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:54:34 +0200 (CEST)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19sf-0003Gl-3c
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o8-0000G8-St; Wed, 07 Jul 2021 11:49:52 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:60637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o7-0003FD-2g; Wed, 07 Jul 2021 11:49:52 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 76DBE320092A;
 Wed,  7 Jul 2021 11:49:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Jul 2021 11:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=f96GloyJtJkES
 4IPk+tH83JNqctMesbeU/r25oDSgGM=; b=AInOLFrm9cd5o6UgmbcMfWfr0sjfV
 APNmgS3aeWW8nqkKDIR8+MHPelciGZb7dyvcaZ2IN5K6jrArN+GrJZ2PvGwmEavt
 3LOZDWruwegXEqtHWBLR+l6Qf2ZbSUTOaWC/Cmf0wHqpAH/mbgMaMIgp+kxgIibW
 yy1Cnp9YMo2OVkqMrJDQt4lXb5cY6NVU+3inwiP7oF+j+2NSIQmpvd2iW13f3wsG
 gx+QJI4JtuJeQ5DJqLCe1gfICCjfvh0L5fDrdCWTjiRk3RBvy/VUA7djYG+JnVTe
 IO/qDF5Hyra0oHBom9bO7AR5rxAQ5AQrFqD+YaQfBV6Ty+MWUpBli74lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=f96GloyJtJkES4IPk+tH83JNqctMesbeU/r25oDSgGM=; b=ZTI7tB4Q
 KffunmHI4wiUto35HuLrDpHDxYDpL4i0e/Fj5LMJOT73Mm3buWOkvODlCODsT6nV
 CtXThGx/IbzJ0HlQUCT/K0j277nIMicSpSDCpWITJCeUE7I5KsbBd1SpevfVkDDA
 3pWPX0F7gMgCdjqg1zyXAlQXBoX4eBeVTYZNKHZ1kLak6ACqFw1Reja/J60T02rK
 4MwKfxfAhQg6aDvI94CbNxqYoVM8LsiX6LvViWOv9s5xpZmIzaHAp6fjd8KxhiHG
 BkKyqJzAaUY6rycAZAdENg8/8NJsLV0sGS5QZqUl08tSSrT5HqmCJGCaHk8C9hNy
 PR9h1SoFVs/cBw==
X-ME-Sender: <xms:Hc3lYDjtczB-IJvyRFY56mZoOCEbW2MPs9cwLhQfoL5gCfbdcxy5ug>
 <xme:Hc3lYABtElC7WIMGVptLwAgdN3ZBFAhqp37_ynB12J51W2g2R5WEMnzxptalwfv6S
 arrDs-u5PsD_Amzs9g>
X-ME-Received: <xmr:Hc3lYDHBJhl-3Pt-I-S_uEwIiX2B3pZ4cg4rCx0dhS-5B7QFjnMjvqWEDrCxlEafG_oUStD-W4Gw-MNYeXS-XnKv_QylHiqkoQVBwCDnLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Hc3lYAS0IWO4cx_w5h-FLjma7BXb5QCUBIJ5y5UN34R7HDiIzgJAaw>
 <xmx:Hc3lYAwCCSVrUgP69bPWbFeh8EaxGESkXfAZsyxLDmPTphYOPO6QWQ>
 <xmx:Hc3lYG5Do6gkTny6A_9DgfPo2wh1Jpw_PN3nea6Cg6EL9v40vkzQ2w>
 <xmx:Hc3lYKs5HSD1t2k9yU8nVedAkQ5bqZu_ciOG72IqlB6AflycZvDgyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 11:49:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/nvme: fix controller hot unplugging
Date: Wed,  7 Jul 2021 17:49:36 +0200
Message-Id: <20210707154936.200166-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707154936.200166-1-its@irrelevant.dk>
References: <20210707154936.200166-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
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
index 90e3ee2b70ee..9a3b3a27c293 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6514,16 +6514,14 @@ static void nvme_exit(PCIDevice *pci_dev)
 
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


