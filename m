Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E9355D40
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:52:22 +0200 (CEST)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsgP-000574-Lz
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsau-0002BC-7n; Tue, 06 Apr 2021 16:46:40 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:37175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTsaq-0001X9-Kt; Tue, 06 Apr 2021 16:46:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 1EDAF13A0;
 Tue,  6 Apr 2021 16:46:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 06 Apr 2021 16:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Nyr1FKlzBIy1/
 c0H4YJtakyzWIQGvyvtqYXrdVAUKHo=; b=aQW8OKACfUCjst9rtabpAZqIpsWih
 SoZKXceeKpbaYuzksMVw/MVaQsbAmo/nWo9PruSCGKc9d/XHy/EuXmm2Vs4yfFFz
 7yHSb9c5K7fxnBX4CFXHzG2aztl9airrkrykEchVZKkh/Ns02j2ROVrEx7RHXK0D
 gHOWw2CQc6oRP31LD4U/+F298ZHa28cZXXJLJ4RGzIonBuuNWZhKZanPKA+9IPJC
 Y+RDv0hn7D69HC+g5M3axZ+1l7fyfAod6xeXca5HpAyNXmR9p+H39Nk7/NvktZ8D
 4o0yRXAwqTm0uXBii0Ss0ZK5YgQsuPeGKUfCBnh66VaCCpBGIfGaDiyGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Nyr1FKlzBIy1/c0H4YJtakyzWIQGvyvtqYXrdVAUKHo=; b=CmVTCYgD
 mLUsarcT0kR63CLw/DlX+dMjOyBAYmsdVDk9eMTkZm6Oce9xygtuIMxHjvBSv6K1
 3k16jWnsvZ3YgqjsmjhjNdO2C2RH5z/DUb2UiC7QHpGm1JUSAKXg5Qaov++uQ0Dd
 Xm/Sdoaky29woZV6rLVw0lYDR9dzrBeCaLhTaaJAw1XuLB/B0BKJ1vT/asshbiTm
 H2qSHAUql5/6jefI3ZHCX2fV+lfxAMh9he3pt+rxSaZ9iUkwT9Rd+btwgsHUAcQH
 MgKyJnepGdGSmhiOWqJK9Y3hpG0EQDEyziuCWEWP3vYg7ao34vA81u+NcCis18US
 k47YuEiGdSBXZw==
X-ME-Sender: <xms:qMhsYFnVvDdkDaV7o7NzI1SI0RKUmogkW_qEwndDW1h_kq6ukshmeg>
 <xme:qMhsYOaoZCo0EBDoaBGjQ_0fpzsf36SLBNu5q-xRomy3Fsu9msn69DWwhwr1EJJpf
 hYoHPsyukiFJCaQ4bs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:qMhsYCH8UTOTOvBeixEmdGvQlaW1jAIMJpG5VAaHE6nvADuHjJrgIA>
 <xmx:qMhsYHLUjtYb87_0fkYpF0GrwhotiT2fKq5XqjkZ8uUjT7IBMGozLw>
 <xmx:qMhsYFNAFLXpPDbknXonT1x7cYh0EdM_nK-rLQErcSQ_3Ux_CDU1KA>
 <xmx:qchsYIEufI-0guLlEBU8AOVzBkNAftKmrxFdzFrwzaxEfcgXpFvfWXxfidY>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7079B24005B;
 Tue,  6 Apr 2021 16:46:31 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 1/7] hw/block/nvme: fix pi constraint check
Date: Tue,  6 Apr 2021 22:46:21 +0200
Message-Id: <20210406204627.140812-2-its@irrelevant.dk>
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

Protection Information can only be enabled if there is at least 8 bytes
of metadata.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-ns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7f8d139a8663..ca04ee1bacfb 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -394,7 +394,7 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (ns->params.pi && !ns->params.ms) {
+    if (ns->params.pi && ns->params.ms < 8) {
         error_setg(errp, "at least 8 bytes of metadata required to enable "
                    "protection information");
         return -1;
-- 
2.31.1


