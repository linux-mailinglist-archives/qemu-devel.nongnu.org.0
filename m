Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44903623C57
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1db-00041K-As; Thu, 10 Nov 2022 02:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1dE-0003xF-10; Thu, 10 Nov 2022 02:05:48 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1cy-0007TU-LS; Thu, 10 Nov 2022 02:05:47 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CFA235C0136;
 Thu, 10 Nov 2022 02:05:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 02:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668063931; x=
 1668150331; bh=BzoDTzQ23eff/L/GUm5ST5aMFbm+im6scMvm7PCp1Hs=; b=b
 hY3lBATMSF6xsjhPdyCxUW2IxGofy//S8uk7G5IrhboPJx6+2Yu265qpy2A2m3Tg
 uFw3eCXVcroWwfjuamqmbfJ11Oe02SuU41L8CCGNtdWKsvUI3jB/LbXiahCkxIG5
 me/ivXZPRjPIOt8ks719MPhwbhpqs1ORx2wq2qeK6xl4HpdUsfSjyb2+WR6ELp2o
 /GVnWa3i7ni+r0KxmGkWF5piSWyzTXsprCUS55UXCt2luOzoSkCZBAWhI3g31iTa
 wt0VckBLyD7S28QzaPaciWm43IQuxYFWW71f8w69BgMviqObtYRUe12bB4p2bm1U
 nlhJVZYwoWt41MRw/3RsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668063931; x=1668150331; bh=BzoDTzQ23eff/
 L/GUm5ST5aMFbm+im6scMvm7PCp1Hs=; b=FY41xgiOMmlQuVhCaI3m1OuXxdV22
 dnrpO1qMC1FecO9wqihLWLIp63ZJWrfvKMGZSMIorjXdgMUGni/yf7w1chFq+mle
 BJVAWgc3UQ+w44bVEXd2Ze+qqk2oqOS+noV426VEkfzd2Hbgm6LVPooyUkd1FDM1
 +rORuB3JwSfz9I7yOHDm/3LHlHEJ2wWIS6dBWJZspXCj6sIehxjYaHRoOJp8Qihz
 fZLEiMjvD/hxdU/6EBYe95g7hoc8n3f6kSeJNsxTlEtCbMDKELPfT1IGYQKl9kBu
 SoGCjbqO7jVnyW5YI6kWYsUOdNC8YqdpmgwRPtyTKxuvmjbq6QcfRRzog==
X-ME-Sender: <xms:u6JsY26fgXVJ4Ap8VRHTEnCsldfKw4FfZhKhhWbM3ceaXmUlKjWDpg>
 <xme:u6JsY_7RyyJ50utWVJHLWN9LDMXYNvtZ3cNjM7Mhyn9u66f5HUppnuIUja3UTsbfE
 hGFtPeHcMEsCRcljjw>
X-ME-Received: <xmr:u6JsY1f1-sCiW0N7S282USSzCV6AVeqW9rBf1hHGkkh1GqbT_ZNh-l2Ihwu0UADCT_vT1rvB_HcsmyGAybpHDT23BixzBW6MbX2j_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:u6JsYzIMXobdnP4XoabNqNz_072GHegQfAnPTJbiIpF9e36c6uuZsg>
 <xmx:u6JsY6LhW4sMsURRhINUaCTQYJ5H-pHnG0nTGDA3gzae-F_ui0AydQ>
 <xmx:u6JsY0w6FeFnCGHwPnIdt2eYSuR8v9_4vCWCfCO6On9_Hua0W5EqgA>
 <xmx:u6JsY20dlrkrbAD24JKLqYdZk9TUpY8X5PKPXA-71J7MWWeBub4ISg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 02:05:30 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 v2 3/6] hw/nvme: fix flush cancel
Date: Thu, 10 Nov 2022 08:05:20 +0100
Message-Id: <20221110070523.36290-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110070523.36290-1-its@irrelevant.dk>
References: <20221110070523.36290-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=579; i=k.jensen@samsung.com;
 h=from:subject; bh=boLQthCSkHOwADoUmz/febG+wI6yHubBYDBggyhscBU=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsorO0jSg+B4Xn6MFe5ZwRpsbCwXHhgyYBQhn1
 XtoocIIW84kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbKKzAAoJEE3hrzFtTw3psk
 EIAL24LCWLSpF2FdLFUIMdnyLziqQS0JCuhaiG5q2uGXQ69BzG8qE/dUrK+gxEWMVHmSufythl0HJK
 zcVkqTfeQt+WodYrmZ1GIURAJwqI0jeoMKe4KUHZvQQpZJCRSZE9LqA5ZmzUHXbK8C3LHB2h8bDOvs
 PumPxGhNq3SCTu21s6vgAtMBbJYD6zeuclUFzivSAjr9qrQDo+si0YhpsiwijZ3tGBWliz5Iu9n7SU
 S0xnzyZ5FcBfm/QYZ4NmPv2TmZqfHgihP0mZwopw3wGvxatN2++3FIEphPCm0nFh6J0BFxE7T+H49d
 fNlx+JTC5TED1sqJ7PSpsvPmNKAXXd+rBAw6pQ
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Make sure that iocb->aiocb is NULL'ed when cancelling.

Fixes: 38f4ac65ac88 ("hw/nvme: reimplement flush to allow cancellation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 819c02067191..fe748fc18a2e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3176,6 +3176,7 @@ static void nvme_flush_cancel(BlockAIOCB *acb)
 
     if (iocb->aiocb) {
         blk_aio_cancel_async(iocb->aiocb);
+        iocb->aiocb = NULL;
     }
 }
 
-- 
2.38.1


