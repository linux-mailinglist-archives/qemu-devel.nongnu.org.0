Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1E330ED3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:05:29 +0100 (CET)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFZg-0001kx-FV
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwB-0003q9-7W; Mon, 08 Mar 2021 07:24:40 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:46095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEw7-0007Bo-9s; Mon, 08 Mar 2021 07:24:38 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 271DE36D8;
 Mon,  8 Mar 2021 07:23:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=doCvP9in28f9Z
 k5mqbNzRBE+bwVJ25rs2t5aKtAZDac=; b=RnWjn0aIpkqbQYvRjYJ/WbZJzLD6e
 uGPRskdWaBW3gUIkAsXck39qq69mOpBPccRZU4S7ASMjIIM2TXheVmwl6/PHKeMZ
 znHSuVkUpOtGzhsiYd6t2hyVn6NwZksBVohvQVF7vYcPKy34kP5sQkEfveLG2sGX
 /sLDJaEilYeeQ+nlsOrJUx2lMbYqUeq00nlYU7iAe/v5p5PliqHmhKsyZGpvcRKL
 czkOsG2OMP2gaBE1E7KXySC/kSasohxEgF13svC0CPBcicwm2UYNrKLpYbxB9LLt
 M6OQDqyXRccDvmDGYe49iOxRCJ+1dG1a15wkjRhHwDKNUlu0T8vKtfxNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=doCvP9in28f9Zk5mqbNzRBE+bwVJ25rs2t5aKtAZDac=; b=i/mutPIH
 KDy/kqTBVNq419zuPN41MRcf0D7Iit/3JM6SepNaBSiFvCozhuJ/RxoANFT2AdBB
 v60jTI8tjk9zB4R9WBYLir5nUVoNqaSU46QAqA4hqWQPPgcE5o/h5DkxDb166ma1
 o1jD+iC1Gt7uExXGmEaASou+Rqzy+g5bixN8YGdt6Mae16zRssIPutj0yE10TZQR
 KJ4FkyJWjVjI1PVWk+adYK3Vjh63yzv1GgcUDlCax5JdEkxF+SjT/4yOb/SKgk4r
 nZL7yYmoyqld7pSzVz3ITm7ftkpYW8mP0tUb90AFdHGyw07GPAdg/unNMlSIUArf
 DRJHU+ph2kibdw==
X-ME-Sender: <xms:XhdGYJdp6-KNF8Kd9ygw6srVNEESDRvASgP5x_2yndcuoP-_J0kggg>
 <xme:XhdGYHO7Q7BwekYyefoHPDOnu2FC_EagyDx-UEQ14xhp8SK7bbLIeaFdFYC6lXLZ0
 DPmaScTRrd_3__NG2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XhdGYCh6pGZ1a7psQgwVgoIp074l3dO7lqn34O5Esnpzyb7DJ5_Sug>
 <xmx:XhdGYC9fiwv_eNrVnOiNTMiYHrT2SGxLP2ysJefTCGCrM_BZno3zeQ>
 <xmx:XhdGYFuFc9_iYcQLBmZVRhyXAMpq23AOBja7hY2kviW2gz1XFtPhZg>
 <xmx:XhdGYLA8huqIoIGKuuzDuM-ZTMWOkGde8uIsW6eTsIgdqHDrXMUECjJhQS4>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 485B7108005F;
 Mon,  8 Mar 2021 07:23:57 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 27/38] hw/block/nvme: fix strerror printing
Date: Mon,  8 Mar 2021 13:23:02 +0100
Message-Id: <20210308122313.286938-28-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122313.286938-1-its@irrelevant.dk>
References: <20210308122313.286938-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
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
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Fix missing sign inversion.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 148ad3dd01e1..6580f5eb1746 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1155,7 +1155,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
         break;
     }
 
-    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
+    trace_pci_nvme_err_aio(nvme_cid(req), strerror(-ret), status);
 
     error_setg_errno(&local_err, -ret, "aio failed");
     error_report_err(local_err);
-- 
2.30.1


