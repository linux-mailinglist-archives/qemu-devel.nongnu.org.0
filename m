Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDFB42614B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 02:28:44 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYdkg-0003Eb-Ff
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 20:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RpBfYQgKCvUtreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1mYdis-0000xf-NS
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 20:26:50 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:34590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RpBfYQgKCvUtreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1mYdir-000405-8R
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 20:26:50 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 x16-20020a25b910000000b005b6b7f2f91cso10374379ybj.1
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 17:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=TuPEeIEeVSnqNB+3esNi6ppd+lL7fEfaQ5/f6mFeSPk=;
 b=fk9EmyublAWUP7fzsdXs0gsqMGzq/fW86Lgg+/LthY9V+vP9achKLy+1uQDgB9rn/3
 FagMuuARtHymFa7HLM9/i5ZgDmklH3ze7RLSg9P7uVcWEQBJyB+KnNtntOgOEnYM8r+A
 H+lRNth7EzV2mscCyksiwlaLs4X0kRgMKVJU7NHLCUSeKD/Z6Gq2xg6bHlc7ZDVKQT5i
 6D5bXjdkr1pJ78ov0DduVUytRbL0r65soW/jNu/jhtD6bwoacqTWHgf3en7n7G5Jz8vm
 JBFFVahbhbrRPoK0iHYnJxChI8pXOcha22SKY2G/yR5Eyq1DEgiHZj3BT6WTQs1HhJNE
 09iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=TuPEeIEeVSnqNB+3esNi6ppd+lL7fEfaQ5/f6mFeSPk=;
 b=WZBpgqjb8qHyMwxPNxXtB4Z749/Z9RMaKWOLc8Blc+KttQcUbCnpq+lJe1kEryAq+o
 xw7hHsvdM+AiboiurITkonAC/pceWI7SCbk8D7vRt4MXVvRiiQ/Ssfv7a+2PbUDpzTut
 jaKni2XeYSNeaFq2VkbMwIGMOqZHM/1MJqNBDqAd213CZYnMAwCTPNCmKtjPEZAT0hOU
 Co0u7m8BIb8yW63yJXsUe+4nTLBtRL1cK3xL1ArgjgR070HcwlXtNboU1PbyFR0ZRM/x
 WgYcx/QJp3G0OAFP6eQEc5Z929FGpi3qhTHx94e+R0cvo9Yx9fv7h4Vh7YuAQ+vXmo1A
 KrCg==
X-Gm-Message-State: AOAM532mYaI8Y1iiLofpVoTUoAwUV6Pzqg3TyvrSTzklAtgWSQgE4Oab
 FRA14KgW+HeYA1otN+NUsqmoWvWZVDLDaA==
X-Google-Smtp-Source: ABdhPJyLCsn1kFjC/vqWppWSTBYmeVSzFYtckVuZXHOQ8PYUJwssYxLRm3olceQ5+zAY9pnEcn3UP7eNYDM/RQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:2681:: with SMTP id
 m123mr130977ybm.7.1633652806630; Thu, 07 Oct 2021 17:26:46 -0700 (PDT)
Date: Thu,  7 Oct 2021 17:26:23 -0700
Message-Id: <20211008002628.1958285-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 0/5] hw/arm: Add MMC device for NPCM7XX boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3RpBfYQgKCvUtreXlqpedlldib.Zljnbjr-absbiklkdkr.lod@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Changes since v1:
1. Rearrange the "add SDHCI commands" to just before when it's
   actually used.
2. Add standrad SDHCI MMIO as subregion, similar to cadence_sdhci.
e. Add a vmstate for NPCM7XX SDHCI.
4. Address various minor fixes suggested by Peter Maydell.

Shengtan Mao (5):
  hw/sd: add nuvoton MMC
  hw/arm: Add Nuvoton SD module to board
  hw/arm: Attach MMC to quanta-gbs-bmc
  tests/qtest/libqos: add SDHCI commands
  tests/qtest: add qtests for npcm7xx sdhci

 hw/arm/npcm7xx.c                 |  12 +-
 hw/arm/npcm7xx_boards.c          |  20 +++
 hw/sd/meson.build                |   1 +
 hw/sd/npcm7xx_sdhci.c            | 182 +++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h         |   2 +
 include/hw/sd/npcm7xx_sdhci.h    |  65 ++++++++++
 tests/qtest/libqos/meson.build   |   1 +
 tests/qtest/libqos/sdhci-cmd.c   | 116 +++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.h   |  70 +++++++++++
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 209 +++++++++++++++++++++++++++++++
 11 files changed, 678 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

-- 
2.33.0.882.g93a45727a2-goog


