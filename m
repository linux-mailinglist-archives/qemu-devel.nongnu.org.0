Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F33C55BAE6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 17:56:24 +0200 (CEST)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5r67-0007AA-OJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 11:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxu-0001UA-6B; Mon, 27 Jun 2022 11:47:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56387)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxr-0005eX-No; Mon, 27 Jun 2022 11:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656344871; x=1687880871;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vBgQt0zz/0b55IfTM8Iv8peB3xv6k7qk91htfd6lJQM=;
 b=VNJDldcVdBUscxhD3cFMAxho2qYlc3KboKqEE1Qb5zlL/6Z66E1nBOqv
 nznGyy043GeYY3RXv85/ZBORJ/V30qHAa5t0qpCkZhODoqNt82dTzp49c
 Zhx1r4qsTEOSV8ANlSrPv8I1yW9CBG/f/h4/EMgs7nr6af5V2/yAfhxhc M=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 27 Jun 2022 08:47:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:47:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:47:34 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:47:33 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Patrick Venture <venture@google.com>, Hao Wu
 <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/7] Add Qualcomm BMC machines
Date: Mon, 27 Jun 2022 08:46:56 -0700
Message-ID: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hello,

I'm sending a series to add Qualcomm BMC machines that are equipped with
Aspeed AST2600 SoC. Also, this series adds MAX31785 fan controller device
emulation. Please help to review.

Thanks,

Jae

Changes in v2:
* Fixed a typo in QCOM DC-SCM V1 HW strap value comment. (Rebecca)
* Removed a useless change which is reverted by the next patch. (Joel)
* Changed machine name to 'qcom-firework-bmc'. (Cedric)
* Dropped FRU eeprom initialization part. (Patrick)
* Fixed comment for a case of PB_ALL_PAGES. (Titus)
* Removed an error log printing when it handles PB_ALL_PAGES. (Jae)
* Fixed a typo in copyright in max31785.c. (Rebecca)
* Fixed indentation issues in max31785.c. (Titus)
* Fixed license identifier style and refined indentation of defines. (Jae)
* Added PMBUS and MAX31785 config selection under ASPEED_SOC. (Titus)
* Moved machine updating part from the previous patch. (Cedric)
* Refined code to avoid retouching by the next patch. (Joel)

Graeme Gregory (1):
  hw/arm/aspeed: add Qualcomm Firework BMC machine

Jae Hyun Yoo (2):
  hw/arm/aspeed: add support for the Qualcomm DC-SCM v1 board
  hw/arm/aspeed: firework: add I2C MUXes for VR channels

Maheswara Kurapati (4):
  hw/i2c: pmbus: Page #255 is valid page for read requests.
  hw/sensor: add Maxim MAX31785 device
  hw/arm/aspeed: Add MAX31785 Fan controllers
  hw/arm/aspeed: firework: Add Thermal Diodes

 hw/arm/Kconfig        |   2 +
 hw/arm/aspeed.c       |  95 ++++++-
 hw/i2c/pmbus_device.c |   6 +-
 hw/sensor/Kconfig     |   4 +
 hw/sensor/max31785.c  | 573 ++++++++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build |   1 +
 6 files changed, 674 insertions(+), 7 deletions(-)
 create mode 100644 hw/sensor/max31785.c

-- 
2.25.1


