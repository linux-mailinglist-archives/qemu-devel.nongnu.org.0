Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C81A2E8E28
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:53:09 +0100 (CET)
Received: from localhost ([::1]:40594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwANA-0003vs-07
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKb-0002Fe-Vd
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:30 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAKZ-0005Wu-Kx
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:50:29 -0500
Received: by mail-wm1-x334.google.com with SMTP id c133so15936058wme.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eh0fsYSI4+gersEm5qB+QNmDBwC9276UvVYUWaIh3UQ=;
 b=eSwl5MVSSaRW8fLSs6nrcGKx3B41eXuwSi6mdTnUOcVT9ATB8SilncHEZy4kMe7tss
 SbXckdE/2LwxfrTF+aqiEXhdYK5cHCRcpiWuSQ9yJZOj/3jyhZUESNsFCdpgU5DRFzXq
 Sarpdj5vcDej7GzNfAFzfS1e0myd9TgOO+PXcLfv7E+WA9cCxNVURj0Sq0UDzVgJbxIp
 Tc1svjWTDA+rfXOsLW6J4oKOyo+czTqmIcXaZ/Z5UfkuV854nJBDQMks8HvyBWQ7LJpy
 r3YVMc2e+7uUOaRhuZrAXeYMMhWSI0cHFVfRxilYcSf2Ejuu701rGNVC8FZcIInBZbXm
 qOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Eh0fsYSI4+gersEm5qB+QNmDBwC9276UvVYUWaIh3UQ=;
 b=ANh1TF03Fdx/mE1wsQEQmg0JWZltNN+iiomZ6+Vcxb4NIehO/ADiJOaCFXypBD9Ev1
 xG0zBjcCdC9kHAiivdgHaH+Wc9NjVQMzj5h1L+dWD8KyikHNCwaBo8Hu8Y1tsVAQC6/e
 ibcFNqft9NeEvcjCHjUXPMqhcUh4eX2GxmpZ+8Rq11lAhaqOg9E4WnwmNhrBsrNd/aQX
 h6FA0501IVv0UPjLnEdLNGhvmCABaj7BjwOfGfj7b8E1e4AKu7qvIzwTGxmPKPPxo83P
 CvH8soQyDGws5GSuSHm9dlnUVVDXWaiwyl+Fzh0zMowNWlwozmSkhagffgVo/rsh1csS
 GP+Q==
X-Gm-Message-State: AOAM533S6xhcPz9X0vWWBI8vzVOTvxzB7rTlaAjo4XrEKwxKyCSKswmR
 0qXp764bYGuqYQgC2D5K8QR8tZ2S0f4=
X-Google-Smtp-Source: ABdhPJx3i4NO5Hnfx/pNdyjEvohxjJfRk0id+QZVhKE2cS6lfczFysV88cSFQ4QaOfLuDwaE02tiOg==
X-Received: by 2002:a1c:2586:: with SMTP id l128mr24379619wml.78.1609707024259; 
 Sun, 03 Jan 2021 12:50:24 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id l7sm29861568wme.4.2021.01.03.12.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:50:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/35] MIPS patches for 2021-01-03
