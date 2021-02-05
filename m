Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8935310F1B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:51:31 +0100 (CET)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85GU-0004XC-Ca
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T8-0006aq-W3
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:35 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T1-0003yZ-JP
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c12so8437980wrc.7
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUlsGvpp5+oODs5Rgveyx+h1Nh5myXtjIPDeTuOs1r8=;
 b=yhh3xWdzI8DhxCdXIggIVuukwnHlgsiQm3yqrr2FGA4BlUBe+6gYjPse9F6+D0kfYO
 YgxSP2fEidWq5QaZieNTN3HpTuuoxd6zXLxDDWOAVQ4WCc0ZtKY6fjRzsccQ4QLA8fxX
 K1V3zcIsWWqmzv9YAKmTEXTTXhuzlr3SjCM222x2RNalNc+UAy/eWKiBq/tFwpF4WVGe
 Xwmb04E17OmuYwUIQBqa4PgTeHeb84iUApY48Ud3/e9jir1cvjc+IziwIMOnydfO0q90
 HyOVRFvXHtSm1sHxiYjnFZ1UI/d6fHwAwNLk4rz4B6kU18mzbCq8iU3CMNS+MCq9mGjX
 67cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUlsGvpp5+oODs5Rgveyx+h1Nh5myXtjIPDeTuOs1r8=;
 b=Ym20t8icDyZz6U2Bh16nvSbF76Zn3eAtgcoa5uK1IG3vdy4JtiWvg2ER3K3GB1fcPM
 iL05p+ZcUS5jFIfWap/lfE1VvOMST461xtI3y9R9TdS1t/jOUnZtyhzbuQ3ZR5u2Ssk7
 Dw+HswhQGDS8pd4A0ecF+SUrOIlFbnKp/c3yZWBfyNqqDobFshzZgLkCqjjjCJayD4DE
 jlVQNNswDDgR4qzYC8qEcbIa3xpGdKi4a1UogXalBbyxk1eeOQKFhcCe6tSxMsGRrUv+
 4Xv40pVJgAzF+Otalknl+2CZBQLujastUdA2KnyXhdcp+zNTCwShiACB4yN0lmi0/461
 FGcQ==
X-Gm-Message-State: AOAM531DJszJPPaSKVreUQwQA/5Od5sJa2SevBR2StsmdLUrIgaC1CRk
 GJYhxqVJksMOeTAdxBT0jLo25Pd2MaEXCA==
X-Google-Smtp-Source: ABdhPJz1BmZwMTC/i+OmmASCdCslq5usW6QtwW+ROKcEQsD+BkKjl0miDBa9EttQCULPv21HuCCk8Q==
X-Received: by 2002:a05:6000:1045:: with SMTP id
 c5mr6274133wrx.250.1612544421732; 
 Fri, 05 Feb 2021 09:00:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/24] hw/arm: New board model mps3-an524
Date: Fri,  5 Feb 2021 16:59:55 +0000
Message-Id: <20210205170019.25319-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

This patchseries implements a new board model in the mps2/mps3 family,
based on Application Note AN524:
https://developer.arm.com/documentation/dai0524/latest/

Like the other MPS models, this board is an FPGA image; the AN524
image is based on the SSE-200, like the mps2-an521, but it is
for the MPS3 board rather than the MPS2+. The major differences
are QSPI flash and USB (which we don't model), and support for
2GB of RAM (which we do). Since the MPS3 is very similar to the
MPS2, I've implemented mps3-an524 as a subclass of TYPE_MPS2TZ_MACHINE,
sharing most of the code with mps2-an505 and mps2-an521.

The motivation for this model is two-fold:
 * Linaro's Zephyr team would like it, so they can test their
   code targeting the MPS3 on QEMU
 * It's a useful stepping-stone towards a future MPS family model
   which uses the SSE-300 and Cortex-M55. All the "make various bits
   of mps2-tz.c be driven by per-board data structures rather than
   hardcoding them" changes will be needed for that future board model.
   This way they can be code-reviewed now, rather than making the
   future patchseries even bigger (it will be pretty large even so,
   because of all the "implement SSE-300 model" patches).

This model can run the parts of the AN524 selftest image that
would be expected to work, i.e. the ones that don't rely on things
QEMU doesn't implement. (The selftest is part of the AN524
download so it's behind a EULA click-through and we can't put it
into an acceptance test. We might be able to get something
based on Zephyr or Arm TFM.)

thanks
-- PMM

Peter Maydell (24):
  hw/arm/mps2-tz: Make SYSCLK frequency board-specific
  hw/misc/mps2-scc: Support configurable number of OSCCLK values
  hw/arm/mps2-tz: Correct the OSCCLK settings for mps2-an505 and
    mps2-an511
  hw/arm/mps2-tz: Make the OSCCLK settings be configurable per-board
  hw/misc/mps2-fpgaio: Make number of LEDs configurable by board
  hw/misc/mps2-fpgaio: Support SWITCH register
  hw/arm/mps2-tz: Make FPGAIO switch and LED config per-board
  hw/arm/mps2-tz: Condition IRQ splitting on number of CPUs, not board
    type
  hw/arm/mps2-tz: Make number of IRQs board-specific
  hw/misc/mps2-scc: Implement CFG_REG5 and CFG_REG6 for MPS3 AN524
  hw/arm/mps2-tz: Correct wrong interrupt numbers for DMA and SPI
  hw/arm/mps2-tz: Allow PPCPortInfo structures to specify device
    interrupts
  hw/arm/mps2-tz: Move device IRQ info to data structures
  hw/arm/mps2-tz: Size the uart-irq-orgate based on the number of UARTs
  hw/arm/mps2-tz: Allow boards to have different PPCInfo data
  hw/arm/mps2-tz: Make RAM arrangement board-specific
  hw/arm/mps2-tz: Set MachineClass default_ram info from RAMInfo data
  hw/arm/mps2-tz: Support ROMs as well as RAMs
  hw/arm/mps2-tz: Get armv7m_load_kernel() size argument from RAMInfo
  hw/arm/mps2-tz: Add new mps3-an524 board
  hw/arm/mps2-tz: Stub out USB controller for mps3-an524
  hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
  docs/system/arm/mps2.rst: Document the new mps3-an524 board
  hw/arm/mps2: Update old infocenter.arm.com URLs

 docs/system/arm/mps2.rst         |  24 +-
 include/hw/arm/armsse.h          |   4 +-
 include/hw/misc/armsse-cpuid.h   |   2 +-
 include/hw/misc/armsse-mhu.h     |   2 +-
 include/hw/misc/iotkit-secctl.h  |   2 +-
 include/hw/misc/iotkit-sysctl.h  |   2 +-
 include/hw/misc/iotkit-sysinfo.h |   2 +-
 include/hw/misc/mps2-fpgaio.h    |   8 +-
 include/hw/misc/mps2-scc.h       |  10 +-
 hw/arm/mps2-tz.c                 | 629 +++++++++++++++++++++++++------
 hw/arm/mps2.c                    |   5 +
 hw/misc/armsse-cpuid.c           |   2 +-
 hw/misc/armsse-mhu.c             |   2 +-
 hw/misc/iotkit-sysctl.c          |   2 +-
 hw/misc/iotkit-sysinfo.c         |   2 +-
 hw/misc/mps2-fpgaio.c            |  43 ++-
 hw/misc/mps2-scc.c               |  93 ++++-
 17 files changed, 677 insertions(+), 157 deletions(-)

-- 
2.20.1


