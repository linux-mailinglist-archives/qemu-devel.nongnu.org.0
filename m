Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03EC35637E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:51:10 +0200 (CEST)
Received: from localhost ([::1]:43398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU15p-0003lh-MY
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11Z-00028L-EW; Wed, 07 Apr 2021 01:46:45 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11W-0004zL-7q; Wed, 07 Apr 2021 01:46:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C4C75C00E1;
 Wed,  7 Apr 2021 01:46:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Apr 2021 01:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Nyr1FKlzBIy1/
 c0H4YJtakyzWIQGvyvtqYXrdVAUKHo=; b=haRFr4zjsdEqlWJFYyeBUciLkK7T8
 CqsCjldiMSphmgmTrZA0PYiITzApiYC/jIrK7TjF0cDY+9qLsIG9KXoP8yCp/go8
 CiozIuqAfIiD7MAus1kOWmdEb3EEH/jrtaOSFIJX4GQCrAqroq8o359TZBPjfwny
 oBQ58eaIkSxoyNFt5xc7bVTeWx2TP+mEoOn4DNW0eGwX7z0PVv3jDozPQKwHsLiW
 Gnw+MWTZ3mUwArB8mP3EPhlB4lqsV2aRDB0jVC46aEbKErIVhb4cGo9nHqZIcU+L
 WoJT14nA6T0eMT0FdWo3TQ8mm5h/B/EF/Tdz5T86usfB0TI80LRBZ4rjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Nyr1FKlzBIy1/c0H4YJtakyzWIQGvyvtqYXrdVAUKHo=; b=i75+q2eM
 v/7/BxUphnOeLEvUQO/IUkGIgiotht8WKSI/gIvVCg+uOGchku6L7PKkP+/mNuPs
 PIkCpgAX6A/TjKltUMdQkpW0qkW7mIWTkVlxVPUmRZSYHoe3r2TvMtPRVclenq1l
 s/JWng/Dy6wifYsj2doldf9fW1EAJAXFZjMIFYEYkw4d9sQcXdSFrgHYqRMDHo6T
 o2mP2gHpXjcV6jp5GVZJyefKwAqDKo5xs8BMp57ypeYJbQxvokSAQK/vVR74WVl1
 8iwAndv0IC+MqNRaiOBUHLrdN1oXmvHGYmZmhz7JBnfeAOORWPTQXcQ+fQOig8n+
 KrewWuqBu28zbQ==
X-ME-Sender: <xms:QEdtYPTrrKYzcXaVD1cmxJMouicxeYOK6LG930J53eA0157HgbnT3A>
 <xme:QEdtYAzLg7jHpWfU9icFKmtvHJZVzl-_XwIIjMlcvLvmrd-K0QLsWQf7l1eDYLSqD
 R_5jFrruGnNAyuiZuI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:QEdtYE2U-oZjDW4xDIAceEAIuKzpWE_dgc6UdzhCbEwiwmLU1cgRzw>
 <xmx:QEdtYPC-zVsPI50_goflMAOU0-CpMbM2MoMUF6YSfYj-DfjId3rmNw>
 <xmx:QEdtYIiwqVFCZFKlViVhr6dij5TREtRbwRKXbJx_lXRw0a2yoNcMxw>
 <xmx:QEdtYEgw5lQfh-BrBCwDivqVcOdaJKWKoHU9E5FBZ_op1safKyOo1g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28B89108005F;
 Wed,  7 Apr 2021 01:46:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 01/10] hw/block/nvme: fix pi constraint check
Date: Wed,  7 Apr 2021 07:46:26 +0200
Message-Id: <20210407054635.189440-2-its@irrelevant.dk>
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


