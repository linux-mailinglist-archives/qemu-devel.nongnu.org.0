Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE252C5E66
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 01:06:39 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiRHa-0002zH-S8
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 19:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQy1-0007Vc-Lg; Thu, 26 Nov 2020 18:46:25 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:42029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxx-0003wJ-VF; Thu, 26 Nov 2020 18:46:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7CB325C0216;
 Thu, 26 Nov 2020 18:46:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ZCm6WADM4E7jC
 Yb0tlAvMNGbhC5Es7a147Vj/anMXhQ=; b=yYoHyGbgLJ2xPURaWf7A0eqkwuAYg
 hgszAj17segCig3zdj+oIHC5ZRArmOkWXpogmeQxCss2grsVqcxjOBZve7nSfvb6
 gy7kEVKbTBqxlju6/Q3mQLPSBQpNcELL7h7zpQZp13GXwQaQGYFP1vXWxyrsTOjA
 +9hPokrPirmqfhzdFOf0ehpKcJXAZXfszxwB0LDVkOzG9ExOtNPKmnUHgTKbPsOY
 X9X09+cN3v79RimJEkaU6q4Em3n1Xke0wVtwY8+TMauAWqP02ZSxeR4DOf1JPg3Q
 CRVYfVLpJThNktwBoaUbK3QvhjI0lG7ywQg6SokWdZ3CM4OjMiWZDmCSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ZCm6WADM4E7jCYb0tlAvMNGbhC5Es7a147Vj/anMXhQ=; b=FE9s5OyI
 0MfPQYaHaazYPlzTOg3gMoGGzvxZQl8EwBQN3rKdxonQI23wOZEI3/zJlakskWk7
 I3L5sIVp8bDsrAbzp57SWRELc6xHv0kz4Nwfak5p8pR9xwGEhRyuMLOf1tfvNHUr
 IOYTeeSJNYG19Yo2zDnKLU01CYqhfWhbSvjwzzE222cCQYqv4fgJd1CwZK5e/wH6
 pDVALfvHwlc1WYN7gRU6z8hMd87MwakFinlAKOAghABhtrGkT2i+VIkDuSfbxJza
 YB1TPqtE27h6qma8ZXK9CJMDCzewwFchMJDiNCvELosoglKpX/t6KZ9NX9TVLf8i
 nyuTUxdXA+aC0w==
X-ME-Sender: <xms:Sz7AX7R51DmlQwSnD2G6cEV9ij3LWOuCQecHaYGP4ci6YQLuO6j7Bg>
 <xme:Sz7AX8yltRZY3n1yddiIVHRXurAUyDh3gPDELyytU2Y_IKyvcyejqK6vEOgpPR0xH
 VArYuJGiEe5adEJIo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejfeejjeejffelfeeuhffftddvgfegudejvddvffdtvdfhgeejkeehuefhjeej
 ueenucffohhmrghinheprhgvshhouhhrtggvshdrrggtthhivhgvpdhrvghsohhurhgtvg
 hsrdhophgvnhenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnth
 drughk
X-ME-Proxy: <xmx:Sz7AXw04vZWPkL28M-dSS9X1Sd1s08JW-JF6l542qPHXj3wz3qX3KQ>
 <xmx:Sz7AX7D3y_hCOJ6HbIoc3hd71SZVn35Q-n5uVuVofadMVoP9UIQGlw>
 <xmx:Sz7AX0ha5GFys391tl7ynIO89JZX92_T0MoRhb3dNTHN9cgF9k-2iw>
 <xmx:Sz7AX_Wz46jENoHRfFBwK2MuJsbbLwIuRfNhPQyIKxKg9X88kNOFFg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1D1783064AB2;
 Thu, 26 Nov 2020 18:46:18 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/12] hw/block/nvme: track and enforce zone resources
Date: Fri, 27 Nov 2020 00:45:59 +0100
Message-Id: <20201126234601.689714-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126234601.689714-1-its@irrelevant.dk>
References: <20201126234601.689714-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Track number of open/active resources.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/specs/nvme.txt  |  6 ++++
 hw/block/nvme-ns.h   |  7 +++++
 include/block/nvme.h |  2 ++
 hw/block/nvme-ns.c   | 17 ++++++++++--
 hw/block/nvme.c      | 65 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
index 80cb34406255..03bb4d9516b4 100644
--- a/docs/specs/nvme.txt
+++ b/docs/specs/nvme.txt
@@ -14,6 +14,12 @@ The nvme device (-device nvme) emulates an NVM Express Controller.
      zns.zcap; if the zone capacity is a power of two, the zone size will be
      set to that, otherwise it will default to the next power of two.
 
+  `zns.mar`; Specifies the number of active resources available. This is a 0s
+     based value.
+
+  `zns.mor`; Specifies the number of open resources available. This is a 0s
+     based value.
+
 
 Reference Specifications
 ------------------------
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 6370ef1a162b..20be2a7c882f 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -32,6 +32,8 @@ typedef struct NvmeNamespaceParams {
         uint64_t zcap;
         uint64_t zsze;
         uint8_t  zdes;
+        uint32_t mar;
+        uint32_t mor;
     } zns;
 } NvmeNamespaceParams;
 
