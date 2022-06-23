Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835B9558AE3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:41:17 +0200 (CEST)
Received: from localhost ([::1]:60592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UZg-0008CI-J8
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTg-0004JG-PC; Thu, 23 Jun 2022 17:35:04 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UTe-0006Pt-R9; Thu, 23 Jun 2022 17:35:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8F9983200927;
 Thu, 23 Jun 2022 17:34:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Jun 2022 17:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656020096; x=
 1656106496; bh=GeUykUW1iTbxgGzpPtSKl7h/Gfxt2BzTniAYlJ/3R8A=; b=V
 DdBBGxHip+OXdH1XTZlTbcUswB1mx13i/cEr9UW9sC60q454CdjaHaaNhcu+lF7C
 I5x6C9JweAjZ4sIQLnMNnU2D8xJKYF5joWPG0eBWszEcUUksAVsWqWnA/b5+iqag
 jJMqfQ27ExncVTBWAacHXsEI3wCOlhugrut4SsFsCpss5V1xGCz7bYlcXKFVDa2J
 JvmcAh2aZr1J5GlB05tOmw/fweyEhDmBLplnwyKHzmo3XL9qZrriQ7RMJ3seo8xU
 F44lCVAHmnI3WK2omCOX+0mm+dDZww1AdKB1z17JyO5MdZgHRUQok28EyjfwYPsJ
 mHvDXg5Bl6vm/XkSQh8Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656020096; x=1656106496; bh=GeUykUW1iTbxg
 GzpPtSKl7h/Gfxt2BzTniAYlJ/3R8A=; b=l9iBXbVoo1Q/2onBAcf0CETAiPLwe
 XXpnhMnhRZ+MgQbKXrlH8oGiaJjb5S6gk1ei2B34atri+1Eoxh6HbAoGXd25Q+72
 XRJQnkpOgTHcYxbvU7EBTd9bYgkMrtCf8YI3156+gcgs8Mewkr9dH6C0AfrGlmCy
 VmP0eXQMsK6T+J9xL4Dvk6OMtlwSMZ0+JHBi87ONSEwX9ujVIUjqTAYLZ8on1YVA
 uITOOASaVnHE/VOjnA7P9CmEjDTpa9qxpU7JCLuuH1LIdJkaYpuun8Kg6afOsO0Z
 1bn6JfMwkfHcQHWOxglx6YlRjAaQFq9kQQccYf6SSBGdlY3m9tgw1GBkw==
X-ME-Sender: <xms:f9y0YtBd7G0tQ5orzW9bENzHbY-V1SINCVWgk8iAc-NfexwSdhdv2Q>
 <xme:f9y0Yrjtok37WZmWpvaWhqTQMosxNrKAIW6RU_oUuPq13n_puf570BcEuAgD1XXdR
 oY2HWZVaFoKoqsJCXE>
X-ME-Received: <xmr:f9y0Yonf8hyAL7KlZPuMyPvGIAMt878FgtT2JZPmGBSoN87MWl6NbVfAS8dLKUGfXHU-cAoz3u139d9yFa14>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeegvddtheeukedufedugeeigfdvhfetgfegtddvfeejheevgeeijedvfedt
 tdelheenucffohhmrghinhepqhguvghvrdhiugenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:f9y0Ynyvba24wOVOjLg-pgg9QxteFLRkPnATB65c-cpOpafWm33Bcg>
 <xmx:f9y0YiTk8O1i-6PQCYBbsSTq6lqWjY7G7uQz16n4vEU1QmvvGVZ2jw>
 <xmx:f9y0YqYXoMY-tjA4JeAYTXktNQwJG2af2S2u7SwQtYdS9RTsIGtmQQ>
 <xmx:gNy0YuovA0mNsy4ow-QYofSCSvo1_Dx6fOFzp_E1fxXrDAsupq-RaA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:34:53 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 02/15] hw/nvme: Add support for Primary Controller Capabilities
Date: Thu, 23 Jun 2022 23:34:29 +0200
Message-Id: <20220623213442.67789-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623213442.67789-1-its@irrelevant.dk>
References: <20220623213442.67789-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukasz Maniak <lukasz.maniak@linux.intel.com>

Implementation of Primary Controller Capabilities data
structure (Identify command with CNS value of 14h).

