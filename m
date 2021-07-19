Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522783CECAD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:22:17 +0200 (CEST)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZmK-0005a0-7c
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZYQ-0001KE-DP; Mon, 19 Jul 2021 16:07:54 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:37925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5ZYO-0001b1-31; Mon, 19 Jul 2021 16:07:54 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5A14F58165F;
 Mon, 19 Jul 2021 16:07:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 19 Jul 2021 16:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=TNGFfPxV/uVnm
 /11Ubrs41ncxjcbv+/8dLrA3uToMHw=; b=igtAcyeBoezeA7hDs9GuSCcDP8sMR
 5rtI7YzwFwqaL9rfwyj6bwQUTh0zAsP27lZBeINPpdAHaj8qoky2LPsAU0BwSEqm
 XIaBnSoPeb1GX2ryfee1x4dQVh4dYk8MYPDyVnyR0m/f2zaCyzSHqqVWYu7UqId6
 xtsZKgIT5zW2/JiMuIkYwpCZZY31FahRUBOrxGnvhf7/yLCBiWheZhQYtKZH2v1E
 QkTWbH/ovjJxceeLJsIw0hR4A55fQe9QHNZ+k+8ruzbNBtsfx/AgvUeBw9lw/S/C
 +yxgGyuwemtzrhntdjQ55O/xfMJsEVsbQKqzIU2pWUBBvnOg8SzmrrXVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=TNGFfPxV/uVnm/11Ubrs41ncxjcbv+/8dLrA3uToMHw=; b=BMzeUSo8
 NY1xJSdFxNrQqe8bltb9TKNKa8WJiqA0K2mCJuXC6LGUiaS+Ph5hhNTS0CwEh1Ud
 wCUDPITEqCK5CRTslFTg0wAEkm8BwSfuB5vlOGGG+xEjo1ZLGenaqbWvM78sSMiW
 sssRjIdv1LWbkuzUora/Evxx/XI0D61k1E1a3eES3+HdL2Ym9aZxAuznX2DkbknW
 6B1zCKZDWieTXiUYuwYazXEbCYRgd82DsXqbeEBWakSkDkGfHkM5VkFBUXsiAXBT
 VwWRkSZmOgUs0demhtFMfeer+nVxVTtjSzqQjJAxJWmPlqF5ADr8vdsRIihRczH7
 0jZQYJpYmgWXeQ==
X-ME-Sender: <xms:l9v1YIOXa7QGaNxjOVIWjfGlD9Ne8qdwMJmfduoYjfr5WVnlKWkHaw>
 <xme:l9v1YO9QqQqLxZXFfTdmj6rJrQ3T1kkbIvjy_onHfdE6Jbj_Hg3mVl7hxj6OQKeIB
 fmoblVo0n6tSZOE5Pg>
X-ME-Received: <xmr:l9v1YPSHgn7GvLJfMGktf2v-vIgjOyF57ABGFZXVc73yLnpAtsFdccVmNu6sB-YW-PLryuQABu31UyV-6agPFWc5oC8-jrR0lFI3GiMy_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:l9v1YAuHjFVCZUf97KdwektowzU4F5rkEXLh47-6hu6oYA1ORWOJfQ>
 <xmx:l9v1YAcmkfLdONQTmlHKnL4urEtg5nMr7lYgYFiPSiPwW-Tn0dcqKQ>
 <xmx:l9v1YE0XUlFxwTuGgf0aZPosfVxSneFKOcTpM06ZqfIugkqa3o6FRg>
 <xmx:l9v1YP_wl3gPAhok-kaYKRpIAM_rUITzaIs2UeRBJ5FIqZX_bZchhw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 16:07:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] tests/qtest/nvme-test: add mmio read test
Date: Mon, 19 Jul 2021 22:07:33 +0200
Message-Id: <20210719200733.28502-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719200733.28502-1-its@irrelevant.dk>
References: <20210719200733.28502-1-its@irrelevant.dk>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add a regression test for mmio read on big-endian hosts.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 tests/qtest/nvme-test.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/qtest/nvme-test.c b/tests/qtest/nvme-test.c
index 47e757d7e2af..f8bafb5d70fb 100644
--- a/tests/qtest/nvme-test.c
+++ b/tests/qtest/nvme-test.c
@@ -67,6 +67,30 @@ static void nvmetest_oob_cmb_test(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmpint(qpci_io_readl(pdev, bar, cmb_bar_size - 1), !=, 0x44332211);
 }
 
+static void nvmetest_reg_read_test(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QNvme *nvme = obj;
+    QPCIDevice *pdev = &nvme->dev;
+    QPCIBar bar;
+    uint32_t cap_lo, cap_hi;
+    uint64_t cap;
+
+    qpci_device_enable(pdev);
+    bar = qpci_iomap(pdev, 0, NULL);
+
+    cap_lo = qpci_io_readl(pdev, bar, 0x0);
+    g_assert_cmpint(NVME_CAP_MQES(cap_lo), ==, 0x7ff);
+
+    cap_hi = qpci_io_readl(pdev, bar, 0x4);
+    g_assert_cmpint(NVME_CAP_MPSMAX((uint64_t)cap_hi << 32), ==, 0x4);
+
+    cap = qpci_io_readq(pdev, bar, 0x0);
+    g_assert_cmpint(NVME_CAP_MQES(cap), ==, 0x7ff);
+    g_assert_cmpint(NVME_CAP_MPSMAX(cap), ==, 0x4);
+
+    qpci_iounmap(pdev, bar);
+}
+
 static void nvmetest_pmr_reg_test(void *obj, void *data, QGuestAllocator *alloc)
 {
     QNvme *nvme = obj;
@@ -142,6 +166,8 @@ static void nvme_register_nodes(void)
                  &(QOSGraphTestOptions) {
         .edge.extra_device_opts = "pmrdev=pmr0"
     });
+
+    qos_add_test("reg-read", "nvme", nvmetest_reg_read_test, NULL);
 }
 
 libqos_init(nvme_register_nodes);
-- 
2.32.0


