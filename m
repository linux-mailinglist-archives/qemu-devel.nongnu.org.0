Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2C456B74
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:16:28 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnz4M-0001Z1-M0
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:16:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnyyE-0006ul-Ss; Fri, 19 Nov 2021 03:10:06 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mnyyB-00058m-Ue; Fri, 19 Nov 2021 03:10:06 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E6C35C0183;
 Fri, 19 Nov 2021 03:10:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 19 Nov 2021 03:10:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=qztWwZIo8ByiX
 ttN9x1f7gYwn3kBpcJV2veNOz8+HPw=; b=MkGHIB2gByYc0ReRBejCsUkmYh3C7
 LftNVgpiEzY64CG1Krv9hfODC5cDjV+iun2LHu9FS05QqngQtLmOa6+ewY0ToHZE
 4mfMH5p3+192wXHWOW4delkESzeRka+BpxH/FanVE9F5tn04hz0Z/mTtEr29abC2
 JMYg7hl203ylyqn1qSo1Hk21yFZXOetisnZ04L8Xvau9Wi5gddwy8MI3TXZfUBbu
 2blHmuRmCCIURZhp37gE7kvvvhrb3NHlCisRC6EF/D20wAyKLte2jLidlj3IsbcY
 mHFGuHg33CLJ3YPLk6qpuaxiA/LrrMb7Xkt5RleXBuaTWNF5XllcLw1Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=qztWwZIo8ByiXttN9x1f7gYwn3kBpcJV2veNOz8+HPw=; b=mm+1yb9J
 Fo55BsBemi1qrWru1VK+dflqtR2AHrQwbuYLV9fye2q64PTFyAPGQBSCOSmL7D80
 Foz4GxJpH8BF/0Qj/LLWUEapPlhbToQ15uGknno3EPcWMETCiOXoVn9z1jWluLD4
 aIzG6mJqSUT9hTxozEzzESbVvSr+FJPcsh4UPcxSorF3S5l7EJ1I49l5kRe4MJlS
 ts1KpJd7orSzVIjv9QfMpy1yjoGkTgTn5SVAjRaw9lW1aq8qWch6Cc1GXuMgojhU
 yL6h5n0a9bhhh5wKTvXhQKG8cC8xzpZfcroVTUZqIPIKgZiyjMTPH12P1HBdos5+
 QWpKVU0vRjzkEg==
X-ME-Sender: <xms:21uXYbbId5HSpKyn5r7GnjFYqeguNLqOUassOpttKsv7w8Bsrdy_tg>
 <xme:21uXYaYVErJTn4NipHaoK-dBs9cVX7ZgG0vGBqazlxO3QEY8-XdB5ApBsQP108565
 64ggIytKVVHq0egq8g>
X-ME-Received: <xmr:21uXYd-zjvFGXw4uAm-Xd-oyTbFQfgOEb250j38xslJmajDK7bhn0CGGzCHl9f8g9uUQnUA0dXghNbwIDa06sigFsuj-o6wD1BiEpaSxHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:21uXYRpc1IdouIp2hZtdEjSnU7w4lmTJ648nRheHYDhXxPv0fnGqxQ>
 <xmx:21uXYWpXZlBxqjYvJHFIvUt_ja_4-VRvyhqlGuCyC9K0PsL39TlaAw>
 <xmx:21uXYXQQuzAbqoWAlEIMPpAtlyyKEBO7RlVu5sK_JGIOLtJwp0WUFg>
 <xmx:21uXYWJVZFysdJQ-Jn1yJ8nEvBhqs1xHfx4iO2sZ9APLrBS1gqsi9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:10:01 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.2 2/3] hw/nvme: change nvme-ns 'shared' default
Date: Fri, 19 Nov 2021 09:09:53 +0100
Message-Id: <20211119080954.211927-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211119080954.211927-1-its@irrelevant.dk>
References: <20211119080954.211927-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Change namespaces to be shared namespaces by default (parameter
shared=on). Keep shared=off for older machine types.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/devices/nvme.rst | 24 ++++++++++++++----------
 hw/core/machine.c            |  1 +
 hw/nvme/ns.c                 |  8 +-------
 3 files changed, 16 insertions(+), 17 deletions(-)

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
index 26ec54e7261c..53a99abc5605 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,7 @@
 
 GlobalProperty hw_compat_6_1[] = {
     { "vhost-user-vsock-device", "seqpacket", "off" },
+    { "nvme-ns", "shared", "off" },
 };
 const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
 
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
2.34.0


