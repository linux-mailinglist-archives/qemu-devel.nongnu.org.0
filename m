Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95D6330EDD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:08:04 +0100 (CET)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFcB-00048C-L1
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvS-0003On-Od; Mon, 08 Mar 2021 07:23:54 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEvO-000720-5W; Mon, 08 Mar 2021 07:23:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D0DAFFA8;
 Mon,  8 Mar 2021 07:23:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=yJP2uiNmANJEZ
 k6C4uLBD2ASYoiONFjfxe94h+S8yXk=; b=mYYcjfTKldB2rSm+dm1yFy9U5Lh/f
 zGhWUTnlhf6zBMJZ+4CoI/iOL2RLZbbSN7lnBk7SIzGhjNOVs0pT5C5zOWaJeRH+
 bEzdaL7Be5gw+73cW3BWfWG1scWeA43td7Dcr9X5QNXm37FxG59Fy83J3md4VQP8
 NHEmS0jynlVbeTqckrd9UgouMRcti+G8+X6pP7clExLzUDfgXvfLYeB7S50Km23A
 ZL08MBHGphqDxQggcp/DUnHXsh+Aa3w1JMnyou2Z5K4ag+MXMxbnsSj/NZYvCGF0
 nN7p4To5u1Ge/ttLSrGoV/XpUUuIs6WfKw0oZScTp3DuE5v0cHfvhS+Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=yJP2uiNmANJEZk6C4uLBD2ASYoiONFjfxe94h+S8yXk=; b=NRyTLUvK
 7sY4pgWRXNVMBUKQRIQU+gwfX2WoT8QoZuLXx0xgvG9yLiuTVbm4gZrpLaCTCyz5
 rXiEc9KYH8N5pKya7adnzsgOVaLMweTb/TUaMGwfWN8AED4F4fOvkH4E7wmviQ/v
 ArZqWpvTPmGRVaaD9Huf4yII+m1msKluv2GGQFFIm6DQ/1iNd4PcFy7tWIPLeWTh
 AdcrIudhbUcJdwK/zTwgWz32XR4SWoVfkS4Iw0fGZGYj3ldqEqEqWYFnnhKf4RI4
 j+meQnl6/HT89QHUrmiHTtWTZAZNcPZtYJu6paKOAvOcRNG74B1Am/rjJvPC9+7N
 L5HpUpw7Bc3uXA==
X-ME-Sender: <xms:UBdGYEHfS1sfXj974ZgO73IthxwmlxHhDhw3TVSh0f6rosZIbTzogQ>
 <xme:UBdGYNWQxH_gytwHu9fdtt4XNK4Nd2Pi1lWTkc0EDJFT2X3lxpyZKbz64bGSvh_od
 MVPH5LRwwkkz73mPAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:UBdGYOJgjTJoiOkUkvhWKZH_zdiVLMTnujAKyy8wxQTXBaqk8tXR-Q>
 <xmx:UBdGYGG4eBzbAvoHfsEj0LFAZN6N7wgEPqorbPgdTnpy6Xu4FbnHKQ>
 <xmx:UBdGYKVrvegB1E7qS0e_0d2j9EOi5fyOXcK4aEg18yBFu13v8J1XxQ>
 <xmx:UBdGYFH692yKdrntZ8maRNY6OfWTOWZpzYPRD5vY5fVUD7e6QQbkPQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16FA61080059;
 Mon,  8 Mar 2021 07:23:42 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 18/38] hw/block/nvme: deduplicate bad mdts trace event
Date: Mon,  8 Mar 2021 13:22:53 +0100
Message-Id: <20210308122313.286938-19-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If mdts is exceeded, trace it from a single place.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
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


