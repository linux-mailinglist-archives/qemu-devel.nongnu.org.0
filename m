Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303E466D374
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 00:57:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHZKp-0002lu-L8; Mon, 16 Jan 2023 18:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKn-0002lK-7U; Mon, 16 Jan 2023 18:56:13 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKk-0003mj-UB; Mon, 16 Jan 2023 18:56:12 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3DBC132001BB;
 Mon, 16 Jan 2023 18:56:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 16 Jan 2023 18:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1673913367; x=1673999767; bh=Jii2hJ17+e
 PC9VmEpWyVDzJkALIO73Z8vhcvzz4IT7Q=; b=wISAom4jfCAstEVHUNJe7Kiylt
 7F+/ew3vo1NuMobg3rdJg0zjggNKhL/LcTjTUmKmI44Hjy+uqJCI0J/s4Nuc2EWN
 cqXDckzlrvekZCCBCALmkaIaol0r3Za/W/OeS1FwRp0oxOPbEvLAfqwL41Cb1mUC
 82lWildmrKScnriG1fMqHzxB8XM4UUvh8FkW3iYqhAT7v5RhQet6YvACeEunQDjt
 /spYRhcWgpgCd2Hb+VtgcLD9HpzsiYqzKoyhNdg4uhQLZry23ovIICtA8e1C7X9c
 tu1x/kTNGqoLafYPkqlSsMg3nm9a+v1IAjkrAVDprowPb0uJDaQ9LN5v/qeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673913367; x=1673999767; bh=Jii2hJ17+ePC9
 VmEpWyVDzJkALIO73Z8vhcvzz4IT7Q=; b=dhjVNvGcj1OoqTpYK2/UPhu9jd6Qk
 rX533RHqfDroYLzzw5B98Rl5/MtpqJEgur3ShmnxeISbr6BGq0GLXuVZ+NXjyczH
 JHCe99lj6cXkJYXGZV40glGFbpSoTq0XEEeJa2M07uTOqAqTZ21eTzg3+Biq3YiV
 b9zlhli9VwbbuTsqf3dFzeO7DKQlirzHTOZrykXWRzWYlc7lnHKGxIQvpa7RqjGf
 bkSCjYMKrvJO/boWaZ/so+qPJeZ91Brzk8K+SuFk8IQfoQnN9F/81+xcoj2NxnfJ
 oMUxAn0vEVxaflOzl+qt28ukFZPkS8OFLpzTuRsTHuZv2KW1rr81i51Ng==
X-ME-Sender: <xms:FuTFYyGzaen5Xl7b5XLX209aX4lAZTkox0P77ABv6gg17cIJScqu1A>
 <xme:FuTFYzUHU2HoQIBRGofzbf3WUUYN8S5Tw7VNt17VfwYVIYAnQyElHXYS3v2CklkUX
 hMP74eYjfpSlloWwgc>
X-ME-Received: <xmr:FuTFY8IHEJsSGYAuBT9NjGP4hqRUdZ_I64snKoYHZ68_gx4pYrEmNyDA7wsTQz4KuyEZIdZgX0j_zoz9rQoBFL3fQb9fEMUtKxJXjbDT16o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofggtgfgsehtkeer
 tdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghrse
 hpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeetffejteejgefgffdvuefhgeeludfg
 feduueeltdefgfduhfetudetueeujeeukeenucffohhmrghinhepkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepphgv
 thgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:F-TFY8EFhxQTT51AowLw9K-NHsL0eZSlRLfUS6yYrBSqeUuEeKdMMw>
 <xmx:F-TFY4Wd2PQBVGwEhTU2mPwxLcn1e11M-OfTnJIbAXqO3b18jw_pdA>
 <xmx:F-TFY_MrQ-uTpnoNr0mrrgn_ryp8UAzqH7-yNHhjGcUJezeyiDKwBQ>
 <xmx:F-TFY7HIkHIoNciwuvFTdQkXwtYDpVASrxQmMqh-p160ko07ISJxVA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 18:56:05 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/nvram/eeprom_at24c: Cleanup + FRUID EEPROM init
 example
Date: Mon, 16 Jan 2023 15:55:59 -0800
Message-Id: <20230116235604.55099-1-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The reset behavior one might be controversial, I put it last, you can drop it
if you like.

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

 hw/arm/aspeed.c                 | 107 ++++++++++++++------------------
 hw/arm/aspeed_eeprom.c          |  51 +++++++++++++++
 hw/arm/aspeed_eeprom.h          |  11 ++++
 hw/arm/meson.build              |   1 +
 hw/arm/npcm7xx_boards.c         |  20 ++----
 hw/nvram/eeprom_at24c.c         |  59 ++++++++++++++----
 include/hw/nvram/eeprom_at24c.h |  12 ++++
 7 files changed, 174 insertions(+), 87 deletions(-)
 create mode 100644 hw/arm/aspeed_eeprom.c
 create mode 100644 hw/arm/aspeed_eeprom.h
 create mode 100644 include/hw/nvram/eeprom_at24c.h

-- 
2.39.0


