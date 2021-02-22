Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10C3220E7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:46:33 +0100 (CET)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEI6B-0004RC-SH
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEHpk-0006AO-Ne; Mon, 22 Feb 2021 15:29:32 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEHph-0007Ig-Bs; Mon, 22 Feb 2021 15:29:32 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D6D35C01C8;
 Mon, 22 Feb 2021 15:29:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 22 Feb 2021 15:29:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=HMV77hINTktkv
 RdU7FsFO6zPOvxhGdRCLWVsPRLfpck=; b=pl+umMuQVRXGzw1YP2zsu4jsiNAvw
 IngaJ8x3Hz3MUwO1+YI7r7OLZnuF/npgf4rBhwdohTqEP0maoGaZ/d/YANz1XNHT
 HgDqw4xu8sof6EbNyhgSiKkaK8+KZAg4edozGDtVzimC08TFvWc+kp0Q3IwC53+V
 Xyj5SXfPEiL1q9K3bKyLYBlmg5lOCeQcOAPFSEkV8wOIp0CxkN23pblk7Elrbru7
 ZoZRGBydFeo9JWZ1MuoiOyrjcwx42JWutAJx3GXo+WKAsAkIjiq74kgwAIZzCtG8
 Ti/8IqBPdc5MZdy9gyfZlvzQ3GHp++nI1h0gI8kCfpKLM7YFFN3NYzlVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=HMV77hINTktkvRdU7FsFO6zPOvxhGdRCLWVsPRLfpck=; b=Hhp+sKPE
 f6iI6ewsmEN+ZldF219GKwxg/EF7aF2ss5Xiz5BWLerGrrNHv/iu4+x+v0Qcfuc7
 rrQs0in33WI0l3EzUCDbUFPs4OkBCvKh3Q5mhCbVUfuheTK+PMr4p7OHcSaUWFLp
 dHbdzBHkM9nQQPEK75ZXQFb9zgXNFWF83sK6hj7uQ8jE6SnP7wZRd6GlFc1Oebw6
 1q5rTNXiI+0stTePEVZjORPpOsmT9/5o2iVQXApBd2HKjWawGTMRE1y5BKxR3gEy
 ZwY0biUWIIGujUN5ElPtz74YPIhnvdNJmI4vJAQGb2K+k1X+axPznQworW4xNu4E
 xDNTppmkS7gV7A==
X-ME-Sender: <xms:KBQ0YO1v_HjLPxgizyvLZjmbPsqUAFXvmrr8IjNQWP5uH-RFfiWmSA>
 <xme:KBQ0YPDdv1qLivSDcN1ki3q5NoM59E03P_XsJjKL3zLdXJOIpFhRJagJiq7YTzT-r
 qGqjGYgTKKHV7Cr98g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddufeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:KBQ0YJNgyLWvrom2jVHGmTusjxpOUaGV-fpx43Rm7WYeg58q_DDEXw>
 <xmx:KBQ0YEaLXDe_TPmzC2j6Z8Uz46qvGHpVHhYfMiXn-2iJYVAYU4ilQA>
 <xmx:KBQ0YIug_bNXNkThYHZxh5ciRwnc3oJ4-90DezerNY8J4m19qN0KsA>
 <xmx:KBQ0YE0OJWFmViLN5eeevX0xswQ6gtgQWnRmzRdfFjj6dfvfgzSZHQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 91B7E240064;
 Mon, 22 Feb 2021 15:29:27 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/block/nvme: deduplicate bad mdts trace event
Date: Mon, 22 Feb 2021 21:29:20 +0100
Message-Id: <20210222202921.92774-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222202921.92774-1-its@irrelevant.dk>
References: <20210222202921.92774-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If mdts is exceeded, trace it from a single place.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 6 +-----
 hw/block/trace-events | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6a27b28f2c2d..25a7726ca05b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1075,6 +1075,7 @@ static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
     uint8_t mdts = n->params.mdts;
 
     if (mdts && len > n->page_size << mdts) {
+        trace_pci_nvme_err_mdts(len);
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -1945,7 +1946,6 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_mdts(n, len);
     if (status) {
-        trace_pci_nvme_err_mdts(nvme_cid(req), len);
         return status;
     }
 
@@ -2048,7 +2048,6 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_mdts(n, data_size);
     if (status) {
-        trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
         goto invalid;
     }
 
@@ -2116,7 +2115,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
     if (!wrz) {
         status = nvme_check_mdts(n, data_size);
         if (status) {
-            trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
             goto invalid;
         }
     }
@@ -2610,7 +2608,6 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_mdts(n, data_size);
     if (status) {
-        trace_pci_nvme_err_mdts(nvme_cid(req), data_size);
         return status;
     }
 
@@ -3052,7 +3049,6 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_check_mdts(n, len);
     if (status) {
-        trace_pci_nvme_err_mdts(nvme_cid(req), len);
         return status;
     }
 
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b04f7a3e1890..e1a85661cf3f 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -114,7 +114,7 @@ pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=%"PRIu32", sl
 pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=%"PRIu32", slba=%"PRIu64" transitioned to Empty state"
 
 # nvme traces for error conditions
-pci_nvme_err_mdts(uint16_t cid, size_t len) "cid %"PRIu16" len %zu"
+pci_nvme_err_mdts(size_t len) "len %zu"
 pci_nvme_err_req_status(uint16_t cid, uint32_t nsid, uint16_t status, uint8_t opc) "cid %"PRIu16" nsid %"PRIu32" status 0x%"PRIx16" opc 0x%"PRIx8""
 pci_nvme_err_addr_read(uint64_t addr) "addr 0x%"PRIx64""
 pci_nvme_err_addr_write(uint64_t addr) "addr 0x%"PRIx64""
-- 
2.30.1


