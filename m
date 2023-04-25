Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFB6EDBB2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:37:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCHM-0004MO-O1; Tue, 25 Apr 2023 02:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prCHK-0004IK-07; Tue, 25 Apr 2023 02:35:54 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prCHH-0003Ag-3y; Tue, 25 Apr 2023 02:35:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A771A5C0076;
 Tue, 25 Apr 2023 02:35:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Apr 2023 02:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1682404545; x=
 1682490945; bh=AI+GTXTaiFUivVhWlC5rhVRFPKNc6javldPOJbFAoM0=; b=c
 8QWykGIRguYHzeVRWz9riSHJ+w/OwI19ChXBVnKcIxiaNECDOpRwTFiDnZT0U0kP
 1+NfKwc9HS07Pyjzrsuwx02TJHiIjbsoOAvUAtd8np90ZLRA9wVV2FmBmY+o0fpY
 kQKhHI04FoUsIgrSV6jsPPTrxFjE1JbkJX4XL6uaUDEVsUbpa7lXKwamzCjSAA18
 gjOmbUCQgZLLazkq3TKsBzf/SG184UZMHylUpZkwaAoE/+/tUVCJL+tdGwEP4pNP
 MjBRfF4aHYYLQVahgreJXuRLs0c8fxZbTqX8PItLZAwe29F7LEeHH5qtYUnOlZ3L
 9yTU2pD6HJu4HHG/c0V+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1682404545; x=1682490945; bh=A
 I+GTXTaiFUivVhWlC5rhVRFPKNc6javldPOJbFAoM0=; b=NSPtqu1tAh8ZLmAiF
 MjVBQ/xbiQaKHEKuuSyZwEwCk/utRX12hU7TX04rQCmEBnwN8NcjWy6aFzHz/Njc
 tnJQqa9JZx3gAQR5i0Tq7Ei4Z4Xc+LaU4TU0XnT7uuOMCIfNbIAL4d8e9cEFfKIj
 9HEBGeBSKllSl28r237H7F5aOWilhDurI4SHx+RBMkET/c4kvyn3AKhp7szjRJ+U
 HPDxSjxFthDNplo1Tbi5KATCd76BKHZvWZG5LXfGURHc0QhCeWNo4O/Gf/IqTgQ+
 VN/hhbHgN4nGo67g16NXIlyfSboWvUTmZVf/szd3csrl11//dMUbLOJ8hdxPOzaj
 EluIA==
X-ME-Sender: <xms:wHRHZB_qCJwNCmm0SjPr_WWUERlBIH5V9XRO2ErohrpSv6lQ_3vCjw>
 <xme:wHRHZFulrXAm-IWMrtMZlwblDSr_N6UFFHN2RRw5mkbMqqaTIJLyKHVC145yYEl9i
 lnmP6tUsLv-Q-YHMrU>
X-ME-Received: <xmr:wHRHZPCBw01MVKmy4QVguyEFEPvcw0rGoYLX_1WoXJvDUsvWuHfVXU-ENjVbFXqRIu9U4i2Apz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeduuddgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepfefghedufeejvdfghfehledvvddvheffgfetvdffueegieeggffggfeghfei
 jeelnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:wHRHZFdfH_G8GfIKWWXiaLIo27tUV1mJn_dYhXreiz3BoL4mX80U8A>
 <xmx:wHRHZGOGe2xqLI5e_PFZIhfzvbC9jc4K__Av_7x4nG5hhiSRK6E5Mw>
 <xmx:wHRHZHnGf2mreYX5b8-7R1FzYFzkGiEHY7bxPd-FotFY4FTgiHZUXw>
 <xmx:wXRHZAvdYjTlhpUPQj7T_cgeS9nvnQ_oVaJ2O4z7cmMdI29FR0raAQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Apr 2023 02:35:41 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Corey Minyard <cminyard@mvista.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Klaus Jensen <its@irrelevant.dk>, qemu-arm@nongnu.org,
 Peter Delevoryas <peter@pjd.dev>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Lior Weintraub <liorw@pliops.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v2 0/3] hw/{i2c, nvme}: mctp endpoint,
 nvme management interface model
