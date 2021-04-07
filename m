Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B6356386
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:55:29 +0200 (CEST)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU1A0-0006WY-MF
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11j-0002ED-5D; Wed, 07 Apr 2021 01:46:55 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11h-00057j-BY; Wed, 07 Apr 2021 01:46:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E6505C0061;
 Wed,  7 Apr 2021 01:46:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Apr 2021 01:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+55KtwyUZoLCD
 C3kba6abNjh+1GG42zd8xU3pXg2m/E=; b=Kk9TZJ6ZxTprB4LYvIl55WOD1R26K
 M/Mx4dAI+mGRzjE1ZXl69H2CqdOQNvQfZDi1kYiFoKJ+YeuvJ8Ku/g98MW5USezH
 ilt4lETFlO/OwYcZzmRActai/tSiz5vXM5WbkDD1HgKvPP+ni1AHOS9JlUvVTr1H
 O0nAIR+x7xiFHg/HAojSY4WtZFaUy9DOFJZ3QQrzNV0s06hwOULtMfafCrE565xS
 iuyIlT5p4IIIcsArrtESwutKlM6nToiuSY8UZFsoAclm9KMRqsbBUcjbeHxQUIif
 WQV/zPuSYN04bgMG2a54Z2C80f/CGSzh2c9Saf8kLufkAyAwq2LR7cCVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+55KtwyUZoLCDC3kba6abNjh+1GG42zd8xU3pXg2m/E=; b=GEJtedkl
 Bg4RMLaPZLI1yIQQEszUglAfAjXrOt+AiM5ASI2+/hKQQSslJRGsT3Tp3wAOKOAg
 ncYNsgbnYYs17Bd7WsDzatqDIf9ey7rqeWwWOTdWtjhTov4KcFVMDQNHOLieXjk1
 GjFgOvQ6KO1CqIiYvI9j1MOVEchtGCJxUfu2/ZgCngDwq7IAEstGJTHtwKpRV/4q
 anQbwQlD4FCYV0yAUnyH6/I/qVAej9vyVIcEKHGWYGTCzYFHWXsnCxUFordeTqdC
 2FVep7oUh6OqpgrVK/nqBkAoJPBe9iuQAuhAAzZnLdAPVuApPD7tB5ZaXoziNsH4
 IDDL0EchP8o3sA==
X-ME-Sender: <xms:TEdtYPSRKu1WTCAm8V60dPXzgykU1qhiXR9X7CVRk_uWRR4AS3X3UA>
 <xme:TEdtYAx5J6cIPdcG9Edgi64YzNFoMfL4lGtk0Pgu7JrJjV3t5apPtPMBVi7dGRFKI
 9LUTh3dPoLl5OI8n1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:TEdtYE2q_5jGWyCKIOxHqSWfy7daqBQyVZXyPDEdzEubhr2MskleOw>
 <xmx:TEdtYPAcvOHD9-YMHrj_GBF4lnsWZBaZrVHyjd0qvZsHSYepL3a1gg>
 <xmx:TEdtYIi2mygddJJH7hWcDRITmC19pAcBHWdAYZdFNHSbsJiyi8PAxA>
 <xmx:TEdtYEhe0QucJnqOszK1Dr0etQ_hKv8XchwmZe3iAZx7TQWX2JZE6A>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2A1ED1080063;
 Wed,  7 Apr 2021 01:46:51 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 09/10] hw/block/nvme: fix assert crash in
 nvme_subsys_ns
Date: Wed,  7 Apr 2021 07:46:34 +0200
Message-Id: <20210407054635.189440-10-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407054635.189440-1-its@irrelevant.dk>
References: <20210407054635.189440-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_subsys_ns() is used in contexts where the namespace identifier is
taken from an untrusted source. Commit 3921756dee6d ("hw/block/nvme:
assert namespaces array indices") tried to guard against this by
introducing an assert on the namespace identifier.

This is wrong since it is perfectly valid to call the function with an
invalid namespace identifier and like nvme_ns(), nvme_subsys_ns() should
simply return NULL.

Fixes: 3921756dee6d ("hw/block/nvme: assert namespaces array indices")
Fixes: 94d8d6d16781 ("hw/block/nvme: support allocated namespace type")
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-subsys.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 24132edd005c..1cbcad9be23e 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -49,12 +49,10 @@ static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
 static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
         uint32_t nsid)
 {
-    if (!subsys) {
+    if (!subsys || !nsid || nsid > NVME_MAX_NAMESPACES) {
         return NULL;
     }
 
-    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
-
     return subsys->namespaces[nsid];
 }
 
-- 
2.31.1


