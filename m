Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71634330DFA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 13:35:29 +0100 (CET)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJF6d-0001IH-Fp
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 07:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEv3-0002yi-Or; Mon, 08 Mar 2021 07:23:29 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:57339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJEux-0006tG-T3; Mon, 08 Mar 2021 07:23:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8733912B6;
 Mon,  8 Mar 2021 07:23:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 07:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=wJM0I9I06P2I0
 V98zTTlkZleVFhNFr2RGgm0LhmG+sk=; b=hiAfhoKY1CdwMg/wHKlnliKgPYrgB
 UIWnYXpZKfbNRbd8TJt9jpYB7xvZ3PF7PVm3EaDRdGzFVX1u2KHxqMTcl0K+EP5O
 Rtf4ZUt+YhNOVu3/W8gTRDoPIEElQq2sJVjRYa0d26QygG8BYtmSztORgsYDzhDe
 CJ5X4/omKsMZowXpBJpwQ2xXYDPEQGYNv4j8SzoUbd3fUDbTTkWpKZ27Sq+/dsj6
 8Gq5pNEjmLbWQsWWItcsWMx9OPEr6RBrNTURR0+rv74ruvHN1cvaIBfnZD5JC4Gb
 cryUW6WjN5dgI+tPgMIQ5fmlJAqG3ls8uhNAMrcAiEhGQ3uIjqigVFw2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wJM0I9I06P2I0V98zTTlkZleVFhNFr2RGgm0LhmG+sk=; b=C19cis6s
 THGaJZWuAGkFvBKFxEfV4k5M9F5COr/AicDm6oY33Ufu1ywcfVqMmpmxjurpMwrK
 1DTtVfjcEdcfpfM+7YxTOeHl+YajHoT1jqAlUT5Jq26Kp62JVLQVSN+CroCYA+F7
 vmmNU9v5rMIYGZ6vXPMEBMPe0kyC674BTIDA6v3KmcCj61kR66HUPZNLPwQsRWHg
 bO6pBpe3NCiFPEYagFR2uY7G/Vd9VVtf51z3fZgYBRK3H9DydaFHKT3js6ycn5mX
 1APvLIg4W6TpEWkugktb5dXKUuVEm2mk3E9KnVOl+naV0Yy3Z48dVv/irZeX2a68
 ehgjnse+OqsRAQ==
X-ME-Sender: <xms:ORdGYNWrg7HjwPP6HqHvoNB9xFeF49zPpQqrDA8s9Zhm8FAaEZQ_hg>
 <xme:ORdGYNmjw0fpz9BPlzr81-5eIVsLelDzQngbM1PUoEO1IBJTt9UP2IexGoxL7VOb7
 27vGqSHd7LeNGtSgRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduvddgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ORdGYJYR7oTUZXdd5RQIf59vrcQhmqnSLrHDuzZZRNjX169XUsM3uA>
 <xmx:ORdGYAWtVQzT-S06FMk2dgzicwsu3OSLKOVblEt61jRMskQL_AL3FA>
 <xmx:ORdGYHntzEz9LGbvvyVp4DdFeyvS_GRSCGA7Zs6q_5wqAXvDnsSX_A>
 <xmx:ORdGYJ6LPAy-G3m-ZIxGWc9eHh80uJwDSqLT0n2TOr09Uz2e1DACp7ZGOwM>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A8B9B1080066;
 Mon,  8 Mar 2021 07:23:19 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/38] hw/block/nvme: add CMIC enum value for Identify
 Controller
Date: Mon,  8 Mar 2021 13:22:38 +0100
Message-Id: <20210308122313.286938-4-its@irrelevant.dk>
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

Added Controller Multi-path I/O and Namespace Sharing Capabilities
(CMIC) field to support multi-controller in the following patches.

This field is in Identify Controller data structure in [76].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 07cfc929368b..f1d3a78658eb 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1034,6 +1034,10 @@ enum NvmeIdCtrlLpa {
     NVME_LPA_EXTENDED = 1 << 2,
 };
 
+enum NvmeIdCtrlCmic {
+    NVME_CMIC_MULTI_CTRL    = 1 << 1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
-- 
2.30.1


