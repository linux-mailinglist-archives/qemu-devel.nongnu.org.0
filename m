Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8076DE475
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 21:06:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmJIa-0005Eg-Rz; Tue, 11 Apr 2023 15:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmJIX-0005D4-L2; Tue, 11 Apr 2023 15:04:57 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmJIV-0006xg-Tv; Tue, 11 Apr 2023 15:04:57 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BD6235C014E;
 Tue, 11 Apr 2023 15:04:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 11 Apr 2023 15:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681239891; x=
 1681326291; bh=i4A0tlvdiHGpLXvBackwrbmgdRwK38qrWAo3IaK+wy4=; b=I
 JkSPDK+NGvulOjeSnQeZJpRPlpe2POK1vqHPBy6v5OyJ83Cp268lXr6n+XA43VQJ
 I0M0RYAR1JGonCE+0DlLFVg/YdzzUzIAb4w9FQp8aRynbtJ/McFB+Hrg/mGNKF2S
 iEpNk91143ySIz05E8PBCwXTy1EHOlKF5eQPPxsqM4JWFxziv5X9dENij2ZEXmEV
 z+jsjb2Zy3oFCAAT9rZR8mFlroWt7WV4DB/9ttzoQBkxpSGtoAoNRe4fuwYk5Pm1
 gtd0D4UadcemhXMSKw3gDdUT1bl2eW6LTxiSDPqGdcL5mcc33WLB1pGk0MrIfp5P
 SlvKsDFeWk1VRD6UVi/dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1681239891; x=1681326291; bh=i
 4A0tlvdiHGpLXvBackwrbmgdRwK38qrWAo3IaK+wy4=; b=IF7cY8TwD1byIqFif
 +c2zpxVmZM1AjjCKA2ks7Nskm/zuHB5YQw/CX4pMBHfu3nIF5oHwn/TJbwQvM/ml
 xePWPZROHjJHOqMSJRh6AwN/qsmr0AQSA2KC5r3RDsFnOFy9jvEkbtj5KdubFjjO
 pExP4EG3r6nFOMZY3dtnY37OG8HFRCHwEfE8QksdEh2OYtCqd0lHhfkGLiqQEpI9
 lb4nMlvgeKyDj7oYcwiSImM3kbQKxOxMS2MQeJ3OEsvGFevPrt3lD/haT7x9yQ7i
 uxYLoOy4xwYTAy6TdgwbQAsGhU1bqPW5/9izmzJuvJdpvmIk1fMk4oxsxFm7NkH7
 aFPfA==
X-ME-Sender: <xms:Uq81ZC9PpS7fdeUpbn-GdL5MrwiAbPgeNu4_Dj0SYpImluvMOGs6Mg>
 <xme:Uq81ZCsN0Wr7DOEG7QcMIf3dcvm3X974c_xBMHeOnFQJ6zIc0Wv6b5aQEYIiAWhsk
 ySVfifS68aAhOfCQsE>
X-ME-Received: <xmr:Uq81ZICV27GP9POIrS60jLOT4wWa1Nq5qNA1Cwho1XQJlJ2WzMXQISiA6drTJMKTgDFIs6YOKmO8A9Y7nHvmW6nBflFLoip7ZNrK-eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepudekvdfgueejvdfgvdefffffhfehiedtieejkeelfedvhfegvddvtdefueek
 gfeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:U681ZKcTsxkpwAz0PZtQJjAULYscAeIGxv6icFA4nneMTCQmBEfYTg>
 <xmx:U681ZHMsHwF56We4CjOtfaK-L_ubjn-RbRR3GmRzwcbvJ4kNVi45mg>
 <xmx:U681ZEnbH7Hjd2d4PPeWiHkBm3uNbygzoKvJqrSvqT6X3QbyrZmI4Q>
 <xmx:U681ZMoMggC1FsK-VLhWI9XCMgUDAbJ8MPj8qfGsxDWsKO1Nt9_nHQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 15:04:49 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 0/2] hw/nvme: coverity fixes
Date: Tue, 11 Apr 2023 21:04:46 +0200
Message-Id: <20230411190448.64863-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=291; i=k.jensen@samsung.com;
 h=from:subject; bh=O3c1451mB5C25AsU6S0hCLtwJsddrLie0ZQm75Ch0XA=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQ1r083j9Cx9LRac5rowcVukhOlQ7hpsvFRl
 EIIq2oMkBLNrIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkNa9PAAoJEE3hrzFt
 Tw3pOXAH/3H58G5Qj0zgOKNFDyYRQEvC3pmavqZZoj8Uqf/WiBYTnO1CuzGCno1DDwStV+7dhyF
 Du0U2RNaWO8Rlkv0RW80OMxbOb0kYbfLDq3v5grESEh7Go6d9/vl0wnbrlwBy+cXyriWxuwTl+9
 oKfNxAc5zzoDJdaba4e3rlnXGWfbU9jTy7kZVP6WL/OnipblXUYEiVPzK2DW07bh2YF2KiUhXBm
 S56bnYHJ6tbtWWZtWvSK3WmB163KmZ9O3+p5WV9/q0d0wODhyHSfIx38zw/6GYeLJF3TloSjR+g
 17YuN4w8rqf8VgJb4yg7dXdXsDG3KwjIhRmAvUzgzEscQzodmPzUrqak
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Fix two issues reported by Coverity (CID 1507979 and 1508281).

Klaus Jensen (2):
  hw/nvme: fix memory leak in fdp ruhid parsing
  hw/nvme: fix memory leak in nvme_dsm

 hw/nvme/ctrl.c | 3 +++
 hw/nvme/ns.c   | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.39.2


