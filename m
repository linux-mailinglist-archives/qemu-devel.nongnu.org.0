Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A923D33E0EF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:59:06 +0100 (CET)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHiT-000710-Ic
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXo-0006s1-Ac; Tue, 16 Mar 2021 17:48:04 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:57931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXm-0000vE-Pr; Tue, 16 Mar 2021 17:48:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DFA3D580A76;
 Tue, 16 Mar 2021 17:48:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 17:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=aQ/+o2Jwoa4rt
 CJsgP6cUiDm6q/wU6aNweqx4+nber4=; b=T/er1Uk1tDwIjolXJdO7AYGyGNgP3
 6nxlxnsJO9CN+Ba7HN99Fq6Ecso5yXPxSLasB7UcGYbvAOdebNYsIOuKlSq3zn9K
 wG7Anh4kEkSRxfxlqxR73l8i5fSPuxC1dSoLtk2qf1bciPKHzHkqtouOkNQxbIo+
 0+1ufwK17RRqL+ysRYfTqF0PqMySt2WPEP1b+EcBezL1upina18gqhXNperDAmM1
 ctzB+zH10cuK7plSeSLv/lSrRUwDngtaN4hg5tj2gm+oukbAUH37OY/fEQqWxvoW
 3FclxBod9U2tVnXcbHaXwKTUI/kdeSIqSFCXHrKTlP0HdpPZRqZyHZEpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=aQ/+o2Jwoa4rtCJsgP6cUiDm6q/wU6aNweqx4+nber4=; b=kqGQ2btC
 SVNiH24IMwiZUB7Pi5PJllKlpLz3iQ7/Eii3e+Sfl775Y0kS6hdcpSkfFvJFAxC3
 +sODFS+48gOELxbH12xt17+nRvPvG8bzjVHnHLeV/e1k2+ynQFNFnCjdt6RtuYmz
 F9Ln+9pQ+OQDjWUzGRdZMNvggOzWrquXi4pr9gIvjT1h4MHP8MeFhn7jm4NAvdXL
 WUzmT0WVWi+Hbrk0xrkxkWxQx8EVVGDWkjA37GC0AwNeScMT+zHhXKs+EOUO4GIO
 Hp2YLi+Htk6hKgCLfi0gDsR6Ju5y/QAtAvti50xcLs3JSXSnM05UM3v45rIHsBWP
 wfVi5XZgqqwN4g==
X-ME-Sender: <xms:kSdRYBrX6j8l9fStvFGZDZb4CWX0-LNh7mzhzrSZYHyasSG0LE2qpA>
 <xme:kSdRYDoOLVTKbqffeZe3yGgt8RAxOSI6y0J0ENcWfXjOPkiTiXl-U9zzM6C9W6Tu-
 S4MiSKxlktJmfDQ9e8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kSdRYOOCz7J_olx735UB672nqRkalCWfaGJPnGnXKvRDifQZEsNwww>
 <xmx:kSdRYM4YGlqek5tTcZWhpvjEGDrClJYLFqDX16NEmBX1UXQJsyFiPA>
 <xmx:kSdRYA5okY02846cntpGJ3JrEW8Kap8RZO65pt7nQ91VlBPIRUbcAA>
 <xmx:kSdRYCvqQKxINI5avM_HhcWURlJJJVyz9H7vqnVYS1mYeRdgKuOlnA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A90F108005C;
 Tue, 16 Mar 2021 17:48:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/11] hw/block/nvme: fix zone management receive reporting too
 many zones
Date: Tue, 16 Mar 2021 22:47:45 +0100
Message-Id: <20210316214753.399389-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316214753.399389-1-its@irrelevant.dk>
References: <20210316214753.399389-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
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
index 0d9b980151ae..9a14c5f7035e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2620,12 +2620,13 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
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
 
@@ -2667,7 +2668,7 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
     buf = g_malloc0(data_size);
 
     zone = &ns->zone_array[zone_idx];
-    for (; slba < capacity; slba += ns->zone_size) {
+    for (i = zone_idx; i < ns->num_zones; i++) {
         if (partial && nr_zones >= max_zones) {
             break;
         }
-- 
2.30.1


