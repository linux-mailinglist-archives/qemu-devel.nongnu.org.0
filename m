Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E25330874D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:21:53 +0100 (CET)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PyS-00009C-4A
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Pse-0006TJ-W2; Fri, 29 Jan 2021 04:15:53 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l5Psb-0003cX-KO; Fri, 29 Jan 2021 04:15:52 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EAC885C01E9;
 Fri, 29 Jan 2021 04:15:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 29 Jan 2021 04:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Lo+4riIA8vp3O
 aiYbYivYwogK1MChPVXI3VUQclJtHM=; b=RHTpinc2EiShUrwv1qcdEZCCbaop3
 7CiDNzogH52Iheeig3fByNwi+x9Rzrd44034QQK6IYsFokCMu2+56+bbjfG1xtH8
 IOxiwIxgrN7E8V0suhOaABFDWVGNRPUhCDqWiNvo+DJPNfsvV377JAVT4Lcnvq3j
 i+Gvou8OMI8qqtJONMtvkut4ndRW7IrotLkNhMLm3J6zSSeiQzO5faNkRTlAEH1z
 +uIVb5JziLCYsHel6ks04JOVgK7ppHl0iWsrfEtFTnOiwK3+b9AA9QluMUD3z5N7
 VraHaKt8tgA1gqg9LNlwqeRVcUgKs8PR6qg5jshqTgabRMiXbHS00rDtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=Lo+4riIA8vp3OaiYbYivYwogK1MChPVXI3VUQclJtHM=; b=VFf3UXX/
 iz0RjcWG6EzhOj3s6Pp0USxpTLwpNMAqSeMlqblt3gZrkyh+IU+4/efJabIFLKkS
 KNlLWlxxo1+Nx+L6ma7AVX+KZilfjBwqsGrl7b8ykl6HdO3PqifvKCoFB6ZsfWbq
 FwdGAVD6D9JK9tiFcQOcxSVqEaPb/KGNF9MiMEPf9DZTRgXo97IZ8FrfAP/iFnLd
 5KlnCyXdSyMYRh38EXl7XYORmksFYl5//yYWT3uvbNRRim5b4dAzcX9lPR/0f1l1
 K04rOiTvwvnH9zycwJz2TwrhuDKIWcnojSZDt6OOsgfNpxcCDOZm30o+/45Hed6R
 5Beqbopgx/15NA==
X-ME-Sender: <xms:QtITYNIgNulRhxEu5_Yx8IxSb7Ta34wm_QA1RQpQzfGq3XqOjrMPzg>
 <xme:QtITYNaaRezfuDaSn7WSLIn-HgkpP-Fbf_rqJnmSi9-qF304Ty94-WM5RLAnHlI6Q
 Xu1weQYcaCoaRFKMRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:QtITYAsesjUEGi205yzf-catKXwBE3ALEHNuVCmNDv00kzEzm7CKgQ>
 <xmx:QtITYCu29y7U0uJoz2f3Ik6Sfb4DxW_I0qBrnjTmRSmNBmOFd2Dj9A>
 <xmx:QtITYNfRWp-R6Vhdkfrgph5MGV7re365OjLh8g1239Rp7ebEpxe0Ag>
 <xmx:QtITYMRIHKRDHm45aDp91Xv4PRb_wXh7T1-0PUgZbyAjUYsT-ZdTpA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 88BD5240069;
 Fri, 29 Jan 2021 04:15:45 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/5] hw/block/nvme: remove unused parameter in check zone
 write
Date: Fri, 29 Jan 2021 10:15:37 +0100
Message-Id: <20210129091541.566330-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129091541.566330-1-its@irrelevant.dk>
References: <20210129091541.566330-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove the unused NvmeCtrl parameter in nvme_check_zone_write.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 8ac997735041..79d9563a17bd 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1183,9 +1183,8 @@ static uint16_t nvme_check_zone_state_for_write(NvmeZone *zone)
     }
 }
 
-static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
-                                      NvmeZone *zone, uint64_t slba,
-                                      uint32_t nlb)
+static uint16_t nvme_check_zone_write(NvmeNamespace *ns, NvmeZone *zone,
+                                      uint64_t slba, uint32_t nlb)
 {
     uint64_t zcap = nvme_zone_wr_boundary(zone);
     uint16_t status;
@@ -1748,7 +1747,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
             res->slba = cpu_to_le64(slba);
         }
 
-        status = nvme_check_zone_write(n, ns, zone, slba, nlb);
+        status = nvme_check_zone_write(ns, zone, slba, nlb);
         if (status) {
             goto invalid;
         }
-- 
2.30.0


