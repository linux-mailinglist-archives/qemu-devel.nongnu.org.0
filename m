Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897213546C0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 20:24:24 +0200 (CEST)
Received: from localhost ([::1]:42044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTtf-0007Lt-0H
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 14:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRY-00017R-7L; Mon, 05 Apr 2021 13:55:21 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:51623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRO-0000Lx-PT; Mon, 05 Apr 2021 13:55:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DC4895C00D8;
 Mon,  5 Apr 2021 13:55:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=pfGhU6JYYN6ji
 Mw69FGeZhnfpkGoE9B4ub/3wFnXqqo=; b=aAwXx3fiTww9vmX1VhxWelpJP57Tj
 C5vDiae/PpZfZvN/OSrBYZLhsKp8DbER4nbkHZdKvN8mLpEP5QgEGsqX+Bd5JC9N
 EC6WZzLuoxEuiRCNVo31YfvJdQR5fF0EwGTjzEUR9HuF1/iqkKEZLAok79goJIk8
 jfjwL+W6AEOyACeUSNSVxyK12U2ENbqqOLlIBabuOURrKaORxuSUeitIo9OrtryG
 syMaV7jPSPl5Zrtz3wBYxOLoUG6Fc6TUCxXZe1+qHAoYCWOGPPw4evIDw5wqDpRm
 /+f/54hFC91dDWx/grX8E3d5gaMFY66jx5dzg3EdO0LJcPA2GGGrWR4Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=pfGhU6JYYN6jiMw69FGeZhnfpkGoE9B4ub/3wFnXqqo=; b=GYHm8fvu
 ZkzXppbIThWdarsUJ0GcnZWuxIM6s1UxXQqH9x6spKJMr9yO7ikawnTl32rRguUq
 lJlKjK+zBNRaJhlyhchu8K3X14v4mTib0vP59hKkbYYd4PFq2hoqzl/RpJ6N8P2/
 NPUORLugVnrrZWc78T6dhPHmhOa3SGUuXRJPxB1SOrjYJ+kwILkWkyxKNNa4ip8m
 ThX4RD3YBMDFjI40Xr2BZRhmTq9TabRDnXKY1uZc59VPiarsw0UakLnmigDHzbKp
 dACQeJ2Gku1CaoTR6QtvvipkHCYJj+6t8NsBZWDCpZTk8fJdZp1kmq1d0+iL/pyC
 jJzaylBznXvMGA==
X-ME-Sender: <xms:_U5rYP3TMpU97_-nxkuCZ43F2mBS1c4ZYI0VJEq-OSNQ7uDt-9g0NA>
 <xme:_U5rYOGsS0wqb-upUjCn3FBUKfHThhIKipc1vRsFBJkbVF_mOGFc4qyoTPRl_BJXb
 sc57FkSn6-vuSwsZrI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepfe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:_U5rYP4ZV-42fa3IfqnP2QoadLrcvBT4NfwgZOKi843F6J72BgSIpg>
 <xmx:_U5rYE2xezsyh2DJ84SH0hSR4ho_RP_Dl6OacMIYS7e6CHbUXpgDYg>
 <xmx:_U5rYCFwNep57MgXS7oAqgYPF31xadpAjcKE0zKHTDJVLR3HFugAjw>
 <xmx:_U5rYF0x7p46HI5PFWv-ZlIVSOoL3VSedvm49FmrEeSIZtlo5SJDUg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D028C240057;
 Mon,  5 Apr 2021 13:55:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 5/8] hw/block/nvme: fix warning about legacy
 namespace configuration
Date: Mon,  5 Apr 2021 19:54:49 +0200
Message-Id: <20210405175452.37578-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405175452.37578-1-its@irrelevant.dk>
References: <20210405175452.37578-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Remove the unused BlockConf from the controller structure and fix the
constraint checking to actually check the right BlockConf and issue the
warning.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.h | 1 -
 hw/block/nvme.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index c610ab30dc5c..1570f65989a7 100644
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
index 6d31d5b17a0b..de0e726dfdd8 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -5813,7 +5813,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
         params->max_ioqpairs = params->num_queues - 1;
     }
 
-    if (n->conf.blk) {
+    if (n->namespace.blkconf.blk) {
         warn_report("drive property is deprecated; "
                     "please use an nvme-ns device instead");
     }
-- 
2.31.1


