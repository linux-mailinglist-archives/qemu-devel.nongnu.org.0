Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81AA314AD6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:53:56 +0100 (CET)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OmR-0005VK-Mr
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW8-0005aU-K7; Tue, 09 Feb 2021 02:33:01 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW1-0005uC-W9; Tue, 09 Feb 2021 02:33:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id F0BF3C2E;
 Tue,  9 Feb 2021 02:32:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=cqmvrs1Nkd0jc
 Z8wseovEeM4Jc2ZvH+/6r2lx5CK/ds=; b=lIKJW5ObrNRYI2fBQL5i6wu4DL5/Y
 g3+km+uo4T80JBIotdc9inKO/QOhpOQQIRHvZweMvp3rSGQ6iEfK6yRo9LObFUCJ
 7KQLj3jJHr5plccoap6FfGACFug5O+7wB12FEBRhV05ptvbld8xP++cV4TrU/Vo5
 p1WQCajrQrvoRV9KIkuztnORCSKWF8sTh6uY3m6ZMQykTYN14Mzw2XNmjG0+GvvB
 8Mn4iGM8NpTBsnks6f8YLcO2wjgsT1Vn1c692VkN/KipjNQKr5WUrGiyPfH886GP
 qdaM84+/zkf/qmvfC9RYWzgg1/6I5TmOGIhNwCItJuIXzSmtKKWKo21MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=cqmvrs1Nkd0jcZ8wseovEeM4Jc2ZvH+/6r2lx5CK/ds=; b=X0Adz+Pf
 /XQN+Do/j12tnDJmSXg2Pjg3ObzGeS3+I9GJmM8YOQgU+yM1j86xcv5zasOk6HZ+
 R172CJPkhFO0Fio0igTF9YXGIq54wECL4gaVC+ZzljPoRQXAF2yQ4Zx3fX1ri6uU
 EmmvvD4GwH8Gmkb8llK2L2xmdJxNKFyRsh3We2krlpKJdbSQnBCeV3I01h6e5tWj
 RqHzcyldmkep0Uj6kcJvYB8QA6Vqd3vCBPXjzsbhCvGGku6xLs94Qm4hPK/t6djQ
 1SUj57/v7OLELRxNlRjtCHXXGnjmeeYiwmql0qAbf2i+gyUpyhP2LXSIY/x7qgIY
 WW8yibpk54Mnew==
X-ME-Sender: <xms:jDoiYL6dDngvWKePxlkM_GvecRQ25zg37nXcTz6AP7ImFzVNokT7nw>
 <xme:jDoiYA76D7fxo7KtlRws6rZ7F5HtjSByDwW_Y1ghBUjdOdR-8GCFdV_wEFJtgv0oI
 21TcIzD-759jj_9oFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduhe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jDoiYCdkvuxONxo8LjpjVUnxZZlQ-P9Bq9SIX26CM1S4sO2Cs685-g>
 <xmx:jDoiYMIa40VGfx9PefHEfSgIi6aMu4B-_K8zDbyknuhxcxcLy0ZqUg>
 <xmx:jDoiYPJ02O6i3DwrppsXjOYauetAL4cw4OC08_DNWodGsFZ79Yxjjg>
 <xmx:jDoiYG-ketKalxI0RQo88iDsh3-kSQk5yOWG5oxTNg2eHndq69-JLpT_BKA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27CAE108005C;
 Tue,  9 Feb 2021 02:32:27 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 42/56] hw/block/nvme: allow cmb and pmr to coexist
Date: Tue,  9 Feb 2021 08:30:47 +0100
Message-Id: <20210209073101.548811-43-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

With BAR 4 now free to use, allow PMR and CMB to be enabled
simultaneously.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 85d3c43c4f74..4ce75642f1a4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -29,14 +29,13 @@
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
  *
- * cmb_size_mb= and pmrdev= options are mutually exclusive due to limitation
- * in available BAR's. cmb_size_mb= will take precedence over pmrdev= when
- * both provided.
  * Enabling pmr emulation can be achieved by pointing to memory-backend-file.
  * For example:
  * -object memory-backend-file,id=<mem_id>,share=on,mem-path=<file_path>, \
  *  size=<size> .... -device nvme,...,pmrdev=<mem_id>
  *
+ * The PMR will use BAR 4/5 exclusively.
+ *
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
@@ -109,7 +108,7 @@
 #define NVME_DB_SIZE  4
 #define NVME_SPEC_VER 0x00010300
 #define NVME_CMB_BIR 2
-#define NVME_PMR_BIR 2
+#define NVME_PMR_BIR 4
 #define NVME_TEMPERATURE 0x143
 #define NVME_TEMPERATURE_WARNING 0x157
 #define NVME_TEMPERATURE_CRITICAL 0x175
@@ -4121,7 +4120,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         return;
     }
 
-    if (!n->params.cmb_size_mb && n->pmrdev) {
+    if (n->pmrdev) {
         if (host_memory_backend_is_mapped(n->pmrdev)) {
             error_setg(errp, "can't use already busy memdev: %s",
                        object_get_canonical_path_component(OBJECT(n->pmrdev)));
@@ -4218,9 +4217,6 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* Controller Capabilities register */
-    NVME_CAP_SET_PMRS(n->bar.cap, 1);
-
     /* PMR Capabities register */
     n->bar.pmrcap = 0;
     NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
@@ -4321,7 +4317,9 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
 
     if (n->params.cmb_size_mb) {
         nvme_init_cmb(n, pci_dev);
-    } else if (n->pmrdev) {
+    }
+
+    if (n->pmrdev) {
         nvme_init_pmr(n, pci_dev);
     }
 
@@ -4394,6 +4392,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
+    NVME_CAP_SET_PMRS(n->bar.cap, n->pmrdev ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.30.0


