Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56F3C76F7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:31:07 +0200 (CEST)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3O7W-0001yE-5h
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1Q-0007UB-DJ; Tue, 13 Jul 2021 15:24:48 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:33277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1O-0003U6-T4; Tue, 13 Jul 2021 15:24:48 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 16D05580ACC;
 Tue, 13 Jul 2021 15:24:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Jul 2021 15:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=WU/Wpf0qBaG16
 /rdIGaw6RL3CizZgZWt672Di5vjyok=; b=TOBNVtLP+UYDn6O72IRUVz+MY39Nh
 ckcIRtUtvVrNw2cWPbzurnNOKJReHdD1hqyoNpWlM6baDDuk3bU8baSPKfUdMnq6
 s4GNGuncBHt/qwPKsq2CWIl4uA9UvVJvX6x0kWgcdsYI5pka0mJjHGiYfZWUdQXu
 j+fsQx0ylVQDMJAjNofSTkDuw1mWem/pb0/ddcrNPoeQgU/jdweHJMiC1vZGdRQl
 pfcdBdrRiEdc7qCPBG8t4E/60l5oTX81VsnZDpC1S8qvX1++ptHkJfssqtD0NqIA
 /0imBvY0la3LOaatUbR2U+kIK/zyJYhZKmPGMScFDez94qPGXCWgzhqag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WU/Wpf0qBaG16/rdIGaw6RL3CizZgZWt672Di5vjyok=; b=E8167EPu
 cB2yifZlrYtpApK6P5bb3svpHJTnURSCHoL38EjHswIP6GNbuJJjWUWajkTppx1C
 w4ic9xx0BO0lIVOefNOB39pTr/Fz1Q9R+imkORLPLmWq49yVjnvNoVCrC6lD/ITs
 3d5qB3mj8qdAHNI2r2fRt3TDekt5bJTi5WksaHxSMhIVV+Ce4a73/I0Cxf1yovnM
 sh9GSbGyyT/tAD3nhMsC0obX/t4d6vhbvezK/Zc3KK3/lw/3UW7f305IyY+TIRUQ
 7rsBOqpnDvWJjnfhZCtxuIBs/DpvMBdoUS+15NN2rprsQBu/23pmuMQpu4yBwU09
 jFByoS0AdZFnow==
X-ME-Sender: <xms:fOjtYEvgkUtOP9SG9ZUFZjojTNT-ojuV3wEWbspKcaMEK9T8Y31y9A>
 <xme:fOjtYBf-uVP_m98wMyNk2WqMbedmA6FRnJw2680GNHfdaHHc3WOOpxfKBolykyBcB
 utNKDhtEC4TDJNM39c>
X-ME-Received: <xmr:fOjtYPwxDufUgD1a8GGUtBT4lFW1Xa-Ys-MUQovKnEgPR83St2nstIF9FlJcA7D1tEgPfTywBeIZxao9-XLRGl2KPAGnzXm6oo2OzGwH7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fOjtYHMcJwNBmSyEtNh-F09ZaLx8sRrkvFUKSVLggEYb_tDiI0aavA>
 <xmx:fOjtYE8zfqvj8nddhU45rMD8vS67XDar1BA66MfGSjhfNtpiuC-XCQ>
 <xmx:fOjtYPVuj7aQ-gynG74ESPA0rl_4FdtviLv94KUovRRMEVJWmElEaA>
 <xmx:fejtYPURKx5-g2iP5AxrssqIVtCqpmDArByJr_l3mTVqTIkjnw2owQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 15:24:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] tests/qtest/nvme-test: add mmio read test
Date: Tue, 13 Jul 2021 21:24:28 +0200
Message-Id: <20210713192428.950160-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713192428.950160-1-its@irrelevant.dk>
References: <20210713192428.950160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add a regression test for mmio read on big-endian hosts.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
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


