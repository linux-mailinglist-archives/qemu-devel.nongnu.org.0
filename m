Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E7D314A31
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:23:49 +0100 (CET)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OJI-0006kn-Me
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVa-0005LW-H7; Tue, 09 Feb 2021 02:32:26 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:56107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVQ-0005gs-I7; Tue, 09 Feb 2021 02:32:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 65057B84;
 Tue,  9 Feb 2021 02:31:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 C1yeJ/9DI7MimzbaBn0LzaoECYwt+2qxlZU5ncanqSQ=; b=OjWbaw0DsmvhbYy1
 cpGKWzNsk/Awh9Dd3oHibBKY6TpKqLGHuN1aRTShovvaW7EkBMLbmWTKRA1HG6Az
 APZhVX8jQW08Tg2bomotow+Bm85OTmqRselNRsWgJj6TcGjqEbbN83BZECAaCfGD
 AWmH4KWeuZtUL2BKO7W+Ti7/deNuqponpXPaBxJb7JL0GkWEeHT/1zVb4h8O1bgh
 0EuixIH3zbE7p2kyy2aiuPvvh9tkyd9r1/8GtZvk1yNZmzNve3SlbyX6wOUTHWdh
 BRgauh+8MQ/0K54iWolD8F6cN0Bkpq+SWWQL+c7cxzR0xCtVxO9USKmE5nw8nCrT
 26ZG+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=C1yeJ/9DI7MimzbaBn0LzaoECYwt+2qxlZU5ncanq
 SQ=; b=MDbSnnnIVLDj6/AXp0jX/Dagq4AV1bcvc8PRbAYy40z8fDJXXqQOSlru9
 fb6kzgT2iXL9DVh3w1rRCDVvvOmkpTHBHTZ994exTEWc4sD9kfFxfG3MVyqMy7U5
 FycT0nNBHRVx/reRQFbJBouIy5s82hm0JAqowtuoyayCGpGiZFeJj8eDorFZ6bXK
 env/eusdPgmley+zPk6mfwTAdJwReS+9hkaP7knHbwnekCnK38QyxRMGj18kwn1l
 YMd+gDs30XSHtRRdMgT0FoDoTDZtkQD705shmM56Vcl6Ew4hZl+AVSkZVHggUXVa
 dJE5BBINFWOZRevaU9adSZVNzZN2w==
X-ME-Sender: <xms:aToiYNVMIRudGNuvRQLK2wkFeOyStQ8Bf1r0pjvGUGbabAB9CYVXFw>
 <xme:aToiYA0dDzfljyoI9NPCfFpOC97T4KSf64eVY5JYSw0Cx1yASEYuSu7jOOSq3rD22
 5SoQef4oOGfl-OxdSM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueevgfeuvdfhgefffedugeehudelheetieekuefhtdejhfejgeegieekueeh
 ledunecuffhomhgrihhnpehquggvvhdrihgunecukfhppeektddrudeijedrleekrddule
 dtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihht
 shesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aToiYC2QT_zHfPvmEHctthAmUNRAmBGrsXoXgpnQUod9uh0ovVdJ4g>
 <xmx:aToiYL9MRkPIM5q73yAv4BrEKq4TptcMS16MVs4Dh8O8ZnDmMh_0KA>
 <xmx:aToiYH3Ihzo8Pwg69vLiLLvmnivH6Ut7qH0mhir9cdGKCQpVYpPgUw>
 <xmx:ajoiYOGHmSfG2nccVAgYTR8e-DRHROp8cGfwj45EFGE3wUm6Gs1Ca7LtabU>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6D1F61080063;
 Tue,  9 Feb 2021 02:31:52 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 20/56] hw/block/nvme: fix for non-msix machines
Date: Tue,  9 Feb 2021 08:30:25 +0100
Message-Id: <20210209073101.548811-21-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Commit 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar()
return value") had the unintended effect of breaking support on
several platforms not supporting MSI-X.

Still check for errors, but only report that MSI-X is unsupported
instead of bailing out.

Fixes: 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar() return value")
Fixes: fbf2e5375e33 ("hw/block/nvme: Verify msix_vector_use() returned value")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f4f1487afeb1..b0b7abf3312e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2590,7 +2590,9 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
 {
     n->cq[cq->cqid] = NULL;
     timer_free(cq->timer);
-    msix_vector_unuse(&n->parent_obj, cq->vector);
+    if (msix_enabled(&n->parent_obj)) {
+        msix_vector_unuse(&n->parent_obj, cq->vector);
+    }
     if (cq->cqid) {
         g_free(cq);
     }
@@ -2624,8 +2626,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
 {
     int ret;
 
-    ret = msix_vector_use(&n->parent_obj, vector);
-    assert(ret == 0);
+    if (msix_enabled(&n->parent_obj)) {
+        ret = msix_vector_use(&n->parent_obj, vector);
+        assert(ret == 0);
+    }
     cq->ctrl = n;
     cq->cqid = cqid;
     cq->size = size;
@@ -4161,9 +4165,12 @@ static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
                      PCI_BASE_ADDRESS_MEM_PREFETCH, &n->pmrdev->mr);
 }
 
-static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
+static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 {
     uint8_t *pci_conf = pci_dev->config;
+    int ret;
+
+    Error *err = NULL;
 
     pci_conf[PCI_INTERRUPT_PIN] = 1;
     pci_config_set_prog_interface(pci_conf, 0x2);
@@ -4183,8 +4190,14 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
                           n->reg_size);
     pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64, &n->iomem);
-    if (msix_init_exclusive_bar(pci_dev, n->params.msix_qsize, 4, errp)) {
-        return;
+    ret = msix_init_exclusive_bar(pci_dev, n->params.msix_qsize, 4, &err);
+    if (ret < 0) {
+        if (ret == -ENOTSUP) {
+            warn_report_err(err);
+        } else {
+            error_propagate(errp, err);
+            return ret;
+        }
     }
 
     if (n->params.cmb_size_mb) {
@@ -4192,6 +4205,8 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
     } else if (n->pmrdev) {
         nvme_init_pmr(n, pci_dev);
     }
+
+    return 0;
 }
 
 static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
@@ -4280,9 +4295,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
                         &pci_dev->qdev, n->parent_obj.qdev.id);
 
     nvme_init_state(n);
-    nvme_init_pci(n, pci_dev, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (nvme_init_pci(n, pci_dev, errp)) {
         return;
     }
 
-- 
2.30.0


