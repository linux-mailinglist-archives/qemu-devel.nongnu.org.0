Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B83BC8A9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:48:49 +0200 (CEST)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hhA-0003lj-BP
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hTC-0000ik-BN; Tue, 06 Jul 2021 05:34:22 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hT7-0000iF-B7; Tue, 06 Jul 2021 05:34:22 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1981F320097A;
 Tue,  6 Jul 2021 05:34:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 05:34:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=SL3y1mMpJjfyY
 hN5UakgCbwsfdHKdoKGx0LJ4YmG/cE=; b=Xqg56m0DnxLAUX0NiHwCLouRW7Y7X
 Ya6ACd3K9ow9LWVizLGgxV0IvmeH2Nvpg0Nt45EvO8XYrqo2nyX6ptnZM5jFlakK
 iSkkU33D3Zrm1SEOuTHciRhUc34dyoPoNDXoFhnOgpkl0oKXPpHvglP9pv0vCJdD
 cben2EZBlBp43/HmuEQ+3w4qK/0qLnZI16yRfaPk5C78f/d8KDf7z1pqeMqdILqk
 wGOtRXlAzhjgUYsEyeWe/jyPtQVMMZwHhWXmt7NED5JveZ2w/7yTGUdMnIU7Mhhz
 ZzEEFoijAveww6gUwBhApW8HCpqQoRttEiUggP8cfZY1pMKAKuCnCLLmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=SL3y1mMpJjfyYhN5UakgCbwsfdHKdoKGx0LJ4YmG/cE=; b=I2QMPhpA
 rWov7vBlvSB7L9YoHFk5GAAhepW6YivPaBINnShaXCWeRGwWdMkTULTSQD79KzrU
 IV1Rr1oLRolJ4C0xvO9ye0khVSFHzvO/SqmW/BzDheq+1HQzX+ltbxZUGzdR4mCw
 +/U1I+S06FIe1k9gQTgsTlIHAxRnkWfDbXkc7VeJWK2Jd/uFTOl9myvtEz7jAZ1h
 crb4uzCyeSOP2mxvb1955tlDfLFEGAdxYme4cPwLo54PHelmK4r4Gh1MaF+Slul/
 9mTcz9JPTWt4FsyX/n2ZnTspsobyLZq1z4IDuFpb4luyBwQsF5XSj2gyjrovQlle
 h24zZtURsguL4w==
X-ME-Sender: <xms:kyPkYBokEWfmbRdbWB_adnRKgxdgJOQe8EwAiwGV800wuT_KS_CcSw>
 <xme:kyPkYDrXqWQjVo5oH3L57IS2_TqTyT4S4rl6xKNPzsT70YrhZEwhnlQbCEf5PdXR5
 RuIPJFyHGUfR7qLZ4A>
X-ME-Received: <xmr:kyPkYOMXhyB3DO29FCW7wD6xYb4flAmYgsXHNuCkeQBDpKuqf9Hsp-7lqSJLnNcf3AYLQg34j0ToB3W6f7_Hiwth10Qhm9iklB6f2ld3PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:kyPkYM6JIl2y5sz2_XIiUFPWoVvWD8C8WElHbm4Am_NPDYq0td8IAg>
 <xmx:kyPkYA6Fr5nTxtDMzPrJpYXrfsEeesQDW9lu1EFp_KxLpW3vnXTcRA>
 <xmx:kyPkYEjXFG_-mHOPbs-xxHbT30SSb2SaWs3BNwG18Zh_JXgoMWkuew>
 <xmx:kyPkYL1x7ra0C_ruSH9LTKzSuKDbXVtKBA6P7rgG4pPs1i5uaGUjNw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 05:34:10 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/nvme: fix controller hot unplugging
