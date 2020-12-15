Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90ED2DAEB8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:18:01 +0100 (CET)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB9M-0006Zv-QP
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4O-0001Q9-BG
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:52 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4D-00075k-Sm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:12:52 -0500
Received: by mail-wm1-x335.google.com with SMTP id x22so17001751wmc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCMFG4sWmiPqMWWW6ZFqqdXinU3eUO+oOn3Zwz4nHqA=;
 b=zfk5/YbYl0jjSvJQhHh6J/M8isyGgiFRpFOOqpPwredpcF5ZoR4lGkWvD2GjNoUad/
 rPR33UKJwZy/+FEB4P+j431Ivs0tTlJIxKYSs5UHskcAEEqrOSF6RZGFke+ekxoYDaQ4
 5ealTdI4KlcomNHDIMMIRJdBkQPxr38Jb+nNWLv1NSM1btz+rsqLfiGkv1FZpeWpCDO8
 5cohgFn6rcG05rBJdbxMgMGTpCtWOhoYjUeRUwEWKcXETI/KUm7q5rtG9GtxhncjglE+
 2KAwPgetGE0uAgGctOeH2rxd4iO+AHE2Vngb+Pocb5jBxxzh+i4MDFOumFWyWtE06Ias
 8r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCMFG4sWmiPqMWWW6ZFqqdXinU3eUO+oOn3Zwz4nHqA=;
 b=DVV8AILE7GgaK739bcOTll/y2JsnpwdsiLmmkOV2nJwdR5NzDexsPEh5z3+wajRkkH
 bICr+S2fbRqE62maHFK4Pymx0bC+0aVu6rUHRYqintxSzb65Ig3fj07C3wCZ8SRH9JAU
 JE3s+MMRgmVl4cu9wKIGF2+yt4Ue152qX0O6igsF0s1kYQ4SNIOvMEnJuWzBsMO4YSGi
 YkPVH7Yp6D2J40xU0/wV45kaGv/O6oPN5LgoZI3yTmhAy5cGyb5MyizOGQyL6MQT6uES
 XIyd8NHiq+ThlPjSuM6k3O+Rn54hyOg2c3q/tCdYBNSGE152BIc0pxF1dgA6CWgQJyyU
 Frgw==
X-Gm-Message-State: AOAM531qhU/3IGb3bhP0tYazHViAgsrXGuJ5ptkM0cEvD0YtzF9k3wTg
 S6bsOoEg0M8ioS9j5k8XiL+1wLrTW3ZaTw==
X-Google-Smtp-Source: ABdhPJwHfyLVMPTV4O2qAmtuP3Qf7NXMIhaCXC7NIia2c1u1yPhPRFLEBrurTelYtiC7cC7R+nxW9w==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr8630000wmc.39.1608041559777;
 Tue, 15 Dec 2020 06:12:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] target-arm queue
Date: Tue, 15 Dec 2020 14:12:17 +0000
Message-Id: <20201215141237.17868-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

A grab-bag of minor stuff for the end of the year. My to-review
queue is not empty, but it it at least in single figures...

-- PMM

The following changes since commit 5bfbd8170ce7acb98a1834ff49ed7340b0837144:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2020-12-14 20:32:38 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201215

for you to fetch changes up to 23af268566069183285bebbdf95b1b37cb7c0942:

  hw/block/m25p80: Fix Numonyx fast read dummy cycle count (2020-12-15 13:39:30 +0000)

----------------------------------------------------------------
target-arm queue:
 * gdbstub: Correct misparsing of vCont C/S requests
 * openrisc: Move pic_cpu code into CPU object proper
 * nios2: Move IIC code into CPU object proper
 * Improve reporting of ROM overlap errors
 * xlnx-versal: Add USB support
 * hw/misc/zynq_slcr: Avoid #DIV/0! error
 * Numonyx: Fix dummy cycles and check for SPI mode on cmds