@@ -62,6 +64,11 @@ typedef struct NvmeNamespace {
         NvmeZone           *zones;
         NvmeZoneDescriptor *zd;
         uint8_t            *zde;
+
+        struct {
+            uint32_t open;
+            uint32_t active;
+        } resources;
     } zns;
 } NvmeNamespace;
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 9ea7dfc40cc6..4038761f3650 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -813,6 +813,8 @@ enum NvmeStatusCodes {
     NVME_ZONE_IS_READ_ONLY      = 0x01ba,
     NVME_ZONE_IS_OFFLINE        = 0x01bb,
     NVME_ZONE_INVALID_WRITE     = 0x01bc,
+    NVME_TOO_MANY_ACTIVE_ZONES  = 0x01bd,
+    NVME_TOO_MANY_OPEN_ZONES    = 0x01be,
     NVME_INVALID_ZONE_STATE_TRANSITION = 0x01bf,
     NVME_WRITE_FAULT            = 0x0280,
     NVME_UNRECOVERED_READ       = 0x0281,
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index f2e8ee80b606..3cbc62556175 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -94,8 +94,13 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
         ns->zns.zde = g_malloc0_n(ns->zns.num_zones, nvme_ns_zdes_bytes(ns));
     }
 
-    id_ns_zns->mar = 0xffffffff;
-    id_ns_zns->mor = 0xffffffff;
+    id_ns_zns->mar = cpu_to_le32(ns->params.zns.mar);
+    id_ns_zns->mor = cpu_to_le32(ns->params.zns.mor);
+
+    ns->zns.resources.active = ns->params.zns.mar != 0xffffffff ?
+        ns->params.zns.mar + 1 : ns->zns.num_zones;
+    ns->zns.resources.open = ns->params.zns.mor != 0xffffffff ?
+        ns->params.zns.mor + 1 : ns->zns.num_zones;
 }
 
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
@@ -197,6 +202,12 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
             return -1;
         }
 
+        if (ns->params.zns.mor > ns->params.zns.mar) {
+            error_setg(errp, "maximum open resources (zns.mor) must be less "
+                       "than or equal to maximum active resources (zns.mar)");
+            return -1;
+        }
+
         break;
 
     default:
@@ -267,6 +278,8 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_UINT64("zns.zcap", NvmeNamespace, params.zns.zcap, 0),
     DEFINE_PROP_UINT64("zns.zsze", NvmeNamespace, params.zns.zsze, 0),
     DEFINE_PROP_UINT8("zns.zdes", NvmeNamespace, params.zns.zdes, 0),
+    DEFINE_PROP_UINT32("zns.mar", NvmeNamespace, params.zns.mar, 0xffffffff),
+    DEFINE_PROP_UINT32("zns.mor", NvmeNamespace, params.zns.mor, 0xffffffff),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 3c2b255294d3..bc1446aeab9d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1045,6 +1045,40 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
 
     switch (from) {
     case NVME_ZS_ZSE:
+        switch (to) {
+        case NVME_ZS_ZSF:
+        case NVME_ZS_ZSRO:
+        case NVME_ZS_ZSO:
+            break;
+
+        case NVME_ZS_ZSC:
+            if (!ns->zns.resources.active) {
+                return NVME_TOO_MANY_ACTIVE_ZONES;
+            }
+
+            ns->zns.resources.active--;
+
+            break;
+
+        case NVME_ZS_ZSIO:
+        case NVME_ZS_ZSEO:
+            if (!ns->zns.resources.active) {
+                return NVME_TOO_MANY_ACTIVE_ZONES;
+            }
+
+            if (!ns->zns.resources.open) {
+                return NVME_TOO_MANY_OPEN_ZONES;
+            }
+
+            ns->zns.resources.active--;
+            ns->zns.resources.open--;
+
+            break;
+
+        default:
+            return NVME_INVALID_ZONE_STATE_TRANSITION | NVME_DNR;
+        }
+
         break;
 
     case NVME_ZS_ZSIO:
@@ -1063,7 +1097,13 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
         case NVME_ZS_ZSEO:
         case NVME_ZS_ZSF:
         case NVME_ZS_ZSRO:
+            ns->zns.resources.active++;
+
+            /* fallthrough */
+
         case NVME_ZS_ZSC:
+            ns->zns.resources.open++;
+
             break;
 
         default:
@@ -1086,8 +1126,18 @@ static uint16_t nvme_zrm_transition(NvmeNamespace *ns, NvmeZone *zone,
 
         case NVME_ZS_ZSF:
         case NVME_ZS_ZSRO:
+            ns->zns.resources.active++;
+
+            break;
+
         case NVME_ZS_ZSIO:
         case NVME_ZS_ZSEO:
+            if (!ns->zns.resources.open) {
+                return NVME_TOO_MANY_OPEN_ZONES;
+            }
+
+            ns->zns.resources.open--;
+
             break;
 
         default:
@@ -1707,6 +1757,7 @@ static uint16_t nvme_zone_mgmt_send_all(NvmeCtrl *n, NvmeNamespace *ns,
 {
     NvmeZone *zone;
     uintptr_t *resets = (uintptr_t *)&req->opaque;
+    int count;
     uint16_t status = NVME_SUCCESS;
 
     trace_pci_nvme_zone_mgmt_send_all(nvme_cid(req), nvme_nsid(ns), zsa);
@@ -1755,6 +1806,20 @@ static uint16_t nvme_zone_mgmt_send_all(NvmeCtrl *n, NvmeNamespace *ns,
         break;
 
     case NVME_ZMS_OPEN:
+        count = 0;
+
+        for (int i = 0; i < ns->zns.num_zones; i++) {
+            zone = &ns->zns.zones[i];
+
+            if (nvme_zs(zone) == NVME_ZS_ZSC) {
+                count++;
+            }
+        }
+
+        if (count > ns->zns.resources.open) {
+            return NVME_TOO_MANY_OPEN_ZONES;
+        }
+
         for (int i = 0; i < ns->zns.num_zones; i++) {
             zone = &ns->zns.zones[i];
 
-- 
2.29.2


