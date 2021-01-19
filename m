Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438392FB55E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:33:39 +0100 (CET)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1oKP-0003f6-Sy
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2k-00027y-FS; Tue, 19 Jan 2021 05:15:22 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2i-0004Im-MA; Tue, 19 Jan 2021 05:15:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 26D77F5A;
 Tue, 19 Jan 2021 05:15:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 05:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FvbSwlvKxeTHO
 XvOW9mbTiUCPAJe3BwO+kLpXHKnqBg=; b=n19WDPn4dG1ZMG+7Q4qsG2dMDQloF
 IFO21xFUnALhnfDCrNFrr2BMcgMh96MQZW2Vr+cdxo0mjcFi1PuqkyYCHgav1lFD
 Z1eM7mayVgD7InJbgzbiZeVHVwhH4TfV7WqqfwHtXUlYzTMyuf/MK/7l9G1iPby0
 dQIplxVR6WJ7f+g11svOY1j7EwVwNLDj++Mnb9CME11PWaeo2926prBrRwdvNJ+R
 6zUnojYGBy8nZmfu1Kd1YdOtCMyPc95++icjA5gJqTEq4JJIoRgNz/Tz/5GSWgm/
 pywBLMS7KwFAwwD5UIIAsqBArHGUtM1aUhZHevBBbo3ePwygt2mFN0doA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=FvbSwlvKxeTHOXvOW9mbTiUCPAJe3BwO+kLpXHKnqBg=; b=iQsvcUpe
 9yjjdsr2+oqiQKr1EtderAQ5dOalzH30jW5hZa+UiJN23msE1t3pzOTWm/7QbsmV
 Hywsp706X/yGNQzne+Q7XYNWPZEe4L4kLUGbwuf2ILTkKW1qW2gqqdtWwQf0Dm4w
 exaJL3//74cHwwU6K2EmhF7lCcyy5xRf+M9n+l2m2mu0wwXQge34dCa3pOPi9aNZ
 wGyB8/8/lDDpHrR+cP+fDEws/zmz9U5NQA7DCrJpDr0YVDMWWeRLbzr10prADk73
 UeYKOZGjjd/s06Zgjh2ABIyEC+65yM+R+zYEdZmU7AlThoBbr6VD6uzfDlhHqn0x
 RbUpzbl7FWdPPw==
X-ME-Sender: <xms:NbEGYKlZWhZ8S56c1wooSc56NB4QHaZDSrEzxwUf_2KW7ol19vkZpA>
 <xme:NbEGYB0fyC6v0xDze5O9-h4x69fZBSPbkqVSwuqG3QZXYHIZjiKfSwPsjGAr541ZL
 4j6YyVwvvLn_ubjAL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NbEGYIqlRYNm6PU4kKAiXFRMz2vPoudlaN3XHXYB_0uA_CPbX8Q9QQ>
 <xmx:NbEGYOnjfAPMPMTDYSdYa8tgncG2NkD-hXrJe1c7DHdxB6b4OUgNJQ>
 <xmx:NbEGYI0kABb1jsb5eGCyRYvQhLC0hEw6lHacMfFtj_y0b7gboTZZ8g>
 <xmx:NbEGYCp7pQ3Yv3Vymsq75afd6uCVCjCjsUVqjTdVIwbIsolsb6D04g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8767424005B;
 Tue, 19 Jan 2021 05:15:16 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/12] hw/block/nvme: remove redundant zeroing of PMR
 registers
Date: Tue, 19 Jan 2021 11:14:59 +0100
Message-Id: <20210119101504.231259-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The controller registers are initially zero. Remove the redundant
zeroing.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e4fb89c88e23..85b6617a0ce0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4188,43 +4188,9 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* PMR Capabities register */
-    n->bar.pmrcap = 0;
-    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
-    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 0);
     NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
-    NVME_PMRCAP_SET_PMRTU(n->bar.pmrcap, 0);
     /* Turn on bit 1 support */
     NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
-    NVME_PMRCAP_SET_PMRTO(n->bar.pmrcap, 0);
-    NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 0);
-
-    /* PMR Control register */
-    n->bar.pmrctl = 0;
-    NVME_PMRCTL_SET_EN(n->bar.pmrctl, 0);
-
-    /* PMR Status register */
-    n->bar.pmrsts = 0;
-    NVME_PMRSTS_SET_ERR(n->bar.pmrsts, 0);
-    NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 0);
-    NVME_PMRSTS_SET_HSTS(n->bar.pmrsts, 0);
-    NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 0);
-
-    /* PMR Elasticity Buffer Size register */
-    n->bar.pmrebs = 0;
-    NVME_PMREBS_SET_PMRSZU(n->bar.pmrebs, 0);
-    NVME_PMREBS_SET_RBB(n->bar.pmrebs, 0);
-    NVME_PMREBS_SET_PMRWBZ(n->bar.pmrebs, 0);
-
-    /* PMR Sustained Write Throughput register */
-    n->bar.pmrswtp = 0;
-    NVME_PMRSWTP_SET_PMRSWTU(n->bar.pmrswtp, 0);
-    NVME_PMRSWTP_SET_PMRSWTV(n->bar.pmrswtp, 0);
-
-    /* PMR Memory Space Control register */
-    n->bar.pmrmsc = 0;
-    NVME_PMRMSC_SET_CMSE(n->bar.pmrmsc, 0);
-    NVME_PMRMSC_SET_CBA(n->bar.pmrmsc, 0);
 
     pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
                      PCI_BASE_ADDRESS_SPACE_MEMORY |
-- 
2.30.0


