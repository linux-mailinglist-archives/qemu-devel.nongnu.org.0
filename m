Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24913333973
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:09:20 +0100 (CET)
Received: from localhost ([::1]:38558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvmJ-0005f1-2G
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXR-0007Vl-R7; Wed, 10 Mar 2021 04:53:57 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:48937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXO-00052o-N3; Wed, 10 Mar 2021 04:53:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5DD735806C9;
 Wed, 10 Mar 2021 04:53:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FYrnxZCRUqxvX
 hWp4PVvzcwcxMk+kEx5KKxZbiqJ6bQ=; b=fW708OreVNi21n/3UaRYEiH+hn8ZF
 3m81xBHlnVdBCJCx2xdoRoj5z4/JD7hA9IBsZHNtPL9kDWR6x7pUWd4T5jKc3Qav
 vXhpR5UFe4xCsZ8wnwFZJApqMtjwQgqghFUpeE5lMPGfyTPXxhsOpJavww0xFQ/F
 g3utkEKoe0n0lAJfgGbT+GVI+jmrABoDw/VUaAHR5RGnyNhegf9jImoYHmuIwl+i
 ARhGU4cfqLrYDynEWWV+BdJkUhdWtP8T+bipKL7RXVSyoiBS1r9pO9gUMXbujrFP
 UOD2lZL4OSeVqkMFwyFPDmTo36cWH7X6epf0mwDUepd7SEpYAfYqZwGvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FYrnxZCRUqxvXhWp4PVvzcwcxMk+kEx5KKxZbiqJ6bQ=; b=pZe3yeeM
 GoTCPH5sIklHJENonZ5Yw5Qa/8Rc4Irtb0tOSPFcpYPz30x62xHM8hEPX5kw3Q1m
 XDCSI4GPoXfA3GowXuVIkzEA23sCf/7G48qXX2Eky49sRgBbBue0aFBCNM/Z3Uy/
 GcwnX/u4DiMBtUBS+EiUbDxpxbR7rqe67/sN3HEY4qH0V8kDgGjEu+tq/KaohL5R
 6626C6es36FgSaFAAqsGB4AOjncJqbiK5Z89UbuS+Lp8/h81QzDIN+qwL3hSmMbZ
 +5AszACaMHA/n+5ErecWQYWdNAgFBbTCLx8VupQ8zqobsbWIO0L7xlitOJC5fg9r
 PRKPW6I5vYa/Tw==
X-ME-Sender: <xms:MJdIYCCTMAX9nNO6TsgjjQH5F9IVs2CnBxdFOdMPPFdV3CZJ2n2eiA>
 <xme:MJdIYMiAU4OCrln8NGV15h4MsnaGI9B1Klrm02sQ_LIPdAAhfQKnVeBxBkhB6xlll
 dnpqZo2aaXu_lYXDL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MJdIYFndARC6FrexHkG6ZI3osP1fMmK-_b4BqijS7funKHRZcTI4_Q>
 <xmx:MJdIYAyhmP6PZG6K4-AembubEq-pvl0BhnSTibvG0H-N61f7muHQZg>
 <xmx:MJdIYHQeAaPAZiUwhzpITPlZNKjNtcYmTgm--Sp1kqJJWDeKh0dpqQ>
 <xmx:MJdIYCHONviYnW2CIZiUYashBb5_63Mc3cgw_aHUSOi65x655uoQTg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C524024005E;
 Wed, 10 Mar 2021 04:53:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/13] hw/block/nvme: fix zone management receive reporting
 too many zones
Date: Wed, 10 Mar 2021 10:53:35 +0100
Message-Id: <20210310095347.682395-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
References: <20210310095347.682395-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_zone_mgmt_recv uses nvme_ns_nlbas() to get the number of LBAs in
the namespace and then calculates the number of zones to report by
incrementing slba with ZSZE until exceeding the number of LBAs as
returned by nvme_ns_nlbas().

This is bad because the namespace might be of such as size that some
LBAs are valid, but are not part of any zone, causing zone management
receive to report one additional (but non-existing) zone.

Fix this with a conventional loop on i < ns->num_zones instead.

Fixes: a479335bfaf3 ("hw/block/nvme: Support Zoned Namespace Command Set")
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d439e44db839..c7b9a1663dd7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2619,12 +2619,13 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     uint32_t zone_idx, zra, zrasf, partial;
     uint64_t max_zones, nr_zones = 0;
     uint16_t status;
-    uint64_t slba, capacity = nvme_ns_nlbas(ns);
+    uint64_t slba;
     NvmeZoneDescr *z;
     NvmeZone *zone;
     NvmeZoneReportHeader *header;
     void *buf, *buf_p;
     size_t zone_entry_sz;
+    int i;
 
     req->status = NVME_SUCCESS;
 
@@ -2666,7 +2667,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     buf = g_malloc0(data_size);
 
     zone = &ns->zone_array[zone_idx];
-    for (; slba < capacity; slba += ns->zone_size) {
+    for (i = zone_idx; i < ns->num_zones; i++) {
         if (partial && nr_zones >= max_zones) {
             break;
         }
-- 
2.30.1


