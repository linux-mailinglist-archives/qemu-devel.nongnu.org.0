Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291B2561067
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 06:54:56 +0200 (CEST)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mCd-0005wz-3L
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 00:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9a-0002LB-JY; Thu, 30 Jun 2022 00:51:46 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9V-0006tS-HG; Thu, 30 Jun 2022 00:51:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id BDE6B2B058D4;
 Thu, 30 Jun 2022 00:51:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jun 2022 00:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1656564695; x=1656568295; bh=MomHN+Omh/
 AfHQZ4UVOp8mXiY2fg0ekRAXZuzEOUX+o=; b=hGlW1tEFVpg+eUTElynOeocg/l
 bWAQ8RQjXzYO3BQMM1DID3c80ix1NiHsjuQIPoMMT+Ms1dOQatuWCN1f7Q+SrdHp
 GKqfQLDsrPkW56ksRXYowKv4BEbSlK2/urjeA4K6c8DYNeb0GAT6dIdUBcPIJU10
 rhVwPAH5mihu5YSNmq0GwLdiWMGCQUG0D/oWT6O4RQVw4WRuE8h5fro9iDcUvvHf
 zWQRnaH2LfrTdsEpHod7o5jbTquUk8mZQdbTbeqxJJh8kPvE9wH3MVGHxRX8l7W/
 nAqcpHWZEMGAH3Gzqi/uy/QRjV2IJ7TWkhkaB4PZGWbgKI5Emrv4ikFdk/Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564695; x=1656568295; bh=Mom
 HN+Omh/AfHQZ4UVOp8mXiY2fg0ekRAXZuzEOUX+o=; b=bnJFOzYw32yz9fGBbwy
 X3VOCjPay1qhHzatDexfhHiIO0xDKQ/pDBH+NqyqRrsLi8DS7YixG9loK8jSEOgC
 oD2nNHiaKfyt74sI4Q1uMWi6cU0KybKBZX5r2a+aDt+e6OWI+4JYbp9yC+qtHOi6
 WJiJdiQj57lMdC0380q8yMegoxLkoVAjuDWKtbcYqmP+dsbxv/ilRBcxyC4rCmXy
 DwUuBufOfkoclJoQ0DPXVQeBnQmofOlv8YhNKUkRMgdLVfnz0pKk1ZMBOz4JFR/0
 aOX7FfRw2ugCu+EehkYfHbEC2M4ea9c/eECHkejJojowr4WvZkGUzTKhHfdRFoCB
 uDg==
X-ME-Sender: <xms:1iu9Yqk8YbpTj5cKJGuVDfTHSOxydW3XDwZe8ToEQiyB90DQhAWlWA>
 <xme:1iu9Yh3GqHk-jgn2ZuiHRPSZOlCOsKaUAslv1VTkfX-jSPCxlyYqFkec4pYXEC4g_
 6ys1rBHGxwuH4tEkqg>
X-ME-Received: <xmr:1iu9YorA9i7C8DgDuZIXDtKcKCHPYbSjbN3wPYQ4WPTW0V9nobqn0K9ydUyOkP4Jcid_x7WtJg0sZvhARSrPB8PjH0eHeu90>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehmvgesphhjugdruggvvheqnecuggftrfgrthhtvg
 hrnhepkeelvefggedvhfdvudfgtdfgjedtffehgeehvdekheehjedvheefkeehkeehgedt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgvse
 hpjhgurdguvghv
X-ME-Proxy: <xmx:1iu9YuliJyB-BZ1vE_kGodPMpX3FeEVkOmlwUgyLobhZLdtCSzQGew>
 <xmx:1iu9Yo03soz30FuFjL-2uH37cHqccwpPNtJSYbcMAslSPOYg4ImBtw>
 <xmx:1iu9YlvxrAJxm4Q1T0-0azcuG-__k0wKXPnKj3AE_pjMOOKPbcLQfQ>
 <xmx:1yu9YpLfXhBaJ61Gr-HYsAUJttlz06NBckHCoj4KkDYV1AynlMGtVPw72Zw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:34 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 00/14] hw/i2c/aspeed: I2C slave mode DMA RX w/ new regs
