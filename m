Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEFC67F52A
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 07:07:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLeLZ-0002Ih-3z; Sat, 28 Jan 2023 01:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLeLW-0002HS-NP; Sat, 28 Jan 2023 01:05:50 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLeLU-0007Th-Kx; Sat, 28 Jan 2023 01:05:50 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 35EEB5C06CD;
 Sat, 28 Jan 2023 01:05:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 28 Jan 2023 01:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674885947; x=1674972347; bh=pYb18UvdEh
 ezrEQmRIhQIK2hpcfo1/NWxuxJqPl2xt0=; b=tvnRNecARLckj6N46S6XSuhn2D
 AhvFRXCa+flB1iCrUgFLtlgkXbtpL/MYTytNpITGNJdI8IraH9MBPnr1XUidiTke
 ZI/u8G4qz9AsWsiKd3Otr5QhQGJD6ajiEi3lvwk2W5PxabSAloknV/FfcEzKTHgv
 BS/efO396eG73GEtesvTvQ/NdF/cCeB/Ma4q+0HysqYd1SXbN4cLEuK3zHX6tJrd
 4dw4B/z2ZMxFtlnV+SN8itFjuo6qla1dmfBisHaGpk0zoU4SjSJpwAZDKjby+2cP
 z1jWq+TkJ+5VX6dt/8X4IwiUsJKRVIGe+1PSjvHccl1MSHM/unuVzPOvCtIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1674885947; x=1674972347; bh=pYb18UvdEhezr
 EQmRIhQIK2hpcfo1/NWxuxJqPl2xt0=; b=iKo0qldU56chEvcV372Y9Tj69sM6v
 R0ojgdTuzXTwFf18tkCeD/5xyxG7axf3BaeCUvuycn/Zv6LjqyAlHYZOKfpjURtF
 7YhOyVHIAGIDmousoNzUWM7jpkWuDmGvXyiBgojGHahHWggUsIClSPTRgRKbxb0v
 NP+2rylPjD/HtCOFbUps2k8a5D4AdPGoMWvOqxKbIaKy2DsDX+H2iXYcJ8e6ow8b
 nWjS85+ySpmG/njNX4kvI3F6CvVPw+aWcHaMN1X8kl3/qVNsiS2l9gBDxQk2ViC8
 uDHSewCbAM2Dj1sJGEVGcqBXVUNTu3SrTvSfpMSbDiK//gehTXVcogJHg==
X-ME-Sender: <xms:OrvUY1nmJZ4TD7AyWZyPiOJjcfYLVOvxDCJRltXxWBCiKQ2WkstDYA>
 <xme:OrvUYw0mGTN5XwZRFf5yLK4M-Ay-ZQlQ0MMkzE-9oe2ljrgJ1ReUqTTdwfJlBZZw2
 qgbR-9F0ha_CR_lnr4>
X-ME-Received: <xmr:OrvUY7o5QauhWdax19XBo_Ux5BIpAe4C24zzcZherD9N2Iw4yTa4KtC3JttsQBR3pfkfHI507bMfH3Gu-GdKiv6N5oKOGSyyyFPbE8cz9_U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvjedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofggtgfgsehtkeer
 tdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghrse
 hpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeetffejteejgefgffdvuefhgeeludfg
 feduueeltdefgfduhfetudetueeujeeukeenucffohhmrghinhepkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgv
 thgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:OrvUY1kc_ky7u9p9bqF9cqJcWQ2s8n82vztJPs4yObT2tuYXxdouSQ>
 <xmx:OrvUYz3M-aHAVKq8pCqdQ0bB9xZ_2qq5z0kVDPC-ivNme5JbWZ_93w>
 <xmx:OrvUY0tg_RM50p08r1o0O9xNL5qfUQoqXYCVPcDH8WFu4bfgX6FlDg>
 <xmx:O7vUY1wFJ957iI848y9bY8Hg8K3DEErPof8T0YFbxyQQBNt5dD0cJw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jan 2023 01:05:45 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org,
 cminyard@mvista.com
Subject: [PATCH v5 0/5] hw/nvram/eeprom_at24c: Cleanup + FRUID EEPROM init
 example
Date: Fri, 27 Jan 2023 22:05:38 -0800
Message-Id: <20230128060543.95582-1-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
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

v1: https://lore.kernel.org/qemu-devel/20230114170151.87833-1-peter@pjd.dev/
v2:
    - Squashed 3 commits from original series into extract helper commit
    - Dropped last 2 commits from original series
    - Changed at24c_eeprom_init to return the I2CSlave object
    - Added commit to introduce at24c-eeprom "init_rom" attribute
    - Added aspeed_eeprom.c and fby35-bmc BMC FRUID EEPROM initialization
    - Added commit to change reset behavior for at24c-eeprom (optional)
v3:
    - Added doc comments to function headers
	- Added fby35 NIC and baseboard EEPROM's (to illustrate 2+ EEPROM's)
    - Replaced "extern uint32 fby35_bmc_fruid_size" by adding explicit array
      sizes, e.g. "extern uint8_t fby35_bmc_fruid[200]".
    - Fixed Meta Platforms licenses by adding SPDX-License-Identifier for GPL2.
    - Moved ee->init_rom initialization code before ee->blk, so that -drive
      property overrides init_rom initialization. This gives more flexibility
      (people can override contents of an AT24C EEPROM using a file for
      debugging/prototyping) while still allowing the init_rom data to be
      specified for a board for default behavior.
v4:
	- Moved at24c_eeprom_init_rom doc comment to the patch introducing the
      function (moved from patch 4/5 to patch 3/5).
	- Added review tags from Joel
v5:
    - Added review tags from Corey
    - Added tested-by tag from Ninad
    - Switched back to i2c_slave_new in eeprom_at24c.c
    - Switched back to "extern const size_t fby35_*_len" in aspeed_eeprom.h

NOTE: I rebased on the latest master and tlb exec segfaults in "Starting
kernel" for fby35-bmc: I'll make a bug report separately. I've kept the base on
7c9236d6d61f because of this.

Thanks,
Peter

Peter Delevoryas (5):
  hw/arm: Extract at24c_eeprom_init helper from Aspeed and Nuvoton
    boards
  hw/arm/aspeed: Replace aspeed_eeprom_init with at24c_eeprom_init
  hw/nvram/eeprom_at24c: Add init_rom field and at24c_eeprom_init_rom
    helper
  hw/arm/aspeed: Add aspeed_eeprom.c
  hw/nvram/eeprom_at24c: Make reset behavior more like hardware

 hw/arm/aspeed.c                 | 109 ++++++++++++++------------------
 hw/arm/aspeed_eeprom.c          |  82 ++++++++++++++++++++++++
 hw/arm/aspeed_eeprom.h          |  19 ++++++
 hw/arm/meson.build              |   1 +
 hw/arm/npcm7xx_boards.c         |  20 ++----
 hw/nvram/eeprom_at24c.c         |  58 +++++++++++++----
 include/hw/nvram/eeprom_at24c.h |  39 ++++++++++++
 7 files changed, 241 insertions(+), 87 deletions(-)
 create mode 100644 hw/arm/aspeed_eeprom.c
 create mode 100644 hw/arm/aspeed_eeprom.h
 create mode 100644 include/hw/nvram/eeprom_at24c.h

-- 
2.39.0


