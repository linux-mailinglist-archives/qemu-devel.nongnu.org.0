Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0211FC5D4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 07:53:46 +0200 (CEST)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlR17-0004Fg-Fv
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 01:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzb-0002RU-VL; Wed, 17 Jun 2020 01:52:11 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzZ-0004QJ-TK; Wed, 17 Jun 2020 01:52:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id f185so623244wmf.3;
 Tue, 16 Jun 2020 22:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4jthcsWCc1LZ6kfAfQ/ELBbOn8lAcaBf32TtFDc06Q=;
 b=u8ol6OqaVITte9oQ0eVUQTo+39E2ZT3Q2LDeraR+ZEU7c7T9o6RoGGZyAJ5bMlB3Uh
 uMVFQVTAL3SF86rL2C6lb/k4FujU9/+O1dAfiW9wo+s+hS6qECuBPpVJEU4/qCDg4uEp
 QGjLxLamO28sciwx9CVvoc/ur4J6NiTxIpi+hPXe19oLrIIcdi9mnqkYGtfAJBLRkBdK
 ApNccln2wMp4lBqGFJ1xOaedxQl++vIebqSUdEj7BYaVzPwZ66bHs2iZkQF0uDgqPsgB
 U67cHdEAWcZ1f021fmMOUyg9ZqjxieAVbTk5j8CMlfRB8bWpTMNApqKOd4xV/V6B3H0x
 /Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=F4jthcsWCc1LZ6kfAfQ/ELBbOn8lAcaBf32TtFDc06Q=;
 b=uTU7KemS/Gl7t1Yx8UYxg5/0aSZeHqUITyfm8gKBlx2WjJ3rU4jPpYECBQhQ5LfErQ
 B45a3irbkG10w8F/akgUmxPx9gDzFZX5eKD3kKDeL3EsafjJfAwmsWcN7lBf3V1P43ng
 GTmK0iX6it8woYpUAW2rhYkujj2WbCZfmJtEV4hZieUEzwooohZlFjTmts7BecYPNCMy
 8ZYiSLU6hAAMvxYh7KB6y4isSW88BAKFZVdW65Ap1oedac3r7RXic41+QHxIvyjnHHIR
 w8of7I17i6nV3berSw3r/k39O8xah5LLeST6946ZjU6oKQCyspHfISB/OtT+76oV1pfD
 f82g==
X-Gm-Message-State: AOAM533DPQq3mEHfrB4DMphaaD9e+AylVY/LsNlf7lPNFJrtt8SenbD3
 Qqdh8xeJ7AkhI++VT7YsL2gj6SuG
X-Google-Smtp-Source: ABdhPJw4uYuEMPWtcRImjTEw2mfW9bPJUY2OHhBlb8Wi8U21DcRMToKLvGDBSZ0jwZTdXqbSOAlLZQ==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr6325648wmi.7.1592373128060;
 Tue, 16 Jun 2020 22:52:08 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id d28sm3000809wrc.50.2020.06.16.22.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 22:52:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/14] mps2: Add few more peripherals
Date: Wed, 17 Jun 2020 07:51:51 +0200
Message-Id: <20200617055205.3576-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Few patches while playing with Zephyr on the MPS2:

- clean 'versatile_i2c' a bit,
- describe it as 'ARM SBCon two-wire serial bus interface'
  which is common on the ARM documentation,
- add watchdog
- added fpgaio with correct prescale clk
- added i2c and spi
- added gpio/i2s as unimp
- dropped the fpgaio push-button patch

Zephyr ressources used:
https://docs.zephyrproject.org/latest/boards/arm/mps2_an385/doc/index.html

Philippe Mathieu-Daudé (14):
  hw/watchdog/cmsdk-apb-watchdog: Add trace event for lock status
  hw/i2c/versatile_i2c: Add definitions for register addresses
  hw/i2c/versatile_i2c: Add SCL/SDA definitions
  hw/i2c: Add header for ARM SBCon two-wire serial bus interface
  hw/arm: Use TYPE_VERSATILE_I2C instead of hardcoded string
  hw/arm/mps2: Document CMSDK/FPGA APB subsystem sections
  hw/arm/mps2: Rename CMSDK AHB peripheral region
  hw/arm/mps2: Add CMSDK APB watchdog device
  hw/arm/mps2: Add CMSDK AHB GPIO peripherals as unimplemented devices
  hw/arm/mps2: Map the FPGA I/O block
  hw/arm/mps2: Add SPI devices
  hw/arm/mps2: Add I2C devices
  hw/arm/mps2: Add audio I2S interface as unimplemented device
  hw/arm/mps2-tz: Use the ARM SBCon two-wire serial bus interface

 include/hw/i2c/arm_sbcon_i2c.h   | 35 +++++++++++++++++
 hw/arm/mps2-tz.c                 | 23 ++++++++---
 hw/arm/mps2.c                    | 65 ++++++++++++++++++++++++++++++--
 hw/arm/realview.c                |  3 +-
 hw/arm/versatilepb.c             |  3 +-
 hw/arm/vexpress.c                |  3 +-
 hw/i2c/versatile_i2c.c           | 38 ++++++++++---------
 hw/watchdog/cmsdk-apb-watchdog.c |  1 +
 MAINTAINERS                      |  1 +
 hw/arm/Kconfig                   |  1 +
 hw/watchdog/trace-events         |  1 +
 11 files changed, 144 insertions(+), 30 deletions(-)
 create mode 100644 include/hw/i2c/arm_sbcon_i2c.h

-- 
2.21.3


