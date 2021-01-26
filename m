Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFC303C2C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:54:20 +0100 (CET)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MvL-0001nN-Nb
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4Mnm-0005r3-F7; Tue, 26 Jan 2021 06:46:31 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4Mnd-0001Ix-Ie; Tue, 26 Jan 2021 06:46:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AB3B75C00EF;
 Tue, 26 Jan 2021 06:46:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Jan 2021 06:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=us1b5cXMJs5xl2IF/X9t9GNXdY
 0AKXeBAPnBuGwnN1U=; b=JWUkrB+odZ69pfJjFs9L4WQQrbMWvogGZlnnrKYIJV
 yHlyS3TbhQbd1RVA9hDcqUGZYTUtavaAZ5N/M8bZZJlw031oxO0uEUZVBalHBx6Z
 qri7bsHuiqpi6CVHUqXnkl5+oLsibABxahSOQXrhRSMUbzaDIP7laaJpiJmfUlpr
 Rd8OMhpdxWerhgWodzKlsvGuTP3KyW4trP7sMFdeGIsM8HRBll+NbbekAVnseY3f
 YTBhdBb3BFC09jZIPJRhAl6blVy6tcnZZzAs6ybJY47tJIZmgB7mWJFs2tDmJZTA
 yqC/pPXhYIGyYC3fVAo+/Hd2RQz/NXqkErACTAFZhc0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=us1b5cXMJs5xl2IF/
 X9t9GNXdY0AKXeBAPnBuGwnN1U=; b=ULTibcuDhkBYBEuaaUGVrHwmTpZ0LgrZR
 qON62ZMLrK+E9Ktk3Hi8Mo6ZOtG6asKC1thOSflHspCHALJn43EhTcvaQiAq/KZa
 BNfnZGe9daIo3oQk/6YVnAF54tz0CRY8FIUaqpo0fdIFD+39rhb6t6wDCfJcKdw1
 j6wd30xurRaN2T/XcManlXpvaTA8PoNPtsAbb1WwuK5BQhai2DMcR3nCBl9xsAUl
 MRJE4xGbgwiwAYg4sAoD06zYqbu5aGuOzaYPUyHBaYcD5lBcrt82P7zLOWn+WWmJ
 esefB0IYB1o/Jb7SOQP7Xu51aAAnJaNPnqN/oH5UBoD8DvSRBOQfw==
X-ME-Sender: <xms:CQEQYGxIgk2GkRWNkSdaBfIbur9XPqP1gecluWvHiT6i7eV8hkOm6w>
 <xme:CQEQYCT6D8HVsfhXKTrh-PrPIbDMSSAz_54NnPcHi9NO-a1Qif1WWDz4TFVCRzLTW
 7d1j6QkMV8Bs8HuB8I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhlrghushculfgv
 nhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnh
 epfeevledvieekudeuffetgeegfeehvdffffejueeuleduhedvgeejveejhfdtteehnecu
 kfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:CQEQYIUxGlc8baUtxXSnR506I84zrpa0ae-tjqv0wyv2h5FISacecA>
 <xmx:CQEQYMj_I-ADEcxKVVUnv3gdQ-cIv8_HScOWH2WpU2MGBjW2ZHNszQ>
 <xmx:CQEQYIBcxT_8VkSKTP1OByQ_BfFSeKqt8Nt5KaXkfQecaLlYh_J6bQ>
 <xmx:CgEQYK2gAq8xzcKBntjgfvgwbUhqXhBc_tX50UfGJ92gTlLKZQ2qWA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A68251080057;
 Tue, 26 Jan 2021 06:46:16 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: add missing mor/mar constraint check
Date: Tue, 26 Jan 2021 12:46:15 +0100
Message-Id: <20210126114615.303740-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The Maximum Open Resources field shall be less than or equal to the
Maximum Active Resources field.

Verify that constraint and remove the redundant check that the Maximum
Open Resources field does not exceed the number of zones.

Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reported-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 62b25cf69bfa..9586f7f33b8c 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -140,12 +140,6 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (ns->params.max_open_zones > ns->num_zones) {
-        error_setg(errp,
-                   "max_open_zones value %u exceeds the number of zones %u",
-                   ns->params.max_open_zones, ns->num_zones);
-        return -1;
-    }
     if (ns->params.max_active_zones > ns->num_zones) {
         error_setg(errp,
                    "max_active_zones value %u exceeds the number of zones %u",
@@ -153,6 +147,12 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    if (ns->params.max_open_zones > ns->params.max_active_zones) {
+        error_setg(errp, "max_open_zones (%u) exceeds max_active_zones (%u)",
+                   ns->params.max_open_zones, ns->params.max_active_zones);
+        return -1;
+    }
+
     if (ns->params.zd_extension_size) {
         if (ns->params.zd_extension_size & 0x3f) {
             error_setg(errp,
-- 
2.30.0


