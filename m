Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B0330DF9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:35:24 +0100 (CET)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJF6T-0001Fu-LZ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv5-0002zl-P1; Mon, 08 Mar 2021 07:23:32 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:32913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv1-0006uS-JN; Mon, 08 Mar 2021 07:23:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A6E64FA8;
 Mon,  8 Mar 2021 07:23:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ttCMfODAjtfaq
 TggQvOlkBJKw2ToMEl9DHUWKQ7EMUs=; b=py0YUhW71QYD1v9qVgrBdAJrHEz6a
 jM1B8ckMkV39K+yR2PoZu+/xcO9PzRkPqDunMvWkStvCar3ZxehsVy07rygg2VaX
 TCfb0xB0tqAIJQRkK6CAP/iYJagEZh8jRUU7ldmJFwHKaSvE25Ouyc0daXPoLYBz
 yNNBiy0G448sHAzqrjKYtHDDJz8kLXMJihUcTXw1QOl2jfLVFYd0oV/Tdb88TioK
 igiYZE2zI8Mtx/ZX3U/n9a+ZELGka1JVCgsgBG7LqN4OU1YyrsBzRx/+tuvCRUU+
 Uw0q4pAmI5sVKmfxSvdYTjLNvgKaKsJDK5Ifbyde083kUPkynFieS8Vug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ttCMfODAjtfaqTggQvOlkBJKw2ToMEl9DHUWKQ7EMUs=; b=pu/Wu7wb
 kcjgPGbQ0ZrFbUp/9sSNvzLRHTmpLmwYcRtI20eACiZWqdyVBoKURGpH5SolUYOn
 Cg8p1lNDOXJbGlKXT0rA312hkmfgQyUiDHHLEBRXtcRGMgaxav6jsVowwd7aFIWx
 OEerDK432CLuqUQBGMlMvauVf1G3OMncECDM4D7sE+/UUeLzqxeQY+HBFPP2AgdL
 60bQ62xxC59oQvRJdvXyPlvcEn2WF9Lw59N5J61uFmjsUKLo1DPV0YGe+tr1p/Ad
 i2mGgs6NF3DAkzqX985k652gzNnYjSfjyNm6SqfS3e8/wqMFCaBtqeKNc2HwWoFS
 I2BnFyiW0lE+Gw==
X-ME-Sender: <xms:PBdGYMFjAJVYhuU8-3jsAHcErRdjLJLdR8NnzyxvLAWaJmYzRl60tw>
 <xme:PBdGYFX7q2a5PHK0TgqFdGPOTnpnXimr8MPZ6PWLmix7qLbWFMAqIbLtkmEPgJK_T
 nSUSkMAIfEHsIY39mk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PBdGYGK5xJp1Ph56aA2BCDZw1PDI1C0tn0tJ09L1Ixnon3hFvUkApw>
 <xmx:PBdGYOFmjMsMkvvCxBnAOTb1IjvmlbQMGv3pnNlfl0rAYOQtUtZwVw>
 <xmx:PBdGYCW45QCDkQztLOuOVAaLbiuHB9FfoctxLcpC6acP9R-TjHj0ZA>
 <xmx:PBdGYGq-fM1dTcDEhve75xs5ubuAXNWJhcj7nufjw4iKn5RXXKD8xCZn6d4>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CE1D51080063;
 Mon,  8 Mar 2021 07:23:22 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 05/38] hw/block/nvme: add NMIC enum value for Identify Namespace
Date: Mon,  8 Mar 2021 13:22:40 +0100
Message-Id: <20210308122313.286938-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
field to support shared namespace from controller(s).

This field is in Identify Namespace data structure in [30].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index f1d3a78658eb..3db2b9b4cba7 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1203,6 +1203,10 @@ enum NvmeNsIdentifierType {
     NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeIdNsNmic {
+    NVME_NMIC_NS_SHARED         = 1 << 0,
+};
+
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
     NVME_CSI_ZONED              = 0x02,
-- 
2.30.1


