Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3035332578
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:28:41 +0100 (CET)
Received: from localhost ([::1]:58492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbTc-0001Bs-N5
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoI-0000GQ-4z; Tue, 09 Mar 2021 06:45:58 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:54085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoB-0000Ye-BR; Tue, 09 Mar 2021 06:45:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B536F271E;
 Tue,  9 Mar 2021 06:45:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=qCxJEoDSwUl1F
 JEMHsPgvHJkiE+SsVnjF8Ib1ZKWozI=; b=n1rQ+7h6RXrEzQ3UmxHXOZ8LaVrOw
 0goVI+oyItBMu0l5CI+zxplPmc9/TctsBIN0Q7ZoNq1XycCVZdJWgDwcLFs1TGBX
 okvxSyex9ED5CCg0PPyyJyZUUg2dmbcscj3UzFXFIzwSj/AscKweOA086uGD8LVt
 uxPk5W6+S0J5MLDq9FYGmykHaaMoXoS6UEVRPu9XJn0f7BcBe71L9d6t8+Ib4a+N
 78QGsQkd2SOErjHxd44EmyCG6WWt+zfi4Yc1bqzIESJEMQkehHPgnE6ajJ6QTiXA
 y4R2ndZLylpgxbdgD4ja2w7a6vdc+AJhanT5TcI/Pw+hemXZznhIdv0mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=qCxJEoDSwUl1FJEMHsPgvHJkiE+SsVnjF8Ib1ZKWozI=; b=X016JFdi
 OB35pgSQ6yg2ZExJRsGFUxC7Br91Uyr1XG45Z7kipYK5XG6TCtB7ozNOnQmoO74y
 b0dyfAQ7Vca+uwaKCn2d3XZYbU3u1SQofZvWSA6LkedeY27Cm1u/ApQMbrQxtE3N
 h0J+9jJ7WKqncbEVdm7FSBtIIA42f4hbmF2nUK5SvJwcCCtyY/7SZI0jG8Uve+XS
 lbhIFX8rn13qEqfxYVw361lwVaT3vAiY1F+EHgbMrmE/+htjCnG3wx/LRr0TmXzi
 QbTnpIZF3DFqzBVPY6/eYnm9Gy4IP7tbw1ELDzT/O4mXI249GAifk4A0xou4/Bw0
 1tD5fooQqLNZUw==
X-ME-Sender: <xms:619HYJ7hTDVQc-GXdx6J0EZTAYi9p7VLBoS8kDic-L89HDWRj1H7OA>
 <xme:619HYG4gDg5j4DLzD_XXLhRuyv4G8B--1aO5vGLuCoMtRwvEc59p9WfyyVFdEj0cy
 LwvdXHoVCGwzHQoXvo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedufe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:619HYAf77u1pn5eQ3Z3tK0uc0xqLK81cJiTqnyDiRNbVBPQo_bBbCg>
 <xmx:619HYCKYoMXvVYTu0_Y_SIoWA5B_HtslhxmWS_-AXbGjZQRaRPFfIw>
 <xmx:619HYNIWq2UE1nNRgbeADLAVD-HriT70AMGPELOOTozQIs3Hq0mGOw>
 <xmx:619HYGUFdDvY45ZL95bzIxLCmDsvBATiSpfndVcvKsGZn8u1Dm346CgXSs4>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B9EFA240057;
 Tue,  9 Mar 2021 06:45:45 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 20/38] hw/block/nvme: remove unnecessary endian conversion
Date: Tue,  9 Mar 2021 12:44:54 +0100
Message-Id: <20210309114512.536489-21-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Remove an unnecessary le_to_cpu conversion in Identify.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 23e1c91ed258..64340a00df4e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3422,7 +3422,7 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
 
-    switch (le32_to_cpu(c->cns)) {
+    switch (c->cns) {
     case NVME_ID_CNS_NS:
          /* fall through */
     case NVME_ID_CNS_NS_PRESENT:
-- 
2.30.1


