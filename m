Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AB7325DC7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:00:14 +0100 (CET)
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFX6j-0005gb-BN
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX4t-0004MA-EH; Fri, 26 Feb 2021 01:58:19 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lFX4r-0007aw-BO; Fri, 26 Feb 2021 01:58:19 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 359C65C0088;
 Fri, 26 Feb 2021 01:58:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 26 Feb 2021 01:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm2; bh=CgI5vNGA6gnIo0Yig+kcbSJUcQ
 0NkbFIMzaTcIvAHGM=; b=j73U5ZYZws/rP8lbd/jCPya90rrOsQcFHtXtDRm/et
 YPW++l5wtSS23M853E/ZNMru75W78Ajr8lICvmWeCTLJNCklXTzwkIp3KTkqOJkr
 xP+DN4iCwG/n+yyneRUrzY1eWxxNVE6k1MMfMds4pVuvxM/2W9OLA0qUv7RhZioT
 Xza7ugHxKbXARHcnEzEaQxcpUQ9UWyQYMN3JtfqpDzRyv1vUHTvwuogaH8M14MHK
 V2TzPDURZl/xZH5+JSTVz5kqh4ffTjcDXeR+VlCtkKUX6iF2BZ3QZU7prRfaXuVn
 WHbggT+8VLyX7MphaGxENTKlpN6+IV41rew9SsuWeFLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CgI5vN
 GA6gnIo0Yig+kcbSJUcQ0NkbFIMzaTcIvAHGM=; b=dvdY8LtjUTYkRDBZfkGUBv
 o2iTLrJvKXl8Ed2ZXT83N1yVHtSrEYkSjeHASkH0scgFlFLyB6480mDt9aV4W8ey
 95mk95GW+2WYQZ8w/eUnMkRcy4DsD3E7ZDg7B2QoVE7Tb7I4pSqYN/QXGlRZ7d0y
 MR8d/CLcm4IjBmrEa6/noH0szsGhWXW6ioftcWDOUp7nJyS6fMLTDpie2Sgxrxe7
 Oi80qgtKgBWqfgoJN5FxOFlFCbXnNCPQXVbd4vWmOMMjitvYcYPhTm+WCPhYTeJn
 EGvWz4S1tg7C8FdL/49gAYF9w27yTdf1Z1B1Lka6F78lKYML9po0bCmAEZPfwCSw
 ==
X-ME-Sender: <xms:BJw4YDfk2eLu6AFB3HjWObCtcKaDljQUB_lon6k7fM9NfIVr6Q8zvA>
 <xme:BJw4YJOxebasZmMT0bjmBhJ4AwmMoJqwo9zlsJdg9ENx-VRpI5oDzayUaZkJJjlL8
 CGVAAJ38kRYefxVew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofggtgfgsehtkeertd
 ertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeevvdelieeiveeltdevgfdtveehjedvtd
 ejhfejtdegudfftdduveeugfevudduteenucffohhmrghinhepihhnthgvlhdrtghomhdp
 khgvrhhnvghlrdhorhhgnecukfhppedugedrvddrledurdefjeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdr
 rghu
X-ME-Proxy: <xmx:BJw4YMgFPyxVD1Y0tMgfnSf-Dg3sX2nMwSORMBSmANu6grHh_HixBg>
 <xmx:BJw4YE-SSn-xsMAQKMLYGmi3fuVCkA7DFS2X_5xMzI46EtHVevgcUw>
 <xmx:BJw4YPsJS9EKHYugOmixsPyBpTrtcPpSKyWMiLJomfcKkG0JBWpTpw>
 <xmx:Bpw4YJIKhYiaC5n377q_z4gmi9fafNMV-nlUOX2UTlZOZ6qm25uf7A>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E7CA24005B;
 Fri, 26 Feb 2021 01:58:09 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/4] aspeed: LPC peripheral controller devices
Date: Fri, 26 Feb 2021 17:27:54 +1030
Message-Id: <20210226065758.547824-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
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
 qemu-devel@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series adds support for some of the LPC[1] peripherals found in Aspeed BMC
SoCs. BMCs typically provide a number of features to their host via LPC that
include but are not limited to:

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
to master the LPC bus. This series does not concern itself with the LPC Host
Controller function, only with a subset of the peripheral devices the BMC
presents to the host.

I've tested the series using a combination of the ast2600-evb, witherspoon-bmc
and romulus-bmc machines along with a set of recently-posted patches for
Linux[2].

Please review!

Andrew

[2] https://lore.kernel.org/openbmc/20210219142523.3464540-1-andrew@aj.id.au/T/#m1e2029e7aa2be3056320e8d46b3b5b1539a776b4

Andrew Jeffery (3):
  arm: ast2600: Force a multiple of 32 of IRQs for the GIC
  arm: ast2600: Fix iBT IRQ ID
  hw/misc: Model KCS devices in the Aspeed LPC controller

Cédric Le Goater (1):
  hw/misc: Add a basic Aspeed LPC controller model

 docs/system/arm/aspeed.rst   |   2 +-
 hw/arm/aspeed_ast2600.c      |  44 +++-
 hw/arm/aspeed_soc.c          |  34 ++-
 hw/misc/aspeed_lpc.c         | 485 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   7 +-
 include/hw/arm/aspeed_soc.h  |   3 +
 include/hw/misc/aspeed_lpc.h |  47 ++++
 7 files changed, 615 insertions(+), 7 deletions(-)
 create mode 100644 hw/misc/aspeed_lpc.c
 create mode 100644 include/hw/misc/aspeed_lpc.h


base-commit: 51db2d7cf26d05a961ec0ee0eb773594b32cc4a1
-- 
2.27.0


