Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96E52FB549
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:22:32 +0100 (CET)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1o9f-0004Fs-Oj
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2e-00020X-T6; Tue, 19 Jan 2021 05:15:16 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:59209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2d-0004Gh-4W; Tue, 19 Jan 2021 05:15:16 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id C453AF50;
 Tue, 19 Jan 2021 05:15:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 Jan 2021 05:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=CM6hNEpJ20kPy
 CBGBWpqYKEw6dzX6r8df3h0BstfxLw=; b=EkuookeSsMERUMbkmvBvXSSpQqzbf
 Zl8+CWlHXs4KhqpwopCCSIOLKmmvRb4op+i8B9wKyJKIfQCeN+BKTeejoRIMY/yQ
 PlLs8ur4H1ihI4AJg2ZcQbavBkekwZ/phtn/BR1+SEYW2Hkey7dM2rjh9s1DDWZa
 /3h9wAACnpM0iWozk8BwtI1MQhU/f67ElXJP/6ss/3lNOgnpk3u3HfFffdbQMAd8
 VmdugNwecKA3KtW8LfQWOZEY7vmHkzs/T8bKWFpUlQaY/v9RU3myS7H4AWeGgnzc
 rR1GGPjfYUP4fq/oXgFwYZsk7Pq2AMkoAd+iCQUdlmdaLXpTyo9uEW3fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=CM6hNEpJ20kPyCBGBWpqYKEw6dzX6r8df3h0BstfxLw=; b=Jagr+Bhc
 doL6/CNrqGyyPQG1+oRfTBVyzSZa69PpkjB19uj++pfret9vXAsMBzmyEE5z12Aw
 ho4fPjs3auiaQNNK39gsxdxqb14r1N/FTGMwZvnP5rnr6iTgN/cqL4hQhvC0QyP/
 sk5aKgXmvJx1VD/55AJSU0OQyqIkVgEofZK79iptBvVTsZ7e8Mlc/X2AsZIeaA3J
 DaUKa3zDYgAZ4gyYFknCF8AFWNM/Vq8NjtyDO50J87/zoVP95ZLsEbXX3WiZtL8i
 QBo44qfUWvdpPAVO+0r1C7e1apAcvirGqnncxwmY98GM/QOIW2x919HDaonl5cPL
 myQtE45jOx4Z5A==
X-ME-Sender: <xms:L7EGYDlpAKzvUdOKdyTX7WS8SpsxNyQgv13XWBGx2sHV-rolGeXTig>
 <xme:L7EGYCqLkx1z_keKxvEzQUqn9XJtjGH9jW83FJnL_Oy-vef9ltbe0E-X43LHRpWr6
 5G26JN5TJxeHO-T25U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:MLEGYPI6GL1-kLAM4H0109abuDMipw-x4HvQEv2me2HjNICTzQEQAQ>
 <xmx:MLEGYOCgWvF7mxxpcr2X34rlcmI8YXCtYAmbIY9Gn9-1qRqxpJrQ1Q>
 <xmx:MLEGYB4LBpCYOPHHPJ9Ul3epVBGFhwjNrXSKsRw8HrD2NtxO1wVynQ>
 <xmx:MLEGYK00ztOQt4to_ASghcsi7Md-3VfFkbcyqvFVGiUg0pkaFmXKC4Pyhbc>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D51D24005D;
 Tue, 19 Jan 2021 05:15:10 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/12] hw/block/nvme: indicate CMB support through
 controller capabilities register
Date: Tue, 19 Jan 2021 11:14:55 +0100
Message-Id: <20210119101504.231259-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Maxim Levitsky <mlevitsky@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>

This patch sets CMBS bit in controller capabilities register when user
configures NVMe driver with CMB support, so capabilites are correctly
reported to guest OS.

Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Reviewed-by: Maxim Levitsky <mlevitsky@gmail.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 10 +++++++---
 hw/block/nvme.c      |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 45b2678db1f0..86d7fc2f905c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -36,6 +36,7 @@ enum NvmeCapShift {
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
     CAP_PMR_SHIFT      = 56,
+    CAP_CMB_SHIFT      = 57,
 };
 
 enum NvmeCapMask {
@@ -49,6 +50,7 @@ enum NvmeCapMask {
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
     CAP_PMR_MASK       = 0x1,
+    CAP_CMB_MASK       = 0x1,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -78,9 +80,11 @@ enum NvmeCapMask {
 #define NVME_CAP_SET_MPSMIN(cap, val) (cap |= (uint64_t)(val & CAP_MPSMIN_MASK)\
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
-                                                            << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val) (cap |= (uint64_t)(val & CAP_PMR_MASK)\
-                                                            << CAP_PMR_SHIFT)
+                                                           << CAP_MPSMAX_SHIFT)
+#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMR_MASK)   \
+                                                           << CAP_PMR_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMB_MASK)   \
+                                                           << CAP_CMB_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9a508df8d200..3168ba5114ed 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4345,6 +4345,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_CSI_SUPP);
     NVME_CAP_SET_CSS(n->bar.cap, NVME_CAP_CSS_ADMIN_ONLY);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
+    NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
-- 
2.30.0


