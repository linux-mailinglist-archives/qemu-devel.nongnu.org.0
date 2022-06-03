Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848B953D295
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:03:20 +0200 (CEST)
Received: from localhost ([::1]:45344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDVv-0006ha-KS
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDN9-0005sS-0m; Fri, 03 Jun 2022 15:54:16 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDN6-00088T-Ta; Fri, 03 Jun 2022 15:54:14 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D1D643200942;
 Fri,  3 Jun 2022 15:54:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 03 Jun 2022 15:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286049; x=
 1654372449; bh=Kb3lidWMLOT9NiWINfui1YYXH/mZrDt8OXR1JE6uz0k=; b=G
 4BuNgujxtxCeh99NWQrmteumAEJLQOp5wqSEZx6JQZyorbjck/G6W8Ht8fLaBo1V
 A+VkoP0/TLASzzgKJIXzbj0Alb1De9PaAd411bc4TPRoTGoQAI95+Ru2hmyWo39u
 kzUbmqgQWoyh/evB8/Hwo5clhSAkcyGwFnWAqer9mbaRTwsFuNXxbuCNufH5tzZD
 MLvPdi9eqnUDyKviu50UOusfeSbPxE25BltjUQoVMGSoCgHntxGDNeSa5/1OEmb2
 5pNsPNv4xETmklez7g1rBs+YhXLgj46QKo+3O+XaYhEggyFyHkjtzv7p9e7h8sI7
 pV981MvbS7ayU5tkIrJ+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654286049; x=1654372449; bh=Kb3lidWMLOT9N
 iWINfui1YYXH/mZrDt8OXR1JE6uz0k=; b=D+qGmMlEXuMlKHlp7awEprbzR7azD
 Ib5PKtci3U4Iz11WJyJ973gZ3D2gEWtYyazxawHAyWR4ER88mc/Fswd7cac4Q3da
 lS5kYiuruUxtQEe+wkPHLYoLTbTqH+BM3T51/w/IQqRtJmcsJFl7MNIWbNZ1dGhf
 5yO5Uv4+ymbbh+L4mg8ONVIFbykmfcBSs/l1lIhSTVxA+3QWjlsep9RNf0ST4zmd
 kn7pJyrjDAe6LWWknkw1n6iB0F4L6sJN1nykcMiHmIKZxgrHw/Dgd1n0Ytb56wpP
 DSxtkUf8oT437FqiAcJ72TQ1vgOJ9RdYJ5vVjYDcW+mVaU2b4FV8+YAiA==
X-ME-Sender: <xms:4WaaYgkxiHjpOUlT9hF01BBEcdM1GuKIp_6rE_4xxMQPWf-HWlXjOg>
 <xme:4WaaYv0STfg-lhcmdoj_-bwTnJiBzBz3IPdQpGeqhqBPwEP9W9dJB0fbKx_aazvTy
 i3c2F8mUOxH5mSkWoY>
X-ME-Received: <xmr:4WaaYuq7fNaYOEVYAQ1VAV5XtIn8y9iXXlWZhEI2Yi2cxkc9chHBijdQRPHPKMvg9sR1eCNW7jQFMxASYduF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:4WaaYsmqi9BtXGMltPxJ2Tzr6Mldl5oELz9-sMnqoOeoUAkjT4xPIw>
 <xmx:4WaaYu0ReEIgeUCqLXZ5fEkFVLYjXWKjUqdrk1HPS2kkQKsbcRxiGQ>
 <xmx:4WaaYjssnbpEgPjU5N4HaKJ4me832VikOGRiMNC7zpQ12nZyofVRhQ>
 <xmx:4WaaYoPZBQJFCvMDk1vfC3-ZhsRmN015xXXXf07vrP9njrfzBPK8HA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:06 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Dmitry Tikhov <d.tihov@yadro.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 02/11] hw/nvme: add missing return statement
Date: Fri,  3 Jun 2022 21:53:45 +0200
Message-Id: <20220603195354.705516-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
References: <20220603195354.705516-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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

From: Dmitry Tikhov <d.tihov@yadro.com>

Since there is no return after nvme_dsm_cb invocation, metadata
associated with non-zero block range is currently zeroed. Also this
behaviour leads to segfault since we schedule iocb->bh two times.
First when entering nvme_dsm_cb with iocb->idx == iocb->nr and
second because of missing return on call stack unwinding by calling
blk_aio_pwrite_zeroes and subsequent nvme_dsm_cb callback.

Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae8c..74540a03d518 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2372,6 +2372,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
         }
 
         nvme_dsm_cb(iocb, 0);
+        return;
     }
 
     iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns, slba),
-- 
2.36.1