Currently, the command returns only ID of a primary controller.
Handling of remaining fields are added in subsequent patches
implementing virtualization enhancements.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 23 ++++++++++++++++++-----
 hw/nvme/nvme.h       |  2 ++
 hw/nvme/trace-events |  1 +
 include/block/nvme.h | 23 +++++++++++++++++++++++
 4 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 855ab55aa46b..d004b484092c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4804,6 +4804,14 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
     return nvme_c2h(n, (uint8_t *)list, sizeof(list), req);
 }
 
+static uint16_t nvme_identify_pri_ctrl_cap(NvmeCtrl *n, NvmeRequest *req)
+{
+    trace_pci_nvme_identify_pri_ctrl_cap(le16_to_cpu(n->pri_ctrl_cap.cntlid));
+
+    return nvme_c2h(n, (uint8_t *)&n->pri_ctrl_cap,
+                    sizeof(NvmePriCtrlCap), req);
+}
+
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
                                      bool active)
 {
@@ -5020,6 +5028,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
         return nvme_identify_ctrl_list(n, req, true);
     case NVME_ID_CNS_CTRL_LIST:
         return nvme_identify_ctrl_list(n, req, false);
+    case NVME_ID_CNS_PRIMARY_CTRL_CAP:
+        return nvme_identify_pri_ctrl_cap(n, req);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
@@ -6611,6 +6621,8 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
 
 static void nvme_init_state(NvmeCtrl *n)
 {
+    NvmePriCtrlCap *cap = &n->pri_ctrl_cap;
+
     /* add one to max_ioqpairs to account for the admin queue pair */
     n->reg_size = pow2ceil(sizeof(NvmeBar) +
                            2 * (n->params.max_ioqpairs + 1) * NVME_DB_SIZE);
@@ -6620,6 +6632,8 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+
+    cap->cntlid = cpu_to_le16(n->cntlid);
 }
 
 static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -6921,15 +6935,14 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
               &pci_dev->qdev, n->parent_obj.qdev.id);
 
+    if (nvme_init_subsys(n, errp)) {
+        error_propagate(errp, local_err);
+        return;
+    }
     nvme_init_state(n);
     if (nvme_init_pci(n, pci_dev, errp)) {
         return;
     }
-
-    if (nvme_init_subsys(n, errp)) {
-        error_propagate(errp, local_err);
-        return;
-    }
     nvme_init_ctrl(n, pci_dev);
 
     /* setup a namespace if the controller drive property was given */
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 7e4bbd5606a0..6ef458d3bc24 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -478,6 +478,8 @@ typedef struct NvmeCtrl {
         uint32_t                async_config;
         NvmeHostBehaviorSupport hbs;
     } features;
+
+    NvmePriCtrlCap  pri_ctrl_cap;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ff1b4589692b..1834b17cf214 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -56,6 +56,7 @@ pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid %"PRIu16""
+pci_nvme_identify_pri_ctrl_cap(uint16_t cntlid) "identify primary controller capabilities cntlid=%"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3737351cc815..524a04fb94ec 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1033,6 +1033,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_NS_PRESENT            = 0x11,
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
     NVME_ID_CNS_CTRL_LIST             = 0x13,
+    NVME_ID_CNS_PRIMARY_CTRL_CAP      = 0x14,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
@@ -1553,6 +1554,27 @@ typedef enum NvmeZoneState {
     NVME_ZONE_STATE_OFFLINE          = 0x0f,
 } NvmeZoneState;
 
+typedef struct QEMU_PACKED NvmePriCtrlCap {
+    uint16_t    cntlid;
+    uint16_t    portid;
+    uint8_t     crt;
+    uint8_t     rsvd5[27];
+    uint32_t    vqfrt;
+    uint32_t    vqrfa;
+    uint16_t    vqrfap;
+    uint16_t    vqprt;
+    uint16_t    vqfrsm;
+    uint16_t    vqgran;
+    uint8_t     rsvd48[16];
+    uint32_t    vifrt;
+    uint32_t    virfa;
+    uint16_t    virfap;
+    uint16_t    viprt;
+    uint16_t    vifrsm;
+    uint16_t    vigran;
+    uint8_t     rsvd80[4016];
+} NvmePriCtrlCap;
+
 static inline void _nvme_check_size(void)
 {
     QEMU_BUILD_BUG_ON(sizeof(NvmeBar) != 4096);
@@ -1588,5 +1610,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 16);
+    QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) != 4096);
 }
 #endif
-- 
2.36.1


