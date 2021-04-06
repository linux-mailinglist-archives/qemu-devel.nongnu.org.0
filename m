Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F0355D4D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:58:14 +0200 (CEST)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsm5-00012O-7f
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsb2-0002Dk-U0; Tue, 06 Apr 2021 16:46:49 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsaz-0001aW-IC; Tue, 06 Apr 2021 16:46:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1D72613FE;
 Tue,  6 Apr 2021 16:46:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 06 Apr 2021 16:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vTFPlL7TkOoOy
 4lt5fLjax8HOg2qO6MjMNotMBL4pf4=; b=bV4r7VdvX3/z4681wX/nnbayQYsjK
 M83ntB2GS+wpJGVpi1qehUxHyHezzzn/nyrSfyePI17SaI5FPeINrDaUflEPkYe7
 wD63sv1mUYEXv/2O/psDRTJzBIAaS/xcjgr3FC90WkGMX5dA8fG9HMqgkhSrxQGD
 HDU6UxpVTN6rIpXB1nEhN7XbOniK+DHNZ/UFiNlAFC8i5J73cNC9hOEb/iB9rsLD
 8EWqPAx5JiI1bYtQlWtKdcGdKXnQSgs8wd2G4p/cN3cb5tHw2ZLLfG/0eAnlEbYB
 QDxBoMdH3hAQBL7KaFdufEdkBh0/BI3Rta4KSnTTdHPY6tdezMqcz2XNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vTFPlL7TkOoOy4lt5fLjax8HOg2qO6MjMNotMBL4pf4=; b=P/CDj4cc
 /uFMTpEwcW8Quc2gVBj8pRU8txKSE7QQYssFfihw2hBHrvIvQJs7lffGR5kzVXyG
 zuSTU12PnIblkkFcyy41M6FMBlPwDwqeLRp8ER0lIQg8CP7+I9uLHoGr2yXoiZYB
 NMbeapTpKo30UISpkTVxJtgXlEzJdKys3v1pvzgQQkyUPo9UEVNg8SapY5s2kxQK
 od4zSJx32BQGt1/JUfIGIhowJ6ZZB7RrUGSiOHUdSvg00hO0s0Pem3iL26XdoKjE
 EK6yQx6bW4NwIo7XoHJY2usztS69mDvNquuGM4FkFYdp7NSzgnSLgZwn8dJjM6qL
 J/9yf+FWr3qc3Q==
X-ME-Sender: <xms:sshsYAGdeUgkgeP6GXT7ehvFvneyYPunC4OGCsN1G4s2GG1fzbUylw>
 <xme:sshsYAM7JCR8zbNzakjlI0WiZxKq867ByEffvMd_l04tXc_rOF6g139u3vuqDLC7M
 MQFlFi9frNN0GlHEXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:sshsYHFTx_vF5-WJz-LT4U9JibOQMfGIF-yY0UoMKXZEeD_OQ0XNXQ>
 <xmx:sshsYPMW1aCGbCq3UcNk-4KSzCT-1R9yVbOnWI68npeq2DKeE4w3_w>
 <xmx:sshsYA_YizLtte_QgdneH-qIwktSIDohWAxRd_03_eYyGsNlGXyThg>
 <xmx:sshsYCWPn3K1lGn7njxTCm133SN6XrDR-mCcO_7JH5SEg_GgJNF8xw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2FF1924005C;
 Tue,  6 Apr 2021 16:46:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 7/7] hw/block/nvme: add missing copyright headers
Date: Tue,  6 Apr 2021 22:46:27 +0200
Message-Id: <20210406204627.140812-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406204627.140812-1-its@irrelevant.dk>
References: <20210406204627.140812-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Add missing license/copyright headers to the nvme-dif.{c,h} files.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-dif.h | 10 ++++++++++
 hw/block/nvme-dif.c | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/block/nvme-dif.h b/hw/block/nvme-dif.h
index 5a8e37c8525b..524faffbd7a0 100644
--- a/hw/block/nvme-dif.h
+++ b/hw/block/nvme-dif.h
@@ -1,3 +1,13 @@
+/*
+ * QEMU NVM Express End-to-End Data Protection support
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ * Authors:
+ *   Klaus Jensen           <k.jensen@samsung.com>
+ *   Gollu Appalanaidu      <anaidu.gollu@samsung.com>
+ */
+
 #ifndef HW_NVME_DIF_H
 #define HW_NVME_DIF_H
 
diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index e6f04faafb5f..81b0a4cb1382 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -1,3 +1,13 @@
+/*
+ * QEMU NVM Express End-to-End Data Protection support
+ *
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ * Authors:
+ *   Klaus Jensen           <k.jensen@samsung.com>
+ *   Gollu Appalanaidu      <anaidu.gollu@samsung.com>
+ */
+
 #include "qemu/osdep.h"
 #include "hw/block/block.h"
 #include "sysemu/dma.h"
-- 
2.31.1


