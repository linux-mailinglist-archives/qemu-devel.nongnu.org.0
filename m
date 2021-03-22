Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836C93440B4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:19:09 +0100 (CET)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJWV-0001J1-TK
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOJNb-0007Lv-Gb; Mon, 22 Mar 2021 08:09:55 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:54513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOJNZ-0005x6-AT; Mon, 22 Mar 2021 08:09:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 68C321674;
 Mon, 22 Mar 2021 08:09:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 08:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=zvmOUxX3kek4y
 VoWEZEgSTTkeyiNBoyFAWFOrokm8r8=; b=vqycC2QQM6ZxAYy3AiZNhRr3opNG+
 IXoIc03WY7/rG9886Ynovdpx8hw7/532RhxFrdS8WZykVm0rSFBniZ//58EPYhNa
 h8i7/MSpYRgf3msJdI8R9imMiK0a0bfO2KLxCZO1gVFpTWc1ossb99a0eg8lG9ur
 is8tuCAK9itXXPh8D69oE9hrAavbPmEtH7prlvAiBWrMLpLg6yvYPWICTNBvbyFV
 G43SskQvSzqv4Fe8MmOj0Gkx79pbBZj62/va6tn71MEJMO8/Re8qhuxPPzllsxN7
 MLIhFMyhMS7P5BCpy+K0BHYApQLX/32Qe8RQRJiUxyHU6f2Gn+WdB39tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=zvmOUxX3kek4yVoWEZEgSTTkeyiNBoyFAWFOrokm8r8=; b=fHCsJxOE
 NTsszRnd1LR6+JepmSEtt99ID9oRMtkukKEukYPExggpytqWBtcGr72G6ou8RRYF
 vK2oumBGs0p1tYw1RakqUov8EDwTMsy4HW7DLNu0WFjx+vgJ521ENWr1PTgAcpWe
 i+iRBZc+FezaLhAkRWoS8ns5MoOa4r57eLIYTCmlbkM+MkhsOqKPlFVmcIFRYGxg
 jkfcanyHl2YTWIo5k5BEtui66ByXCW6jmP6gAHXINR97od2S2OlKusHRUJW/5dFX
 XtnI6OmMOWNaNagqoeZbTfLnnpoPJnPVwmaG1U93NbgOjol1saQIJJGkwe9FJLl7
 6mT+Wem8exTDyg==
X-ME-Sender: <xms:DYlYYNfIVzB4A8Nu5IrPsQy-PwT6rMe8Buv8QYjGmDNoCZTL5aEWzw>
 <xme:DYlYYLPJ-1PRnc5ib6MeAQ98Nf42TPHQ4oGkgz0N_Yx80tuK6XGsZqXl-IJM2on6k
 aIZMRqA8hENM_DsmXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:DYlYYGgL0BuvDd6k61yfoGKWfWcfy8SuUwLs78c11H5WlVmxMGQJmQ>
 <xmx:DYlYYG-3l7o1XyAXH4_dF3uASW4pTt9uts9qr2wygNioKCpJGcIOrw>
 <xmx:DYlYYJuY_lmMCZ-_jqZGDodg59iSLy-ggA4sXILwBaCtOkblASpXeQ>
 <xmx:DolYYDIe2XICZvxkBVuoUoDkbMyI9bqpw-tsvbeAzNCrlwtxf98QWA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A3D12240423;
 Mon, 22 Mar 2021 08:09:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/block/nvme: fix resource leak in nvme_dif_rw
Date: Mon, 22 Mar 2021 13:09:43 +0100
Message-Id: <20210322120944.225643-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322120944.225643-1-its@irrelevant.dk>
References: <20210322120944.225643-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If nvme_map_dptr() fails, nvme_dif_rw() will leak the bounce context.
Fix this by using the same error handling as everywhere else in the
function.

Reported-by: Coverity (CID 1451080)
Fixes: 146f720c5563 ("hw/block/nvme: end-to-end data protection")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-dif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index 2038d724bda5..e6f04faafb5f 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -432,7 +432,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
 
     status = nvme_map_dptr(n, &req->sg, mapped_len, &req->cmd);
     if (status) {
-        return status;
+        goto err;
     }
 
     ctx->data.bounce = g_malloc(len);
-- 
2.31.0


