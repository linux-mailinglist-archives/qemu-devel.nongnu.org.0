Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20833BC8A4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:45:47 +0200 (CEST)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0heE-0000D2-If
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hTE-0000m7-VW; Tue, 06 Jul 2021 05:34:24 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:43323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hT1-0000dG-4n; Tue, 06 Jul 2021 05:34:24 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D01A13200978;
 Tue,  6 Jul 2021 05:34:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 05:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+Jh+0m+XuAsq5
 5neFvCxnMdPNlH3OZPB+bgtvoEg4xU=; b=lKlzge3SvJkk+LizzouONiXZkz3ld
 vIcWivnt/iMCfXXbVkmcKkuGMQm4fn7seipZx8D9wQCM1PIuAreZ+qsZ31/pOg1d
 34yqN9eVO78cDlYFIaJLnON1Fk36N+XtgrqijGNM5xoPYcKRH/Jy+N2Sf+yb5CI8
 Bt9WkJaXWbaT5qHT8DMZ0XGvcnAlzWS6yTYl5krAZWuQd2JKqXCP+FUhZ5SL7L/G
 xKLvUFlO6p3sK7M8if71rR/i4xxxZKhz+m3gd0mw0MkTUN7NO5nrwFm/0SDauUWU
 oPfClzWM2ahnGv+ZQZvU1EZHJ9piDcfEBtkUnQRocoPw1MxXk9Ax9EI2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+Jh+0m+XuAsq55neFvCxnMdPNlH3OZPB+bgtvoEg4xU=; b=Hr1U3cCr
 maGq0YOEX2yI0/ctD3pWt0bURd8RdkFUmXwv22DPUtciH7SfHdjxcgihhiFkiGV/
 y5yV+tBRdU44vgXZjLAlQTGQIvXdIHZK2Ux2lnQtmwKkIovrSrZhRqDVfwCKHnyw
 GZfLluR/uP8lmna7rGW82K5xrnTdLwkODnVpzMp9UmVg5cNe58Sre8QOi99whNuj
 ydEYoqkHQJw6LQq6fJqM+xGMIJiP7FxU07fBXoujMwAGC+F3Y1YQVTIaKH3DEIw5
 KShtoUOSllqnjIZMRtTZc+r2q3/S5VX0WnqDijxsWIWm8AXyumfX7LUkv8ApGcxW
 ulrBDxoGMOa1ag==
X-ME-Sender: <xms:jSPkYEmJ74J2znqIFKX4qrLvI5fGxnSloZP5SKEdX-d1MfgbTNaPOg>
 <xme:jSPkYD0mlxo0xbMT5sAEuQ2skSTcmR6Nl39YnVSGKXaGWh5J2-DUEuOKP6uWI7IMF
 zGavnjpoJ3QuxFQLq8>
X-ME-Received: <xmr:jSPkYCpuUjz-0kU3iP8bMSxRCdbrnm3bfX47-2oTvgj-fsAr9O-J-rZMNjfzj2Fqny8aPlPMs6kPgHtko6EszQ1uCmuUqeKyoSMUzQsO3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:jSPkYAkQrv3bJJcpToH_4XPPfw1P5WVcby3fKKCE1wtri54KhyjnYQ>
 <xmx:jSPkYC2uFDhzLfE58gqqvfqTrIerOwSr0pBNg7olPCn1NgusCbxBWA>
 <xmx:jSPkYHszrY0ugCzoI40dkWmE5oJ016wIosxjUT1NdjBctsfgLh3tqQ>
 <xmx:jSPkYFSle6bhY2LGeFNDEf5ACs_wHK_HMo_E79f2-pt0cfhYbB2Q4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 05:34:04 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/nvme: remove NvmeCtrl parameter from ns setup/check
 functions
Date: Tue,  6 Jul 2021 11:33:55 +0200
Message-Id: <20210706093358.1036387-2-its@irrelevant.dk>
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

The nvme_ns_setup and nvme_ns_check_constraints should not depend on the
controller state. Refactor and remove it.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h |  2 +-
 hw/nvme/ctrl.c |  2 +-
 hw/nvme/ns.c   | 37 ++++++++++++++++++-------------------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 56f8eceed2ad..0868359a1e86 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -246,7 +246,7 @@ static inline void nvme_aor_dec_active(NvmeNamespace *ns)
 }
 
 void nvme_ns_init_format(NvmeNamespace *ns);
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 629b0d38c2a2..dd1801510032 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6498,7 +6498,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         ns = &n->namespace;
         ns->params.nsid = 1;
 
-        if (nvme_ns_setup(n, ns, errp)) {
+        if (nvme_ns_setup(ns, errp)) {
             return;
         }
 
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 4275c3db6301..3c4f5b8c714a 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -346,8 +346,7 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
     assert(ns->nr_open_zones == 0);
 }
 
-static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
-                                     Error **errp)
+static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
 {
     if (!ns->blkconf.blk) {
         error_setg(errp, "block backend not configured");
@@ -366,20 +365,6 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
         return -1;
     }
 
-    if (!n->subsys) {
-        if (ns->params.detached) {
-            error_setg(errp, "detached requires that the nvme device is "
-                       "linked to an nvme-subsys device");
-            return -1;
-        }
-
-        if (ns->params.shared) {
-            error_setg(errp, "shared requires that the nvme device is "
-                       "linked to an nvme-subsys device");
-            return -1;
-        }
-    }
-
     if (ns->params.zoned) {
         if (ns->params.max_active_zones) {
             if (ns->params.max_open_zones > ns->params.max_active_zones) {
@@ -411,9 +396,9 @@ static int nvme_ns_check_constraints(NvmeCtrl *n, NvmeNamespace *ns,
     return 0;
 }
 
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 {
-    if (nvme_ns_check_constraints(n, ns, errp)) {
+    if (nvme_ns_check_constraints(ns, errp)) {
         return -1;
     }
 
@@ -465,7 +450,21 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     uint32_t nsid = ns->params.nsid;
     int i;
 
-    if (nvme_ns_setup(n, ns, errp)) {
+    if (!n->subsys) {
+        if (ns->params.detached) {
+            error_setg(errp, "detached requires that the nvme device is "
+                       "linked to an nvme-subsys device");
+            return;
+        }
+
+        if (ns->params.shared) {
+            error_setg(errp, "shared requires that the nvme device is "
+                       "linked to an nvme-subsys device");
+            return;
+        }
+    }
+
+    if (nvme_ns_setup(ns, errp)) {
         return;
     }
 
-- 
2.32.0


