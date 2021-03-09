Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84663325A6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:45:25 +0100 (CET)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbjo-0002p6-Lx
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap5-0000iD-E5; Tue, 09 Mar 2021 06:46:47 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap0-0000oN-Dd; Tue, 09 Mar 2021 06:46:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C3D501320;
 Tue,  9 Mar 2021 06:46:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=4MBfUUX+81EY1
 0usv2jO8kYmSruutrkK92npChlYE8Q=; b=EY+TPu0msmr/PBSJNY/mBP23xd3Fc
 mAwdNi5R1LwyaqerLckoZflyqd2ZH34wPrR27Ym+TelJBi01ec+3rQrBxPkJgp/6
 RfSx0jtsE8AKitTR8RqJ+1evuZivH7Sqlmyeg9fGfv7TdkdBpBK19CkZeWIsgakF
 bWRxt+p4bWqvmru1T7Z7eto2mf/mSzvDpP8+4LQKEr3gS3oRY1JgAXE/WaJu3kAE
 976BA59E2gE6xuuoe+Z+e23ONh/3vrGmg7IrOzRzkBP4AQjUSITl9efZWR79MbrJ
 DZnjjvT6vyevD+fBNmXfvDdck+genWzgbw+W+yFdUc0UYlUcyZ4iUfatw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=4MBfUUX+81EY10usv2jO8kYmSruutrkK92npChlYE8Q=; b=O3ETUDpU
 v7IB6x35PBihYVXrg5YtVuzKnTZYyIsx3YJbIbAZYkj6OVSLwR5ZUv2r4cUxf1xz
 Z3rn4FCD54eN53WtSEG5ccE9GoRJnikwWIytETYoqZEO9WxIHiwKbmc/TSa7jJCF
 7uOoGDbXkcl99MEsNhtD8Q8ZS1yS18aHkRpVQbiwuyR3/c0jIQw4j/o9saHMFY1o
 4KRCH6FlUw8RCcLPTyY6d0nISAoPSfSe3WzOEgmFBdKMFDZQfDtG88trLgrg236A
 BkqR1TtbVOqm+zYPMDvKlSRzAQl7gBtHWyJDz/bqW4vwHtmkxzq5Mu+Vxv2tYr41
 H1q/8N03F3lUjQ==
X-ME-Sender: <xms:_l9HYAdqN5ZOYVUJPhlGJOiwCeYXEAXZXhaDHD-FgOr2fy3RptnAhQ>
 <xme:_l9HYCOLRNduuvJKo2E7IQz0LUcT0BA602y_5ENhkeDkXj4VIg7ykcghma3iAe472
 SEf27Xp4bhwebJpSlc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_l9HYBgI1dJZxKU3xDEYCkyMuImEWIpJa09mXwPyTesGLuEb6crHig>
 <xmx:_l9HYF9u_bThEuuvmDZf0ZY3qb3xvSrEHqBSsOHwe2uyOnk5vkXeNQ>
 <xmx:_l9HYMsc6R4nxQJs8XqytjEPL04gPPo7risFlNbSJG2zoUMONu0l2w>
 <xmx:_l9HYKAmthQXXQzeLuFXqTnFKcML2h-ubZdysOsn1xfvS5aN6ot8Q7Tu3FE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E769324005E;
 Tue,  9 Mar 2021 06:46:04 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 32/38] hw/block/nvme: fix namespaces array to 1-based
Date: Tue,  9 Mar 2021 12:45:06 +0100
Message-Id: <20210309114512.536489-33-its@irrelevant.dk>
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

subsys->namespaces array used to be sized to NVME_SUBSYS_MAX_NAMESPACES.
But subsys->namespaces are being accessed with 1-based namespace id
which means the very first array entry will always be empty(NULL).

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 507efcd23f9b..20d34004c677 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -24,7 +24,7 @@ typedef struct NvmeSubsystem {
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
     /* Allocated namespaces for this subsystem */
-    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
+    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES + 1];
 
     struct {
         char *nqn;
-- 
2.30.1


