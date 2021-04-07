Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DBA3563B4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 08:07:37 +0200 (CEST)
Received: from localhost ([::1]:35180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU1Lk-00042x-QJ
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 02:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11k-0002GN-Af; Wed, 07 Apr 2021 01:46:56 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11i-00058U-Px; Wed, 07 Apr 2021 01:46:56 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 101295C00EC;
 Wed,  7 Apr 2021 01:46:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 07 Apr 2021 01:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=wP0e4oiBcmbpZ
 2/CJUbzOJTfvUrQHGu1I7DHqbyh2sQ=; b=Kf+6ftevwQJaggnGgebt/KNyv7tfF
 0Mi+dViLhy3cVev6wnEUsLuQXupVICA6CAeexeQd9hwHxEZLH3+LVONxMDvO8f+a
 rDdD9zK1MDTO/V6XuMByBdrC3iXOnb3krxwtPxPvtb1wY5uCNEiFOYFlon/ZHDyb
 UQkq+f3c6dt17yJs5U00burzqN87WPtWse8BNqXx446ombeFc3CG4qPAS0D1+hJF
 9i3dmlStKiiSbKoX9AhzbMYOaXDHIvh9YAuEBsZWpLKnI9N0UWiSuU7q6a7z3v+3
 oPo5MzfYsUly24pZL1qSjqAq7x61/M0xtK8vgp6aVgsL6vtbhdQV597UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wP0e4oiBcmbpZ2/CJUbzOJTfvUrQHGu1I7DHqbyh2sQ=; b=OHhCQvME
 Hryu9OzIIY+SAG+RDoFgx7UTW7EMDT9U5mQ+qDl4lWzfLDXcve30XcF+L+xTf4AR
 qbo8ocJuYgTf4fm78UbIgDF/T5iAYaAcnCpEQ51s3992+NW6JgCpjWXp3JeAWU4s
 1bemaiEonZVhq6YkRYVG1MOELNQN9F0fD7O7iHbpi8bEfwq7xU6BkPtwLWQp7CqA
 /rCURL4gkzJ47ba3me18S+ImigknPfUjN++T3L/amN0twZ0TpvjVyXsUpvPGX4je
 WjJgdS0Xoo4BdsvL9kfyysvNvFnqb3i75NoXeIUYapHAoIvE9ncf4IqW4BKC5WYl
 XiIffbU8243xpQ==
X-ME-Sender: <xms:TUdtYLaRk6tABQPCCSG1Dnr_R7PFt00BPVBFHSjTAeRUlJeZeMMurg>
 <xme:TUdtYKUP_DKlGMx6S1pyzfXdQQ-JJT3yT0RfWmwI_N5TITLrKc1BTu8MR7jhgkWGp
 Q3HURiQsKH_ELOohp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:TUdtYK3coU74qB5D9tyJYRgX0sx1BM-X1HRuASlFmtux3nhz87s6Rg>
 <xmx:TUdtYJZQVR5efM24ggIP_7SVtk5PStwV3WiBaAsq2E9byHBCjUGH4A>
 <xmx:TUdtYFodAf525tN9pqYK8e9o6a03qoyLP0GL8qxBEBZU9WKhSMq5EA>
 <xmx:TkdtYFeS10JPV4k39Qy-KK7zfVLToxgJ2t4sr65dbxbFXjlDrLjhcQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9F5BE1080063;
 Wed,  7 Apr 2021 01:46:52 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 10/10] hw/block/nvme: fix out-of-bounds read in
 nvme_subsys_ctrl
Date: Wed,  7 Apr 2021 07:46:35 +0200
Message-Id: <20210407054635.189440-11-its@irrelevant.dk>
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

nvme_subsys_ctrl() is used in contexts where the given controller
identifier is from an untrusted source. Like its friends nvme_ns() and
nvme_subsys_ns(), nvme_subsys_ctrl() should just return NULL if an
invalid identifier is given.

Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment command")
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-subsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 1cbcad9be23e..7d7ef5f7f12b 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -36,7 +36,7 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
 static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
         uint32_t cntlid)
 {
-    if (!subsys) {
+    if (!subsys || cntlid >= NVME_SUBSYS_MAX_CTRLS) {
         return NULL;
     }
 
-- 
2.31.1