----------------------------------------------------------------
Joe Komlodi (4):
      hw/block/m25p80: Make Numonyx config field names more accurate
      hw/block/m25p80: Fix when VCFG XIP bit is set for Numonyx
      hw/block/m25p80: Check SPI mode before running some Numonyx commands
      hw/block/m25p80: Fix Numonyx fast read dummy cycle count

Peter Maydell (11):
      gdbstub: Correct misparsing of vCont C/S requests
      hw/openrisc/openrisc_sim: Use IRQ splitter when connecting IRQ to multiple CPUs
      hw/openrisc/openrisc_sim: Abstract out "get IRQ x of CPU y"
      target/openrisc: Move pic_cpu code into CPU object proper
      target/nios2: Move IIC code into CPU object proper
      target/nios2: Move nios2_check_interrupts() into target/nios2
      target/nios2: Use deposit32() to update ipending register
      hw/core/loader.c: Track last-seen ROM in rom_check_and_register_reset()
      hw/core/loader.c: Improve reporting of ROM overlap errors
      elf_ops.h: Don't truncate name of the ROM blobs we create
      elf_ops.h: Be more verbose with ROM blob names

Philippe Mathieu-Daudé (1):
      hw/misc/zynq_slcr: Avoid #DIV/0! error

Sai Pavan Boddu (2):
      usb: Add versal-usb2-ctrl-regs module
      usb: xlnx-usb-subsystem: Add xilinx usb subsystem

Vikram Garhwal (2):
      usb: Add DWC3 model
      arm: xlnx-versal: Connect usb to virt-versal

 include/hw/arm/xlnx-versal.h                |   9 +
 include/hw/elf_ops.h                        |   5 +-
 include/hw/usb/hcd-dwc3.h                   |  55 +++
 include/hw/usb/xlnx-usb-subsystem.h         |  45 ++
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  45 ++
 target/nios2/cpu.h                          |   3 -
 target/openrisc/cpu.h                       |   1 -
 gdbstub.c                                   |   2 +-
 hw/arm/xlnx-versal-virt.c                   |  55 +++
 hw/arm/xlnx-versal.c                        |  26 ++
 hw/block/m25p80.c                           | 158 +++++--
 hw/core/loader.c                            |  67 ++-
 hw/intc/nios2_iic.c                         |  95 ----
 hw/misc/zynq_slcr.c                         |   5 +
 hw/nios2/10m50_devboard.c                   |  13 +-
 hw/nios2/cpu_pic.c                          |  67 ---
 hw/openrisc/openrisc_sim.c                  |  46 +-
 hw/openrisc/pic_cpu.c                       |  61 ---
 hw/usb/hcd-dwc3.c                           | 689 ++++++++++++++++++++++++++++
 hw/usb/xlnx-usb-subsystem.c                 |  94 ++++
 hw/usb/xlnx-versal-usb2-ctrl-regs.c         | 229 +++++++++
 softmmu/vl.c                                |   1 -
 target/nios2/cpu.c                          |  29 ++
 target/nios2/op_helper.c                    |   9 +
 target/openrisc/cpu.c                       |  32 ++
 MAINTAINERS                                 |   1 -
 hw/intc/meson.build                         |   1 -
 hw/nios2/meson.build                        |   2 +-
 hw/openrisc/Kconfig                         |   1 +
 hw/openrisc/meson.build                     |   2 +-
 hw/usb/Kconfig                              |  10 +
 hw/usb/meson.build                          |   3 +
 32 files changed, 1557 insertions(+), 304 deletions(-)
 create mode 100644 include/hw/usb/hcd-dwc3.h
 create mode 100644 include/hw/usb/xlnx-usb-subsystem.h
 create mode 100644 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
 delete mode 100644 hw/intc/nios2_iic.c
 delete mode 100644 hw/nios2/cpu_pic.c
 delete mode 100644 hw/openrisc/pic_cpu.c
 create mode 100644 hw/usb/hcd-dwc3.c
 create mode 100644 hw/usb/xlnx-usb-subsystem.c
 create mode 100644 hw/usb/xlnx-versal-usb2-ctrl-regs.c

