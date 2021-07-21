Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700593D0A42
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:08:52 +0200 (CEST)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67Hf-0003xw-Ar
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yY-000748-Tb; Wed, 21 Jul 2021 03:49:06 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yX-0002Zy-A0; Wed, 21 Jul 2021 03:49:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9ED885816F0;
 Wed, 21 Jul 2021 03:49:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 21 Jul 2021 03:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=TNGFfPxV/uVnm
 /11Ubrs41ncxjcbv+/8dLrA3uToMHw=; b=IuX88tr9WqYNekSbNppBvOwcD9UWf
 k+PukANcGNCXWq7xPx9mfR2pIbOi0WQlQaJT+Vqti8zGHZKrQ6it1vGOkjYmmLqj
 i5tuHGOnv9YKOjCSzAnxHiCJLtlO2+LIQi+IDOIIMfSuJjEqysuQ2c7RXnbI/CP4
 K+I1B5Z7O65RIsUZIF8zlHR4a2ui3oaFd4v8mHlcajf6eYATYfrAP4LzYDui2+tw
 +ARKiWkv9LKHGFACq5AJawzMWM9yIpg6rLLxkBlSNVEM/otsBSsvJ7y7zhpbdvZi
 qiVfkF1MHTJT2kJ/RP0lbva24NWp9gMvynCZmTCPJ6kpUuwRp7d6o8d7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=TNGFfPxV/uVnm/11Ubrs41ncxjcbv+/8dLrA3uToMHw=; b=lbLZ05ak
 LPcRgVQwcRS82W9BarvM/lK0YqudKzwSUBfL++Eb6LKTHRrud2xfo4HX9Hja1BB+
 43LjPOH5NSkfHEde7TcwBvMKpPOt+ZkXjt+YVRxyVH5M93PvTkHPj5Ci6PJI90kb
 IVXCROc3DiUPsGaZSejl46zrJFNXudNuG+UQQWMutsGeQREzGMhsHdZI/vxzpGBw
 jGxZPA18MO/TaRMs40e5rSHRYAmTdI23CwHE1m0/Fum5Lxh62ri8rxiXjUvSajBK
 mrgjy5QXWI8Xwpn/D6FMVioGg/5SryZgBMfHuHzfvdV+FPneV3KhoOjj220l6S04
 JolcqQUKQrtOcw==
X-ME-Sender: <xms:bdH3YBQdKX76_L-5PEpmFucnv4sMdjysMRHuZJyhQgkY9EVkzm5g0g>
 <xme:bdH3YKx1BxahYlXzNZZkVN32bgR_ZAhN6J888ykwXMtzKxhlR6w6CUNJywpDb179M
 enfea9EdyKkPD4nQlY>
X-ME-Received: <xmr:bdH3YG361a6Bi9b_ERBG8MEHMq4y0gmUxK12Yz6azD_G3JWI2BVxHyEaeNZllfJF1q3zFHE9mFmNtEb8IWfn50Mu21sRxjFx6AdIZ1uAfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:bdH3YJD6eFcklvKnVRIsHj0E3-w7cpylSfSoM-O4ldBLJ0BF0CdKCw>
 <xmx:bdH3YKjTowjPEEqGxMqeflPzVLviOBH-RQ15mpWQ5Vq1asJb205m_g>
 <xmx:bdH3YNqqsC04I8PtrEseGzLWpCqj918jeBB4qQdzoo4rQb233xyMMw>
 <xmx:bdH3YBRXGTb8l8S2BQ7ahnI0qPGsh4F4XsgAAbVpw45IUTRdRQO5LA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 03:48:58 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/5] tests/qtest/nvme-test: add mmio read test
Date: Wed, 21 Jul 2021 09:48:36 +0200
Message-Id: <20210721074836.110232-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721074836.110232-1-its@irrelevant.dk>
References: <20210721074836.110232-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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


