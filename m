Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2032329587
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 02:46:54 +0100 (CET)
Received: from localhost ([::1]:60826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGu7h-0003mo-38
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 20:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4g-0002Bb-P2; Mon, 01 Mar 2021 20:43:46 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGu4X-00021S-1t; Mon, 01 Mar 2021 20:43:46 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C00B5C00CB;
 Mon,  1 Mar 2021 20:43:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 01 Mar 2021 20:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=tfMBkXspTIvSJwMPWlgaiiBpsl
 vmVpFcM7IrRUmbcUQ=; b=GJL1biDWhOcYfDG62KmpipNeNjEgbTZiVgU3JgmoI7
 Qg/je6xrWU/NhLnQt+t0wklk7ZAiaR3JBsspWLB/LslplMEX5InMEYZWBVNhJ9bn
 hipJBhbeZEf6w6WMq94YQkPrtbVXyNcBAN4EVsfybWEIDynN1tbgc38e78ri7k90
 b0PMX//L2XpL2tJb5Zk124RSkhnwIFGwbFQRFWNMSXU/rEpP6b7nSyyhv1R0FgsL
 O6fh+ZtaIqHNn68sPWgZOSfLBMtHIhbBXFO9x9v6ho/6MI7mfZEDiziZwyAlFw9O
 jliEAKQtrTxfkOG5Zvm/nWwRxoqRpOqvKcjEwprfVH/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tfMBkX
 spTIvSJwMPWlgaiiBpslvmVpFcM7IrRUmbcUQ=; b=ajOXsTyMlR2oVnHdIDRUj9
 2sEWrhEu6Xmi2kJKca6X4uP0CJaXT16HDGd07YxgB0d8NbCNnL9ByZkE7EVfubx1
 WQIyrGtIOSGD3gPRYyl3wq6RBrlJKWOfLhbYjO4of9UaGvKznYGpQfaJJpK3lEyI
 Q9asUTg7F8GgFLxgpvrep2z4E+yD2MzQw9buTmoAZQkKr3z6BGe6Jk5Q9zKg6jef
 /H+JmNf/H00HPdq4Mq7ogw2RXrBSUZPvYCE4FJFhYbaz6D9+I9CIl4I38GzxmKKJ
 dgL2gtx12hZTRBQk83f0iq/tEUv2/Lgbbra2c4o+O3CMbn3H0sDUYY+TJFdvy1AQ
 ==
X-ME-Sender: <xms:QZg9YHzuMtd_gtvLz3HQiM-O4eNAmj3-e5V96Vh9ZzMtlNCOi-cN_g>
 <xme:QZg9YPQOOQ0oMi6vi2ovMlBKLQX4g1nEwGgA_tZRMJuMiq6IfHpFYyZtXUHw3ezWs
 47cT3sCV7ewyH5fmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthekredtre
 dtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepvedvleeiieevledtvefgtdevheejvddtje
 fhjedtgeduffdtudevuefgveduudetnecuffhomhgrihhnpehinhhtvghlrdgtohhmpdhk
 vghrnhgvlhdrohhrghenucfkphepudegrddvrdeluddrfeejnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:QZg9YBXuCj37dq0BnSaMNlHsJdaL1U7gPP9W6MlatPARjQY7EPdXXg>
 <xmx:QZg9YBipzcW4sY_FS3cBVBnxr37R2yzYlnjQ0LovBzkfNORpLgOVBg>
 <xmx:QZg9YJBT4Oy4QbD4GUKxfvQtZm4DMOLYpZv-_gGUpHlcWbMLJtYyPw>
 <xmx:Qpg9YM5OmCz691kRKY7UZZgUItt9cO1fvz0lrCt5GPtWfQ_I8mDpug>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 581D624005C;
 Mon,  1 Mar 2021 20:43:26 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 0/5] aspeed: LPC peripheral controller devices
Date: Tue,  2 Mar 2021 12:13:12 +1030
Message-Id: <20210302014317.915120-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=andrew@aj.id.au;
 helo=out5-smtp.messagingengine.com
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series adds support for some of the LPC[1] peripherals found in Aspeed BMC
SoCs.

[1] https://www.intel.com/content/dam/www/program/design/us/en/documents/low-pin-count-interface-specification.pdf

v3 fixes a copy/paste error hooking up the LPC IRQ for the AST2600, identified
off-list. I've tested exercised the eMMC path to confirm the fix. v2 of the
series can be found here:

https://lore.kernel.org/qemu-devel/20210301010610.355702-1-andrew@aj.id.au/T/#mccf00fea21d955d74de39dbc49af8451b447ff54

BMCs typically provide a number of features to their host via LPC that include
but are not limited to:

1. Mapping LPC firmware cycles to BMC-controlled flash devices
2. UART(s) for system console routing
3. POST code routing
4. Keyboard-Controller-Style (KCS) IPMI devices
5. Block Transfer (BT) IPMI devices
6. A SuperIO controller for management of LPC devices and miscellaneous
   functionality

Specifically, this series adds basic support for functions 1 and 4 above,
handling the BMC firmware configuring the bridge mapping LPC firmware cycles
onto its AHB as well as support for four KCS devices.

Aspeed's LPC controller is not a straight-forward device by any stretch. It
contains at least the capabilities outlined above, in the sense that it's not
possible to cleanly separate the different functions into distinct MMIO
sub-regions: Registers for the various bits of functionality have the feel of
arbitrary placement with a nod to feature-creep and backwards compatibility.
Further, the conceptually coherent pieces of functionality often come with the
ability to issue interrupts, though for the AST2400 and AST2500 there is one
shared VIC IRQ for all LPC "subdevices". By contrast the AST2600 gives each
subdevice a distinct IRQ via the GIC.

All this combined leads to some complexity regarding the interrupts and handling
the MMIO accesses (in terms of mapping the access back to the function it's
affecting).

Finally, as a point of clarity, Aspeed BMCs also contain an LPC Host Controller
to drive the LPC bus. This series does not concern itself with the LPC Host
Controller function, only with a subset of the peripheral devices the BMC
presents to the host.

I've tested the series using a combination of the ast2600-evb, witherspoon-bmc
and romulus-bmc machines along with a set of recently-posted patches for
Linux[2].

Please review!

Andrew

[2] https://lore.kernel.org/openbmc/20210219142523.3464540-1-andrew@aj.id.au/T/#m1e2029e7aa2be3056320e8d46b3b5b1539a776b4

Andrew Jeffery (4):
  hw/arm: ast2600: Force a multiple of 32 of IRQs for the GIC
  hw/arm: ast2600: Set AST2600_MAX_IRQ to value from datasheet
  hw/arm: ast2600: Correct the iBT interrupt ID
  hw/misc: Model KCS devices in the Aspeed LPC controller

Cédric Le Goater (1):
  hw/misc: Add a basic Aspeed LPC controller model

 docs/system/arm/aspeed.rst   |   2 +-
 hw/arm/aspeed_ast2600.c      |  44 +++-
 hw/arm/aspeed_soc.c          |  34 ++-
 hw/misc/aspeed_lpc.c         | 486 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   7 +-
 include/hw/arm/aspeed_soc.h  |   3 +
 include/hw/misc/aspeed_lpc.h |  47 ++++
 7 files changed, 616 insertions(+), 7 deletions(-)
 create mode 100644 hw/misc/aspeed_lpc.c
 create mode 100644 include/hw/misc/aspeed_lpc.h


base-commit: 51db2d7cf26d05a961ec0ee0eb773594b32cc4a1
-- 
2.27.0


