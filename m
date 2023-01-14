Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0513A66ACE1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 18:03:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGjvD-0005rH-9U; Sat, 14 Jan 2023 12:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjus-0005Eh-CX; Sat, 14 Jan 2023 12:02:04 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pGjup-0005Om-Mq; Sat, 14 Jan 2023 12:02:02 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 03F625C0004;
 Sat, 14 Jan 2023 12:01:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 14 Jan 2023 12:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1673715715; x=1673802115; bh=J9WWP+D83LjQZ25t0MybN1ZJA
 72LlHXks8fP8ntCWfk=; b=iofJZH9yjU/i1iDhBJZqxfXc6xWpqrnr9djhh9BhW
 Jsaw1vGUbNy8G2gkaYnm/d1adqQDLVAmAKybibIlmr3OixKUgHcRa38vJQrEVZIb
 W9UNmT3YnfQ6pQNYi5kqF5IEbKfGaOnI9NFeqvaUcl5QlrvVivW4t6dkTk0Atf34
 2zUl5wTbXmDpdKUIVMmaRlaForivBkSQS0GoxrCjRAWx5qS/HUhenPzP8SD1jSMU
 X5z+Zp3FCyueAYCFiOecCtn0mCaoZr0gab3mNawkYiiVGiZeWDbN6n7miUE556tr
 i74+yFLhfo81PbW62+lL6qdcGM+8djZFn0uunOX2renaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1673715715; x=1673802115; bh=J9WWP+D83LjQZ25t0MybN1ZJA72LlHXks8f
 P8ntCWfk=; b=C1ulJT2A9gNr0FsjBRqbMci3u812AzyVqj+ykjKDP7ilzYko0+u
 vQymrKnoK/fFU/e9xvXPDEeQjiNoHXEiAtpYvrvvUJdYWBpUM02CeOEGPccoYjqj
 Bmv88Iq7jNcWvtmIEDLXKG23ILC446/qW4h+yGoHpGJecnA8XzctE8iUJWP2Fkqg
 myybhFAvPWTL50hRoJoMilLKTZhYxqYb0HhZe6srO9HL/IQXydglqBUIRDmJ7Gh5
 VQX49bCCs52XTZlh//5CohAhjegzJLkEfWu/SI6orvaM6c4cRRhXbvHhHfAf8pSq
 2GtHb2KKYOkEmwn8Twhihupjm2VftZ9CSuw==
X-ME-Sender: <xms:AuDCYxFljzlrvGyuLxgQRE3wnZXsBxrZoMkfl6HbwwtCirwssisnRQ>
 <xme:AuDCY2VqfYhPtUh6vjYA7UzhW1OKZplFs3MScAJkoHlTAnAq7BJ-grVR0nzSxOXE7
 5ADOUZs8xuZmtJ_z2k>
X-ME-Received: <xmr:AuDCYzJjeW3ll4N1nvpgQHKYJ8fQ2y2q14bmP2lqdojc3rDFFywIICtQ4YKI4WZFBHX-_QWQPOtjw4Bx1uPGd1CRO6zN8xYKt0s9LXIxM4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddttddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepvdejgefhkeejjeeitddutddvueegheehfeelteffueegjedutdetgfdvgeev
 ieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
 gvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:AuDCY3GUyb5eOK8IpGGMbf25X8frtAS4CWtN_djk0g3w4b-qUPI3KQ>
 <xmx:AuDCY3V-oWlPvaQptejOyAyB_bKQLvirSrlykIXmhQkmSK1pXKcqyA>
 <xmx:AuDCYyOSIpxS1IEAbwITWqQsSW4f_Q5QVMg5rH4g3dqIJgqgHdtcaQ>
 <xmx:A-DCYzp876j8D25K7blMETH8TN_hr9yCcUaFNMDdCkmw05halqpBbA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jan 2023 12:01:53 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: patrick@stwcx.xyz, peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 0/6] hw/nvram/eeprom_at24c: Cleanup + FRUID EEPROM init example
Date: Sat, 14 Jan 2023 09:01:45 -0800
Message-Id: <20230114170151.87833-1-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
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

This cleans up some of the code we have creating at24c-eeprom objects in the
Aspeed and Nuvoton files, and adds an example of how to initialize a FRUID
EEPROM with static data using I2C transfers.

Initially I was going to propose a patch to update the at24c-eeprom realize
function to incorporate static data, but then I realized I could just
accomplish the same thing using i2c_send in board reset. The patch at the end
demonstrates this.

Thanks,
Peter

Peter Delevoryas (6):
  hw/nvram/eeprom_at24c: Add header w/ init helper
  hw/arm/aspeed: Remove local copy of at24c_eeprom_init
  hw/arm/aspeed: Replace aspeed_eeprom_init with at24c_eeprom_init
  hw/arm/npcm7xx: Remove local copy of at24c_eeprom_init
  hw/nvram/eeprom_at24c: Add I2C write helper
  hw/arm/aspeed: Init fby35 BMC FRUID EEPROM

 hw/arm/aspeed.c                 | 154 +++++++++++++++++++-------------
 hw/arm/npcm7xx_boards.c         |  20 ++---
 hw/nvram/eeprom_at24c.c         |  25 ++++++
 include/hw/nvram/eeprom_at24c.h |  12 +++
 4 files changed, 135 insertions(+), 76 deletions(-)
 create mode 100644 include/hw/nvram/eeprom_at24c.h

-- 
2.39.0


