Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B4558AAF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 23:25:24 +0200 (CEST)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4UKJ-000841-JT
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 17:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UE1-0006Wo-TH; Thu, 23 Jun 2022 17:18:53 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o4UE0-00046o-7l; Thu, 23 Jun 2022 17:18:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4F6FA320091E;
 Thu, 23 Jun 2022 17:18:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 23 Jun 2022 17:18:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1656019129; x=
 1656105529; bh=Uw4Beh3GJ2Y977GWAS5ev7RKpWmRWIWeTXSBJIX0XOg=; b=g
 A2jnaZi0+0z3wJKL8FDdNV3OAqG8hY5iItXfj1a+b0iWiKX+zWqvyAUw2neEFttW
 nXhlJg7LGDF5hEwgfDtCpw1Y5KhtVOrUZ9E707U7k8qU4dlMxuFFpXxUY4Oil6Et
 0Yx+11BvStoywfxlqHT3P8Jcfgb6IiHv5t9PlJ3jkB9jmixw2dszgy0BLpblQCub
 9KbxE2Sf3gJj9SEy5Wnm03uHfVsFwbB44YdpQLNXpIIDWbrsLNeyv45R3/rM1Bra
 zXj1KUFWQw4uLUIBpYkOg1slKE/8+mrWKH43OMz613Wn7mXvkBXwSc/pPytGsmrV
 XpzW+WmuZbYxcjJHxtO3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656019129; x=1656105529; bh=Uw4Beh3GJ2Y97
 7GWAS5ev7RKpWmRWIWeTXSBJIX0XOg=; b=hV6ljQLvdKgB5+YcQXO9se7X2un6m
 NMhiLje3dqYChdR/u0c1j9fkM1CaNnUvTZEBADvYTUXyd6kM19J5HE8JGGSxXsWi
 ikPAQIUlF26Ps5XdkAOL5WL4KdgEfHciTgFW77gXaF1Ze3wMtbZoOfPQrOEgSDUr
 nW43T5+PQSe+MmLzdHBgYh9sVX5dX7IHSCUnYt4SSk3sF8RSAtU4oi2cDGdNa0f2
 meRiYEZwjQKjPRQzRVEFWu4LP7G6SwMLIGfFbepv/FvDS1toCTXZ85kHu3aqfNA7
 xF/0TmWaeSiDUY380utC6GfcszQ6cloueVSxOKQxe9hiEXLALeG9MtXVw==
X-ME-Sender: <xms:udi0YmpBJKZn9mqgpNUcdT-eKkMR3hlj2mSMnoNBPdwpBnygRR5bzg>
 <xme:udi0Ykoy49Edy3yh8LZcEuB5kmfHAIpPiv3DsVRyI1NWRKo87FR8xYw9fnonsafCV
 BmD4Mp-KU6iKsqNV3k>
X-ME-Received: <xmr:udi0YrM9g_w0YvJkMWe4N6MiPnciWLiOCZhPIVqcz7wyDqHcpX9giIzo_hOsDJj8eaqixzMqBE0fraOpu6ey>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:udi0Yl6DN81Uv9prG224SLz9Tfrwp4hJHXpqzgKosz502K1_aZ0qwA>
 <xmx:udi0Yl4nlRtmN0O9tDc7wy6rf_SLmQgp2U7_nHLXe5b4IpiFsKmU6w>
 <xmx:udi0YljTbg98tsL3bpIGoHpbUE-KydCLn1Al3ZmYL1WpBAEr_67LLQ>
 <xmx:udi0YvlL7etICMDzMyb62NWrZe85vnCnUgmYnT4vKAzzY4S1qtHGJQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jun 2022 17:18:48 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 10/12] hw/nvme: improve cancellation handling in dsm
Date: Thu, 23 Jun 2022 23:18:19 +0200
Message-Id: <20220623211821.50534-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623211821.50534-1-its@irrelevant.dk>
References: <20220623211821.50534-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

When the DSM operation is cancelled asynchronously, we set iocb->ret to
-ECANCELED. However, the callback function only checks the return value
of the completed aio, which may have completed succesfully prior to the
cancellation and thus the callback ends up continuing the dsm operation
instead of bailing out. Fix this.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 9add74753fd8..5eee730ed0cf 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2367,16 +2367,10 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     uint64_t slba;
     uint32_t nlb;
 
-    if (ret < 0) {
-        iocb->ret = ret;
+    if (ret < 0 || iocb->ret < 0 || !ns->lbaf.ms) {
         goto done;
     }
 
-    if (!ns->lbaf.ms) {
-        nvme_dsm_cb(iocb, 0);
-        return;
-    }
-
     range = &iocb->range[iocb->idx - 1];
     slba = le64_to_cpu(range->slba);
     nlb = le32_to_cpu(range->nlb);
@@ -2389,7 +2383,6 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     ret = nvme_block_status_all(ns, slba, nlb, BDRV_BLOCK_ZERO);
     if (ret) {
         if (ret < 0) {
-            iocb->ret = ret;
             goto done;
         }
 
@@ -2403,8 +2396,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
     return;
 
 done:
-    iocb->aiocb = NULL;
-    qemu_bh_schedule(iocb->bh);
+    nvme_dsm_cb(iocb, ret);
 }
 
 static void nvme_dsm_cb(void *opaque, int ret)
@@ -2420,6 +2412,8 @@ static void nvme_dsm_cb(void *opaque, int ret)
     if (ret < 0) {
         iocb->ret = ret;
         goto done;
+    } else if (iocb->ret < 0) {
+        goto done;
     }
 
 next:
-- 
2.36.1


