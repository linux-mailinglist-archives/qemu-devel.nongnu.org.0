Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB168FBAE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 00:55:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPuH5-0002Tr-Rb; Wed, 08 Feb 2023 18:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PTbkYwgKCmAUSF8MRQFEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--wuhaotsh.bounces.google.com>)
 id 1pPuGy-0002Ru-GE
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:54:45 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PTbkYwgKCmAUSF8MRQFEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--wuhaotsh.bounces.google.com>)
 id 1pPuGu-0003U4-Ea
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:54:43 -0500
Received: by mail-pg1-x549.google.com with SMTP id
 f19-20020a631013000000b004e8c27fa528so230529pgl.17
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 15:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1675900477;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=POZ93p9zftXIYOaqzhswzbaseGp2hKv+gLQb0c30ivU=;
 b=eMxRcRz5w0igN4gCVMKKGqSVWA1/u77HGygsVDVfSjGarbxpSu+6KdryMUdz5O7uhk
 qznHFS5LnBmGAKTPnhZsOhMcYRl/peWjTL0Iki841mK71uGh/DV6C+5l50JzDrgebTAR
 Crx8X7nzoEd0xeuZXAcPEGQ/1tqaHbG7DoroWZvDMAShki94b3fXkTu0PdeqfLqKhRXN
 xBoiqpsanJxcZDOCCYR6q+t+evMKcG9k8ZJaLBnOC+YyRf8zk66sNfFYTM2y6LfANPQ0
 kDHVCc8Jbr3BwUSBm3Snq9kI0IopMa137bmal56lDb/duEGNKS9ts+1yvAXdofgWWug7
 kl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675900477;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=POZ93p9zftXIYOaqzhswzbaseGp2hKv+gLQb0c30ivU=;
 b=PjEI0lVauhxQPW/fIcO1ylSVtmHsTqvcGK2bRqwxQvbql8GgF2hmFRaLY8+ZHIF5bq
 2qY42lKjxUq6v9HnBlMSQcCaLXOYGKW0kK0NwpCAvUFYkcsBMzjvMcvxO1cMXmz54wef
 Uq5hYhBVJWXV6QW56TXGmdjwZ67ecW+Eu9vg6pg+jVT76mqDF8V7uT11yR6httDSHzzq
 zrM3TrS6U5hG5FoB1rqyUVEGFeAJyHKsiK4rZj3lgLCcTbRvUzm2aWM3ltlHWmEeg25X
 K6nj6JZpG6Pi4aixjMLIl2h0sr8NouAYKicsh2yRnAoRmux3YTnBYfWYA9o+SHzE653+
 qybA==
X-Gm-Message-State: AO0yUKU0KoL4ytsXVM++Acuc+kly0OTln+IF3+a1Sx8GoBA6m2Vb2N9y
 +1cLZBrbx5SQoDulMx/3XWplTztBFNOYEQ==
X-Google-Smtp-Source: AK7set/tDYesOYqSKm5RXV0ESB4FP1ml+7gUaOJycAV2XB0wYmpHyz9ipQBmlfVTG05oBhrzbuPwTa1M5uyxfQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:1b83:0:b0:593:fa6a:b960 with SMTP id
 b125-20020a621b83000000b00593fa6ab960mr1998772pfb.48.1675900477078; Wed, 08
 Feb 2023 15:54:37 -0800 (PST)
Date: Wed,  8 Feb 2023 15:54:30 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230208235433.3989937-1-wuhaotsh@google.com>
Subject: [PATCH v3 0/3] Nuvoton Peripheral SPI (PSPI) Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3PTbkYwgKCmAUSF8MRQFEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
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

This patch set adds peripheral SPI (PSPI) modules
to NPCM7XX SoCs. These modules can be used to
connect any SPI peripheral devices to the SoC.

This module will also be used in the next generation
NPCM8XX SoCs which haven't been merged yet.

-- Changes from v2 --
Change max_access_size to 2 to match the datasheet.

-- Changes from v1 --
A few minor updates for npcm-pspi.c according to
Phillipe Mathieu-Daude's review.

Thanks!

Hao Wu (3):
  MAINTAINERS: Add myself to maintainers and remove Havard
  hw/ssi: Add Nuvoton PSPI Module
  hw/arm: Attach PSPI module to NPCM7XX SoC

 MAINTAINERS                 |   8 +-
 docs/system/arm/nuvoton.rst |   2 +-
 hw/arm/npcm7xx.c            |  25 +++-
 hw/ssi/meson.build          |   2 +-
 hw/ssi/npcm_pspi.c          | 221 ++++++++++++++++++++++++++++++++++++
 hw/ssi/trace-events         |   5 +
 include/hw/arm/npcm7xx.h    |   2 +
 include/hw/ssi/npcm_pspi.h  |  53 +++++++++
 8 files changed, 310 insertions(+), 8 deletions(-)
 create mode 100644 hw/ssi/npcm_pspi.c
 create mode 100644 include/hw/ssi/npcm_pspi.h

-- 
2.39.1.519.gcb327c4b5f-goog


