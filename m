Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74935464A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 19:51:03 +0200 (CEST)
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTNN-0008T5-Jd
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 13:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTT8k-0004sf-4b; Mon, 05 Apr 2021 13:35:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTT7b-00014d-PC; Mon, 05 Apr 2021 13:35:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 17A775C00D9;
 Mon,  5 Apr 2021 13:34:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=20DvQ3WH5QWQR
 0UjiWykqS7FkDOIGVYlA50nzpdE8Y4=; b=WB/z525JmpuHYVkuP+igZAjDMyJO0
 8g5ijnlCUAuUYnqpjs/Lw2Devn92skGJIRevedAA1TaRf5lRTy8/joV/aL5l9vm+
 B1d0SiKuRVDv7bEn5lMZtLucadDrwk/NKukGAJmu+L6ZNDEt7umAcqWL9biIwqHh
 O0bTzOWSGm2AGJNUP2JzIVA0uAG6/KLWDLomk1JDyhjq2PjBZFjh3Z/a71JwiAv4
 /5XQYLPydtZRGwe5xle3VIHwbk6YALTGzZcj9SGQeA+Q+0cX7/+t4Zz2oEyQU43h
 I3rYKLkUf0aORj2J46W6sxr2jeCgX/5xlBAL0KrzaRU/k+Ujf+cdleAdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=20DvQ3WH5QWQR0UjiWykqS7FkDOIGVYlA50nzpdE8Y4=; b=RwQaPIIj
 5BYhbZ65NEPH3l92u477qtIXKbbLivJXcFpqty9j3hCM7llA6p/cXxYVpGl90wJQ
 hZej0rju75w8MkdrAXm9TC/tO8SBqDZJPcZf+CTd61fLU3JnIkFGT+Dxjci1BP0z
 0x9hh4sTk/tVsNoezLoCwIcqXpFQVtcLdxoB0jDorDW9xeMUXL5QYSzaK4kcpspj
 uZGcFLoXkTZovNlicpns67IZnuE7TjuJcMDZnuxcvczDJ9Mrjko3HAIy62PLXqYK
 9DJlBEcg9XG8XLjgOh74tWJhcibyKKl3wm2JmA4s/wzXYM7oNInBx4iVVmfQntVo
 s1uHdvv6mAi4yg==
X-ME-Sender: <xms:MkprYGbRWB8ua4VySU4swc4nSki918AoBw0IL8wdf-yGXdWVSG6CrQ>
 <xme:MkprYJbo8OoMynRA1rvUP9H0evF4zgU6aE3C0RI6NIi4ypVLKq62AcxAj4U5eGKLx
 ztfw8mlS6Pn2J2cGJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:MkprYA8kMu_nSAnnQSvB4_VFp1MpiMnPKsrXlyrgSCUxcOBnHFEDAA>
 <xmx:MkprYIpAdmlPUGr-Yh7i4z1GrRJWvq0O7QlcDgcDut4Xl-nRu0PHvw>
 <xmx:MkprYBo70YykMbTQoyqFgFAKuL1-ZXbZ4sUq1ST63R_N76rzOfv9Kw>
 <xmx:M0prYCdc1XTlemzBAV1tajG-7PRcQDRB-pynVaS8d0UbmBiJwpaybQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B51781080054;
 Mon,  5 Apr 2021 13:34:40 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.0 1/2] hw/block/nvme: remove description for
 zoned.append_size_limit
Date: Mon,  5 Apr 2021 19:34:34 +0200
Message-Id: <20210405173435.36486-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405173435.36486-1-its@irrelevant.dk>
References: <20210405173435.36486-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Niklas Cassel <niklas.cassel@wdc.com>

The description was originally removed in commit 578d914b263c
("hw/block/nvme: align zoned.zasl with mdts") together with the removal
of the zoned.append_size_limit parameter itself.

However, it was (most likely accidentally), re-added in commit
f7dcd31885cb ("hw/block/nvme: add non-mdts command size limit for verify").

Remove the description again, since the parameter it describes,
zoned.append_size_limit, no longer exists.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index c54ec3c9523c..08c204d46c43 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -91,14 +91,6 @@
  *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.e.
  *   defaulting to the value of `mdts`).
  *
- * - `zoned.append_size_limit`
- *   The maximum I/O size in bytes that is allowed in Zone Append command.
- *   The default is 128KiB. Since internally this this value is maintained as
- *   ZASL = log2(<maximum append size> / <page size>), some values assigned
- *   to this property may be rounded down and result in a lower maximum ZA
- *   data size being in effect. By setting this property to 0, users can make
- *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
- *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `subsys`
-- 
2.31.1


