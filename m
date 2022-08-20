Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1D59B0DC
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Aug 2022 01:01:14 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPXSs-00025M-1o
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 19:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oPXPA-00078u-He; Sat, 20 Aug 2022 18:57:24 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oPXP8-0002u1-AU; Sat, 20 Aug 2022 18:57:24 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F0D835C0094;
 Sat, 20 Aug 2022 18:57:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 20 Aug 2022 18:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1661036238; x=1661122638; bh=8PRwsLk1jQA2QA8YhkkJH4Pgw
 fG4c5jri75d6c1Ko04=; b=qvGGpJZxQUXdsKe5l6gtAZ9lQurwuV0+uHXeI8v8d
 BdxOl2Drhh3ZrF3+OqJith65VJ6KfagxiTTlu7nGPAkYU9Pcmw54KuuSTMymMqzX
 R0/Jy5sYFzYqn4yfsb08IkKxlkBvhmVjjGYJYrqsj/ESbJW3iX31o3UOIQ+g36/+
 j6yRS4aNNHENgeWc2G507yFCzSjIBIoB7OMB2Ze8t/HB1fLCV11E7KJ1q66BmfIw
 GgMQX6STOFD1IOV4km18SLAh06fJskeiRecDT2qRrNYxKroCd9FIOCpq9r83c/PQ
 snops1PQk+1/eRqOsiAd528uueHqxZ+V6YP6QPrzneMbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1661036238; x=1661122638; bh=8PRwsLk1jQA2QA8YhkkJH4PgwfG4c5jri75
 d6c1Ko04=; b=vjekTynRKd5Fkv3oEdInYqODDf+o874Qk0IHxikycymqFQJWWj+
 mUOFiMZ5brUNbazaEUJa+T8mNKGjPB3GgcjK4F1R+upn9fwCCX9wesA4UVUtzzF8
 oJo1a3K36xH2su5GekcgXGR0KcQUSnETE+2+1I8un+DlOvd0Ks9a9oCxwrO9EVfQ
 0Keqs84xKZaGqgTAtXvFluY3jNRqUF/qRns9E+kgFgvpsXjH8xbfo6/aQrhSl6Tq
 NLviBhz3t7H6+hl275U2LGC2SAt/Q7PX4zhLApfaky+1erMZMrlXBesvfMLuK21I
 NbJ6RC58kwE2RAPYQT2m1NCDuGQNw1v8VGg==
X-ME-Sender: <xms:zWYBY4izE7FElXY9MBPpYrXSxa-jtxNQG44sncL5p1BNsyDMqeAKjw>
 <xme:zWYBYxC9BdJhJ3NbMc8wl1XxZFmk21yZjcYpSWKUCiTX6MYDG9_zO8zrKqoDmv8CT
 br0_BIgcvV79VkXfuo>
X-ME-Received: <xmr:zWYBYwE4brZJDdHfRC_XzonSIRSSp9fqNHLjHyvN_1xDhZCfYk3drxolC2Wk1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeigedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgggfestdekredt
 redttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesph
 hjugdruggvvheqnecuggftrfgrthhtvghrnhephfdtgfejleejleeuudegvefhleejjeel
 heehgfeggedvkeehfedujeegtdeggfdunecuffhomhgrihhnpehgihhthhhusgdrtghomh
 dpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:zWYBY5QqDnfepBhSGDcuCHiUBDyjC0T-cMYvukss16jswf6NWAqoqA>
 <xmx:zWYBY1zd_D8focBma9cgVD_N26sk2Y2zY5SEQAVKItUT27hDPYruhg>
 <xmx:zWYBY36EQcfgNzrabM5qd9PnOkHyPtraBzy7GfIYLqZtxEK-qU2pZg>
 <xmx:zmYBY0yrmPwAToTl7UNowG3GmgsYYB9TuvCXBs1BEctFcsK9fIhF3A>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Aug 2022 18:57:17 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, dz4list@gmail.com
Subject: [PATCH 0/1] hw/i2c/aspeed: Fix old reg slave receive
Date: Sat, 20 Aug 2022 15:57:11 -0700
Message-Id: <20220820225712.713209-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=peter@pjd.dev;
 helo=out3-smtp.messagingengine.com
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

Hey everyone,

I haven't gotten a chance to work on the Aspeed I2C controller in a little
while, but I finally started looking at it again and noticed the
old-register mode slave receive function (master-send-to-slave) does the
wrong thing for the first byte. See the commit message for details.

I noticed this because I have a qtest for slave mode rx in old-register mode
downstream [1] (I'm also working on a version of the test that can be
upstreamed) that broke when I updated our QEMU branch to the 7.1 release.
Previously I was using Klaus's original slave I2C patches from [2].

