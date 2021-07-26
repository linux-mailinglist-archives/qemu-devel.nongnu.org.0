Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3A3D6777
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:24:40 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86DP-0007ZY-Ip
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868G-0004Xt-5e; Mon, 26 Jul 2021 15:19:21 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:48409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868E-0007dq-QQ; Mon, 26 Jul 2021 15:19:19 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1AAB2580416;
 Mon, 26 Jul 2021 15:19:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Jul 2021 15:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=h8t2938WpU3UU
 zpsqciYJT+0fzYoMfhS77cmgL5tVOs=; b=h21JgQlArIEXKx6KBkgGnqP3ZOiD+
 xEvkamM5SQedWpoGuqhCC6LLs7rPcOJNk/gdFI/d7YwwrIZv8/QkCw07S7XYozPD
 xLtzXY16aePYVlLxHOvfnbcT6I7LgDXj7EiYkFPLqVVzva6allXESHWopcdyyj86
 fOIz0Hp1XYW1REO/ZStj+jBTbLEN3Reu+dpMmuU/cxUACOENBFMJYFSsu62kDReB
 EMkD7AvelcLyKfo7mtY1z+++MgxUP8GiF6Xi/TZ4s/CFRbFJl2QuElFq7IIYt2jL
 HmmKiOYEoWULe7Te9XDDSJhNfHjLB76cLJgj+YQdsZudX6bzabHuJScyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=h8t2938WpU3UUzpsqciYJT+0fzYoMfhS77cmgL5tVOs=; b=rfezMIPG
 Yq1J5DpP22r7Wi3JgY3j96Fcsct30Z36AF77h01lhmqBY3B4d3W4OkD83vva4/1t
 YjJl6+4IM091SVStyRNz9oaiOrL3zWbVGC+9Qzp8cKTIG9qsrrAgjMYK/V8JpZ9b
 UvK6UZ9bwwqlL5Q0AyOaSiFdS/lDzA73DlUdzgLbMhDfScA6SVgfsl5LXCzIp/F5
 dRsQzyfDtteji4azhfOS3MHaLQuBwBpvVFF7jT5ecIx5jSczVTWL6MrTJEinIuBs
 XDjvrXXtO/0/tyvdUF+jlQ+d8RV9plEEgjeewHQ0KoNvSIvoEAS3ZbaxgzMwYKY3
 2/5XkffUE+2Elg==
X-ME-Sender: <xms:tQr_YEv3i9Zvrl2G_hGVCC2BSnfJIzltK4YmPUcWbv4C9YhAxfnPCQ>
 <xme:tQr_YBfJ32QoGyliCIWc_FSCNtsgeTJos6_uLA695hmLQi01ZANzbGyAI0V4eyFxe
 PNyzrYQHmKdpfTUHLE>
X-ME-Received: <xmr:tQr_YPygh0y_vJDUs3Mu9crlwQPok8ISD82O2j-PABSC3211vIXtxNBR1V6doLuQqSQ8kpdxpb21bhMl0XPTMrOTeAqvaw7Krx39C31vlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgddufeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tQr_YHNflaW3B4UAGT7AhSrhTK0IrGbt-FRdCCJgBcn_9C0LvbMk7Q>
 <xmx:tQr_YE-6oqhioAKmc2rCBf_zhl3w3BbZb-2-xhWHJ8fuV1bGBvMEjQ>
 <xmx:tQr_YPXpZsSLKBU0zXotWP7tDir8zYlWZ4NPjBa2b4X5eJJC4XqHzA>
 <xmx:tgr_YPUwgt5o73KYV2KSgdS9cpnP21cEBZo2wcSiwujRQDKdfBMRpQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 15:19:14 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 02/11] hw/nvme: mark nvme-subsys non-hotpluggable
Date: Mon, 26 Jul 2021 21:18:52 +0200
Message-Id: <20210726191901.4680-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726191901.4680-1-its@irrelevant.dk>
References: <20210726191901.4680-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

We currently lack the infrastructure to handle subsystem hotplugging, so
disable it.

Reviewed-by: Hannes Reinecke <hare@suse.de>
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


