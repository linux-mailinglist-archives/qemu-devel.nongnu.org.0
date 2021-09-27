Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A054418EA5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:25:14 +0200 (CEST)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUj8b-0007k7-BF
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj1t-0002cD-AW; Mon, 27 Sep 2021 01:18:18 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:49201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mUj1r-0008Mj-IJ; Mon, 27 Sep 2021 01:18:17 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 1FA402B011FD;
 Mon, 27 Sep 2021 01:18:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 27 Sep 2021 01:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Ae5wCA8dhSpHI
 VA3VC5vqxMvJy+pmCouZ+8WyrMRKyQ=; b=Ep92hDIhmIHqjZ5bOV+/s+WOcFGsJ
 re00TfxY1u+mjJ+EDJN3hwDwyykQnp0SvW/MVeNDivNHLTMIDOVxfZrHIDKdUWtU
 XelK6ww+Z4A1nLF7afrN8qiZbjYGIbDfzzZrud12GgDw1aHRsH+yaN7F1itXwibS
 ZXIFvat1Et/Ii/Gopo2HlaB4I9f9rXLq4WAuP+zADb0gjl+WZMIcTbus+JbyhOzQ
 FGxFG7BTQ99Wsu9WY5zQvhGoYGmbwf8b9GyQg3d1fPH5wcAxtby+OOl5E1yUEgd9
 Nsf1QY/IYTbuB6usSUqxAsWEN4CoGtfTBpbVDalrkAkGQGABPiotg5fpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Ae5wCA8dhSpHIVA3VC5vqxMvJy+pmCouZ+8WyrMRKyQ=; b=k48YgY4/
 aKu6ZmkTajucL+QHx4SHyZbfLpftjUqsscAHg2dzvbj7XPpP8JOqi7M5etA9vV5n
 yk0Xhg7Q/zrhTBvjereRyUsIdzGdZpH5OfH2nS4lc9tC3KmKbnCIQAHuZ+hj9BbR
 iq7eieRjCpCpmr4fQe9qOmp+gGARg/o21InLZ0LTo80wffVl8htjzUwFQATwqsvA
 qEhpz2PvAzPgwj98JDby1TfQZHPOQr+QRtk/9YNyQhmODZbNEFC/2sywC6Fa2D80
 iw9XgzeeW0lVBXQ6vyM9j2ULxQbIO8kEIbBdcq+9Yj7Ib80tbj8sQiKnY9Tk65VG
 izj0lKzUDXLb7A==
X-ME-Sender: <xms:FFRRYWbwrHlTzR_Uo6z7FVClZP01U8UQm0SV0ibTbGWdZwF00OVnSg>
 <xme:FFRRYZYbnIgNDjGFgO2UxAGCnYOrwuYJeXcIVDj2vqczF_7bqrJbzNmyBPmFFQKK7
 PaI-qGnRVmb6dAZa9c>
X-ME-Received: <xmr:FFRRYQ_b6OQnrxr-HNOXAmbe77ORUumgnzp2ZSteRuy2qKCo8nRa95TBW__Db0PWx2l6BTXLwQiP92b_YfgC3vuzREn3i3HtS2INcz4rGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:FFRRYYorrOS2rZicSfg4R_MW91kuxVCS7t7H3vWawJGkxKiSh2a_jg>
 <xmx:FFRRYRpK6BdEt_TeCzuXqBE2c0pkTJ4FpT2ll-M9TG_FSnDe0pwDyg>
 <xmx:FFRRYWSFWT1rsqMZ57-XjvIWiCtNOl1rVp7cjO3KQtCS7VpMGkXRZQ>
 <xmx:FFRRYZabRm2e9MPNpgvHnFL6i2kOcIdgrXf3hF1BWfcLMjXpWzrCSScDxw8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 01:18:10 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 02/16] hw/nvme: change nvme-ns 'shared' default
Date: Mon, 27 Sep 2021 07:17:45 +0200
Message-Id: <20210927051759.447305-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927051759.447305-1-its@irrelevant.dk>
References: <20210927051759.447305-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Change namespaces to be shared namespaces by default (parameter
shared=on). Keep shared=off for older machine types.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/devices/nvme.rst | 24 ++++++++++++++----------
 hw/core/machine.c            |  4 +++-
 hw/nvme/ns.c                 |  8 +-------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index bff72d1c24d0..a1c0db01f6d5 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -110,28 +110,32 @@ multipath I/O.
 This will create an NVM subsystem with two controllers. Having controllers
 linked to an ``nvme-subsys`` device allows additional ``nvme-ns`` parameters:
 
-``shared`` (default: ``off``)
+``shared`` (default: ``on`` since 6.2)
   Specifies that the namespace will be attached to all controllers in the
-  subsystem. If set to ``off`` (the default), the namespace will remain a
-  private namespace and may only be attached to a single controller at a time.
+  subsystem. If set to ``off``, the namespace will remain a private namespace
+  and may only be attached to a single controller at a time. Shared namespaces
+  are always automatically attached to all controllers (also when controllers
+  are hotplugged).
 
 ``detached`` (default: ``off``)
   If set to ``on``, the namespace will be be available in the subsystem, but
-  not attached to any controllers initially.
+  not attached to any controllers initially. A shared namespace with this set
+  to ``on`` will never be automatically attached to controllers.
 
 Thus, adding
 
 .. code-block:: console
 
    -drive file=nvm-1.img,if=none,id=nvm-1
-   -device nvme-ns,drive=nvm-1,nsid=1,shared=on
+   -device nvme-ns,drive=nvm-1,nsid=1
    -drive file=nvm-2.img,if=none,id=nvm-2
-   -device nvme-ns,drive=nvm-2,nsid=3,detached=on
+   -device nvme-ns,drive=nvm-2,nsid=3,shared=off,detached=on
 
-will cause NSID 1 will be a shared namespace (due to ``shared=on``) that is
-initially attached to both controllers. NSID 3 will be a private namespace
-(i.e. only attachable to a single controller at a time) and will not be
-attached to any controller initially (due to ``detached=on``).
+will cause NSID 1 will be a shared namespace that is initially attached to both
+controllers. NSID 3 will be a private namespace due to ``shared=off`` and only
+attachable to a single controller at a time. Additionally it will not be
+attached to any controller initially (due to ``detached=on``) or to hotplugged
+controllers.
 
 Optional Features
 =================
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528fd..5e2fa3e392b9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_1[] = {};
+GlobalProperty hw_compat_6_1[] = {
+    { "nvme-ns", "shared", "off" },
+};
 const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
 
 GlobalProperty hw_compat_6_0[] = {
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index b7cf1494e75b..8b5f98c76180 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -465,12 +465,6 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
                        "linked to an nvme-subsys device");
             return;
         }
-
-        if (ns->params.shared) {
-            error_setg(errp, "shared requires that the nvme device is "
-                       "linked to an nvme-subsys device");
-            return;
-        }
     } else {
         /*
          * If this namespace belongs to a subsystem (through a link on the
@@ -532,7 +526,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
-    DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
+    DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, true),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
-- 
2.33.0


