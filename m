Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F82F9C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:04:56 +0100 (CET)
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RP5-0001vL-Mx
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R85-0000mL-1l; Mon, 18 Jan 2021 04:47:21 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R83-00016j-D6; Mon, 18 Jan 2021 04:47:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A828B5C0164;
 Mon, 18 Jan 2021 04:47:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+uRqlbEx0fkoa
 5YOaRoZO1Pw488di9s9lI1NNCnfOMs=; b=H7LDP032op6gOsp5KBKn48swNZv7N
 sbTrcQSLbGrhNXZbrpxiuWmwCTJkjDVDBqzNcLvg9I/T4OizusDcPUc7+6zPClWE
 J1G8a9FygPAJJEIGpcHKjsk/fmNpWseGMvT6qeuLnAY28j0qEGyu1Y67NtFUrzhf
 sXOhGGXrpU4QcM4sGz/T2F32LH79aGsJ7mnpMhQIhlvTZVo7crOJBKw9wLNeONBq
 eyJ5VqztKH5ExPoNztHeXOqtN5AQkOzS5fLpLIev2wsyg27f+uNd8ENQDSsYNmuy
 0nKXvxS4ux/axEz9wTBb4W+nTPGBnCrOhEOu2aiSeCjymDO7lrhVVq8lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+uRqlbEx0fkoa5YOaRoZO1Pw488di9s9lI1NNCnfOMs=; b=dy9zbdA4
 NP4sD3qrvFmzaB3z7ftgNBINreQes5HQD1A+M29sdctyMz8w/M4gsfuA28x80OpM
 ohaQRGwZ5M4H5Kp1Qsz/f7JkuyB7AxPwtl+AVzQKLZuMMuQz5jTesYhmJbclp4tL
 h79wZL+n2slbnxL+a04uTjwM1Vbf8OiY8MV8rwWUX5cTx3IAEiNsgUEWtNmksu28
 6CUonxZinqPh9qz79E85AsSP5cFrcK0H7xij6ZeV/q4gCt6BAIC4Q+Lihd7DrIll
 PFXwD4ufY3PQPopp6miahrIvv5PItpmMee/Gg0+pFZWAygzixAJFNYLcaFTA6feC
 Lg0XHr2V9gC4Dw==
X-ME-Sender: <xms:JlkFYMYh_dnnE2wLY7vKFHAOrAqrriF1FzYYKlOEkvtkVjcftTbzww>
 <xme:JlkFYHZhnVsKA5qYRf9FjqTqs4T90JhENviLFCJ2P0-G88KCTNN9bL48xJIIBqpGt
 I6togRySTuLWfi0ri8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:JlkFYG_buov30esVSiBXfinE65Khnr_9nHe--uu-8MMbwOLyGhlruw>
 <xmx:JlkFYGqU7DBAHE9nB-WlsS3unwkPKCWfW-21Lf7pEnF_BmSnuiOqPw>
 <xmx:JlkFYHoxDly45Nl1Z8aGOC6nP-lBGtFHmbVK4k9-GwhQu9CGwf3aLA>
 <xmx:JlkFYIeEroysOepq8kmUmoxbfjPpOuUDrj5_rCiJpOx8xjLRwXNdUw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 642A224005A;
 Mon, 18 Jan 2021 04:47:17 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] hw/block/nvme: remove redundant zeroing of PMR
 registers
Date: Mon, 18 Jan 2021 10:47:00 +0100
Message-Id: <20210118094705.56772-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118094705.56772-1-its@irrelevant.dk>
References: <20210118094705.56772-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The controller registers are initially zero. Remove the redundant
zeroing.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f3bea582b3c0..9ee9570bb65c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4179,43 +4179,8 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
 
 static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    /* PMR Capabities register */
-    n->bar.pmrcap = 0;
-    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
-    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 0);
     NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
-    NVME_PMRCAP_SET_PMRTU(n->bar.pmrcap, 0);
-    /* Turn on bit 1 support */
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