Date: Wed, 29 Jun 2022 21:51:19 -0700
Message-Id: <20220630045133.32251-1-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Peter Delevoryas <pdel@fb.com>

v3:
- hw/i2c/pmbus_device:
  - Removed commit that resets the out buf.
  - Removed IC_DEVICE_ID
  - Added commit to allow devices to move to an idle state that
    avoids enqueuing excess data into the out buf.
- hw/sensor/isl_pmbus_vr:
  - Added IC_DEVICE_ID commit just for voltage regulators.
  - Added ISL69259 with an IC_DEVICE_ID.
- hw/misc/aspeed_peci:
  - Moved registers from .h to .c
  - Replaced guest_error on interrupt disable case with trace
    for all interrupts (not just when they're disabled).
  - Removed leftover qemu_irq_raise

Thanks,
Peter

Klaus Jensen (3):
  hw/i2c: support multiple masters
  hw/i2c: add asynchronous send
  hw/i2c/aspeed: add slave device in old register mode

Peter Delevoryas (11):
  hw/i2c/aspeed: Fix R_I2CD_FUN_CTRL reference
  hw/i2c/aspeed: Fix DMA len write-enable bit handling
  hw/i2c/aspeed: Fix MASTER_EN missing error message
  hw/i2c/aspeed: Add new-registers DMA slave mode RX support
  hw/i2c/pmbus: Add idle state to return 0xff's
  hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
  hw/sensor: Add Renesas ISL69259 device model
  hw/misc/aspeed: Add PECI controller
  hw/misc/aspeed: Add fby35-sb-cpld
  hw/misc/aspeed: Add intel-me
  hw/arm/aspeed: Add oby35-cl machine

 MAINTAINERS                      |   2 +
 hw/arm/aspeed.c                  |  48 +++++++
 hw/arm/aspeed_ast10x0.c          |  12 ++
 hw/arm/aspeed_ast2600.c          |  12 ++
 hw/arm/aspeed_soc.c              |  13 ++
 hw/arm/pxa2xx.c                  |   2 +
 hw/display/sii9022.c             |   2 +
 hw/display/ssd0303.c             |   2 +
 hw/i2c/aspeed_i2c.c              | 234 +++++++++++++++++++++++++++----
 hw/i2c/core.c                    |  70 ++++++++-
 hw/i2c/pmbus_device.c            |   9 ++
 hw/i2c/smbus_slave.c             |   4 +
 hw/i2c/trace-events              |   2 +
 hw/misc/aspeed_peci.c            | 152 ++++++++++++++++++++
 hw/misc/fby35_sb_cpld.c          | 128 +++++++++++++++++
 hw/misc/intel_me.c               | 162 +++++++++++++++++++++
 hw/misc/meson.build              |   5 +-
 hw/misc/trace-events             |  13 ++
 hw/nvram/eeprom_at24c.c          |   2 +
 hw/sensor/isl_pmbus_vr.c         |  40 ++++++
 hw/sensor/lsm303dlhc_mag.c       |   2 +
 include/hw/arm/aspeed_soc.h      |   3 +
 include/hw/i2c/aspeed_i2c.h      |  11 ++
 include/hw/i2c/i2c.h             |  30 ++++
 include/hw/i2c/pmbus_device.h    |   7 +
 include/hw/misc/aspeed_peci.h    |  29 ++++
 include/hw/sensor/isl_pmbus_vr.h |   5 +
 27 files changed, 971 insertions(+), 30 deletions(-)
 create mode 100644 hw/misc/aspeed_peci.c
 create mode 100644 hw/misc/fby35_sb_cpld.c
 create mode 100644 hw/misc/intel_me.c
 create mode 100644 include/hw/misc/aspeed_peci.h

-- 
2.37.0


