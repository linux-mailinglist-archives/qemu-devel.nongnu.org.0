Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7777D2EA7C9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 10:44:13 +0100 (CET)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwisu-0002Pr-5B
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 04:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwiqH-0001Wp-MA
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:41:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwiq9-0007p4-Ri
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:41:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id 190so2411097wmz.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 01:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QR3N3wiDunz804vW5H/SNmhGtLZFP9XVIe9r8sq4VTU=;
 b=aj17vrpH4z+SCNtEYxT2R1Ta4eftqK2Tq78FEUIqRmxX/4PK6060bLAMOhDCR4WOmG
 tVa2FNtQVdMEDbhrvOnbqNYplOfoRT7cJ0/52cmsimSZ51lVnifdo04ayQwhIQ/LyBOQ
 Lq6qGj1GOW3bcM0uEd3vmdEllpDa8LjcGCL2wkoSpOarSKrrGLm+wDtJXmODRKE+4CCf
 NChOyIrgcxI7VaM71BboPDlIqPNAHeX8haF5ZDBSv1Msq3H1r7K/H8uGc9Olws4cru0z
 uPo6njihwqyoXWGb+rcguLwFI2hsYO84NW8kqGs0WBRn7Ee1BafjgN5fWjD165mSyPcZ
 oaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QR3N3wiDunz804vW5H/SNmhGtLZFP9XVIe9r8sq4VTU=;
 b=N/oZ0rhNdpa1MVn0MxNF1DGBEbk/QRfRxHK//TEa8roCFSs3tqzzr4xXYLSdVFI+gO
 CYBjTxkVov9J3ENJtZvLZRlzN8ErVIGxbshYAR06t5ZkBq1nRKJjj5tteYqXUHnszOPx
 Yc9Bt0r+9jMi9ruc18gNOkediMQSZkEpp2d3KoKmLFs4Nkwf1k0511m8UaWRiLtDDYBU
 S5Zwf+aJtRhxZnWo9u7sQp3Vjqf6+RgYFoGSdu4kI6KDkM0YseNwNulvj8D3RFgmVxv/
 2rEfMp9giQRZVP6E44wdB41Gtpcp7oOAUXVhXqEeQ9irRCAYsj2ayjgPkLu5hH/uCazl
 K8Mg==
X-Gm-Message-State: AOAM5331/EZEY2xlBnJdpKy1eRbIaOVmvoxlRRVWaHv6UQ+PkaM5dR4T
 5uDJ6UQCVM6l/bUdy0nxZdahBxorQY4=
X-Google-Smtp-Source: ABdhPJwV9Ima9QYVIMEpLYChIpz1Q6T1jMU/bFT09DkrN51LLhUbRHtu822JakiWZ96I2tXbhHcSAQ==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr2524472wmf.173.1609839680127; 
 Tue, 05 Jan 2021 01:41:20 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c6sm75041118wrh.7.2021.01.05.01.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 01:41:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/35] MIPS patches for 2021-01-04​
Date: Tue,  5 Jan 2021 10:41:08 +0100
Message-Id: <20210105094109.3303949-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUBJECT_NEEDS_ENCODING=0.049,
 SUBJ_ILLEGAL_CHARS=1.518 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e551455f1e7a3d7eee9e11e2903e4050bc5511ae=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
uest' into staging (2021-01-04 15:02:53 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/mips-20210104=0D
=0D
for you to fetch changes up to 457027298749333047bf81a856ce95ea5f9dccd9:=0D
=0D
  tests/acceptance: Test boot_linux_console for fuloong2e (2021-01-04 23:36=
:03 +0100)=0D
=0D
Since v1:=0D
- Fixed memory leak reported by Peter=0D
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
 hw/mips/fw_cfg.c                             |  35 +=0D
 hw/mips/gt64xxx_pci.c                        |   2 +-=0D
 hw/mips/loongson3_bootp.c                    | 151 +++++=0D
 hw/mips/loongson3_virt.c                     | 638 +++++++++++++++++++=0D
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
 37 files changed, 1537 insertions(+), 362 deletions(-)=0D
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