Date: Tue,  6 Jul 2021 11:33:58 +0200
Message-Id: <20210706093358.1036387-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706093358.1036387-1-its@irrelevant.dk>
References: <20210706093358.1036387-1-its@irrelevant.dk>
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

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h   | 18 ++++++++++--------
 hw/nvme/ctrl.c   |  8 +++++---
 hw/nvme/ns.c     | 32 +++++++++++++++++++++++++-------
 hw/nvme/subsys.c |  4 ++++
 4 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index c4065467d877..9401e212f9f7 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -33,12 +33,21 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
 
+#define TYPE_NVME_BUS "nvme-bus"
+OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
+
+typedef struct NvmeBus {
+    BusState parent_bus;
+    bool     is_subsys;
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
@@ -365,13 +374,6 @@ typedef struct NvmeCQueue {
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
@@ -463,7 +465,7 @@ typedef struct NvmeCtrl {
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
 {
-    if (!nsid || nsid > NVME_MAX_NAMESPACES) {
+    if (!n || !nsid || nsid > NVME_MAX_NAMESPACES) {
         return NULL;
     }
 
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 90e3ee2b70ee..7c8fca36d9a5 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6516,11 +6516,13 @@ static void nvme_exit(PCIDevice *pci_dev)
 
     for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
         ns = nvme_ns(n, i);
-        if (!ns) {
-            continue;
+        if (ns) {
+            ns->attached--;
         }
+    }
 
-        nvme_ns_cleanup(ns);
+    if (n->subsys) {
+        nvme_subsys_unregister_ctrl(n->subsys, n);
     }
 
     if (n->subsys) {
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 3c4f5b8c714a..612a2786d75d 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -444,13 +444,29 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
 static void nvme_ns_realize(DeviceState *dev, Error **errp)
 {
     NvmeNamespace *ns = NVME_NS(dev);
-    BusState *s = qdev_get_parent_bus(dev);
-    NvmeCtrl *n = NVME(s->parent);
-    NvmeSubsystem *subsys = n->subsys;
+    BusState *qbus = qdev_get_parent_bus(dev);
+    NvmeBus *bus = NVME_BUS(qbus);
+    NvmeCtrl *n = NULL;
+    NvmeSubsystem *subsys = NULL;
     uint32_t nsid = ns->params.nsid;
     int i;
 
-    if (!n->subsys) {
+    if (bus->is_subsys) {
+        subsys = NVME_SUBSYS(qbus->parent);
+    } else {
+        n = NVME(qbus->parent);
+        subsys = n->subsys;
+    }
+
+    if (subsys) {
+        /*
+         * If this namespace belongs to a subsystem (through a link on the
+         * controller device), reparent the device.
+         */
+        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
+            return;
+        }
+    } else {
         if (ns->params.detached) {
             error_setg(errp, "detached requires that the nvme device is "
                        "linked to an nvme-subsys device");
@@ -470,7 +486,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 
     if (!nsid) {
         for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
-            if (nvme_ns(n, i) || nvme_subsys_ns(subsys, i)) {
+            if (nvme_subsys_ns(subsys, i) || nvme_ns(n, i)) {
                 continue;
             }
 
@@ -483,7 +499,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
             return;
         }
     } else {
-        if (nvme_ns(n, nsid) || nvme_subsys_ns(subsys, nsid)) {
+        if (nvme_subsys_ns(subsys, nsid) || nvme_ns(n, nsid)) {
             error_setg(errp, "namespace id '%d' already allocated", nsid);
             return;
         }
@@ -509,7 +525,9 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    nvme_attach_ns(n, ns);
+    if (n) {
+        nvme_attach_ns(n, ns);
+    }
 }
 
 static Property nvme_ns_props[] = {
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 92caa604a280..fb7c3a7c55fc 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -50,6 +50,10 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
 {
     NvmeSubsystem *subsys = NVME_SUBSYS(dev);
 
+    qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
+                        dev->id);
+    subsys->bus.is_subsys = true;
+
     nvme_subsys_setup(subsys);
 }
 
-- 
2.32.0


