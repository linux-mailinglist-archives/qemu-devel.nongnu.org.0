Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8B3BEBA4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:54:36 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19sh-0003IT-Dt
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o6-0000CD-IL; Wed, 07 Jul 2021 11:49:50 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:52767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19o5-0003Ew-0i; Wed, 07 Jul 2021 11:49:50 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 658CC32009A5;
 Wed,  7 Jul 2021 11:49:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 07 Jul 2021 11:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=wG7Zr+dwuhEwF
 WP/4Iw9tSJ54oGJFx3b2RiKRyjEeY4=; b=U1SDUfieO6qy4Ouod+TPJKwpMr7+f
 LyhG+X93I6xVOzQjlB7kHYVJaDa1Faq+EBQ4WfrHLyQAXJTiEDh5KQPzAggK/EcM
 9qwAZidqADptVTUCaK4j5FUVXfOegu+zQa/H74B0SnRMjxyg13WatKlVPlfCuim0
 3GU0WA0QBLx1vfcFE9hATbGD6VrrbsKwg1KLhrTyzcibtt+vVA8RM2EGYhLI+IiO
 W7n72t9UhpYm11I0hBqBwlrif7xP4gLcOaxe40c+za1AL0O+m2GSrh2PdBv2/m3s
 y7K8tCCcYQHM+UlegV0iDpfS/eQvcJyT00zfcJJTPnhVEVdXcyv2TZ2VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=wG7Zr+dwuhEwFWP/4Iw9tSJ54oGJFx3b2RiKRyjEeY4=; b=O4D10yUD
 ECKhQnGtrS+tPXwUwQxP9YYKUxGJfS+Dgg3et9op3vfjwTiXtOAZ1tV44UCjLLTi
 F7o9l3K1Vo4gR5ENiEexkCzIX33JVnSd+swcNm1yQpW9ONK8S4cfbbbKlvyu/Cw2
 9YFpA35E30jWmzLdt9ZP8kC5k/9G5g3++PoIxftd4IPPr3DL3vxEVoq8Dmyh9icq
 A3YABmLxlkw6+WJ5b7wzLgQ2b8adxEslmAqLaCk4Qrq9h5BJ47v+xvONjz3+/Oi7
 rk49SlqqxYBNvbxCpud7sSOc9Nq6NhwCFJbfeuFIdNoaQMFNA1V876pYspM0H1KB
 cFWQEEWS+jpztA==
X-ME-Sender: <xms:Gs3lYLMdf01H3KoBrw6IYyzebLCe7RD5K4FyVQ_K9dBnpfTmrZF9Ag>
 <xme:Gs3lYF-TyBaFHG4nx5m7iolx6dxSsugXqKbukZiGX__OCnmI70fZu7Z3Xjj78o9DA
 7i1S2vHaafkIpYEDno>
X-ME-Received: <xmr:Gs3lYKRxwhy7HQunre_WL8TbrQ8GaN4g3coObq6iiiKym1D7i-wfiiK4lfk0Gw8A5BEMFV8vEw4wgHzPGXyFnYa352cnAjK6LC8-IYtaLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Gs3lYPsm9zBjgN7Mo5OJJb9JO85D3v3NOLYXXP8jmmelNi-aTSzWgA>
 <xmx:Gs3lYDff6LuPyV66-Iz2haji6l06p2ury5T9GAGJNPSYjNCkMZLXnA>
 <xmx:Gs3lYL0QTTROtryuT52XXM0PNZEPYO50gUxk75t_p_ALl8Yf66Ee0Q>
 <xmx:G83lYK5vbxFecQ-O6d_z2q9T1Ej4GDLaHPcPfeXNHFi9eC0zYv8fgQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 11:49:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/nvme: unregister controller with subsystem at exit
Date: Wed,  7 Jul 2021 17:49:35 +0200
Message-Id: <20210707154936.200166-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707154936.200166-1-its@irrelevant.dk>
References: <20210707154936.200166-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Make sure the controller is unregistered from the subsystem when device
is removed.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/nvme.h   | 1 +
 hw/nvme/ctrl.c   | 4 ++++
 hw/nvme/subsys.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 0868359a1e86..c4065467d877 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -50,6 +50,7 @@ typedef struct NvmeSubsystem {
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n);
 
 static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
                                          uint32_t cntlid)
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index dd1801510032..90e3ee2b70ee 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6523,6 +6523,10 @@ static void nvme_exit(PCIDevice *pci_dev)
         nvme_ns_cleanup(ns);
     }
 
+    if (n->subsys) {
+        nvme_subsys_unregister_ctrl(n->subsys, n);
+    }
+
     g_free(n->cq);
     g_free(n->sq);
     g_free(n->aer_reqs);
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index dc7a96862f37..92caa604a280 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -32,6 +32,11 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
     return cntlid;
 }
 
+void nvme_subsys_unregister_ctrl(NvmeSubsystem *subsys, NvmeCtrl *n)
+{
+    subsys->ctrls[n->cntlid] = NULL;
+}
+
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
 {
     const char *nqn = subsys->params.nqn ?
-- 
2.32.0


