Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F7403187
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 01:29:04 +0200 (CEST)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNkWV-0004hL-5I
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 19:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JPU3YQgKCv01zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU4-0000GT-AC
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:26:32 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:49801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JPU3YQgKCv01zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU2-0003zu-N3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 19:26:32 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 z6-20020a257e06000000b0059bad6decfbso168680ybc.16
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 16:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=gcg2LCsrx72JmLSBueLTYl9KZ6RXoGSsUJdE5lrZ93A=;
 b=pq4pJ9AbqMNsDeApPEuGnnSEJgYqJqjgf+CGSGX9M5yi9PDWQieHuf/S441g85+tLT
 lEYkftVXiaKl8H+y8BJa8gT02DaYrpNy0k+4xoke9o8MV0Ov9SLJAC0HGzPsrXeKl4qf
 4QI9isWoOPvG4PDs6RaL+x4zy1mIcBVy35CDYe8W7wYChtXm4Zd7gz25thIbhLNdhpVy
 Kgu7VtXFHBcFhx4Dxk/y7+R/se73hB3znFtQ4PcEyHurMvLv49o6SdvOSYffTU0wapy4
 Jsi7xpIcqpcxhjJiMFSgeSQaEancLteQ3feclf+tueZc0XrcaWQ7mDGxmwrDwupkW85z
 iR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=gcg2LCsrx72JmLSBueLTYl9KZ6RXoGSsUJdE5lrZ93A=;
 b=olovidqrOpRwCHZH8vRrQbgK4Jxgj0ecovJNi8zYw/HS4YUeUvkQVd1Vsd3JCzlvnM
 SMINwG3QwxTmWj6kKvjcdV19nYsUqQ5H86JaRNquhgz8Io9MVUPhv/QNUyF37joAOLUV
 9vhBOYF5rc44L5Fjgo9gpb5Ozwfe/AMuKIxOtgdzELEAOQn3w0xKZoaOtrpkfVyXL9m8
 oO+ppWAdAikVQ+j9xQ2gLQynP34eIyO7ZablemISVC28TorW6Ft7E1sAb/3tbwy+Svcl
 KiJDaw7pxjEXnBldYsc+rXZtxOIGYvxuFNadGmbya0/ROIw7T3nACHAJ+Gxe1P5pG08q
 awPA==
X-Gm-Message-State: AOAM530fD6s0chnZLIpgda0X8mTm1JO+ShwGYBFuhKrF5xi3W/1aagEy
 8VI8XVXeOcNlLEi+NJDYWv3GeehjzV5MaQ==
X-Google-Smtp-Source: ABdhPJxeDNTKK+j8e22j62YX8im+QS1Vuku6hCUBmUmQQgVewcApVx7EGHW0KDtSUbpvSVftNEfpuvLFyowL0w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:61c7:: with SMTP id
 v190mr1120210ybb.215.1631057188836; Tue, 07 Sep 2021 16:26:28 -0700 (PDT)
Date: Tue,  7 Sep 2021 16:25:51 -0700
Message-Id: <20210907232555.3268967-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH 0/4] hw/arm: Add MMC device for NPCM7XX boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3JPU3YQgKCv01zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set implements the Nuvoton MMC device
for NPCM7XX boards.

The MMC device is compatible with the SDHCI interface
in QEMU. It allows the user to attach an SD card image
to it.

Shengtan Mao (4):
  tests/qtest/libqos: add SDHCI commands
  hw/sd: add nuvoton MMC
  hw/arm: Attach MMC to quanta-gbs-bmc
  tests/qtest: add qtests for npcm7xx sdhci

 hw/arm/npcm7xx.c                 |  12 +-
 hw/arm/npcm7xx_boards.c          |  21 ++++
 hw/sd/meson.build                |   1 +
 hw/sd/npcm7xx_sdhci.c            | 131 ++++++++++++++++++++
 include/hw/arm/npcm7xx.h         |   2 +
 include/hw/sd/npcm7xx_sdhci.h    |  65 ++++++++++
 tests/qtest/libqos/meson.build   |   1 +
 tests/qtest/libqos/sdhci-cmd.c   | 116 ++++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.h   |  70 +++++++++++
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 201 +++++++++++++++++++++++++++++++
 11 files changed, 620 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

-- 
2.33.0.153.gba50c8fa24-goog


