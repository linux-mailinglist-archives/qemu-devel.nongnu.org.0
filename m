Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0C6C2422
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:56:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNTa-0005Wf-I9; Mon, 20 Mar 2023 17:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UNYYZAYKCoc4t4532rzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1peNTX-0005UX-Lt
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:32 -0400
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UNYYZAYKCoc4t4532rzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1peNTW-0006YR-2i
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:31 -0400
Received: by mail-vs1-xe49.google.com with SMTP id
 h25-20020a67c199000000b00426372db235so813132vsj.10
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679349328;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9TQ8MIG/ABiPoAVWjvrkNmohRgr/91qEVY2JL4G1ozA=;
 b=QxbTy5+8J7w3g3x2kBgVlDZo3XSpom3nCLSqkP1qtfDkC5RIb+Osyu7K/BbzIueOMo
 h6MO1ChS6v5pgcvuWur6Gu0vLulJywwCBICsv6pNweldE4AH/BpfDXDpDfzTgp93hG27
 ylRvdJkKr+mhGLBr8TV9cSsR7lsu1BzWUvI1BI6zd/F8e6EwbTZJ5WlJAs8K8xTTpcNW
 s0lLD+XBlF3Sfamqw5mK59g5ENKkRUs9LuNsq29TtMbC0793Hb2iAeUcV9wIXh4k0Add
 JC3MqrirrNu9vu5SJLXCNDlbp4EioRg1pB/+svpj+r1vezpUdKAnec6f0r4YObMkXs7d
 LVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679349328;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9TQ8MIG/ABiPoAVWjvrkNmohRgr/91qEVY2JL4G1ozA=;
 b=SZhTQvUG3BXrC7m4BmlG+TrDIWr4nQN6JFw8sst4kmu/RvPW0C6uT7sjMbsMbZPkRq
 IhJY7Lnoa6XoH+3EUbwPnSodeA7kP2El95Slf2CuZX0Vr/bAfu3eQ4+jKk07WvkgbN4K
 UPnn7V6PiWc6llbXwLLn7LnewIifAM7h1E33Rb/1+qLzh1Z5apqmJ8BVDhDhQTiSetWP
 HCSyEIbDiIBvVwMnrr10aj4KfdyL/QtHKoxfaTxdsYoycS7OD7zI3bvkQN3eZKpvhZqJ
 5zo6/lcrXRsdBO0Hl64lzJVUfYa2FG5W5rHTBSZhJ3Oq7FsS9hfcTXVOzOJ2grcDzJtF
 wcMw==
X-Gm-Message-State: AO0yUKWxlWyYUnFcWI8mpGbOFJpZn3zS2q7YN4Gx9qOAPaxtLzWFLq+u
 aHt+LdrtZpL+qcVRsLj1S4P/GBmmstk=
X-Google-Smtp-Source: AK7set+KntFTl7550TE6WK2CPIPoICVU0Qoy+PtrD7tkib7dWcnlThqMtSS1MDFApQ9NdWL6HpNCD2WI4b8=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a1f:aa15:0:b0:432:6b9b:bbd8 with SMTP id
 t21-20020a1faa15000000b004326b9bbbd8mr103223vke.1.1679349328173; Mon, 20 Mar
 2023 14:55:28 -0700 (PDT)
Date: Mon, 20 Mar 2023 21:54:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230320215500.722960-1-titusr@google.com>
Subject: [PATCH v3 0/5] PCA I2C GPIO expanders
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e49;
 envelope-from=3UNYYZAYKCoc4t4532rzzrwp.nzx1px5-op6pwyzyry5.z2r@flex--titusr.bounces.google.com;
 helo=mail-vs1-xe49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This patch series contains a set of i2c GPIO expanders,
with support for 4, 8, and 16 GPIO connections.

The devices are configured as GPIO inputs by default, but can have pins
configured to be inputs with qmp commands.

For example, the following snippet in a board file for a system,
configures a 16 bit pca6416 to have pins 8-11 as inputs, then asserts
them.

    dev = DEVICE(i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "pca6416", 0x72));
    object_property_set_uint(OBJECT(dev), "gpio_config", 0x0F00, &error_abort);
    object_property_set_uint(OBJECT(dev), "gpio_input", 0x0F00, &error_abort);

We currently use these to test hardware presence and LEDs in simulation.

Thanks

Since v2:
- switched to extract / deposit API
- added deposit16 to bitops.h
- squashed PCA9538 patch into PCA6416 to use the same send and recv
  functions
- updated unit tests use asymmetric 16-bit test values
- add patch to imply I2C devices on NPCM7xx boards

Since v1:
- addressed comments
- fixed typos in commit messages

Titus Rwantare (5):
  bitops.h: add deposit16 function
  hw/gpio: add PCA953x i2c GPIO expanders
  hw/gpio: add PCA9536 i2c gpio expander
  hw/i2c: add canonical path to i2c event traces
  hw/arm: imply I2C_DEVICES on NPCM7xx

 hw/arm/Kconfig                  |   1 +
 hw/gpio/Kconfig                 |   5 +
 hw/gpio/meson.build             |   1 +
 hw/gpio/pca_i2c_gpio.c          | 410 ++++++++++++++++++++++++++++++++
 hw/gpio/trace-events            |   5 +
 hw/i2c/core.c                   |   8 +-
 hw/i2c/trace-events             |   2 +-
 include/hw/gpio/pca_i2c_gpio.h  |  69 ++++++
 include/qemu/bitops.h           |  26 ++
 roms/edk2                       |   2 +-
 roms/openbios                   |   2 +-
 roms/opensbi                    |   2 +-
 roms/seabios                    |   2 +-
 tests/qtest/meson.build         |   1 +
 tests/qtest/pca_i2c_gpio-test.c | 188 +++++++++++++++
 15 files changed, 716 insertions(+), 8 deletions(-)
 create mode 100644 hw/gpio/pca_i2c_gpio.c
 create mode 100644 include/hw/gpio/pca_i2c_gpio.h
 create mode 100644 tests/qtest/pca_i2c_gpio-test.c

-- 
2.40.0.rc1.284.g88254d51c5-goog


