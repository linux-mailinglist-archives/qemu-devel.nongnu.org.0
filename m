Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924DF416CE0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:35:34 +0200 (CEST)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfk4-0005K1-W8
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTfcc-00039F-Ph; Fri, 24 Sep 2021 03:27:50 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTfcb-0002qi-4y; Fri, 24 Sep 2021 03:27:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 69B125C01A9;
 Fri, 24 Sep 2021 03:27:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 24 Sep 2021 03:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Ae5wCA8dhSpHI
 VA3VC5vqxMvJy+pmCouZ+8WyrMRKyQ=; b=Wreer4w72AZ0/CX5m5tztjltswrKt
 RtxALSwwhu3TdmMo4jXCgJoOTbaBw9LDnr6qp1/rKDxLL9Dvgry/vQUUrKUjkVzl
 QXt1rQ+7cDowY2XOyi2hCOE349xsOODbdyIr5Bu3CgpOpk6W65yJLgp/InF6xhdw
 eh/lBEJ731GbviQlGZumTunbPHj9eTsJskYmmgjUGGS2xuE7L6+ApTohzX9tW0Ih
 OCoW1T+1WMON3HMpSFJE2AWo0u3ppHrKx9CBi/JP/mL9NWrUjubgHzSoS0Q7m1zt
 Gf10fxWNdKSJqs8g6G+Qbo5T67lG57PeyWTvH/4qA9XJ1qe7auG8i+HOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Ae5wCA8dhSpHIVA3VC5vqxMvJy+pmCouZ+8WyrMRKyQ=; b=FMcHBUwu
 XIOk5ta+iYVo4bJYR2MVSuJUO8ENc/c9yF1DwsqRVHllY5GXlDjzwtDAm5MadJhv
 NjM+nlhw/L9Tbnn2VPcgJ0FbPB4phw1n1bMEbpZZU60OanmDWnwxoL5pVZ4Z+RXL
 5jZN1ICnrsl9hyV+DNl+NJc8ZpzEPsYntGl+9Y0jidSkmkmH8+qZSrR02RYW8jEj
 fidRHNzc1JXlCiwLf77z+BRALwvA+phovYqk2Rf4Rcm+tO6NyKlizRs7yF58K5xh
 znqzuhTLI2AKex53UUG98e04cr+Gu8Y4NR2Mf7TxR7GWMl4QyipzKC4NXl1wIKAs
 XTdMtQjUZbjyOQ==
X-ME-Sender: <xms:9H1NYXsOjSqak_gdr6K3zUHQdJoPNwKQE92QDnZAodVSD9yniQOeew>
 <xme:9H1NYYfIayTiOWSRMVV5v5V1LTvD5BHLEe6O87WE5BZZGShOpoJfsyKmq6GCtO3jD
 S5HHIxo76hrRCMbbHA>
X-ME-Received: <xmr:9H1NYawD4j3-0tJz3JaC49EMvm0-MVkGXpAXCY0getUBIR95nmMRGlnHtJBsnTIEAM9-V7LUCL1iAqxwoQZ0iqmn2p3xgZM_2VlN271QVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:9H1NYWOE-zcIvfq4lirbqgJo8IJKyEyAcpSfpyttnysPbe71e_fGxg>
 <xmx:9H1NYX8UkPAuoiOU3I6U6yK4sW0M4zmi65XIcbnok-osrVZeB3PAXg>
 <xmx:9H1NYWVwvWeoRAjJtAN_QT0mp4uyqg-3iemhncGDDHcvIQf20bVowg>
 <xmx:9H1NYXwIF0OXni83p9bV1KyD0mrsVcZIJj6sUeNz-FH4fHPckm7nQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:27:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/nvme: change nvme-ns 'shared' default
Date: Fri, 24 Sep 2021 09:27:42 +0200
Message-Id: <20210924072742.306473-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924072742.306473-1-its@irrelevant.dk>
References: <20210924072742.306473-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Klaus Jensen <its@irrelevant.dk>
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


