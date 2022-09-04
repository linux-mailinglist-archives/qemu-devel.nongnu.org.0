Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06E15AC33C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:30:47 +0200 (CEST)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUk5e-0004t2-Qy
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1I-0007iW-Rt
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:17 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1F-000303-Me
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso4066915wmb.0
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=YZ+8OE6OqyKCsYpTCKgvLyTHvwK6nGORs1oXgs9w+ZY=;
 b=H91pUz+KwHs03kKUg2fAcrTFXhtGv/Nt9vo7wlbbRmCz6z3q9AHhisAePuAOr4ybIf
 UbIWd42jJ5kOsipPUtkHJ8m66lj+tmUEM80Jnq7vccHuNO5yZs7rvIpn8gEpvC7P2vT3
 jgLSfgk95FVyvhIhlUy7lqEQkF6dIAAZTr0MzuEZ8g03zz2JNOd3fzhotMaNmAPd6ZKv
 1NvoqY1aT96i06nYWUTq12awoUYXdJgZOtWXyRs2KFgTDdIi/qnC4fg2//4BXzKz/1Jj
 m4jxINNEydrf4z9WcQcJlPibdy9n5WUtMrkTUZ9ODF58ZBbwoCVbnxgIQLnu6bRMPEMU
 MR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=YZ+8OE6OqyKCsYpTCKgvLyTHvwK6nGORs1oXgs9w+ZY=;
 b=ueNXwkoD4uMvTnpECU85TViRHYjC3iQwfbFdggOvrnNZOgD+LfBdYUbAwt8BctSiWh
 gVRGQfyKdmmVHaizqwFW+KBhjjXSQAVqU7XUD/6jt6v2vFi7cJVkcWy8stGA3+PerooP
 Reh/W8phzW0/jwU6vJ7YVMpBZoIV6D6DnvRPXjapvhFhNvQf/LdirOcjAv4FuAcZlawI
 3BcXzI0YXvJR3pqxcmT96J3A3odddU2ct87g24D+r0yNGHyA4G3Tawo6O/FXRctQwXZs
 RgObwSDyqKbGYwC5ULxfmLAVqMWu7W/VHzlV+pm/duFgClnWBNAbqx1drdz213dzgOYz
 bTFA==
X-Gm-Message-State: ACgBeo3CtY4cywwEwMJvEW41k2OsjC8+jmwsJKJkvyPxnpK0kTcONen/
 NTtdsPgx11Du3yIWdubUd9p185sfyH0=
X-Google-Smtp-Source: AA6agR7zmfA2SzuJI+Rc1nTWKAkTQ4hK4qduGWpLCyYXsQWQhyttMtMIhQnyVKJxd4S3xffYkelATw==
X-Received: by 2002:a05:600c:2909:b0:3a6:2ef5:772e with SMTP id
 i9-20020a05600c290900b003a62ef5772emr7415892wmd.16.1662276370928; 
 Sun, 04 Sep 2022 00:26:10 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 bu3-20020a056000078300b0022863395912sm1833017wrb.53.2022.09.04.00.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:10 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org,
	Stafford Horne <shorne@gmail.com>
Subject: [PULL 00/11] OpenRISC updates for 7.2.0
Date: Sun,  4 Sep 2022 08:25:56 +0100
Message-Id: <20220904072607.44275-1-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 61fd710b8da8aedcea9b4f197283dc38638e4b60:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-09-02 13:24:28 -0400)

are available in the Git repository at:

  git@github.com:stffrdhrn/qemu.git tags/pull-or1k-20220904

for you to fetch changes up to b14df228d7c4fe6e86e7f8a4998e9ccf4967b678:

  docs/system: openrisc: Add OpenRISC documentation (2022-09-04 07:02:57 +0100)

----------------------------------------------------------------
OpenRISC updates for 7.2.0

Updates to add the OpenRISC virt plaform to QEMU. Highlights
include:

- New virt plaform with, virtio and pci bus support
- OpenRISC support for MTTCG
- Goldfish RTC device endianness is configurable now

----------------------------------------------------------------
Jason A. Donenfeld (1):
      hw/openrisc: virt: pass random seed to fdt

