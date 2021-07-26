Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7743D67C2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:55:31 +0200 (CEST)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86hG-0008Oa-Op
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868h-00052L-L1; Mon, 26 Jul 2021 15:19:47 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m868g-00080F-5A; Mon, 26 Jul 2021 15:19:47 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 655A1580412;
 Mon, 26 Jul 2021 15:19:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 26 Jul 2021 15:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=TNGFfPxV/uVnm
 /11Ubrs41ncxjcbv+/8dLrA3uToMHw=; b=baf+ZdxpUy4YQzSuGkQIC5SUkZL6I
 y+vEgSg7FIwbPHjiMaXcOjqkSdLyIuFDkhfkqiRW9heWN7pm0phXN9f0bu5gHgUb
 qrFHregPTKA1j56V5I/2CgLWxuK1oG/92Y0rSYOL4R6X8F/3wCVfFmSIpwmk3s+W
 /N8DbZz+mlCHM/SuqvGEUpZKzoWqHXdHY3Q1P/9wY1z8lsiDBggd8QGjozNQD9n2
 rdALDxqZl357q8mVOwFavFJDnPXA39UtsEo9uz7rT31X4lrCfweTN2dTBat9nplh
 UMC79s6K2bDN6ZVOYtBz8wBg00kPGbGr21qBEx9Qh/G734XsIZXgscPeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=TNGFfPxV/uVnm/11Ubrs41ncxjcbv+/8dLrA3uToMHw=; b=jYElcdbj
 21tfzAxC2+I/vBZgMTIutQhtPQInspU9tRBASHZE2ttYKqPIxycdBWh3UB2yt0Kq
 +TlNDtEyQAM7IEmoFWntRQRzvoxmQvy73qsUgP8MqYeytgLddiqtPCsKqfEQC2w6
 vD3zjEemuOnugygUF/fB4IVE8ux/jxnDqK2VaJ9v2QT5MJ+lxsRjf2lm7cc4zU1e
 NdN153B00G1VrvDbPbtdbtWrOjT+qoGn4tAoLAmMvrT0dTXz6SoTKWntU5HX9yAm
 T+dudOmduNxGZ3yLYZlcUV6erWlvmwqfqes9zOrqQXOyKprinkk0p9KbpWPOIlmc
 6so9rFU3U7YZAg==
X-ME-Sender: <xms:0Qr_YJ11vw40g3F98ThOdK9dtr_7xDt0pCg7vyochCG9jKxHdw52HQ>
 <xme:0Qr_YAE-4iWxRaRoIFMB9I3Wnr6JfOrULWicJl4H3Q9WNsH5dySqhTDfNCP42eAKO
 idcdjril_KDussDis8>
X-ME-Received: <xmr:0Qr_YJ6kVWMa6pgw1xC6eN85x9FOGpAdRNHR9Wqm4wRQTQv7TDd1daxacVgodS1FqsazUhmRXrR9oMrzh9Ms-0IUJjUWdiGAdOhMOctkvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0Qr_YG136EfOMthhIvSaQC0iNXMqjo1uqGemBkvOKcPXKCcx69W48w>
 <xmx:0Qr_YMGLBlTCNRkuAeLCbQ8nPpo-NY8MwEY4hiJHZyQlxVaHBuNP6w>
 <xmx:0Qr_YH-DK12U21QFo0hLbmeoF2AbPCfKzG13t1Ddddwc1eOuHo5xrw>
 <xmx:0Qr_YDcB2A2PE9w_idHass5V5RHN0u3kt7s97dQnxufjANlsPHpoxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 15:19:42 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 11/11] tests/qtest/nvme-test: add mmio read test
Date: Mon, 26 Jul 2021 21:19:01 +0200
Message-Id: <20210726191901.4680-12-its@irrelevant.dk>
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
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


