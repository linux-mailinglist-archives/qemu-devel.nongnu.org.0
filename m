Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1A9615DA3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:26:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq94n-0005RO-7m; Wed, 02 Nov 2022 04:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq94W-0005Ms-PT; Wed, 02 Nov 2022 04:26:05 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oq94V-000421-BS; Wed, 02 Nov 2022 04:26:04 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 499535C00D0;
 Wed,  2 Nov 2022 04:26:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 02 Nov 2022 04:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667377562; x=
 1667463962; bh=kXbI5hL5nXdXyQVBYicibcnn8RL5ibO8tf1EAJYNEzU=; b=D
 Z7P+HroAa0/eT62gZAz/dsPI6VG6PtnuuNnWjwAK0lWG9mfT8Ly5G+JqQc0eVNpK
 1lZtV7suwRMStOZ5Qm6afpzfunHAHeIYeHotGYVRTH3wQTIoIWzxQFr2S6bxFaHw
 TCqwKKbtK+ELRVrXiNpBd2hrjHKyehM3pqoatEAVggVWtHASEYB5j29kKq8/8sxu
 d6NZ7VVEnhyMKwQ/r+uU/5HPCvON5CAk2gRxPTqhW4cmqEevuDhLArfIMqvpGCqg
 W33BzJ5NK4jCazz7NxcsJQLQiimqIkBnPX7xze9W44XR9STR7PsfL+wLb4WBYqlN
 hCSZqssH2G3rMeepejWyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667377562; x=1667463962; bh=kXbI5hL5nXdXy
 QVBYicibcnn8RL5ibO8tf1EAJYNEzU=; b=Q26LgOBoHcF7qXBpXGwyBcA7laaEG
 TQEXF2/X0OAsku0EZPqDqWTFKGrBgsednZmwXuUNbcYbrLimlo0e1Sgu46cklMfp
 R3Mt0QJvfnwLITcdFQ3PiQIEmxTKlstNP1IRNQI+UEt8hl/XClbTB7PcAtodmVp3
 5RAjMGyUZMTKo1gHceDrhVjBzsEPs9b+jI9rtmoENo7l5IueHFirFobAtRQj1X4g
 L70lSaO4dSIpQ7IK+HpFswtm40LrIbVAplAJtwl7iLpF2LpMmTv88ZBLtaZARoHg
 0BwXSNGRAypf9SCS+i7aXzZYlPLvWV4o4FOx+eUQJ7cmIrjdEcxTj981g==
X-ME-Sender: <xms:miliYw0OZcpYCjhhEZ82UUbZ9w6jnFZE6pDgWHtuWw14aRuipwdeUw>
 <xme:miliY7HFmHnfM61YjHp0mF7hwGgxLZIFMmB1JzMRa2Gd-RXMmhMKUgXXQphTnpdTk
 J-v3esXsWMZSNvOsrc>
X-ME-Received: <xmr:miliY46KNbzXwvfxT7yF87jqljwVeiiMi-NUVpFpDQvLlmnWE3QXj2DMNeki47NI5YdAXCJe5kk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudeigdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:miliY53-EmEDkSXd6MFhEKppvo7UjwN8CEyjE3D7URYra0OAH_o8Qg>
 <xmx:miliYzE714AXTwmSXljVGQ3G8y2vJvSKyozajelImx40jo0Z4e2jtQ>
 <xmx:miliYy_W5MoNPQbqZ-hxFBD4eF-xTZKxdfqapQd7ocdaEwHfI41PIg>
 <xmx:miliY0O9cQfB5ZOd6ydUWX0FnKIz-ZGCacDL22RTsDO3n4Zcv2v8bg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 04:26:00 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>,
 Francis Pravin Antony Michael Raj <francis.michael@solidigm.com>,
 Jonathan Derrick <jonathan.derrick@solidigm.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 2/2] hw/nvme: Abort copy command when format is one while pif
Date: Wed,  2 Nov 2022 09:25:55 +0100
Message-Id: <20221102082555.65165-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102082555.65165-1-its@irrelevant.dk>
References: <20221102082555.65165-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=k.jensen@samsung.com;
 h=from:subject; bh=GOvASwWr+G6JI09NpDm9zia+zi2/5vTTh/bnzxiCokQ=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNiKZPXTlLhkGXVNY+7+BvDiy1nlKyMeeaARmie
 jfzfT5MV+IkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjYimTAAoJEE3hrzFtTw3pcJ
 oH/iCEpI3zacWzK1B177bDbb5qLWSmmB7rb0i1GLmpvbLf993NSiM+Q0TMjenc9neUKVy77deK2T/9
 G6lVzSxlgfHoLGDtgMyA6Jf8atkAGtJbvKdiEbQumzaRr0y8rplPFDhqk6lHoNODoZ6kromxW64eNy
 uuPBe9AiiBqpoJ+EqNt8fgIdE/g1x+ABSLdIvmJuyL6LEUkMzWRiM8zTb4jHfx+BnFsnS/ThRgoIaN
 INpc3zaXf4Fta+0hvS7QVhSXJrPEQzlrad7gKaRu6A53Uo90D2JPCk0UcFd/mTR2x1Gn9/uMvRvk4k
 G581KuuAQdUoQpHred+WK3gEfuWaLdnCBpja/g
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Francis Pravin Antony Michael Raj <francis.michael@solidigm.com>

As per the NVMe Command Set specification Section 3.2.2, if

  i)  The namespace is formatted to use 16b Guard Protection
      Information (i.e., pif = 0) and
  ii) The Descriptor Format is not cleared to 0h

Then the copy command should be aborted with the status code of Invalid
Namespace or Format

Fixes: 44219b6029fc ("hw/nvme: 64-bit pi support")
Signed-off-by: Francis Pravin Antony Michael Raj <francis.michael@solidigm.com>
Signed-off-by: Jonathan Derrick <jonathan.derrick@solidigm.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 73c870a42996..9a9857ccf85f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3034,7 +3034,8 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    if (ns->pif && format != 0x1) {
+    if ((ns->pif == 0x0 && format != 0x0) ||
+        (ns->pif != 0x0 && format != 0x1)) {
         status = NVME_INVALID_FORMAT | NVME_DNR;
         goto invalid;
     }
-- 
2.38.1


