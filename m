Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD03C7E6A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:14:16 +0200 (CEST)
Received: from localhost ([::1]:52526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Y9v-0000ow-Jh
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Xy0-0000Ii-Nb; Wed, 14 Jul 2021 02:01:56 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:59067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Xxy-0000uH-PR; Wed, 14 Jul 2021 02:01:56 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 725792B01247;
 Wed, 14 Jul 2021 02:01:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 14 Jul 2021 02:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=WU/Wpf0qBaG16
 /rdIGaw6RL3CizZgZWt672Di5vjyok=; b=DcirCwZT/18sOE/auKG4+9xfdBK0K
 LVSVWI7PKvuX91bmkdV39WcuaTvNnhSqijZzQaQHWmBf8nBRZLIV+jArCFxEkUeW
 1QztjArSQr779I4Zuk1h2Bx+JN97nzWXHYCPIvCGN4kYCyqkopQL3ydi4hkpkXAo
 iyHjHybuyzsp6rb9Be7cpn21vlgXWAaMTKlQqr6/CgF5mVpHFEOSW8AmcxSjn/54
 37Li8krlnGApHS9nlQT/q8DHJfUZ4IR6+L5Ojy8cWP7A/BAIJlbJZAdf9isoDOgz
 /R/CA9pA5fU+LvE1iKoPb76YJpx8Nk3ObwSSRmBDe5nDIufH/YZqR0ngA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=WU/Wpf0qBaG16/rdIGaw6RL3CizZgZWt672Di5vjyok=; b=qpHWW7AG
 ayXvSZ1PfyvYC9qpCkMVTAEXNWRgUsAgYSBRgu2wu2xTjltL4Nln3jaBpTiOWpPh
 MCtMny53EzpoH+mNep/A1k3MvC0scpMF69sKMqDehDPxtRYGYn1A1i16yJn6kcnC
 jtiHAuZT/yu7KiKp490UJ7aBWjPDrXNHx2/5a/ykCKeZpsR8f3J1Ur5418cfda9r
 hYy6cJEcXY7hZLE3fda4LyNYu81a17tV6buDLr0vpBm+vKcfpBfGLFVNzVhcxLsU
 APpdK5STFVop0mZfIQJ/C/Lyap6AmJO6AA1cRMO9ShLMVb/WbXJyRF0WI2F8b1cg
 /+tOx2UIobQntw==
X-ME-Sender: <xms:z33uYApwVbotripqAZceZyrg0kxtLDBTZVpDf_seOTc-xVrqfIWzWQ>
 <xme:z33uYGrMN1avLf0t1ZYlc7PLdQwlYkVGQQr_d53x0IN5asqCHySoyebin18L--FH8
 1K2TMy3UM9VwHbMPOg>
X-ME-Received: <xmr:z33uYFOdgSzdn0XHAvJbqr1IOSBeFeO6i2riqFeZaxDEdfmkjqBaCkvvxs3OnAjUdhyic2qnH9Apaa_uPTrcA80FYZcODgdrYVcmzgishQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:z33uYH76760VPuHsFFxETpqF63UzL-PzR4SZvRgOnrE_5Qi3G4tbbA>
 <xmx:z33uYP6fphbeSbFgph74_pt-cuUYCl4BtK2XeDmSitt9S0Gnnx9kgw>
 <xmx:z33uYHjvvpvEUNfZ5FzFObhFnnsC1Wn9SoSlGWhy8wf4RJaJVps1sA>
 <xmx:0H3uYGJ375uNjHDlUeuo8O1-C8VZGrc86HoTcKmmUVH8nfHWeGLCXppJg5k>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jul 2021 02:01:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] tests/qtest/nvme-test: add mmio read test
Date: Wed, 14 Jul 2021 08:01:25 +0200
Message-Id: <20210714060125.994882-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714060125.994882-1-its@irrelevant.dk>
References: <20210714060125.994882-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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


