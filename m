Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E63CEF78
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:58:20 +0200 (CEST)
Received: from localhost ([::1]:54620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cDL-0002bo-EN
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2W-0000T3-Nw; Mon, 19 Jul 2021 18:47:08 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:48043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2V-0005S4-8o; Mon, 19 Jul 2021 18:47:08 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6A56B580A37;
 Mon, 19 Jul 2021 18:47:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 19 Jul 2021 18:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=TNGFfPxV/uVnm
 /11Ubrs41ncxjcbv+/8dLrA3uToMHw=; b=emGlmfb2Cs2g7sAfEGUqtk56A4Lob
 thftyUmRyZi+PIO7cAW59yDYZEmngXzqHcAtQHvskJSISHGQegUyjK2HaelRkHJL
 y30kj3CbNG2ovvwsstQONA3llqsSwTecyyePGuBTbVP6/zeyV/lKLzWosYm8cMm9
 SQ32YxDvHFsfVSVF3QVcd3Le3fz+KqY+dap1sAFKx23DIbaCgNulPArteZY+Tnlh
 0jQE3GRFxNYHEFUscfTpAlrlIg4E3S+D9vJJR3K0asBUuFe5YTxzq2mBjTIZU0mP
 ZTSF+gTtUax1cp+CX/MRhviggupMMU0hIlc67UswpBzbPsNZHdcmtl8xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=TNGFfPxV/uVnm/11Ubrs41ncxjcbv+/8dLrA3uToMHw=; b=CuD5rEFf
 6URa/QUy5pl8CSVbT7Jn6yMKV7HLxNgn369ETGAG5ycLwYBHlDWQUjiWazhqkqXx
 qLFT3ojdasnz0X9fmWUepHiu4nBxUvUeXHQu2JjjiAbWFw1FbFcZedqVrKzVAl29
 jCby53ChKn4N06uW6i8JmlHBEb7HG+ANjN9AqHc/eHeGyEEQnNto8YmoFpK8LGGp
 bfVbhro31QhYncNsIBYlz76Z9gbQ9P+77KEaLqGWGbO2PwyqdrcAsOu5mJ/5KL1O
 JIUZa5YaTeMZOAYxko0ktZ/h+xcBkojKWkmSZyv7cfnHPNOYKv1f8cpZJmT6llvo
 6X/C1hz0QxC6KQ==
X-ME-Sender: <xms:6gD2YO_7NBMrL3DL-YJetMM1F0TJTtYDMluBuGLfQvy1rLbrIvzUjg>
 <xme:6gD2YOsaMpIho922AnTT4pV3IlrPUKgPkU4KjBy7xIqD2kBmoRWGXMKuJqROh_KO9
 l3hgWqfHcpS5opOZMk>
X-ME-Received: <xmr:6gD2YEDwiNV0tj8459Y4AYjIgs4R-d1TVMrLznq5N1M4uiF9ZjN17bHS9zyH9OXX-iYoBsuSMS7eIxWePHE5wW5gd41FHMRIqmNUbN1s8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedugddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:6gD2YGc3CzPVUI4lji6WQldifKPybMOqLqvVRmX0AYXWJv1LJdApUg>
 <xmx:6gD2YDPlxHBsko2Jyq_Uew9e6DtBwj3281vXBVgf4I7uuLAuebPogQ>
 <xmx:6gD2YAkFrO--uR7F62TIEdsAdgqczixRoXmlKutB2GqbjYrMd4iE2g>
 <xmx:6gD2YBuKnhzBNtw9eNNbNZsbrK1MGPB9FdXbUVix7zS_UFI8mM-X5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 18:47:04 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/5] tests/qtest/nvme-test: add mmio read test
Date: Tue, 20 Jul 2021 00:46:47 +0200
Message-Id: <20210719224647.68559-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719224647.68559-1-its@irrelevant.dk>
References: <20210719224647.68559-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
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