Date: Sun,  3 Jan 2021 21:49:46 +0100
Message-Id: <20210103205021.2837760-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 83734919c408ba02adb6ea616d68cd1a72837fbe=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20201222' =
into staging (2021-01-01 18:19:44 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/mips-20210103=0D
=0D
for you to fetch changes up to 9c592996981fcb37fef011d7e9603cb31f8ef29f:=0D
=0D
  tests/acceptance: Test boot_linux_console for fuloong2e (2021-01-03 21:41=
:03 +0100)=0D
=0D
----------------------------------------------------------------=0D
MIPS patches queue=0D
=0D
- Use PCI macros (Philippe Mathieu-Daud=C3=A9)=0D
- Clean up VT82C686B south bridge (BALATON Zoltan)=0D
- Introduce clock_ticks_to_ns() (Peter Maydell)=0D
- Add Loongson-3 machine (Huacai Chen)=0D
- Make addresses used by bootloader unsigned (Jiaxun Yang)=0D
- Clean fuloong2e PROM environment (Jiaxun Yang)=0D
- Add integration test of fuloong2e booting Linux (Jiaxun Yang)=0D
=0D
----------------------------------------------------------------=0D
=0D
BALATON Zoltan (12):=0D
  vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA=0D
  vt82c686: Remove unnecessary _DEVICE suffix from type macros=0D
  vt82c686: Rename VT82C686B to VT82C686B_ISA=0D
  vt82c686: Remove vt82c686b_[am]c97_init() functions=0D
  vt82c686: Split off via-[am]c97 into separate file in hw/audio=0D
  audio/via-ac97: Simplify code and set user_creatable to false=0D
  vt82c686: Remove legacy vt82c686b_isa_init() function=0D
  vt82c686: Remove legacy vt82c686b_pm_init() function=0D
  vt82c686: Convert debug printf to trace points=0D
  vt82c686: Remove unneeded includes and defines=0D
  vt82c686: Use shorter name for local variable holding object state=0D
  vt82c686: Rename superio config related parts=0D
=0D
Huacai Chen (5):=0D
  hw/intc: Rework Loongson LIOINTC=0D
  hw/mips: Implement fw_cfg_arch_key_name()=0D
  hw/mips: Add Loongson-3 boot parameter helpers=0D
  hw/mips: Add Loongson-3 machine support=0D
  docs/system: Update MIPS machine documentation=0D
=0D
Jiaxun Yang (8):=0D
  hw/mips: Make bootloader addresses unsigned=0D
  hw/mips/malta: Use address translation helper to calculate=0D
    bootloader_run_addr=0D
  hw/mips: Use address translation helper to handle ENVP_ADDR=0D
  hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT=0D
  hw/mips/fuloong2e: Replace faulty documentation links=0D
  hw/mips/fuloong2e: Remove unused env entry=0D
  hw/mips/fuloong2e: Correct cpuclock in PROM environment=0D
  tests/acceptance: Test boot_linux_console for fuloong2e=0D
=0D
Peter Maydell (4):=0D
  clock: Introduce clock_ticks_to_ns()=0D
  target/mips: Don't use clock_get_ns() in clock period calculation=0D
  clock: Remove clock_get_ns()=0D
  clock: Define and use new clock_display_freq()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'=0D
  hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'=0D
  hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'=0D
  hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'=0D
  hw/pci-host/bonito: Display hexadecimal value with '0x' prefix=0D
  hw/pci-host/bonito: Use pci_config_set_interrupt_pin()=0D
=0D
 docs/devel/clocks.rst                        |  51 +-=0D
 docs/system/target-mips.rst                  |  10 +=0D
 default-configs/devices/mips64el-softmmu.mak |   1 +=0D
 hw/mips/fw_cfg.h                             |  19 +=0D
 hw/mips/loongson3_bootp.h                    | 241 +++++++=0D
 include/hw/clock.h                           |  53 +-=0D
 include/hw/intc/loongson_liointc.h           |  22 +=0D
 include/hw/isa/vt82c686.h                    |  12 +-=0D
 hw/arm/virt.c                                |   3 +-=0D
 hw/audio/via-ac97.c                          |  93 +++=0D
 hw/core/clock.c                              |   6 +=0D
 hw/hppa/dino.c                               |   2 +-=0D
 hw/i386/xen/xen-hvm.c                        |   2 +-=0D
 hw/intc/loongson_liointc.c                   |  36 +-=0D
 hw/isa/piix3.c                               |   2 +-=0D
 hw/isa/vt82c686.c                            | 267 ++------=0D
 hw/mips/fuloong2e.c                          |  69 +-=0D
 hw/mips/fw_cfg.c                             |  35 ++=0D
 hw/mips/gt64xxx_pci.c                        |   2 +-=0D
 hw/mips/loongson3_bootp.c                    | 151 +++++=0D
 hw/mips/loongson3_virt.c                     | 627 +++++++++++++++++++=0D
 hw/mips/malta.c                              |  88 +--=0D
 hw/mips/mipssim.c                            |   8 +-=0D
 hw/pci-host/bonito.c                         |  14 +-=0D
 hw/pci-host/pnv_phb4.c                       |   2 +-=0D
 hw/pci-host/ppce500.c                        |   2 +-=0D
 hw/pci-host/uninorth.c                       |   8 +-=0D
 hw/ppc/ppc4xx_pci.c                          |   2 +-=0D
 hw/sh4/sh_pci.c                              |   2 +-=0D
 softmmu/qdev-monitor.c                       |   6 +-=0D
 target/mips/cpu.c                            |   4 +-=0D
 MAINTAINERS                                  |   3 +=0D
 hw/audio/meson.build                         |   1 +=0D
 hw/isa/trace-events                          |   6 +=0D
 hw/mips/Kconfig                              |  15 +=0D
 hw/mips/meson.build                          |   2 +=0D
 tests/acceptance/boot_linux_console.py       |  21 +=0D
 37 files changed, 1526 insertions(+), 362 deletions(-)=0D
 create mode 100644 hw/mips/fw_cfg.h=0D
 create mode 100644 hw/mips/loongson3_bootp.h=0D
 create mode 100644 include/hw/intc/loongson_liointc.h=0D
 create mode 100644 hw/audio/via-ac97.c=0D
 create mode 100644 hw/mips/fw_cfg.c=0D
 create mode 100644 hw/mips/loongson3_bootp.c=0D
 create mode 100644 hw/mips/loongson3_virt.c=0D
=0D
-- =0D
2.26.2=0D
=0D

