Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D918468FA5D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:44:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPtAU-0008Q6-J0; Wed, 08 Feb 2023 17:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qSXkYwYKCqodSdecbQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--titusr.bounces.google.com>)
 id 1pPtAT-0008Pr-2x
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:43:57 -0500
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qSXkYwYKCqodSdecbQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--titusr.bounces.google.com>)
 id 1pPtAR-0002fI-Iz
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:43:56 -0500
Received: by mail-ua1-x949.google.com with SMTP id
 l42-20020ab0166d000000b00445260e9ad6so124129uae.13
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r/00doHFcVzc4IB9itN8rc2KL7Q2cB+ydnX+2AslmSA=;
 b=gzaccR0OKY1Fdz0BZ0Jd+lnK3/1jGorNlMRwT1t+shazOTVhP4nM7DqqiOuyFz+NXv
 d6ISYb8VtWt3fM4xhptEMd35mFLJualp/LkzQ558rC41tBtg0UasmZ+9dEeYIBLtoteI
 99jM8ylT4T4mn6HmLZPmvIr7PAEmYldwM99vZEVtuiLhbprtXVFLfl7MCWGYba+4y+tC
 ZOE+0tYIuvMrxk4Er2f/MW/fT9kNbF/0tvdNd4B44ZE8iXVd7GC3yyyoFe9+mPKxnp0/
 Rg//4Zl9Lysi0/JatntYbktX+g0x6YVL51pX1ACXvajkD+D2ucF/iVtv5zCdvWvLhsM3
 0a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r/00doHFcVzc4IB9itN8rc2KL7Q2cB+ydnX+2AslmSA=;
 b=vrSxMvFBTfjJyC1tYvbut2cuahW7xOUneqLRM67n0v7kZV6u/TZTij7wOIKar2ISc3
 D/tDdPw2p5V2zy19wYuVPpw1Z6thNsk+sHw7GoP3QhoQQGeKC+agR34D4EWPxP8UUtNL
 Apq0kuhsTxerXiO95/urstycrUX/Kemy9jJ0QznJQrUe5rlGBIh8tpBHdvMQ1EEjNKs8
 J/7ZPGR0a/SJQkoT5iRY+6r1WnHp5/ja0QxzLS+0G6qTrlpEo3fDnV0AQgw7c461X+2d
 SXtZBGE8SSNu0pMNqhAeI8CizbUAV/nfBVLRXg2cc2tLr9e4kSQGqNksbJIntHKA9VQM
 5fTA==
X-Gm-Message-State: AO0yUKVGIQDZbk5t27mG9iIeedeWsqTjZZ1AI4n0gZzfGzH4S+guQPbl
 7Pm+gBGkUiiO6xoxgF3UhdviLomxk/I=
X-Google-Smtp-Source: AK7set9rgc8pmfvDF5G3ZptMEX0NplN15dQT5tscNlAgIeRP2X6/nTZNS0UY9qIvOAg4aYNthNDe3fOKabY=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:ab0:624e:0:b0:653:d63a:91da with SMTP id
 p14-20020ab0624e000000b00653d63a91damr2345902uao.28.1675896233452; Wed, 08
 Feb 2023 14:43:53 -0800 (PST)
Date: Wed,  8 Feb 2023 22:43:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230208224339.270589-1-titusr@google.com>
Subject: [PATCH v2 0/4] PCA I2C GPIO expanders
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3qSXkYwYKCqodSdecbQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--titusr.bounces.google.com;
 helo=mail-ua1-x949.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

The devices are configured as GPIO *inputs by default, but can have pins
configured to be inputs with qmp commands.

For example, the following snippet in a board file for a system,
configures a 16 bit pca6416 to have pins 8-11 as inputs, then asserts
them.

    dev = DEVICE(i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "pca6416", 0x72));
    object_property_set_uint(OBJECT(dev), "gpio_config", 0x0F00, &error_abort);
    object_property_set_uint(OBJECT(dev), "gpio_input", 0x0F00, &error_abort);

We currently use these to test hardware presence and LEDs in simulation.

Thanks

Since v1:
- addressed comments
- fixed typos in commit messages

Titus Rwantare (4):
  hw/gpio: add PCA6416 i2c GPIO expander
  hw/gpio: add PCA9538 8-bit GPIO expander
  hw/gpio: add PCA9536 i2c gpio expander
  hw/i2c: add canonical path to i2c event traces

 hw/arm/Kconfig                  |   1 +
 hw/gpio/Kconfig                 |   4 +
 hw/gpio/meson.build             |   1 +
 hw/gpio/pca_i2c_gpio.c          | 500 ++++++++++++++++++++++++++++++++
 hw/gpio/trace-events            |   5 +
 hw/i2c/core.c                   |   8 +-
 hw/i2c/trace-events             |   2 +-
 include/hw/gpio/pca_i2c_gpio.h  |  78 +++++
 tests/lcitool/libvirt-ci        |   2 +-
 tests/qtest/meson.build         |   1 +
 tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++
 11 files changed, 766 insertions(+), 5 deletions(-)
 create mode 100644 hw/gpio/pca_i2c_gpio.c
 create mode 100644 include/hw/gpio/pca_i2c_gpio.h
 create mode 100644 tests/qtest/pca_i2c_gpio-test.c

-- 
2.39.1.581.gbfd45094c4-goog


