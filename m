Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2238B2B0EEB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 21:16:40 +0100 (CET)
Received: from localhost ([::1]:36772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJ1L-00019G-3L
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 15:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl9-0003Er-LR; Thu, 12 Nov 2020 14:59:55 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl7-00078o-TT; Thu, 12 Nov 2020 14:59:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 180735C0178;
 Thu, 12 Nov 2020 14:59:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 14:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=TqqiMr2dKOOQq
 B3CmCfppdNgvzCDBb0OHgbBfuuJd7U=; b=q8Im0pVTocXwBR0xgxGZ+egpiTIPh
 T4JmhIVRzYiPvoZiw8nqys2d7cmnpD7RK/OUavjdrGELjk9wU1vFXENpdQEuAf6h
 43wO4prtH39ttZLHbVsFYRDkS5PDhnaUli9m1sJ4WphtdaYVzKy8GCA7neiT1R4G
 TRadTx3KtCI87ajPcC0oG061ugUeEf8KcGgYvrRV+40fcHICDGOHE71NlzMeFCuR
 ToKLQqcIxUxdOqB5u6Vw9OPo3aiuVRaEgc6KlOl4DIcutVtUpHa86WK5RiV/XsKS
 VXGoUM3SGZRqE9FwIWp+lMCz4Zf0rjGpsY5On+c7qv41J8+5EeIQxzocA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=TqqiMr2dKOOQqB3CmCfppdNgvzCDBb0OHgbBfuuJd7U=; b=C353OQCS
 eFDMNoY5XVGBoBKrW0EIEMhBlccDYcNkoHq3bF7tMZgmfiEH1KdC8WsghJiKgezQ
 PvDdCSDD7D3TL7pK06sqEnl/Zmyr8mCbBI4KNkCDhF5LfP0knw2PE3+LElYRqZRf
 59bCfZx/knZUkgq95mbM5zo9so0s4/nSonnU75PgZqE95tptVvqG6y/hgWhVv+ht
 tNr6YOP1RuguAWn0POXpmehFKwdPA4bn0RCyv3JetyGftRm+TMUSSvJWKJMAIMnI
 spsHYVXoUmHJqtnQrQ71D6FFOoqVrF3atJTY9o8IZ8RYdFIqaFt2uw1AIfLszmRx
 V3a194Z7FFO7yg==
X-ME-Sender: <xms:OJStX1qQCGSDTrNcUcHQ_edYGf2Y8vF11tDkLznjHR4d34DxHQEW1g>
 <xme:OJStX3puRLD-AgMmPF9R-T4dL9EQeCp2GvaJ8oGSk0W4NedaOOipntXGxf4F9r55-
 ZJWl4OdAxyO_eol31E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:OJStXyP-PCRntNvhqai9-1veHOWFitoPjNakTnXp8mbiaZ-LU52VVg>
 <xmx:OJStXw4TcyEjA_mXN1rwKyQeL118YaPtgzcYQIMuMRHRHmJcwYHFAg>
 <xmx:OJStX051SZKF5rLK43zkPbRxGrkW5LAOCO0WPhR99v1nXfOX2qIpEA>
 <xmx:OZStXzaL7gsRzMP3aGCas7gokGV0xSjhgBEIt-rnUM9dUXpaYwT4vg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C19B30689E1;
 Thu, 12 Nov 2020 14:59:51 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/5] nvme: add namespace I/O optimization fields to shared
 header
Date: Thu, 12 Nov 2020 20:59:44 +0100
Message-Id: <20201112195945.819915-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112195945.819915-1-its@irrelevant.dk>
References: <20201112195945.819915-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 14:59:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This adds the NPWG, NPWA, NPDG, NPDA and NOWS family of fields to the
shared nvme.h header for use by later patches.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/nvme.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 966c3bb304bd..e95ff6ca9b37 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -990,7 +990,12 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint16_t    nabspf;
     uint16_t    noiob;
     uint8_t     nvmcap[16];
-    uint8_t     rsvd64[40];
+    uint16_t    npwg;
+    uint16_t    npwa;
+    uint16_t    npdg;
+    uint16_t    npda;
+    uint16_t    nows;
+    uint8_t     rsvd74[30];
     uint8_t     nguid[16];
     uint64_t    eui64;
     NvmeLBAF    lbaf[16];
-- 
2.29.2


