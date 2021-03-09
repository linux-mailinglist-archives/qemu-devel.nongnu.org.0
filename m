Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807833246A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:50:49 +0100 (CET)
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJasx-00020V-GK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJann-0008A0-R6; Tue, 09 Mar 2021 06:45:27 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:43639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanj-00004q-SS; Tue, 09 Mar 2021 06:45:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5425E271E;
 Tue,  9 Mar 2021 06:45:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=wJM0I9I06P2I0
 V98zTTlkZleVFhNFr2RGgm0LhmG+sk=; b=HjNZsmSWheKv8RZTYOJN0qW2PEsci
 SgV1Y295+LrOqJbPHKbAZGvYIiItW4oFViJlGWDC+73m3netYW5byzUxhMvK/Ovz
 aDvH0FQaNpaXe0oJsLDgnXiCZ9IDrmUKQVTapEprrJMOVq30IUVmEKrHNYtHIuZe
 xUsmeF3K0ZoX4qFaE59Y0vVPJWZ2BXUyy9yv93/qlab7uu2K7rQFAAjSlr1jrRIt
 Nh+rDfqxZ5izUrQu546aA1TftlJyTmMb/n9VKFI7cBPMup282A8DX3Nkyu/O6XkP
 dCFvp5NzhhcICGOi5QTu+sxMmjsRw5O4nNRGfSUmJVm9D9VDLQYb9/qiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wJM0I9I06P2I0V98zTTlkZleVFhNFr2RGgm0LhmG+sk=; b=RtxTukoZ
 nPKbnHAh2f2QwbnoOcoQ97a0VueHdrYAvlrqydvWn8uoLzcQMBj4pR21WQWh2Nth
 iZQKq86ZwG6j6Tku7Y1+a7ipx4ju40B7Sv0dOXMFj5ocN8opoc6fMGmB4qpXjICI
 DmRmrkMXMZGAi6ODlQGvT5kPAe8AM1smqvFgFuu3Wl4CRPlrOacsWBT8luvAGQ2q
 H77ThS+bB2ihFfIs5jJsXPyrjMpH73iXDNq5uFME2jFsr+VkbiHLVdOs3LARRDl1
 Ms/1zsuNusLddgL6eUmD9cTMQ1oyTYJUKWyy8r9Pa3wdkIlC/iMJsYULsgjpyXyX
 TzrLq0hpaZvCcg==
X-ME-Sender: <xms:0F9HYFaXnkYlnPaRpgAiwvX7QbMA9dv3BwFc82PQ4J3GUzuL8ygN9A>
 <xme:0F9HYMbPu-xWaMCfwlmCCOavXVdetOBMMShg9S9QZ3EXgzcA-KhpodDKG9mA8EX8F
 AW9-IQeq44RlwSq0m8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0F9HYH-zi74wiXSziJ9y9FRreq3vLV2yAkFW-BJ7Sghos-AwVqKz2w>
 <xmx:0F9HYDrztoT1J7aSR6RsbCVXqXWE_LzbDzU6uNZk7ok-NjRh3d9nOA>
 <xmx:0F9HYApwJ6IuV3qbak6W3j2ltsZYTiaaOvQB_LhJTp0dqmQ0fsTgnw>
 <xmx:0F9HYMd5GqYKU0n7q6sUozaazaK2bza7jn3-d7XzYynR-xsOXy8FUFg1Juo>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7BF0624005D;
 Tue,  9 Mar 2021 06:45:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 03/38] hw/block/nvme: add CMIC enum value for Identify
 Controller
Date: Tue,  9 Mar 2021 12:44:37 +0100
Message-Id: <20210309114512.536489-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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

Added Controller Multi-path I/O and Namespace Sharing Capabilities
(CMIC) field to support multi-controller in the following patches.

This field is in Identify Controller data structure in [76].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 07cfc929368b..f1d3a78658eb 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1034,6 +1034,10 @@ enum NvmeIdCtrlLpa {
     NVME_LPA_EXTENDED = 1 << 2,
 };
 
+enum NvmeIdCtrlCmic {
+    NVME_CMIC_MULTI_CTRL    = 1 << 1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
-- 
2.30.1