An example of the test running successfully with this change is pasted below,
for whatever that's worth.

Thanks,
Peter

[1]: https://github.com/facebook/openbmc/blob/helium/common/recipes-devtools/qemu/qemu/0008-hw-misc-Add-byte-by-byte-i2c-network-device.patch
[2]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irrelevant.dk/

# random seed: R02S5d2728d1347dc8b50533a0d85ebb1b02
# starting QEMU: exec build/qemu-system-arm -qtest unix:/tmp/qtest-711521.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-711521.qmp,id=char0 -mon chardev=char0,mode=control -display none -machine fby35-bmc -netdev socket,id=socket0,udp=127.0.0.1:5000,localaddr=127.0.0.1:6000 -device i2c-netdev2,bus=aspeed.i2c.bus.0,address=0x32,netdev=socket0 -accel qtest
i2c_netdev2_class_init
i2c_netdev2_realize
i2c_netdev2_can_receive
1..2
# Start of arm tests
# Start of ast2600 tests
# Start of i2c tests
i2c_netdev2_handle_event: 1
../hw/misc/i2c-netdev2.c: tx [64, 00, 00]
../hw/misc/i2c-netdev2.c: tx [de]
../hw/misc/i2c-netdev2.c: tx [ad]
../hw/misc/i2c-netdev2.c: tx [be]
../hw/misc/i2c-netdev2.c: tx [ef]
i2c_netdev2_handle_event: 3
../hw/misc/i2c-netdev2.c: tx [00, 00, 00, 00]
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [01, 00]
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [01, 00]
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [01, 00]
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [01, 00]
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [01, 00]
ok 1 /arm/ast2600/i2c/write_in_old_byte_mode
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [20, 00, 00]
prev rx_buf: [00, 00, 00, 00, 00, 00, 00, 00, 00, 00]
next rx_buf: [20, 00, 00, 00, 00, 00, 00, 00, 00, 00]
i2c_netdev2_slave_mode_rx: rx_len=3
i2c_netdev2_slave_mode_rx: rx_len=3
i2c_netdev2_slave_mode_rx: guest OS ack rx, clearing rx_len
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [de]
prev rx_buf: [20, 00, 00, 00, 00, 00, 00, 00, 00, 00]
next rx_buf: [de, 00, 00, 00, 00, 00, 00, 00, 00, 00]
i2c_netdev2_slave_mode_rx: rx_len=1
i2c_netdev2_slave_mode_rx: rx_len=1
i2c_netdev2_slave_mode_rx: guest OS ack rx, clearing rx_len
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [ad]
prev rx_buf: [de, 00, 00, 00, 00, 00, 00, 00, 00, 00]
next rx_buf: [ad, 00, 00, 00, 00, 00, 00, 00, 00, 00]
i2c_netdev2_slave_mode_rx: rx_len=1
i2c_netdev2_slave_mode_rx: rx_len=1
i2c_netdev2_slave_mode_rx: guest OS ack rx, clearing rx_len
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [be]
prev rx_buf: [ad, 00, 00, 00, 00, 00, 00, 00, 00, 00]
next rx_buf: [be, 00, 00, 00, 00, 00, 00, 00, 00, 00]
i2c_netdev2_slave_mode_rx: rx_len=1
i2c_netdev2_slave_mode_rx: rx_len=1
i2c_netdev2_slave_mode_rx: guest OS ack rx, clearing rx_len
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [ef]
prev rx_buf: [be, 00, 00, 00, 00, 00, 00, 00, 00, 00]
next rx_buf: [ef, 00, 00, 00, 00, 00, 00, 00, 00, 00]
i2c_netdev2_slave_mode_rx: rx_len=1
i2c_netdev2_slave_mode_rx: rx_len=1
i2c_netdev2_slave_mode_rx: guest OS ack rx, clearing rx_len
i2c_netdev2_can_receive
../hw/misc/i2c-netdev2.c: rx [ef, 00, 00, 00]
prev rx_buf: [ef, 00, 00, 00, 00, 00, 00, 00, 00, 00]
next rx_buf: [ef, 00, 00, 00, 00, 00, 00, 00, 00, 00]
i2c_netdev2_slave_mode_rx: rx_len=4
ok 2 /arm/ast2600/i2c/slave_mode_rx_byte_buf
# End of i2c tests
# End of ast2600 tests
# End of arm tests
i2c_netdev2_nic_cleanup

Peter Delevoryas (1):
  hw/i2c/aspeed: Fix old reg slave receive

 hw/i2c/aspeed_i2c.c         | 8 +++++---
 include/hw/i2c/aspeed_i2c.h | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.37.1


