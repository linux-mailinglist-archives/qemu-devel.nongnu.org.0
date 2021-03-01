Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B363275B4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 02:09:11 +0100 (CET)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGX3Z-0002GF-7a
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 20:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGX1C-0000Uf-Bu; Sun, 28 Feb 2021 20:06:38 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGX12-0001gE-Cw; Sun, 28 Feb 2021 20:06:38 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 49A9B5C0093;
 Sun, 28 Feb 2021 20:06:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 28 Feb 2021 20:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=yJzOBMb83Uei1HQsj8fwPmNBYV
 lb3fxWAY5omdLXGv0=; b=DaagugRzYKDcqijq3VKHWuB5vdO7dY78Gi6MHNR1RL
 Lp69PxVyYhualHpsg3gQrXRHX8IxUBdP6cNgp7lsBtlv5JVo4GeTUbHopbM7jKaW
 TwkXZQvDfdHdrw6zVKn52fV1hIRLINP367tfUI3+s0/p+1ND5+0dQ4Gx7k6eGind
 8DcZBd/b21CN9eKn66tNBxYGXkhBq7EDtvjvSYT31w8EGMuLXn035l1GQnelqY3Q
 1wCyocivSnBveSAZfTXfZ6PQ8lYkXH1drHqr6vWs5XQ+XzmE/GWHrOMvuoeLBgZ1
 wLXXV/QmVmAL8oh6/LjS6ubbTeTFT20lo450Ec+vpafA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yJzOBM
 b83Uei1HQsj8fwPmNBYVlb3fxWAY5omdLXGv0=; b=gwMoL849xvu9r+NPK1K1nu
 Kys4lvGd0tfZRdBdsuG32UdwLrfphsF4RmalwQH+pOJtp3CDmKZZNbHAuhiFfNk5
 ffDfQj9zaEJpjhsetcX8EK/nVdxM7f1NRsqN+cvftxKVPd6dvpFqXJoy7O6aU4q9
 Du/eozvNHezP27Xq+1EW9h9t7VX0aJsplXG5yvqpZroxrFM1kHiksMXqD4ZYNGIL
 J5L5CbYobpeVMYExcu8CjuJnR1C4qbe7mbAUoH6xNgqrhO/qkkQ1Bn3KFqmR7RZj
 gZ+zf6Sff60QHhqPXOMmZ8/SbWU+eAttXlJwIUAO6gAyT0tlXFJG1fHTlCIfuu/g
 ==
X-ME-Sender: <xms:ED48YKs9F6mUazHEtkYGA5DXjASucdhVqLZkvR_M7ZOaGqLeMPU1XQ>
 <xme:ED48YPf_5ktPBP3Lv-Hx_G19788cON50p0MY2OJp934Hq9ITsh9Ged2_hQZ_K6TsY
 w7jarn50R7Pd3bygA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthekredtre
 dtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepvedtveeutdejhfdvgeffieegteegtdefhf
 eihfevheefffffvdegudeivdekheffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdp
 ihhnthgvlhdrtghomhenucfkphepudegrddvrdeluddrfeejnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:ED48YFw-Z_wMSba-XfXNz1yI4NvZOkwNUdq8zAKLjVDDTPHJzAeXAQ>
 <xmx:ED48YFOhr8MxL7NrP_JJktA1yqG7oj_DOHCTvJPZnAN--pJVxkE8OA>
 <xmx:ED48YK8GgAsqEwFOc4xhI0utztD4KjgPTgBWHqIbworN0oXB3vFGww>
 <xmx:Ej48YBnCcJODdBVyk-Tkm63MrofxBaxFbTOUJRD0t5pDGFYW7f7-Xw>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7374A240054;
 Sun, 28 Feb 2021 20:06:21 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/5] aspeed: LPC peripheral controller devices
Date: Mon,  1 Mar 2021 11:36:05 +1030
Message-Id: <20210301010610.355702-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

v2 addresses some minor feedback from Philippe and Cédric. v1 can be found here:

https://lore.kernel.org/qemu-devel/20210226065758.547824-1-andrew@aj.id.au/T/#m28b4392d0672e85fbfaaf6565a2da2e82de1691d

BMCs typically provide a number of features to their host via LPC that include
but are not limited to:

1. Mapping LPC firmware cycles to BMC-controlled flash devices
2. UART(s) for system console routing
3. POST code routing
4. Keyboard-Controller-Style (KCS) IPMI devices
5. Block Transfer (BT) IPMI devices
6. A SuperIO controller for management of LPC devices and miscellaneous
   functionality

[1] https://www.intel.com/content/dam/www/program/design/us/en/documents/low-pin-count-interface-specification.pdf

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
  arm: ast2600: Force a multiple of 32 of IRQs for the GIC
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


