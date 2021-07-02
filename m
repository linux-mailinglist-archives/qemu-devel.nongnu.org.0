Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018373BA0DA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:03:08 +0200 (CEST)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIp0-0001wv-W9
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm1-0007U2-Cg
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIly-0007dU-0T
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id u8so12342803wrq.8
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dqGbxye7js2RBDi8lhpqHU+wKrOnMQoqUNtyaQw45Sg=;
 b=njL16qmgLx1N+mCDMhlaqZBx8ngJZnDjkESI7HOQMyUQDg8fb/3cEoZ280r4H5LA3g
 fsYIeCR3l5oK4/G0lNK9nfTb+B41VBsbp1zx3IkB3S3ZQaP+2OeWGUpduND1SaGt8Ro8
 8eQfYGgLUUXkcyMYTNeTxUjemqoV4T6kbndl4vEe7HkHDz2Y15zg6JFXeKqh7ZkIsEL1
 +xcujCUWb8jIft1oAGwj+FCrC5BURRs7NBxCt8bowUnSBJec30fqNAzgnq8GLOVMYUGa
 TIIZM5HbdGIRuILDFSj+RnQ8jeLd1E9AinLahE/c5/c96LUBaphvqLq/KDl1iF6i8O0A
 YH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dqGbxye7js2RBDi8lhpqHU+wKrOnMQoqUNtyaQw45Sg=;
 b=o8cnzEUqPyGN0GtMxUqyO9ZFOQ+P1Ch9n74g3UtECilgdkWfSn0Li8dp6kw2tXZ8DG
 TzmHcJtTVyENeAivVjrPy2HMhYL2q1jH/N56ukqKk+/E/5vgMnM2GA4C/7DgY+Hd49Ak
 mxcwpD8AUsrPY2Y0FW1pNPFxg0H31RxxwOG5KuRqCDHndh5v0djzyWE6SP+N5IZWzQSR
 +8V99D/vvvCzgmte7rpmV4EY8DNg0RYhE6Hwi1iP+1/hZeQ0oWU0mfjLTHQIfWbufoEX
 nqfbVONozWs7Ikxoatv/oHFyR2Z7Z4oeIoHhZOGVWgQbYfFMOJeIcD5aRa+hda16JbuU
 n5bg==
X-Gm-Message-State: AOAM533zXh0RISdQvqzkkACSdhaUsFRonNK+Q/srSv2UMI79vK6WBrJo
 g+fseeCKRtrBONKMpkI1e5JnN9PkHfkjL2Y7
X-Google-Smtp-Source: ABdhPJyDeHTJTsesF/q+ZI88sfF+4uLHKS1WF4yKPO+CCl/JpupRyBOiTVzoB/WnIgu8gEHhG9uACg==
X-Received: by 2002:a5d:4492:: with SMTP id j18mr5631948wrq.151.1625230796313; 
 Fri, 02 Jul 2021 05:59:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.05.59.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:59:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] target-arm queue
Date: Fri,  2 Jul 2021 13:59:30 +0100
Message-Id: <20210702125954.13247-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 5a67d7735d4162630769ef495cf813244fc850df:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/tls-deps-pull-request' into staging (2021-07-02 08:22:39 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210702

for you to fetch changes up to 04ea4d3cfd0a21b248ece8eb7a9436a3d9898dd8:

  target/arm: Implement MVE shifts by register (2021-07-02 11:48:38 +0100)

----------------------------------------------------------------
target-arm queue:
 * more MVE instructions
 * hw/gpio/gpio_pwr: use shutdown function for reboot
 * target/arm: Check NaN mode before silencing NaN
 * tests: Boot and halt a Linux guest on the Raspberry Pi 2 machine
 * hw/arm: Add basic power management to raspi.
 * docs/system/arm: Add quanta-gbs-bmc, quanta-q7l1-bmc

----------------------------------------------------------------
Joe Komlodi (1):
      target/arm: Check NaN mode before silencing NaN

Maxim Uvarov (1):
      hw/gpio/gpio_pwr: use shutdown function for reboot

Nolan Leake (1):
      hw/arm: Add basic power management to raspi.

Patrick Venture (2):
      docs/system/arm: Add quanta-q7l1-bmc reference
      docs/system/arm: Add quanta-gbs-bmc reference

Peter Maydell (18):
      target/arm: Fix MVE widening/narrowing VLDR/VSTR offset calculation
      target/arm: Fix bugs in MVE VRMLALDAVH, VRMLSLDAVH
      target/arm: Make asimd_imm_const() public
      target/arm: Use asimd_imm_const for A64 decode
      target/arm: Use dup_const() instead of bitfield_replicate()
      target/arm: Implement MVE logical immediate insns
      target/arm: Implement MVE vector shift left by immediate insns
      target/arm: Implement MVE vector shift right by immediate insns
      target/arm: Implement MVE VSHLL
      target/arm: Implement MVE VSRI, VSLI
      target/arm: Implement MVE VSHRN, VRSHRN
      target/arm: Implement MVE saturating narrowing shifts
      target/arm: Implement MVE VSHLC
      target/arm: Implement MVE VADDLV
      target/arm: Implement MVE long shifts by immediate
      target/arm: Implement MVE long shifts by register
      target/arm: Implement MVE shifts by immediate
      target/arm: Implement MVE shifts by register

Philippe Mathieu-Daudé (1):
      tests: Boot and halt a Linux guest on the Raspberry Pi 2 machine

 docs/system/arm/aspeed.rst             |   1 +
 docs/system/arm/nuvoton.rst            |   5 +-
 include/hw/arm/bcm2835_peripherals.h   |   3 +-
 include/hw/misc/bcm2835_powermgt.h     |  29 ++
 target/arm/helper-mve.h                | 108 +++++++
 target/arm/translate.h                 |  41 +++
 target/arm/mve.decode                  | 177 ++++++++++-
 target/arm/t32.decode                  |  71 ++++-
 hw/arm/bcm2835_peripherals.c           |  13 +-
 hw/gpio/gpio_pwr.c                     |   2 +-
 hw/misc/bcm2835_powermgt.c             | 160 ++++++++++
 target/arm/helper-a64.c                |  12 +-
 target/arm/mve_helper.c                | 524 +++++++++++++++++++++++++++++++--
 target/arm/translate-a64.c             |  86 +-----
 target/arm/translate-mve.c             | 261 +++++++++++++++-
 target/arm/translate-neon.c            |  81 -----
 target/arm/translate.c                 | 327 +++++++++++++++++++-
 target/arm/vfp_helper.c                |  24 +-
 hw/misc/meson.build                    |   1 +
 tests/acceptance/boot_linux_console.py |  43 +++
 20 files changed, 1760 insertions(+), 209 deletions(-)
 create mode 100644 include/hw/misc/bcm2835_powermgt.h
 create mode 100644 hw/misc/bcm2835_powermgt.c

