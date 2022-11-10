Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEFA623BC2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:25:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0ym-0000Ke-C4; Thu, 10 Nov 2022 01:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot0yY-0000Hv-RF; Thu, 10 Nov 2022 01:23:46 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot0yV-0006oM-I5; Thu, 10 Nov 2022 01:23:46 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B977F5C00C0;
 Thu, 10 Nov 2022 01:23:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Nov 2022 01:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668061418; x=1668147818; bh=FA
 pDijFXAz6JphGwU8xT8S6hjRiG+tfCHsYo3aNqUlc=; b=ofT6q9KusmXLEE+ztx
 LHESz7l4N4auggEGixfSA5JPXwDKtZJuDRRfApDljKfSZgbMoZavCn4ChqX+a0tX
 IHuA5c8f1PNwBPaFYr0dz8sgarfJpokhswkch6jiWYO4HSEMN0/w0AvRTN6czmYO
 jfMsspkMKyvx5v46xIaueVqAcKszNo6lpeTyENySGEYNeXXob5rGTSwvLZcX93tF
 9b6EU5lAtP6UPgK71000FGT7PxxyC91I+Hg6EHvE4RkyxSW6rHv039+FW/yeC48a
 yGyHUDl08UhsdwQ18N+evisAJsGulQ7IRv2jYVvQITPHcQP/BOrIlNaBugHyVNkL
 LdTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668061418; x=1668147818; bh=FApDijFXAz6Jp
 hGwU8xT8S6hjRiG+tfCHsYo3aNqUlc=; b=Uy1YHcnddbp1yxkji2IMqlNTvz3RL
 8sJqdghA0dFq7viA2fJRMYC0suyWvLEuBECJ8hcSPrvzdIp8e2Lc3Qs9nf9/LYfL
 5zsR0nQ4E14QZF+DSC0loT+IZa9DMv6p9hg6FV7f/AMCINi1YBmdIiYVmuGdc1te
 lGlEMuDSqAs3Kc+V1eGHNEHuCb75/NdNru0oLidncuG4a99cKE46NvMxUbHE0I4U
 U+ho3RygQ3OxfqL7GS+QI6AAJrwS1Gk671xclA8s+EEkZENWx8U90PMcuXfm1193
 J2CXFWvysA5X7ogMEZ5GIGpi9mDQp5XbvRZaegBYJ89wow82HLYsSpipw==
X-ME-Sender: <xms:6phsYyGYXGVJwgoqFLPXfRdyTdlbmt_qQTNl-T-dwZr45LRjLEuv0w>
 <xme:6phsYzWIfH3Tbf-W0XhOar2dLDmxrDwS0U4qdCkyWR6fHKUFucDC3Ty3KhuLyYqs1
 omv_CZpFBwA3e9C510>
X-ME-Received: <xmr:6phsY8L0oc6GgGKHhvrjFiGlch1X5PavApyQ41H046JynVUHJgBOhUOoGf7mq-S1WWyjI4YVtGqq6Z--jMKABlnCMBah4PAnNKSXwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepudekvdfgueejvdfgvdefffffhfehiedtieejkeelfedvhfegvddvtdefueekgfeu
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:6phsY8HulqBGfaIkjdnEuTZCtqudRTg35I-rBcw_T94fDb_54lygMw>
 <xmx:6phsY4XS9K4r-FwaoqhahUloGoBMeqRqiwdCBGWGVRBNTBOtEMtGYg>
 <xmx:6phsY_O841wZJG34HObeh_si5vXhIvHrnrCI3ZPzvSa2CFPQj-wheA>
 <xmx:6phsY_StfY3G8bwjlf64bw2txBeoaSMCxfIbRWoXHpkh_VeRpVewGw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 01:23:36 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 0/2] hw/nvme: errp fixes
Date: Thu, 10 Nov 2022 07:23:33 +0100
Message-Id: <20221110062335.18401-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=304; i=k.jensen@samsung.com;
 h=from:subject; bh=F3nlHPkosQL8t1HCWUwlzeqWy3sHX9ulnC+084+5Y9I=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsmOYppN6iLUa6KgRvAk1lpgEDFIWyIQmwQWnB
 OvSP0e6ZP4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbJjmAAoJEE3hrzFtTw3pOI
 AH/0e/FEiVPMDlY1lVAv21SqRvDtYzxY8Xl8TqPa1UTgOU2+1aDpGL+jmW1Yi2cI0x3uFGGG2yfcHz
 QyNASWBY7X5hnVCB3gu4NXgHYLhPv3lioQbGuasp1uQBkEUK82ou/ivKq3ubEPfqvPwhvQXK91tzvE
 gDfsRfIgmwoXuQPov+w0s/bh7D3CJxsi14+m6NMk3SMKlauda0hQ5iKtJKbj2KLFEsY6/U8ET3qiTj
 zT/1Q4YyfJEud8XTjCi54z5qkx6e22ovED+87ar2UQWymswBapKd0itPxV4s5ksAZSRZrcoB5lGwiZ
 tav61pSE398nheeJtl8fU8C3Ne2VWoFAPGwqc3
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Fix a couple of invalid errp usages.

Klaus Jensen (2):
  hw/nvme: fix incorrect use of errp/local_err
  hw/nvme: cleanup error reporting in nvme_init_pci()

 hw/nvme/ctrl.c | 71 +++++++++++++++++++++++---------------------------
 1 file changed, 33 insertions(+), 38 deletions(-)

-- 
2.38.1


