Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E029AA32
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 12:02:55 +0100 (CET)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXMkf-00066g-U2
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 07:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kXMXx-0008PL-D5; Tue, 27 Oct 2020 06:49:45 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:49815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kXMXv-00026t-Lt; Tue, 27 Oct 2020 06:49:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B1BA95C014F;
 Tue, 27 Oct 2020 06:49:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 27 Oct 2020 06:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=NUroHaB5R9qWf
 e9blSonw+UfK5j4zMyrJvn0kafQITc=; b=x8Ij5Sm+eHsIL65WQ3hw8brHjdzYT
 NPtSo/2TrWi8BxwzGZBMB5dNctvNjnPSxP+2scFVb6pTJTauNLvDAtws6EybpRvz
 a51DfOTAHZP+x3CxTo9MB6k45lWOfhwx2ddw0ucTXg3W0+ITMTO7O1yMfSrCXjbw
 XnnzUGWk230LXcBjQN6a7wPplj7MWRB1CjiDtNRaoO6T7skHAbPkjbC7qTf/MCao
 CdDhJ3ouNTZjddB6jVqtvkFm75iyAxHTTZKwUNgSzk/R23KOqRPs2sEgamdikSH8
 +g3JaMN9rjJFbmlhqcgSncpknRsvjL3z3HclZjvRdJ/7z7v9viilIOkZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=NUroHaB5R9qWfe9blSonw+UfK5j4zMyrJvn0kafQITc=; b=GjJU8SjU
 v/APFZKud46aWtG53UjAUoyqF0xzuMwjccUj2cf1odUWUm3uyT9tz9fMAI7YHcj7
 rqvjb1vl1gjbuy52yQ0eW9l5wENL4amtdCc8MUFTRkPYiat4m64Y30ZiyFFFOrXO
 0kFpCuHw7KBMef+doHwpsLjOd/8hmob1kfn837LfHK5v4HPIg72MkUSlUo+LHzm/
 s1X88OBM7iMH1O8WFOKDAk4odjzBh86lAPkX+BrSXUoERr10s09SbFC1yDQwOgHs
 mkyXrmkTovEUfxWKOYPlQ0TQY605PEsqw1iHsMHAX86ZpHCava6Mls1KujtjqzMA
 hMx/Z7C1x22aaA==
X-ME-Sender: <xms:RfuXXxpgFO2j1_xc9zI9i5Co43o9vytuL_b-cbnetNHzVf17ZA8jUg>
 <xme:RfuXXzpj8qs1dHBNMJUiOC12r3nMXb6oKxtjeTkg_0nUs7tfwsMhVqTE6g0FzJeiB
 NYQtchktuOhuU-60pE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:RfuXX-OzMrg-V-tx9hbHPotFKbP-H9MRZHfgpOV3eGCM31MNXtmmuw>
 <xmx:RfuXX871W--aPH_jvcBAsiq56i2zYNVWbHGoW8wI_LoHH4gFaFiN7w>
 <xmx:RfuXXw6BKgPVP_w86aZ9wfvg7xa6TNhXDIrtVBi3b2GAeV4eUYr6xw>
 <xmx:RfuXX-mpGDUVlvhqx-kagL7rGS1r0MqKbiso0UzAFZ0uX2C7po_Lqw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A68CE328005E;
 Tue, 27 Oct 2020 06:49:40 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 06/30] hw/block/nvme: add a lba to bytes helper
Date: Tue, 27 Oct 2020 11:49:08 +0100
Message-Id: <20201027104932.558087-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027104932.558087-1-its@irrelevant.dk>
References: <20201027104932.558087-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 06:49:36
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add the nvme_l2b helper and use it for converting NLB and SLBA to byte
counts and offsets.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h |  6 ++++++
 hw/block/nvme.c | 12 ++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 52ba794f2e9a..1675c1e0755c 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -77,6 +77,12 @@ static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
     return nvme_ns_lbaf(ns)->ds;
 }
 
+/* convert an LBA to the equivalent in bytes */
+static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
+{
+    return lba << nvme_ns_lbads(ns);
+}
+
 #define TYPE_NVME "nvme"
 #define NVME(obj) \
         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d6d8324fa1de..59338b42328b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -644,12 +644,10 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
-    const uint8_t lba_index = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
-    const uint8_t data_shift = ns->id_ns.lbaf[lba_index].ds;
     uint64_t slba = le64_to_cpu(rw->slba);
     uint32_t nlb  = le16_to_cpu(rw->nlb) + 1;
-    uint64_t offset = slba << data_shift;
-    uint32_t count = nlb << data_shift;
+    uint64_t offset = nvme_l2b(ns, slba);
+    uint32_t count = nvme_l2b(ns, nlb);
     uint16_t status;
 
     trace_pci_nvme_write_zeroes(nvme_cid(req), slba, nlb);
@@ -674,10 +672,8 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
     uint32_t nlb  = le32_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
 
-    uint8_t lba_index  = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
-    uint8_t data_shift = ns->id_ns.lbaf[lba_index].ds;
-    uint64_t data_size = (uint64_t)nlb << data_shift;
-    uint64_t data_offset = slba << data_shift;
+    uint64_t data_size = nvme_l2b(ns, nlb);
+    uint64_t data_offset = nvme_l2b(ns, slba);
     int is_write = rw->opcode == NVME_CMD_WRITE ? 1 : 0;
     enum BlockAcctType acct = is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ;
     uint16_t status;
-- 
2.29.1


