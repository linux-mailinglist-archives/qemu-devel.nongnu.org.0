Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9E583AAC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 10:52:10 +0200 (CEST)
Received: from localhost ([::1]:56796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGzFZ-0002UH-La
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 04:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGypn-0006l8-6E; Thu, 28 Jul 2022 04:25:32 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:33827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGypl-000568-0o; Thu, 28 Jul 2022 04:25:30 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 42EF35C00B1;
 Thu, 28 Jul 2022 04:25:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 28 Jul 2022 04:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1658996727; x=
 1659083127; bh=cNoN8LNT9AHPwJ3o1o7zjURXDf9IvCRTtK/qRAs5ixg=; b=D
 UHyLrViIY0DDzzvwl6UVDUa3rC6GD9avBXDF8YyuYIxOh5CykCJbkbHUnNoro9+A
 usXSuxULDSg5TN/8tS1IRAfW2/vogcvYsqe813JHVk2sIKgeG1embzx8hs6Q5GHx
 zuI8zvnW9SLFgXCERIlRO99LGtpW6NQV6h+wVm9V8mHccPBkODo4KLSoakHnL5ht
 vslfxl+oERn800urCMdEee7hZSOl40wzofpYkjwRyB9DAlj+poh0o/snie3CsTWf
 xeae572Ig+2o5YDZRLTou0kpYD9bkM0tNsfFTAOaGsnTD7Qcsm8AX3eu0G10fgvA
 c4DR/6nnK/H12/flblmpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1658996727; x=1659083127; bh=cNoN8LNT9AHPw
 J3o1o7zjURXDf9IvCRTtK/qRAs5ixg=; b=ujVAilo1sTX9FYt2sR2Y3xnsGkLTI
 tU43j8I+W2imLfL7J0zXALYoDh2r7xzKVdyQAE8aKKZCjVvlBALGPRTKB2wv6xLZ
 UlPANcdorvJjmOH3A+ZNbMSSzaDetA4lyctp9uT8vI5RJXQd9VRQ8qvLkH0VAt/q
 yme31WhyMiranTYe/hAc3Fx6GgDVZEtiHEoo07aR5XgwkorA4+ybbkJlB6o8l4BM
 xZDe0x2VDzio3Oxb1YgGLx3qhUvQ2u17NSidGKOe4rM+SgmuO7LGeZojBymmj8sY
 upKRvxhb74AgY9F75r28y5sXPUoQShPVkwD6kMXiClwAtXdjxNj2N1ayQ==
X-ME-Sender: <xms:90fiYqK_Ry9eUITWyHPJjiI4URBE7M5G_t9JUhwnzasbjWSLSknkLA>
 <xme:90fiYiJABgXU1K7z1f3JcqbWECkYHLBrjHUlv4Vzz4V-lItC7Spf6x7uWIhdF_wSF
 VMUB9gdokA7b7Bx4LI>
X-ME-Received: <xmr:90fiYqsyAFQvhazUYKQ-7rwH_1tUYcMU-dPjFzeh3uAQLsuI9bYBjgivCPAzAQznEkMAMCimfoGyinfvPQP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddufedgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:90fiYvagIjZZlaFgsHyayEbrFXS9GkuL3uzQN8tQBr7Tf036ubxkfw>
 <xmx:90fiYhZRZxzNh8JXdDpBZp-odNVEIhTGSbRwkC6Y7Hp5t4vQsZkX9Q>
 <xmx:90fiYrDmBUC1whsAuu_GyGpE_LKChB95q8kp3BAIxBVkCzCjkqRUVQ>
 <xmx:90fiYgUSn5Ji92545MFzQgOcoFGnLNdFMDFG2WU54fQSNaqMsDOOSQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 04:25:25 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.1 1/3] hw/nvme: skip queue processing if notifier is
 cleared
Date: Thu, 28 Jul 2022 10:25:20 +0200
Message-Id: <20220728082522.3161739-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728082522.3161739-1-its@irrelevant.dk>
References: <20220728082522.3161739-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

While it is safe to process the queues when they are empty, skip it if
the event notifier callback was invoked spuriously.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 533ad14e7a61..8aa73b048d51 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4238,7 +4238,9 @@ static void nvme_cq_notifier(EventNotifier *e)
     NvmeCQueue *cq = container_of(e, NvmeCQueue, notifier);
     NvmeCtrl *n = cq->ctrl;
 
-    event_notifier_test_and_clear(&cq->notifier);
+    if (!event_notifier_test_and_clear(e)) {
+        return;
+    }
 
     nvme_update_cq_head(cq);
 
@@ -4275,7 +4277,9 @@ static void nvme_sq_notifier(EventNotifier *e)
 {
     NvmeSQueue *sq = container_of(e, NvmeSQueue, notifier);
 
-    event_notifier_test_and_clear(&sq->notifier);
+    if (!event_notifier_test_and_clear(e)) {
+        return;
+    }
 
     nvme_process_sq(sq);
 }
-- 
2.36.1


