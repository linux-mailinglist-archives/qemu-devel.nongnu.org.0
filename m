Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420783BC896
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:40:02 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hYf-00045N-4b
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hT7-0000fT-Tk; Tue, 06 Jul 2021 05:34:18 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0hT1-0000f3-Bf; Tue, 06 Jul 2021 05:34:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 13F693200035;
 Tue,  6 Jul 2021 05:34:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 05:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ddr37AxnCS03P
 2tLnWUS5hmlbD26l68AX/D5LAEdKJI=; b=lStchnYxZygCj2ByKaW/K64/aoDV2
 ypVO7asTh108aH8rFZyJc+f1bxC7YqUNHAChG58H3s1wDfDmOXxsJZ9lSF+cYjWr
 QXSa9w1eXfN/6TRPPCF3GhPybw8Kwz+erC+z9KWvsvN0o15YxU6LlSYJvTMkzYCM
 FG/m53fQ+AnMLcDrQzDxVdnTLktvUWFHuUFIceZmthMirGvH78gc0QntcVwpQRY3
 fS5fsZDkuvPntgNhkx/ecCeZHjOFaP8Jo9WOKnHEjt4HZ2cWr9MmNGYd8odbzrTu
 2F3kvr5Gbp18jbRFd582iMfph7p4rPpVZhIVjwJpfptwfB6VTnq1owFTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ddr37AxnCS03P2tLnWUS5hmlbD26l68AX/D5LAEdKJI=; b=ACVpVSGx
 byLLknJsBIMMgVW23YuNg0h8He/OkpE28d4Im4DdEtF5qbWCBRZsQYhCASZ0DSZ4
 0DQn4BMxLzI9VTMy9PXb6F0o2h2uJzj/XPDIyVpHwC+WAkk5jHStp9HhJ51BySi9
 aHuDfwwjGjlxY+N7Km+B/8bnXX78m1cu3ChDe2x9oB+M6AtKobMaqXEU3MeInpJ7
 qT9czw7YLSxmn3xlc6jxpIvigNsFoEuplQ34Am0cmA9YWyLZUeZbKXjQ3cQtF1mo
 vL9CUoA3vKhm/kVTakbnRmw6xP1b6jpfD3QvQojYafITrJPKfQKmc5K1CaIhDs2a
 /R9+6U+hKjr24Q==
X-ME-Sender: <xms:jyPkYI1qLDkWtrOsKmXf0tw0eY3QQPd0f9qpwROkrh0tEm7FBwZFSQ>
 <xme:jyPkYDEolgeZTsH5virEqDJDRG-nYh8yrRpQaQMrKT9xh0kkTHYCcvGHuF4X3MP9_
 F1ZckLCf7puf8fQrVE>
X-ME-Received: <xmr:jyPkYA57l6XeF-TfamZVA-vPRBu-jWawo5_KznglQsq0rbaXDbPuJTrzBV75DiPJ72kGqFd7QLJfYkJZMtGnhV8pGb091sUX6aXnAYPkXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:jyPkYB1l2XMO5l9xyddBD8j8fIIKTUBbsTB3xmwykxptduuoUe-biw>
 <xmx:jyPkYLHfZz0wQaX1jhSMAMj-rmd9J9wor1rJ75jeBGaXkM3v1yBtmw>
 <xmx:jyPkYK_gRa6QUNC-tWyGeK8d5ul7dYnbRfORKEaqL_ehAp2W39nY7g>
 <xmx:jyPkYPhcDJnnUqOjw83lIp1NF3FwA1FEY-JcXZAqr3sL0Bgl9ic6HQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 05:34:06 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/nvme: mark nvme-subsys non-hotpluggable
Date: Tue,  6 Jul 2021 11:33:56 +0200
Message-Id: <20210706093358.1036387-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706093358.1036387-1-its@irrelevant.dk>
References: <20210706093358.1036387-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

We currently lack the infrastructure to handle subsystem hotplugging, so
disable it.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/subsys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 192223d17ca1..dc7a96862f37 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -61,6 +61,7 @@ static void nvme_subsys_class_init(ObjectClass *oc, void *data)
 
     dc->realize = nvme_subsys_realize;
     dc->desc = "Virtual NVMe subsystem";
+    dc->hotpluggable = false;
 
     device_class_set_props(dc, nvme_subsystem_props);
 }
-- 
2.32.0


