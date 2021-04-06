Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1A355D5F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 23:01:34 +0200 (CEST)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTspJ-0003mw-Jm
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 17:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsaz-0002CQ-EZ; Tue, 06 Apr 2021 16:46:45 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:60679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsau-0001Ym-K2; Tue, 06 Apr 2021 16:46:45 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 179461407;
 Tue,  6 Apr 2021 16:46:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 06 Apr 2021 16:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=weMSRVXTf60n3
 ESV7JtZnQQPeh6az/lUiqnAZxFrNPQ=; b=kx5iUaYeCjCFnInu5MZGmmx3Ij32F
 F99vnrNcaeb7zfKskruS+SY/utBoYOb8GxT4Hdl/DtF4ssFEvJlgtEDtYtv2N1Go
 92tSSu4vmzFR3ntDiw+Fu4UOe1PsA/GvU5QJvLhYvfjrTj2AWEFppAtYNQRi6W1Q
 MirecKr+iepZNmYFQIOBV8K/yNpcmUn3KV5fmw7tJL5PYGdoibCP+gqILVPZ+AsV
 OlMCvJpH7FGBkk45kzJU184TNIznPyhHLWhqzIbYynLLRf9/CrpStPX5xwVZLl0I
 pHcmfV4JaoDbOzpTFfoCvec0jo4taQWXrvEeGGmg85BnPQU59xVc9lBxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=weMSRVXTf60n3ESV7JtZnQQPeh6az/lUiqnAZxFrNPQ=; b=qHO45h07
 7QkJl3UPhqUnJyAB4570C08uxli/9+WZRVfuJzSWAKloIpvL4WynjpF3PvjCkn8h
 //AnRZzHBbQDTrmhcRdlMURxEETSnmg0ye6LKHusFXoapWCOQrWlNY7k0cIwkhLl
 QIoKAUsRHBAfiJPkLwOqNvfqP1fvGchOhL9YGt7Wqn1W5PpP5Ms/8shThv2UL3AY
 S2mBTbmPzn1fS6C19+D9BjxfTJRnJamzGC/6AF1nK4KEgL1zuXDHN6J47nc0Rqo6
 tlNdMzH2P+0wNtonODC9uQjXuD6jHzNUSVesMf5vqf+pNZLQTyqFjcv78Y+evuiX
 XxWfyVMq3Ni/ww==
X-ME-Sender: <xms:rchsYFhImmTUEH40W7bFXJ2miSlyg91mHatuTPWxhXzVXYqY3rUmnQ>
 <xme:rchsYA87s4jsrwIFplEaoCGMIw0r2bS_upIN0Sin89y5KyZbtbe4Z3g_gaab6cjA-
 ZxGdB_lc7UuI0dxprA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:rchsYKLxImHMTM37pz46vhcP85zFQtZPTurqBBO0z0ahYAfRDCI0cQ>
 <xmx:rchsYBamBiPi2MtD5lnn1IZvNbajj_3MBdpZZeFb8zdG_XxTPov1rg>
 <xmx:rchsYNhvsy0FzsbpP2cRz8mx-_iIvwj2JvJKVh8KVBnAzNSSgDwn2Q>
 <xmx:rchsYB6wWhL-3QF8rkn7a22YPCfc5uzUYNP6OvFOuIllah_gCqgx3nQFM2c>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39C1824005B;
 Tue,  6 Apr 2021 16:46:36 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 4/7] hw/block/nvme: fix warning about legacy namespace
 configuration
Date: Tue,  6 Apr 2021 22:46:24 +0200
Message-Id: <20210406204627.140812-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406204627.140812-1-its@irrelevant.dk>
References: <20210406204627.140812-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove the unused BlockConf from the controller structure and fix the
constraint checking to actually check the right BlockConf and issue the
warning.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h | 1 -
 hw/block/nvme.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 9edc86d79e98..8d1806cc942f 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -166,7 +166,6 @@ typedef struct NvmeCtrl {
     NvmeBar      bar;
     NvmeParams   params;
     NvmeBus      bus;
-    BlockConf    conf;
 
     uint16_t    cntlid;
     bool        qs_created;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7244534a89e9..09c38fb35e0d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -5805,7 +5805,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         params->max_ioqpairs = params->num_queues - 1;
     }
 
-    if (n->conf.blk) {
+    if (n->namespace.blkconf.blk) {
         warn_report("drive property is deprecated; "
                     "please use an nvme-ns device instead");
     }
-- 
2.31.1


