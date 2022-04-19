Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF5506C32
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:21:03 +0200 (CEST)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmqs-0001oN-TF
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmh4-0006d5-6Y; Tue, 19 Apr 2022 08:10:54 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:42035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ngmh2-0003kf-Bf; Tue, 19 Apr 2022 08:10:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2E78D320204A;
 Tue, 19 Apr 2022 08:10:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 19 Apr 2022 08:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650370249; x=
 1650456649; bh=ndOGC+6Q8QGSKmlsXLSQEeN/1XRg0L/izpaGqnVVhhs=; b=Y
 gFLjlNd88LR5GbPR9JAoesy1EIjFNMnJizdQSg7GpE2ShBQNoC/yM3YkhRq+YaoL
 oEtx5YSJFwbv7BKVJAc9tLXz/+g7mr1aUdxU3j8zJ8giJ2qloOek+6IFRYydeZzT
 dukxo1fXgWAc9GgRTOvBZSL57WjoeFygT/SrEiPAyTL5MhpNmvFV/RvofRltfSnK
 y9UVxHvY4v7n1hvAFbhDe6STu/5xiByCLZ4LGnP3/kk7XNPY6y8LoVqi4IrzrAxD
 qrdWJl/yKvGSUNh+mJv8tQCjZghhLQHT+c64ZW79e6sCFSDqG4IXV+aL6tu1j78u
 YAPH7oy295J04tBW34+fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1650370249; x=1650456649; bh=ndOGC+6Q8QGSKmlsXLSQEeN/1XRg0L/izpa
 GqnVVhhs=; b=haUOqNDwWNi5AL17St51cEvRmM0wztHGxXhB3bi9HdVQj8FBYMH
 GoIk+TkMBFz+C3VXa2wnv9iUWK3hY/5IrPpfGV/4+h61+1hyuTlnzQzR9ycfRnJT
 IvK+UALIku5jiiQmykSonKYlEAVfe5V4M2biMz2LD+f4ecybgP2jjYb4cCKbCala
 Sy/jOaKB3YMOE/9fEZCaQyNKGpRLZh3lwV2wJmmxBzO0/pDy6O0Ytq3Zxdala+KF
 zRSbYbqhRg/S4wg07JNhP8RbaVGRX73EgPAZS1L5o4KnUL9OhiosR3s7eJ7clAOF
 7Nh4iGWY4Vvp+OelZtSbjRP4e3vDkwuWWRQ==
X-ME-Sender: <xms:yaZeYtN7-W4CVdH1MNnEBjAslbOQK_Y0JobD9zxv6XvKUrjHJukKpA>
 <xme:yaZeYv9m880hM_C5DJAaGsJ8Gs3J9oN-6mdeKq_0ScB5fMA-QqU_Pr1OgNwQHWiyJ
 sQaau_dvFEQDJaCFY8>
X-ME-Received: <xmr:yaZeYsRMoGvPWBQY-jXlAn0jkosLrCj0csORxHoJgqZPqmuRZACKupCcJcoaqO8O0Vmkz9HLGq2_V6sK2qDNjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:yaZeYpszzNkVbNuYUafHszhLoC0uEJ6QfJ5HvCvqwslM0HRO1eZCkg>
 <xmx:yaZeYlf_dmv-pTllfzvhmI2hSsZTmgerfIbNteKVnE2Xqeg6LBkt1A>
 <xmx:yaZeYl1-LQL4f4iOU20GZWmbOAxwlQw5vq3zWGKF5R-fNA1dfvnFWw>
 <xmx:yaZeYuFBg8WUQ5YSaPdMXmmf-a8Fs0mDQXtsY3J9DF2hl4PnWjMowA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 08:10:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/nvme: always set eui64
Date: Tue, 19 Apr 2022 14:10:36 +0200
Message-Id: <20220419121039.1259477-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419121039.1259477-1-its@irrelevant.dk>
References: <20220419121039.1259477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Klaus Jensen <its@irrelevant.dk>, Luis Chamberlain <mcgrof@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Unconditionally set an EUI64 for namespaces. The nvme-ns device defaults
to auto-generating a persistent EUI64 if not specified, but for single
namespace setups (-device nvme,drive=...), this does not happen.

Since the EUI64 has previously been zeroed it is not considered valid,
so it should be safe to add this now.

The generated EUI64 is of the form 52:54:00:<namespace counter>. Note,
this is NOT the namespace identifier since that is not unique across
subsystems; it is a global namespace counter. This has the effect that
the value of this auto-generated EUI64 is dependent on the order with
which the namespaces are created. If a more flexible setup is required,
the eui64 namespace parameter should be explicitly set. Update the
documentation to make this clear.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/devices/nvme.rst |  6 ++++--
 hw/nvme/ctrl.c               |  2 ++
 hw/nvme/ns.c                 | 12 ++++++++----
 hw/nvme/nvme.h               |  3 +++
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index b5acb2a9c19d..f9b8c7f3eeb4 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -84,8 +84,10 @@ There are a number of parameters available:
 ``eui64``
   Set the EUI-64 of the namespace. This will be reported as a "IEEE Extended
   Unique Identifier" descriptor in the Namespace Identification Descriptor List.
-  Since machine type 6.1 a non-zero default value is used if the parameter
-  is not provided. For earlier machine types the field defaults to 0.
+  Since machine type 6.1, an EUI-64 is auto-generated. However, note that this
+  auto-generated value is dependent on the order with which the namespaces are
+  created. If you intend on adding/removing namespaces on your VM, set this
+  parameter explicitly. For earlier machine types the field defaults to 0.
 
 ``bus``
   If there are more ``nvme`` devices defined, this parameter may be used to
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae8c..17cf9862ab89 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6862,6 +6862,8 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         ns = &n->namespace;
         ns->params.nsid = 1;
 
+        nvme_ns_set_eui64(ns);
+
         if (nvme_ns_setup(ns, errp)) {
             return;
         }
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 324f53ea0cd1..5685221f47c6 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -25,6 +25,8 @@
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 
+uint64_t nvme_ns_count;
+
 void nvme_ns_init_format(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns = &ns->id_ns;
@@ -54,9 +56,13 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->npda = id_ns->npdg = npdg - 1;
 }
 
+void nvme_ns_set_eui64(NvmeNamespace *ns)
+{
+    ns->params.eui64 = NVME_EUI64_DEFAULT | ++nvme_ns_count;
+}
+
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
-    static uint64_t ns_count;
     NvmeIdNs *id_ns = &ns->id_ns;
     NvmeIdNsNvm *id_ns_nvm = &ns->id_ns_nvm;
     uint8_t ds;
@@ -75,10 +81,8 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
         id_ns->nmic |= NVME_NMIC_NS_SHARED;
     }
 
-    /* Substitute a missing EUI-64 by an autogenerated one */
-    ++ns_count;
     if (!ns->params.eui64 && ns->params.eui64_default) {
-        ns->params.eui64 = ns_count + NVME_EUI64_DEFAULT;
+        nvme_ns_set_eui64(ns);
     }
 
     /* simple copy */
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 7f2e8f1b6491..3922cf531f6d 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -33,6 +33,8 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROADCAST - 1);
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
 
+extern uint64_t nvme_ns_count;
+
 #define TYPE_NVME_BUS "nvme-bus"
 OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
 
@@ -511,6 +513,7 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
     return le16_to_cpu(req->cqe.cid);
 }
 
+void nvme_ns_set_eui64(NvmeNamespace *ns);
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
-- 
2.35.1


