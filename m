Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9C2FB568
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:42:43 +0100 (CET)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oTC-0000RB-2Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2q-0002FY-G2; Tue, 19 Jan 2021 05:15:28 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:45187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2o-0004OB-Nz; Tue, 19 Jan 2021 05:15:28 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A93C4F6F;
 Tue, 19 Jan 2021 05:15:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 19 Jan 2021 05:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FyE9MqxPuUBKm
 LHmf9A+z3DWz4LJFUSijxwTVzTh76Q=; b=E7VMdqw6GNtOlJYwPylkjFhOtA9SO
 wb9X4gIfHqWQxI9MAZFioP0oT4KDpQBwCiSrGVns4TN5X/s6NSgqs2/Gyv826V0a
 9F1zcrZ1zAGocCNuehoIRMKcYrfThdVn9v+e/Ng6ESThRR3W74FnNab5gHMnFn9v
 +qVlqA2ZqtLVTlZfmsAeOXnQLGG7QvEi5dQ2m6OWzo215xxCODZI6gQGsfjKvyve
 dke//x/uN3poXsCVeVY+V9DN8bUMLb7BqVcrGVgl7XLhwcuU1w1AWhIotjfRwSPy
 6CPeOowkPmo/TGVSi8aCRkpx6Txhh0TuFGUkMWSzlVwv4xihl29pFtndA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FyE9MqxPuUBKmLHmf9A+z3DWz4LJFUSijxwTVzTh76Q=; b=e55h8kjQ
 Ic6HXPT6koqc8WYxbIEeAfT/4iKsDwLFknfKh2M2YKClechrc23TqmLWnc1QKtZ5
 /JLld6Sz/tczwQxm/TdgO+O0rFy6xIJh78J44Bdb2FDOg0Er1+i+Qzefoi9Bmpiz
 YyPiUllsQ3KYVnLk/TwgjqPoabcim7d+hnscNEVrzfHlhozz2WWJEV8OzyXv8Pfi
 bZN0Te2RPn/1faCPTx85vfHuwX/Kc5e3BM/4lUZ5eASKPWZ38+JWGMwhWXuhskK3
 YNZsukj94Undq5P20MzT1Qg5Zb6wHvLvoxGuEvLJ1iBx8jlOkhKBrRsSBvioeUnD
 +BFZWInRSJRUuw==
X-ME-Sender: <xms:O7EGYPQP_oIqgoPCUVyDeBpTfTCwamCEgi57Xfc796ALQMG5sufaVg>
 <xme:O7EGYLUQXMPI02n7kfOsb_Qzeal7YP2CD7X5Dqm2jdttsBUmglWlH6-YTM1LI22O7
 B2s6sJyfh25qsADuto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:O7EGYBbJMRvi4jbpwtJ5OolXunu4j4WQcALnzGXa6ePYDF7cnmw5IQ>
 <xmx:O7EGYB2YZXAckghJbyVXqhPS2sYG3M2ko50xWTF_QOABYj8ShLu7Gw>
 <xmx:O7EGYDggPtFDERjmVzjCpUl-mHNC8QAO4B4PQ6KutXuGibw3R0OjNw>
 <xmx:PLEGYM7KIFMPjDUBGNx85AHAq4j1qaxGTdqVxQwQHzMpkrbyANfZcA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2824724005D;
 Tue, 19 Jan 2021 05:15:22 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/12] hw/block/nvme: bump to v1.4
Date: Tue, 19 Jan 2021 11:15:03 +0100
Message-Id: <20210119101504.231259-12-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

With the new CMB logic in place, bump the implemented specification
version to v1.4 by default.

This requires adding the setting the CNTRLTYPE field and modifying the
VWC field since 0x00 is no longer a valid value for bits 2:1.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 3 ++-
 hw/block/nvme.c      | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 7dcd8f9b4e78..c34343c13a3c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -949,7 +949,8 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint32_t    rtd3e;
     uint32_t    oaes;
     uint32_t    ctratt;
-    uint8_t     rsvd100[12];
+    uint8_t     rsvd100[11];
+    uint8_t     cntrltype;
     uint8_t     fguid[16];
     uint8_t     rsvd128[128];
     uint16_t    oacs;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4bcc3cd71c9f..2c158cf419b0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -108,7 +108,7 @@
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
-#define NVME_SPEC_VER 0x00010300
+#define NVME_SPEC_VER 0x00010400
 #define NVME_CMB_BIR 2
 #define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
@@ -4421,6 +4421,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(0);
+    id->cntrltype = 0x1;
 
     /*
      * Because the controller always completes the Abort command immediately,
@@ -4449,7 +4450,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
                            NVME_ONCS_COMPARE);
 
-    id->vwc = 0x1;
+    id->vwc = (0x2 << 1) | 0x1;
     id->sgls = cpu_to_le32(NVME_CTRL_SGLS_SUPPORT_NO_ALIGN |
                            NVME_CTRL_SGLS_BITBUCKET);
 
-- 
2.30.0


