Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8B330EE4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:10:38 +0100 (CET)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFef-0005Sl-CN
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwF-0003sp-LU; Mon, 08 Mar 2021 07:24:43 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:52331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEwE-0007Eb-2O; Mon, 08 Mar 2021 07:24:43 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id D68DEFA8;
 Mon,  8 Mar 2021 07:24:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=49i/GpGXgZkKE
 /lrgDn4OIQuxN3Fi8uTjQx7h58jORs=; b=QeV+tYShtGvyWiGt7R9ZVamxzJH0M
 4/RqYHBU4JKTQRRPXW+kygnJ3Xfgs2GUfBDdMM7Q9/0jT21IuRzLzZkBm2XOqSHh
 7x6IZw6YKF2Df6kLkKbJ1bbYTKedObYOiBZ37OjqhdJZqiZTFKWdse/y0a4tKeHD
 pAJ9fucT8XFX1Nc9QorNtpBPJ5+z50gG6pl9zPvEB+AugEm0dzIi15u0ZCpPSiJD
 qKiF4LDxHJU8OBoThmXdPRYn464zBOXO9Ya66ITpoHfyMC4DtUyBqry/3NfkkD98
 lHNBDfKh3ozckcuseneBnwvaZqYFH7RzBGq79uRHmuqK5PYiCKIPkkjGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=49i/GpGXgZkKE/lrgDn4OIQuxN3Fi8uTjQx7h58jORs=; b=EvS84m+H
 wF3VTew0Ye2m8SrrLoVmYK9Uw0cBKMU1XlqEMMPXEcwCl1gDobjO8Zzw8iPCLsAI
 VCIGw5TnR9Q67lKTRf6fiAnfWc/jMZlHFJ02Ckel6nvDKsLjvoIyTZJ4akdm6FSO
 YH3XxWYi06Uje87cXL/xmopUGxUT5sPXRfn22EMnPyF5XWWPifnAhbET2f29Psye
 czThlqDS//V7cQW52MCPSgcPkFSXY7g2DmzHAh0qPznkopkVwI7GNgJRtJEO5m1o
 EaH2XA0wjAWExk37oN7wZNke4dpV7aHZvr0+TX8Uco/SapwWsQStIiyXdUOnj7R5
 Ch3uN/HYK6ckjw==
X-ME-Sender: <xms:ZhdGYIHQ3DydPmFQJ9sME0txd8bZxizURAjOxCI6-yVmXEIsPR4gcQ>
 <xme:ZhdGYBXJOqraCsKIjdkAG8LIVs00qU7ZjmM7FYKag18nI8lBMrIsCvYP-Lgj_jBz5
 P_OXt1uxyy8UDdFKwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvje
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZhdGYCLUbNi53p0TkG3vLSvZfc1xhaYa6bOyMwnjo2pUXOkKS5yNIw>
 <xmx:ZhdGYKFKKD3g7KT3uYMPeM1svuEdvFNFHXkoNNHvwWwfhUtzyg9aNA>
 <xmx:ZhdGYOUw5OPXkoDNeIY094NRliwNuz_Jbpx1WevG0fn9Ejnd4hTrOQ>
 <xmx:ZhdGYCoJYeSzs3MUd3XHIwhZWLi2YH05aCc6YGn39LraVkJuzQADeLB3Kus>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 076851080068;
 Mon,  8 Mar 2021 07:24:04 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 32/38] hw/block/nvme: fix namespaces array to 1-based
Date: Mon,  8 Mar 2021 13:23:07 +0100
Message-Id: <20210308122313.286938-33-its@irrelevant.dk>
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

From: Minwoo Im <minwoo.im.dev@gmail.com>

subsys->namespaces array used to be sized to NVME_SUBSYS_MAX_NAMESPACES.
But subsys->namespaces are being accessed with 1-based namespace id
which means the very first array entry will always be empty(NULL).

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 890d118117dc..574774390c4c 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -24,7 +24,7 @@ typedef struct NvmeSubsystem {
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
     /* Allocated namespaces for this subsystem */
-    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
+    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES + 1];
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
-- 
2.30.1