Stafford Horne (10):
      hw/openrisc: Split re-usable boot time apis out to boot.c
      target/openrisc: Fix memory reading in debugger
      goldfish_rtc: Add big-endian property
      hw/openrisc: Add the OpenRISC virtual machine
      hw/openrisc: Add PCI bus support to virt
      hw/openrisc: Initialize timer time at startup
      target/openrisc: Add interrupted CPU to log
      target/openrisc: Enable MTTCG
      target/openrisc: Interrupt handling fixes
      docs/system: openrisc: Add OpenRISC documentation

 configs/devices/or1k-softmmu/default.mak |   1 +
 configs/targets/or1k-softmmu.mak         |   1 +
 docs/system/openrisc/cpu-features.rst    |  15 +
 docs/system/openrisc/emulation.rst       |  17 +
 docs/system/openrisc/or1k-sim.rst        |  43 +++
 docs/system/openrisc/virt.rst            |  50 +++
 docs/system/target-openrisc.rst          |  71 ++++
 docs/system/targets.rst                  |   1 +
 hw/m68k/virt.c                           |   1 +
 hw/openrisc/Kconfig                      |  12 +
 hw/openrisc/boot.c                       | 116 +++++++
 hw/openrisc/cputimer.c                   |  22 +-
 hw/openrisc/meson.build                  |   2 +
 hw/openrisc/openrisc_sim.c               | 106 +-----
 hw/openrisc/virt.c                       | 571 +++++++++++++++++++++++++++++++
 hw/rtc/goldfish_rtc.c                    |  37 +-
 include/hw/openrisc/boot.h               |  34 ++
 include/hw/rtc/goldfish_rtc.h            |   2 +
 target/openrisc/cpu.c                    |   1 -
 target/openrisc/cpu.h                    |   2 +
 target/openrisc/interrupt.c              |   4 +-
 target/openrisc/mmu.c                    |   8 +-
 target/openrisc/sys_helper.c             |  14 +-
 23 files changed, 1017 insertions(+), 114 deletions(-)
 create mode 100644 docs/system/openrisc/cpu-features.rst
 create mode 100644 docs/system/openrisc/emulation.rst
 create mode 100644 docs/system/openrisc/or1k-sim.rst
 create mode 100644 docs/system/openrisc/virt.rst
 create mode 100644 docs/system/target-openrisc.rst
 create mode 100644 hw/openrisc/boot.c
 create mode 100644 hw/openrisc/virt.c
 create mode 100644 include/hw/openrisc/boot.h

Jason A. Donenfeld (1):
  hw/openrisc: virt: pass random seed to fdt

Stafford Horne (10):
  hw/openrisc: Split re-usable boot time apis out to boot.c
  target/openrisc: Fix memory reading in debugger
  goldfish_rtc: Add big-endian property
  hw/openrisc: Add the OpenRISC virtual machine
  hw/openrisc: Add PCI bus support to virt
  hw/openrisc: Initialize timer time at startup
  target/openrisc: Add interrupted CPU to log
  target/openrisc: Enable MTTCG
  target/openrisc: Interrupt handling fixes
  docs/system: openrisc: Add OpenRISC documentation

 configs/devices/or1k-softmmu/default.mak |   1 +
 configs/targets/or1k-softmmu.mak         |   1 +
 docs/system/openrisc/cpu-features.rst    |  15 +
 docs/system/openrisc/emulation.rst       |  17 +
 docs/system/openrisc/or1k-sim.rst        |  43 ++
 docs/system/openrisc/virt.rst            |  50 ++
 docs/system/target-openrisc.rst          |  71 +++
 docs/system/targets.rst                  |   1 +
 hw/m68k/virt.c                           |   1 +
 hw/openrisc/Kconfig                      |  12 +
 hw/openrisc/boot.c                       | 116 +++++
 hw/openrisc/cputimer.c                   |  22 +-
 hw/openrisc/meson.build                  |   2 +
 hw/openrisc/openrisc_sim.c               | 106 +----
 hw/openrisc/virt.c                       | 571 +++++++++++++++++++++++
 hw/rtc/goldfish_rtc.c                    |  37 +-
 include/hw/openrisc/boot.h               |  34 ++
 include/hw/rtc/goldfish_rtc.h            |   2 +
 target/openrisc/cpu.c                    |   1 -
 target/openrisc/cpu.h                    |   2 +
 target/openrisc/interrupt.c              |   4 +-
 target/openrisc/mmu.c                    |   8 +-
 target/openrisc/sys_helper.c             |  14 +-
 23 files changed, 1017 insertions(+), 114 deletions(-)
 create mode 100644 docs/system/openrisc/cpu-features.rst
 create mode 100644 docs/system/openrisc/emulation.rst
 create mode 100644 docs/system/openrisc/or1k-sim.rst
 create mode 100644 docs/system/openrisc/virt.rst
 create mode 100644 docs/system/target-openrisc.rst
 create mode 100644 hw/openrisc/boot.c
 create mode 100644 hw/openrisc/virt.c
 create mode 100644 include/hw/openrisc/boot.h

-- 
2.37.2


