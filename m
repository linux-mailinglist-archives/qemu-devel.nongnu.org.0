Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251ED3E4457
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 13:01:03 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD31i-0007vP-1w
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 07:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2x7-0003Ow-6u; Mon, 09 Aug 2021 06:56:17 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2x5-0008Lt-AD; Mon, 09 Aug 2021 06:56:17 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F21E5C008F;
 Mon,  9 Aug 2021 06:56:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 09 Aug 2021 06:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 JqF/XEfERIVnQqWrRMRF7hYf1ac5Sx60YH0N4DEKhho=; b=R+VofVt+o2ediSKV
 mHESfwdT0Ho4Z359YxD9htVkIJEMAJB01/KT1vVAWfgeo1uciF2MG/IvMkCaYXPb
 CSanSDlzgYANFzDZTMQqp2jaEN3ipFnUi3HvYWM7clG/VaT4tBQc1QysQi3s7x7i
 rTZm7bZkQM1tlqB0mlv8PFkFCaDOHhp3quuJRO0ciUKvHQiJUUIw2zyA4P51k5uA
 AYvhVsiAP3ahB9K2v7UFZmVlv/qiL7cJ/En9PIOK9f+Zbg7jnHVtiaPS8OeOH+2C
 IYB7L7xljerTjpWUX5VIDf/Ef49emXYW+xchkggDBeTHljyAWQIM/uxq5nBgTdBq
 aXN7QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=JqF/XEfERIVnQqWrRMRF7hYf1ac5Sx60YH0N4DEKh
 ho=; b=q9FRODWYwJ4BXs4brjkgWQ1KlmwyzHImvIXiqtHQChoozeOgwArFam1of
 2f2oEGug7cZh5v0n5K+0CP/ebTVJZqSzmaca/eBSikVrS3bTdeV+GnvZZXIlrQR+
 eHwDWVdGdXGDM5xcHraUQFcxdqEF7mbu26nGXuSkmGErJ7C5P7zXsPrlPY3qG0oL
 YP1sudjEe79UVMQ/DjaYp/hxgM7dr/WYlk464mwyGRDO59BnIQzNrwJBlszce3Ds
 R3o02JM5Xc9UzSNy0VeLI/ZaaqDGj6R+wOG5jKOIaTzAczzTLt+zI6eIA0j/1Q5F
 ItOFocHhU7j3j/HqfvRbKzDzSOC9w==
X-ME-Sender: <xms:zQkRYe6ZeYYoq-jbyye8xEVXn3PM6F1zalJXRk7hDEaG3o5WcbmELQ>
 <xme:zQkRYX56cBUJklaPzA0YrQ8NsUdTHQ9NoiXctXc0n0U7lwi-uLOzxrX3NcpkyXry2
 rzcJtooNe6GbBDYzoE>
X-ME-Received: <xmr:zQkRYdezeVYkGRCeAGTlo-j3CVsEhNVst190aQRE8tl21tCRmtSIymtQT1HCosn512H4-BQOI2OmdxsP2ULVWnrnXPNWL-sdTq69nr-mew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfhffdt
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:zQkRYbIofKoPWyJSGwkPj6iQD-JAhL8s5iNJtWruc3NNY_pE70Vq2A>
 <xmx:zQkRYSIEyT9Nk66ZyLfwbefS-i4wI1ZeoSvCJLG1XSUeqlKoxO-OlA>
 <xmx:zQkRYczqi447wJ2liV2Oy-PmH90jQXNBnS_D_oxkHIq2G4G110-s7A>
 <xmx:zQkRYUjbW1O9f6K0Z-e3YS7qb7iRcwnobJSlzT8QppOgJZdiXSS-ow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Aug 2021 06:56:12 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 1/1] hw/nvme: fix missing variable initializers
Date: Mon,  9 Aug 2021 12:56:09 +0200
Message-Id: <20210809105609.51177-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809105609.51177-1-its@irrelevant.dk>
References: <20210809105609.51177-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Coverity found that 'uuid', 'csi' and 'eui64' are uninitialized. While
we set most of the fields, we do not explicitly set the rsvd2 field in
the NvmeIdNsDescr header.

Fix this by explicitly zero-initializing the variables.

Reported-by: Coverity (CID 1458835, 1459295 and 1459580)
Fixes: 6870cfb8140d ("hw/nvme: namespace parameter for EUI-64")
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvme/ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 43dfaeac9f54..6baf9e0420d5 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4663,15 +4663,15 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     struct {
         NvmeIdNsDescr hdr;
         uint8_t v[NVME_NIDL_UUID];
-    } QEMU_PACKED uuid;
+    } QEMU_PACKED uuid = {};
     struct {
         NvmeIdNsDescr hdr;
         uint64_t v;
-    } QEMU_PACKED eui64;
+    } QEMU_PACKED eui64 = {};
     struct {
         NvmeIdNsDescr hdr;
         uint8_t v;
-    } QEMU_PACKED csi;
+    } QEMU_PACKED csi = {};
 
     trace_pci_nvme_identify_ns_descr_list(nsid);
 
-- 
2.32.0


