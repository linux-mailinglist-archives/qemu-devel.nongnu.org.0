Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255FF2F9C15
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:58:09 +0100 (CET)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RIW-0006kr-1S
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R7y-0000f1-Iq; Mon, 18 Jan 2021 04:47:14 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:57449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1R7w-00010Q-HF; Mon, 18 Jan 2021 04:47:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BC74E5C0125;
 Mon, 18 Jan 2021 04:47:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=jnSJmPAWX+y4o
 7yR6InFMxaMA2cZLxhVeW5iBjf7yJ8=; b=kON9B1obW0y18e0u2oT8ew32kbEQI
 4Ma7ZOkRq2gtMBre2k3hIwd6mvz94I34pSwrQ+bAostad1+scFW2Ngz7fvwyUEjf
 PHcJ4UL9IVHc1A4FI2AHNnOwyzr50n2e5lI5K4/e+nEaO2xw/i1s/hZQSS5gCIB1
 oDY4YgvWrZmQ4o1WqCLWLmGjKt92sPYHeFpuCfb3ZkOmnditrnPmkbp9HWyqnkyz
 XLLumbptNbB+hGlYr2ZCQbwR/BWlBqTQh9StT2hll9msis2GG2fsJ7JbZJNBsZNa
 bTLW9ycin+KRXoa24yo3/X93w2qsZXpBxWFhZuBkloy+oocR5WiWBUERA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=jnSJmPAWX+y4o7yR6InFMxaMA2cZLxhVeW5iBjf7yJ8=; b=pOQK2zsi
 wyCOET88Oah52pinQK78QGOvY47LBt8Y6tdI+S5FZ3LihNWVo+1Po05BVZs0GSD4
 fSrmZaw4m9up/gedggyPSdY6ANo82kE+x3xJ3yfXL04lDX9NPgs9Xd8Vw4jzLO5Z
 uVwrm/m5V3eV8q6wOD9bF0+V5NhgeqN/aX075fheCkhhEObejP8i30dWKP0dlOMu
 kgwi+CraBxNJFMFyBGOrFFv+f0RTDwNEetuf8P0XwKPX0XhTt1QbEh7XYUiiK0NH
 59QhbU8vFiyonPUAZBiEbkv/0joWwLTTpH5Jz6UVtEeaVZbXrCuzGlCh4ocSQ+ob
 lVvypviaWsv9IQ==
X-ME-Sender: <xms:H1kFYEF3SfsXiFTiu6r4hVi-imX6aicS-c_1qAzJnq00M0ewWFDSlg>
 <xme:H1kFYNVITpX1y_mmfZ5YVBVZRB3hzxTvjGYn0p-BRoQ_cJrmHyPr6bkp9Hw3zVMKx
 xWsoTgzvwGhPxvc0R0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:H1kFYOK4gLlFquchaGe2Nuy4f-Xwpl6QF4CPRq4gtj9mw1drcGtC0Q>
 <xmx:H1kFYGEwJVPhCanUADomhnUtTz3oz8uQG0s7um3FtfC9PHdVB33fIg>
 <xmx:H1kFYKWD_MMyHvOzeDoCt3E_mjYJnkUwu65PIGOXtY3DDNYD78h0-g>
 <xmx:H1kFYMIud3W-Tr_Hg65SP83Y6bcTzlcXggD8goCw49vUrU4cV9ZmWQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 777BD24005A;
 Mon, 18 Jan 2021 04:47:10 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] hw/block/nvme: fix 64 bit register hi/lo split writes
Date: Mon, 18 Jan 2021 10:46:55 +0100
Message-Id: <20210118094705.56772-3-its@irrelevant.dk>
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

64 bit registers like ASQ and ACQ should be writable by both a hi/lo 32
bit write combination as well as a plain 64 bit write. The spec does not
define ordering on the hi/lo split, but the code currently assumes that
the low order bits are written first. Additionally, the code does not
consider that another address might already have been written into the
register, causing the OR'ing to result in a bad address.

Fix this by explicitly overwriting only the low or high order bits for
32 bit writes.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index bd7e258c3c26..40b9f8ccfc0e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3781,19 +3781,21 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
         break;
     case 0x28:  /* ASQ */
-        n->bar.asq = data;
+        n->bar.asq = size == 8 ? data :
+            (n->bar.asq & ~0xffffffff) | (data & 0xffffffff);
         trace_pci_nvme_mmio_asqaddr(data);
         break;
     case 0x2c:  /* ASQ hi */
-        n->bar.asq |= data << 32;
+        n->bar.asq = (n->bar.asq & 0xffffffff) | (data << 32);
         trace_pci_nvme_mmio_asqaddr_hi(data, n->bar.asq);
         break;
     case 0x30:  /* ACQ */
         trace_pci_nvme_mmio_acqaddr(data);
-        n->bar.acq = data;
+        n->bar.acq = size == 8 ? data :
+            (n->bar.acq & ~0xffffffff) | (data & 0xffffffff);
         break;
     case 0x34:  /* ACQ hi */
-        n->bar.acq |= data << 32;
+        n->bar.acq = (n->bar.acq & 0xffffffff) | (data << 32);
         trace_pci_nvme_mmio_acqaddr_hi(data, n->bar.acq);
         break;
     case 0x38:  /* CMBLOC */
-- 
2.30.0


