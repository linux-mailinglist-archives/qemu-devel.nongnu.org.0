Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A33B783B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:06:01 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJ3Y-00023H-Ni
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImY-0001Pc-Ge; Tue, 29 Jun 2021 14:48:26 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImO-0005Nv-SR; Tue, 29 Jun 2021 14:48:23 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 02F402B00AAA;
 Tue, 29 Jun 2021 14:48:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 29 Jun 2021 14:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=mFoV6U2iUBImJ
 8+uKTCws82hjluU0Z3Qtq0CMNRwjdc=; b=TgLfZjjYbNDyYZfeFW/APTpYphM3j
 jY6xz+PoXMAk4AGRxBeiR4fWRuPCVjw6RMyXyFBfc1dTWEfH5gYSxJg5lzoSJS1F
 mhT4bF553i6uMwbZn1ekGdg0KBz0gnAjnXT4kTXpVsvDgBo89OSM3uZwYxrhuUlL
 K5aferYuBYb0En9URFIplDF78sQ+avWq+shCO7ALg+qqq0eub8mJ52fqZPAjhdh9
 WMcwo5cgdHO0lQizJSYwQBwbBR+dV4p83eJVFyrQDLfb6Orv4fxGhD/KvXY2KDmR
 iUrtmCtFtkFjBF7MU27iOcjOHwmOuwPI/nJgDp4GnxqcsPKfK9y5mRY6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=mFoV6U2iUBImJ8+uKTCws82hjluU0Z3Qtq0CMNRwjdc=; b=Lzf0sFzG
 IP375qMyIujn+RtKqkW3adpmWAnVKNzN0v1CIDib1xg1S3KWiPHaMB+VS6kSACgG
 kCyFWMuC3vWcZWTCM6As1W4JgOL6ag3VgXAW4amrcXLCTHMY5ow95pqP44ok8qQh
 isX6JeTCzMfvtn1cv60qLIwL/DSYGMenSfgVL/hA71ieJyC8psxH7Q+Q+DLMcMti
 Ra9YOZv/TuP4ADjAArPy1BoymyQvNONpuBQEtf8QFEcRtug6mR3oRlUnnUQb2KQC
 CGyxgVFSa/2Jli65czTX1UrtBtSbotdKkG7+/S+XsbpI2bJiHj/qO8/3eF0SYdpS
 3+5Qg/kEULPtgQ==
X-ME-Sender: <xms:7WrbYKZnNAEGk5EkIkdK6mJDNkRciSACWYzX-8o_d9FCu9D2xfMCbA>
 <xme:7WrbYNZhbWF87unVb1gEBbv2n3KlOX452rBXf8NEXBa0JeztvdOcbZqRC5Y9uHgCo
 NA1JYWdq3elJe08pnk>
X-ME-Received: <xmr:7WrbYE9EIX7mZBggI3qGG7WjJ4hJjZ_L921ZI9cqWHQrj-_bCvWVdQur33Doy68Du9a6obHOwmzlovGBif4wq-TFKYjIw4SsKZBk6dg5Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7WrbYMp7QFdaDSQOO94ThUQQC7moDRLuyxiba3KUzk7NzLgPgXEQtQ>
 <xmx:7WrbYFr1J5yP78m6zLr4bFbD-DrYPStXAWv6OEA3d5ySM4UQaNpM3A>
 <xmx:7WrbYKTvUB8GttBglOikdVkPlFAFVg4T5wz39mzI0G0tfrH5kZqEDQ>
 <xmx:7WrbYGQzUurdRGSJMifKV458PUiIve-wfZTRiqso1JaS8QYsja6M0Xk0khY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:11 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 07/23] hw/nvme: default for namespace EUI-64
Date: Tue, 29 Jun 2021 20:47:27 +0200
Message-Id: <20210629184743.230173-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Heinrich Schuchardt <xypron.glpk@gmx.de>

On machines with version > 6.0 replace a missing EUI-64 by a generated
value.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/nvme.rst | 2 ++
 hw/nvme/nvme.h       | 2 ++
 hw/core/machine.c    | 1 +
 hw/nvme/ns.c         | 9 +++++++++
 4 files changed, 14 insertions(+)

diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
index b5f8288d7c85..33a15c7dbc78 100644
--- a/docs/system/nvme.rst
+++ b/docs/system/nvme.rst
@@ -84,6 +84,8 @@ There are a number of parameters available:
 ``eui64``
   Set the EUI-64 of the namespace. This will be reported as a "IEEE Extended
   Unique Identifier" descriptor in the Namespace Identification Descriptor List.
+  Since machine type 6.1 a non-zero default value is used if the parameter
+  is not provided. For earlier machine types the field defaults to 0.
 
 ``bus``
   If there are more ``nvme`` devices defined, this parameter may be used to
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index ac90e13d7b3f..371ac9bfd8fc 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -26,6 +26,7 @@
 
 #define NVME_MAX_CONTROLLERS 32
 #define NVME_MAX_NAMESPACES  256
+#define NVME_EUI64_DEFAULT ((uint64_t)0x5254000000000000)
 
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
@@ -84,6 +85,7 @@ typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     QemuUUID uuid;
     uint64_t eui64;
+    bool     eui64_default;
 
     uint16_t ms;
     uint8_t  mset;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 55b9bc7817d8..d0e934888872 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,7 @@
 GlobalProperty hw_compat_6_0[] = {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
     { "i8042", "extended-state", "false"},
+    { "nvme-ns", "eui64-default", "off"},
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 45e457de6ae1..4275c3db6301 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -56,6 +56,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
 
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
+    static uint64_t ns_count;
     NvmeIdNs *id_ns = &ns->id_ns;
     uint8_t ds;
     uint16_t ms;
@@ -73,6 +74,12 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
         id_ns->nmic |= NVME_NMIC_NS_SHARED;
     }
 
+    /* Substitute a missing EUI-64 by an autogenerated one */
+    ++ns_count;
+    if (!ns->params.eui64 && ns->params.eui64_default) {
+        ns->params.eui64 = ns_count + NVME_EUI64_DEFAULT;
+    }
+
     /* simple copy */
     id_ns->mssrl = cpu_to_le16(ns->params.mssrl);
     id_ns->mcl = cpu_to_le32(ns->params.mcl);
@@ -533,6 +540,8 @@ static Property nvme_ns_props[] = {
                        params.max_open_zones, 0),
     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
                        params.zd_extension_size, 0),
+    DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default,
+                     true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.32.0