Date: Tue, 25 Apr 2023 08:35:37 +0200
Message-Id: <20230425063540.46143-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2706; i=k.jensen@samsung.com;
 h=from:subject; bh=+JrmcKrFbJuSCvxv1qLM8eAp0hkWVVmGxl/Dg4yaUzo=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGRHdLp3sabuoQsdY5h57hXQ7ofnwYXWz5h6o
 hqQXLzoNQ1tZokBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkR3S6AAoJEE3hrzFt
 Tw3pzEEIAIcYkZeKZLYUABGgidw5NZ83sqpmcMQwqtqGuGWP668obRFdIT138iZ9iSZtGZDKelf
 z52RYh9ojOiumDMeLexm2VftdBYCbz3yOR/g8JSv74yapi5eF7xyyCRbLiChvG4zLCvW+UZ87O3
 ynepQS2sCXisO33cR7j3ZAq4cFb9RlAo61GeVYpOqeKiWWOQqfgRGBTuzspuoKCoWUyXoBQqtk2
 15B+dmA5rbO6NLf5w6a88pRPzHHnE0o6+cDRIhvsJIGSbEMJcD3/j1di7Zoajm1YpqOyP9TKRrZ
 BOe16Y25A+Ial6vkU1Y/L/cCf2reVmgjbKCrRd6L1OQsuglkZpxmPaqZ
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

This adds a generic MCTP endpoint model that other devices may derive
from. I'm not 100% happy with the design of the class methods, but it's
a start.

Also included is a very basic implementation of an NVMe-MI device,
supporting only a small subset of the required commands. Lior (CC'ed) has some
patches coming up that adds futher support.

Since this all relies on i2c target mode, this can currently only be
used with an SoC that includes the Aspeed I2C controller.

The easiest way to get up and running with this, is to grab my buildroot
overlay[1]. It includes modified a modified dts as well as a couple of
required packages.

QEMU can then be launched along these lines:

  qemu-system-arm \
    -nographic \
    -M ast2600-evb \
    -kernel output/images/zImage \
    -initrd output/images/rootfs.cpio \
    -dtb output/images/aspeed-ast2600-evb-nmi.dtb \
    -nic user,hostfwd=tcp::2222-:22 \
    -device nmi-i2c,address=0x3a \
    -serial mon:stdio

From within the booted system,

  mctp addr add 8 dev mctpi2c15
  mctp link set mctpi2c15 up
  mctp route add 9 via mctpi2c15
  mctp neigh add 9 dev mctpi2c15 lladdr 0x3a
  mi-mctp 1 9 info

Comments are very welcome!

  [1]: https://github.com/birkelund/buildroots/tree/main/mctp-i2c

Changes since v1
~~~~~~~~~~~~~~~~

  - Fix SPDX-License tag for hw/nvme/nmi-i2c.c (Philippe)
  - Add some asserts to verify buffer indices (by request from Corey).
  - Drop short packets that could result in underflow (Corey)
  - Move i2c_smbus_pec() to smbus common code (Corey)
  - A couple of logic fixes (patch from Jeremy squashed in)
  - Added a patch to handle messages with dest eid 0 (Matt)
    Maybe squash this as well.

Klaus Jensen (2):
  hw/i2c: add mctp core
  hw/nvme: add nvme management interface model

Matt Johnston (1):
  i2c/mctp: Allow receiving messages to dest eid 0

 MAINTAINERS                   |   7 +
 hw/arm/Kconfig                |   1 +
 hw/i2c/Kconfig                |   4 +
 hw/i2c/mctp.c                 | 353 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build            |   1 +
 hw/i2c/smbus_master.c         |  28 +++
 hw/i2c/trace-events           |  12 ++
 hw/nvme/meson.build           |   1 +
 hw/nvme/nmi-i2c.c             | 382 ++++++++++++++++++++++++++++++++++
 hw/nvme/trace-events          |   6 +
 include/hw/i2c/mctp.h         | 114 ++++++++++
 include/hw/i2c/smbus_master.h |   3 +
 include/net/mctp.h            |  43 ++++
 13 files changed, 955 insertions(+)
 create mode 100644 hw/i2c/mctp.c
 create mode 100644 hw/nvme/nmi-i2c.c
 create mode 100644 include/hw/i2c/mctp.h
 create mode 100644 include/net/mctp.h

-- 
2.40.0


