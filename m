Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4ED62B570
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 09:44:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovE16-0005GL-9x; Wed, 16 Nov 2022 03:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovE0y-00058Z-86; Wed, 16 Nov 2022 03:43:24 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovE0v-0001sT-M8; Wed, 16 Nov 2022 03:43:23 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DFCB45C0274;
 Wed, 16 Nov 2022 03:43:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 16 Nov 2022 03:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668588197; x=1668674597; bh=/r
 N0rTF1X6pDkPhtLRcyqE/sj87c+jJLVjcU88yM6/s=; b=V6aPY9FFn/Y2SAkcuS
 ox0mgzEl0xZ3zjFc40rbv+WPnLLwq0StK5WlEIpJo20jTRBK+l2ZoDTOyMs5YHbw
 BfubvC8RA461prrkys8VXOfkuOvv2toG055tOuCsMPbAFKZji4P6LQhBUlqEFrOx
 ontqSUU1InXRNqtWv2dZf9fsGZo3x5oHLlvXlNf65SMM5uKf/zXUyivZLkoexvxX
 PE2YytW3+XuZjUB4D8mB7i53KMCnUgXQbmQNxVbwp52wViHD9VvRYVB8h5aPSZjd
 jy+el643+aT84toiSg8dFbl6VMh3JmD63ls9cS9OVGLQkJ1k+iJBaurjDfPoiH3F
 yIQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668588197; x=1668674597; bh=/rN0rTF1X6pDk
 PhtLRcyqE/sj87c+jJLVjcU88yM6/s=; b=DnlDX8X2UAjIRc817PNzKSf1knwT8
 b0Mcdbwg6r1a7oHF5uX3dblj+niRhX+x/u57JkDA3RRoBD8GdgwB3XDbVGKFoaPO
 zpmbJbAc+apIPgi9IWsFhx2fuzM834qfu2Hx/Bkn5Bv1cCGZUVdilwaJUp4ACM0R
 2FiVo00TOmi5PvS4D5wOSS6uKzfCVjpUD/hmBbVtqDpH47kObgA+2tyT3+4aBa8i
 bUXZ3sxzg9N+p0H3AFYKCbH9iTrecArJOsiqPJ42n4IS45+cgmgAdlc/13E041DT
 LmY7KdIMxRbm4BzMMt0uMf5vm/mItWLIdWP73TSHVBvyhAzCJdkUa/vCQ==
X-ME-Sender: <xms:o6J0Yx4yJ6kVWPgRJLIrissPY41yeP4BCRiqMsMRm39jzHSjEjahYQ>
 <xme:o6J0Y-5mVbz7h9Xk1zlVcXSgJKLLq8zCVUYaR9dmrBXvTkINXH2z5m5i2IiXHKHxQ
 nVCnlj9rD8uCO42Vu0>
X-ME-Received: <xmr:o6J0Y4f_nilOPJgEfTKib72bGnHPkjawdurTiNnFJLrGuoamGninr7UI28s5dL_oIWYJ_fWNkJE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeehgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeefgfehudefjedvgffhheelvddvvdehfffgtedvffeugeeigefggffggefhieej
 leenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:o6J0Y6KCnXld6AwbENW_bfZK6PHY-dYcJiMBBCqhx4YYyOhn2BgGPg>
 <xmx:o6J0Y1LvCXGHvuSr0VkbVxIDivYozbIZSiTPSBBbEkRlZMY11imxMw>
 <xmx:o6J0YzwuvUph8nYyb6YfoJY4Ubez9HS0ylhp7mwYuD6MmUFQkPBcoA>
 <xmx:paJ0Y_xHKybBGiYn2AULJ6z30lBeadHLEj4VFIdtHG2Go6dTOYRjpQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 03:43:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>,
 Corey Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 0/3] hw/{i2c, nvme}: mctp endpoint,
 nvme management interface model
Date: Wed, 16 Nov 2022 09:43:09 +0100
Message-Id: <20221116084312.35808-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=k.jensen@samsung.com;
 h=from:subject; bh=5WsFbZ8a27QXful4UaRPUhwUDZbOAa8X3pRMgQLNeMk=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGN0oqD3dCoJIC8AFxEw49QLYPy6sG0UWVW55I7T
 0Yf5Os4cOYkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjdKKgAAoJEE3hrzFtTw3pj+
 YH+wRg1Os0qiqHxrNvMmIsndNCsWi8L7a41312+vsu/RNcRmltuWYAaTjSmAVq/r/3pXvlvbeF4lOM
 jEVVXbinkJ55UylODdiO6RuaF74t3v4NKjrxY1NGKfnevSPm3YIoC3ZrNeqsqWHnVpSUBAfzbuRLjE
 IboxMMzF+xbIh2JTSuJUmt5y69bd741qq5L2iA1m61uM6zciYRP/cAFvPxTAqjKi5dAw27Eu9cBNUb
 TQu/8PZ6OrSQbmwnBczDIe6RCfzj/BN1IIUnCJeVPSyMkmABq8fHc2G0Tkq8epNMKlfnikN42F6Il4
 G9heLVILAuORkKRizXmjL65tqJr+a6F+kRdqjB
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

This adds a generic MCTP endpoint model that other devices may derive
from. I'm not 100% happy with the design of the class methods, but it's
a start.

Patch 1 is a bug fix, but since there are currently no in-tree users of
the API, it is not critical. I'd like to have Peter verify the fix with
his netdev code as well.

Also included is a very basic implementation of an NVMe-MI device,
supporting only a small subset of the required commands.

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

Klaus Jensen (3):
  hw/i2c: only schedule pending master when bus is idle
  hw/i2c: add mctp core
  hw/nvme: add nvme management interface model

 hw/arm/Kconfig         |   1 +
 hw/i2c/Kconfig         |   4 +
 hw/i2c/aspeed_i2c.c    |   2 +
 hw/i2c/core.c          |  37 ++--
 hw/i2c/mctp.c          | 365 +++++++++++++++++++++++++++++++++++++++
 hw/i2c/meson.build     |   1 +
 hw/i2c/trace-events    |  12 ++
 hw/nvme/meson.build    |   1 +
 hw/nvme/nmi-i2c.c      | 381 +++++++++++++++++++++++++++++++++++++++++
 hw/nvme/trace-events   |   6 +
 include/hw/i2c/i2c.h   |   2 +
 include/hw/i2c/mctp.h  |  83 +++++++++
 include/hw/misc/mctp.h |  43 +++++
 13 files changed, 923 insertions(+), 15 deletions(-)
 create mode 100644 hw/i2c/mctp.c
 create mode 100644 hw/nvme/nmi-i2c.c
 create mode 100644 include/hw/i2c/mctp.h
 create mode 100644 include/hw/misc/mctp.h

-- 
2.38.1


