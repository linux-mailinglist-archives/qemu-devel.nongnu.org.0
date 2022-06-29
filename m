Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA59F55F43A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:43:38 +0200 (CEST)
Received: from localhost ([::1]:47042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Oc5-00006Q-1M
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVL-0007RC-J6; Tue, 28 Jun 2022 23:36:39 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVJ-0006dT-L8; Tue, 28 Jun 2022 23:36:39 -0400
Received: by mail-pl1-x633.google.com with SMTP id n10so12915380plp.0;
 Tue, 28 Jun 2022 20:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9D9qpr+4Po4PpO7ogvqXcuW/WaNdEjS7iGqPsqrS3tI=;
 b=D3VgV8lL0e9762fOeXDNpo8nFDGk/39cz+/+2uOsmPpvbrZIYgHWh/EwfBm3sjy9fA
 6jM2NaI/37pzdPsIkshsGSgcTbYVxI+3iOW9FnqD7GhQWH3+aWSnBFpZ7N/CpWlUpdpZ
 Z5l+pq+17f464EVNXtEwCxWH05dHvUPetfpf6fmRaeAfayuhJ7HXbP6bdYpPyM23Yucc
 n39iv4kwh2sWS6p/3t6Fp0qWQVb/xHh3GOt1zqg1zzossWroQa8tSpvjsOUGH1eZtYgk
 zKDjnx2RsdE4Pnpoeh9tJ1D2qCWZLJFjVCjbJ84jKxiR0r8BGX82MDSiYLDJJ+llgdRG
 srNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9D9qpr+4Po4PpO7ogvqXcuW/WaNdEjS7iGqPsqrS3tI=;
 b=Cb4L+eVmxq1QybiLH7siBMjAjihW2pHOgRfS+M21KxRrrPtLt/kujzxWJE253AtdNL
 hBLcpcw11sFfUzsdhXv1r5Z2J7EyM6H893yry2oUmW+xAksybyEcKZxfLXiSSg2iWEkQ
 OD+asRnAXTYspfUOJaT2Cm1cwUsG55CqbKZkvs0Vhk6pAhjzhGmO3xZLDE71olzlgdOF
 fow4Nizp924do6QsfqiNjI3MXbh3OsD5UtnZmFqwZ7/xFBMik4f2uYWqSAP61k7avFqO
 17jeXvKLuzZ3e23eSTeB+ZmslGa6Qy/WIyJ2BdSodu8RJwuLu396jkB77Am8ylwCbElJ
 7AyQ==
X-Gm-Message-State: AJIora+CsZ8oVCnlfWtoAPMOiNAfq/DUd0i4rhaKIdWoi6j8SIchOLdb
 Rp8zr7RESIfBB5h452LiO64=
X-Google-Smtp-Source: AGRyM1u71V4vxyQSKMWC7iS+84Yk/+EuT5+mA7aT3nh6T/ggkRuG1FDQgfkPUyJSH0KQQXReJW7fzw==
X-Received: by 2002:a17:903:1c6:b0:16a:6941:10e8 with SMTP id
 e6-20020a17090301c600b0016a694110e8mr8360968plh.158.1656473795388; 
 Tue, 28 Jun 2022 20:36:35 -0700 (PDT)
Received: from localhost (fwdproxy-prn-010.fbsv.net.
 [2a03:2880:ff:a::face:b00c]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170902ff0f00b0016a84d232a6sm5897165plj.46.2022.06.28.20.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:35 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 00/13] hw/i2c/aspeed: Add new-registers DMA slave mode RX
 support
Date: Tue, 28 Jun 2022 20:36:21 -0700
Message-Id: <20220629033634.3850922-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hey Cedric,

I've gone over the patch series and reordered it a little better.

Changes since v1:
- Replaced printf's with qemu_log_mask or trace events.
- Added more detailed commit messages to several commits.
- Removed one unnecessary patch through reordering intel-me before oby35-cl.
- Replaced PECI register #define's with registerfields.h API.
- Renamed fby35-cpld to fby35-sb-cpld to be more specific.
- Moved the I2C patches to the start of the series, and the
  optional device/machine stuff to the end of the series.

If you'd like, I can separate this into separate patch series.

However, as I mentioned in the previous series, I was using oby35-cl to test
the I2C master and slave mode support in QEMU against Zephyr, and this patch
series includes everything put together.

Hopefully my patch series actually arrives in one piece this time.

Thanks,
Peter

v1: https://lore.kernel.org/qemu-devel/20220627195506.403715-1-pdel@fb.com/

Klaus Jensen (3):
  hw/i2c: support multiple masters
  hw/i2c: add asynchronous send
  hw/i2c/aspeed: add slave device in old register mode

Peter Delevoryas (10):
  hw/i2c/aspeed: Fix R_I2CD_FUN_CTRL reference
  hw/i2c/aspeed: Fix DMA len write-enable bit handling
  hw/i2c/aspeed: Fix MASTER_EN missing error message
  hw/i2c/aspeed: Add new-registers DMA slave mode RX support
  hw/i2c/pmbus: Reset out buf after switching pages
  hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
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
 hw/i2c/pmbus_device.c            |   6 +
 hw/i2c/smbus_slave.c             |   4 +
 hw/i2c/trace-events              |   2 +
 hw/misc/aspeed_peci.c            | 136 ++++++++++++++++++
 hw/misc/fby35_sb_cpld.c          | 128 +++++++++++++++++
 hw/misc/intel_me.c               | 162 +++++++++++++++++++++
 hw/misc/meson.build              |   5 +-
 hw/misc/trace-events             |  12 ++
 hw/nvram/eeprom_at24c.c          |   2 +
 hw/sensor/isl_pmbus_vr.c         |  31 ++++
 hw/sensor/lsm303dlhc_mag.c       |   2 +
 include/hw/arm/aspeed_soc.h      |   3 +
 include/hw/i2c/aspeed_i2c.h      |  11 ++
 include/hw/i2c/i2c.h             |  30 ++++
 include/hw/i2c/pmbus_device.h    |   1 +
 include/hw/misc/aspeed_peci.h    |  47 +++++++
 include/hw/sensor/isl_pmbus_vr.h |   1 +
 27 files changed, 950 insertions(+), 30 deletions(-)
 create mode 100644 hw/misc/aspeed_peci.c
 create mode 100644 hw/misc/fby35_sb_cpld.c
 create mode 100644 hw/misc/intel_me.c
 create mode 100644 include/hw/misc/aspeed_peci.h

-- 
2.30.2


