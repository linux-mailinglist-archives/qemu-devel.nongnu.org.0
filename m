Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D04938284E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:29:33 +0200 (CEST)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZZ5-0003ds-WF
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNr-00038R-8T; Mon, 17 May 2021 05:17:55 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liZNp-0005ew-IC; Mon, 17 May 2021 05:17:55 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 3918F5D1;
 Mon, 17 May 2021 05:17:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 May 2021 05:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=jWU1CIa28hRSW
 I/94oCJCN3g4HT02fhAwunbOb3KYbs=; b=JqGXrK27e5gyoeYwMnVT5tWgDcgrZ
 WB0ajfXkK7I2mR8impkTcO/zoC2sToa5GWvjYRWBMMxKtB7qX5GThShxhWhCj+rM
 HnbCvbMQ/oHZ7yZ/wTO19J8Zx6MR8uvH0CC0H0RPqU8kPt8AsFcDEYB5F/Gt5TEq
 nqHhK/fGxJHL+z9u6TLAsdD7eEnWOHTnEAGMh9E9yAgXj716w+sALcCFPGCbxgHP
 0JBLKqcsCCRZHO8Z3umNKfAouf6iIvRU1h0duweb3An/2CIFwIbFqeoGxTVpaGVr
 chFszDzsEKkqW91IaZ1ZaF7LAb7TxCaGMvNevGOJ0gBayDa3Afu0ABayg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jWU1CIa28hRSWI/94oCJCN3g4HT02fhAwunbOb3KYbs=; b=s9wLNbub
 kMZcEJLO2mHLUXvWL5JSIt1tABRML+sglr5naot7ShIiVRGTvz2ZOXiAeCAihz+o
 qa+0enHL4OwdLYn92p4rNpmeyszZfgOhfVngBPFu3YgeNBiVKAJqH/17QRNPxXlA
 QtHQSKZUDbTKvSLx114QRP742iuaI9cuzaNg3Os41+sUz+qp+rCYwW7V95gh6U51
 Tt41kF8F9OcVIkTLfqOAEddf7etpM/YZlsJVR3F2lJ0x9R7Jk1LK4yYmMq1J5FuZ
 eCrYQ2su2j6ADPlpnzXW5e05xQpuPrfTazJ3ku2ERGgCu5PMLC2yZjm8z609Td8R
 ivL5421C5v0hEQ==
X-ME-Sender: <xms:vDSiYMQIc1lWdNficLUt_TCfpY7X9tX_yDMTTfkv1euaplbbf3XkYA>
 <xme:vDSiYJzvgMR6arqYyL7zQgOYZAva3Jb0YDOe2N7-KlsalAbrGHj2uxz1DtmnlpSKK
 djmaR_Hnv1pFMUsDhM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeihedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vDSiYJ2FXKWvxDmGh6Y08EKXYa9cE5iq_6g8h0VHXPUHO0B50WRloQ>
 <xmx:vDSiYABeDyDFTHimJ0_owlwgYNh9ckmlYA78fS2Zl133IyP3zNdl8w>
 <xmx:vDSiYFjKQlkWaljDDjjZIqv56Y5ch0BVNcn1x11okmd6MH7GphL5Yw>
 <xmx:vDSiYGUPXFgQt9eC08EARbr-vL-oZHC-92zNv3eopvFmhDHQb227cmDjTkE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 05:17:47 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 02/20] hw/block/nvme: rename reserved fields declarations
Date: Mon, 17 May 2021 11:17:19 +0200
Message-Id: <20210517091737.841787-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517091737.841787-1-its@irrelevant.dk>
References: <20210517091737.841787-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Align the 'rsvd1' reserved field declaration in NvmeBar with existing
style.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: minor commit message fixup]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 4ac926fbc687..e7fc119adb24 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -7,7 +7,7 @@ typedef struct QEMU_PACKED NvmeBar {
     uint32_t    intms;
     uint32_t    intmc;
     uint32_t    cc;
-    uint32_t    rsvd1;
+    uint8_t     rsvd24[4];
     uint32_t    csts;
     uint32_t    nssrc;
     uint32_t    aqa;
-- 
2.31.1


