Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D1F40B969
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:46:15 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQFJm-0001bI-8G
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBx-0005fl-IA; Tue, 14 Sep 2021 16:38:09 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:55093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQFBs-0004nL-Cq; Tue, 14 Sep 2021 16:38:05 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 0705D32009FF;
 Tue, 14 Sep 2021 16:38:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 14 Sep 2021 16:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=38nnrBM97XPIY
 VmHe5MfH0sS2KBUeMhYG5oVjJyrNKc=; b=LjLMtNnkSyCMa8LzgPc19hOBztOdk
 GSjuOg2XNy9iRcNERNed1vm08D4yOcfC7WdIx2g2t3YkELDNSy107QETJ73Bqb0H
 2yw8dS7VrweWfEkmMcC78ViuI7NEguhrtv+yWx0QbEuUZ04w3cLfzFfktFop2Uir
 JezjdhV57S5qk1AhWoK4lgoirdQUY6NWWjwAsd+cfi9U4mBI1SqNGvtEU6mrI2go
 l1bPraM5w+Jv1oeNvei1Q+KQ6ZSX06Lm1h5yyxlquQP7q7CO5QgNrWb3fYoQu0nm
 ZPi4aKuRn5rwWVFzdDru0zsdjvX+wKiAcO3pIfwxFuxS0X4vdWkldlLAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=38nnrBM97XPIYVmHe5MfH0sS2KBUeMhYG5oVjJyrNKc=; b=p5Ed8p2r
 /147Yb2z48NRNTzHbdPjfN/tRuy6n38RxQnG5ljpJ4vYQDl/xzvCIRo7wfsID6H0
 5mFyHHwcXaaC0k9OyBUYE0QJhzn+cDY6SQ3xDKvTToF+nAT8l2HhBYe+wph/hKtp
 7wIMsmwuUu2PPXSUNXqRE0fxbkZxHR6VZg7BtGSDlRbz7uwYw5I892dsfkBLsUP4
 f6YgxOrEmapBwl7mGCgxbBKdaweKSucfyMFknYymL1alb+mwGZJofzNLaZX337uW
 ZUfcVz4WQ5zBsRMYSCALaaKwM8ScnDWJKLJ1foC2KtX0FTwVwGUXRI+OuL7HGN4A
 fKLElZdx/abLqA==
X-ME-Sender: <xms:KQhBYZ_S11f89CmJa8MsiKnMhW-hkANQ0urckLPBS-QrOzaNhm9GWw>
 <xme:KQhBYdujqaKdA6HTGEjbSV2RCJQ6zY5QWggNse_A7k5bYBxPVimmf8rCbIiBxKiBi
 RrPbLrKbSyxt_1-xp0>
X-ME-Received: <xmr:KQhBYXDetZpwUalJNvFP6hbmDDF3MSx9eQRUm6T9QCl1vKuCvWR0zGKxDv-WJeAyWTrjTcj1zgKcM3kvcwwo49nUXbvv2udWmMfo4iicMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudegkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:KQhBYdfBa7mSDXMacGzUtNMmTfBTgR5EbWLOlpa0c2f0Nc4JfSvCNg>
 <xmx:KQhBYeN2gCPTm70nQQQ-tr76NtBvQVLJFTQIS7D-QCR1a3DaQtNmlQ>
 <xmx:KQhBYfksrXzBcs9DFWN2VuWUNyUm9kQH-H2WyT0FE2lhHTS04XDbgA>
 <xmx:KQhBYfhCWbZCaeHz1ngbfp0ChxIHFGryzovJduPwur42O-7YduVkqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 16:38:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 06/13] nvme: add structured type for nguid
Date: Tue, 14 Sep 2021 22:37:30 +0200
Message-Id: <20210914203737.182571-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914203737.182571-1-its@irrelevant.dk>
References: <20210914203737.182571-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Markus Armbruster <armbru@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Add a structured type for NGUID.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 2bcabe561589..f41464ee19bd 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1269,6 +1269,11 @@ typedef struct QEMU_PACKED NvmeLBAFE {
 
 #define NVME_NSID_BROADCAST 0xffffffff
 
+typedef struct QEMU_PACKED NvmeNGUID {
+    uint8_t     vspexid[8];
+    uint64_t    eui;
+} NvmeNGUID;
+
 typedef struct QEMU_PACKED NvmeIdNs {
     uint64_t    nsze;
     uint64_t    ncap;
@@ -1300,7 +1305,7 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint32_t    mcl;
     uint8_t     msrc;
     uint8_t     rsvd81[23];
-    uint8_t     nguid[16];
+    NvmeNGUID   nguid;
     uint64_t    eui64;
     NvmeLBAF    lbaf[16];
     uint8_t     rsvd192[192];
-- 
2.33.0


