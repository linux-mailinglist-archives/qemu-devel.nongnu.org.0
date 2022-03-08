Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CF84D200A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:22:06 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReTF-0008MV-KE
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:22:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReKx-0007Zo-I1
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:13:31 -0500
Received: from [2607:f8b0:4864:20::629] (port=46929
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReKt-0001vh-G9
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:13:31 -0500
Received: by mail-pl1-x629.google.com with SMTP id w4so7437421ply.13
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XSrHIfpNoZQYynTp2pRlpjeSkrLGOEf28Cr192QW7A=;
 b=PCMgiXLxp5CNG1LTrzvm5qWrAoCRQr6rmzQeARHcOjIlkv/y/2nflRooM0Gs10T4va
 7+1/Woa5bmMAXeOhUHaaF9NQlkHqmvtM83wJ6UDTRZIhGglz/DtHB2q+SU3XYf1XA1b2
 X1VmbUG/reTBmETik3qOjOKOOx3r/1OEh4Zb2F4/Z6dsB2DVU639xn1quv961864A82u
 NMfGwgQ328jamFyEWcCOGXbOUJoN6a4ARF+apew7lLsqTUn4NCf4l193GrQvj7r+co8x
 0u1uTVjL13HYz0qbW0yWxuu2/YY+FfNhbsmFtTlKRDV2xTHvYk8yD5Q3BJBOGu+JzJ/z
 npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XSrHIfpNoZQYynTp2pRlpjeSkrLGOEf28Cr192QW7A=;
 b=0Sfqt3Xax4QugX6iTdebamW8eoWiqDp9eZNXXKh2qpGc4jWxpnF8aJ7CSzE+A0RnlC
 LcvgvH8K9vdxDm+pEVT2KMVkAxpwUZnHsBWPmiLowGXVmMbJYuGvJFbyRsFq17NXOuet
 UBJOPsYufpy8TGpTqX9BsP7Skv8s2ZVwKjMx8290WSm2cdi9H84jQTHZ7fL7kou+wqlI
 DVhi8WcqW4PN8X1Vw+zSTrvI6FfgCRPc0pw+rcTCphK+JGwLAJzWSLqjO302tdF85DTU
 vB3IC5FNlf3egOX7fqfMIw+hxWwJvWl8gCPtl/90cfhgEJq/wyP2OkftdeAq2m4Ps6CQ
 dbhA==
X-Gm-Message-State: AOAM533N/G+VhLHLFQsvrEc5DCxT/eoYYTblaw9NVZCUtiyaClWpy5Au
 bNvTP3Mj+jdBz/BauoOqe96FUyGtTEA=
X-Google-Smtp-Source: ABdhPJyzqeTrTgoin2V+8lSfsnM5ulLFNXYUH1Au1lvgM4N1UaJtFEgIIs8p6WOfNDAT6L7MT2xCfQ==
X-Received: by 2002:a17:902:ba8e:b0:151:ed65:fda4 with SMTP id
 k14-20020a170902ba8e00b00151ed65fda4mr10717906pls.127.1646763206024; 
 Tue, 08 Mar 2022 10:13:26 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 i187-20020a626dc4000000b004f6e0f346e7sm11980779pfc.39.2022.03.08.10.13.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Mar 2022 10:13:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] I²C / SMBus / PMBus patches for 2022-03-08
Date: Tue,  8 Mar 2022 19:13:11 +0100
Message-Id: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Titus Rwantare <titusr@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit 9740b907a5363c06ecf61e08b21966a81eb0dab4:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220307' into staging (2022-03-08 15:26:10 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/pmbus-20220308

for you to fetch changes up to 5f14cd7032beab6cac8d7ed1b09efc58baddb48c:

  hw/sensor: add Renesas raa228000 device (2022-03-08 18:46:48 +0100)

----------------------------------------------------------------
I²C / SMBus / PMBus patches

- Add some Renesas models
- Add Titus Rwantare to MAINTAINERS

----------------------------------------------------------------

Shengtan Mao (1):
  hw/i2c: Added linear mode translation for pmbus devices

Titus Rwantare (8):
  hw/i2c: pmbus: add registers
  hw/i2c: pmbus: fix error returns and guard against out of range
    accesses
  hw/i2c: pmbus: add PEC unsupported warning
  hw/i2c: pmbus: refactor uint handling
  hw/i2c: pmbus: update MAINTAINERS
  hw/sensor: add Intersil ISL69260 device model
  hw/sensor: add Renesas raa229004 PMBus device
  hw/sensor: add Renesas raa228000 device

 MAINTAINERS                      |  13 +
 hw/arm/Kconfig                   |   1 +
 hw/i2c/pmbus_device.c            | 112 +++++++-
 hw/sensor/Kconfig                |   4 +
 hw/sensor/isl_pmbus_vr.c         | 279 ++++++++++++++++++
 hw/sensor/meson.build            |   1 +
 include/hw/i2c/pmbus_device.h    |  25 +-
 include/hw/sensor/isl_pmbus_vr.h |  52 ++++
 tests/qtest/isl_pmbus_vr-test.c  | 474 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 10 files changed, 948 insertions(+), 14 deletions(-)
 create mode 100644 hw/sensor/isl_pmbus_vr.c
 create mode 100644 include/hw/sensor/isl_pmbus_vr.h
 create mode 100644 tests/qtest/isl_pmbus_vr-test.c

-- 
2.34.1


