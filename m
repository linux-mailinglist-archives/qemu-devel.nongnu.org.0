Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C740B564A08
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 23:31:51 +0200 (CEST)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o87C2-00065p-Pf
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 17:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o8798-0003SH-2h
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:28:50 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o8796-0006Lw-3Z
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:28:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so11719027pjm.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 14:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BnOvjZiW9u4sx8x+Ss3mNCv4J9tIowByCWqNKuz5lKQ=;
 b=WgAJPuRMgibvmQi0sUlccPkrX/iiPAHnaOLe8SStio1pl1zdIRly0EBkW75+CWeaYK
 3zR8YwLlRfxV3U1cfZBQI3QzWjTjKHCaEV0N+FMPkMNvPvY0Nu5fbNUxcKWEB3A1zaRT
 m2RxvbKbZN9DfpaBowUpWhgJ5NU2oO6xez6pt/gd+YSQ/WOhoHpLnIkdUxOkkQqK0/db
 NgIQjqSKL3QbiZ+UKUeF7WhiJC8vgomh7RYVsgGEBU4co6pryt4/t6bhKYbksm1S9vNi
 5pVQDOewLDcdPRhaputi16eID2fxux99yL+XdR4vYgdRKhvBiqzMZF38cysef6WqUfgI
 vS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BnOvjZiW9u4sx8x+Ss3mNCv4J9tIowByCWqNKuz5lKQ=;
 b=OLMj5v8El8tSuYCTYS656+MZCnMfVRDzGclJ7Q5RLqu1oT1vWsOlao1nXOKtNjw2/M
 t0uUmn0IMw31rWw9f/1J3za9bMAwF7+bhJNaX4B7gpyyAF5rnDOgOl5c2oXYMeM/3bw8
 VWWivhyL3av+CGFQvhVF376213O9kes+qB2bX4TBm5+i/UxM5vY7Ke977YIgK+KKIR+E
 tPdTmKanUd5RBhgsVHm5hNaW8szMnj/QFpztnCXZwNM0w8zqUAKr7Wf8UIQ8jwpJSMw2
 OJguG127m8VedHhDeLzqPXJfZ6AkrKGbT+YVSvRRztZvgIZPT6vKHl36VYrFX+bZK6uj
 ZfKg==
X-Gm-Message-State: AJIora9WXUh/xuRvLtRE+HvuoQTaCCz2ndDczK0Ubv6eaBCHS9FRL90n
 u7SVe8Rl0YEy0ZILdRZ2v1m1sTcYNII=
X-Google-Smtp-Source: AGRyM1s7d1u9/66Gm8B1U9hFHMS+NTp6IaA1tPWQkH77kzVmLVnPcYMcTCsBzu+H9KIYbYbCH1SB2A==
X-Received: by 2002:a17:90a:9e7:b0:1ef:6fd7:b5f7 with SMTP id
 94-20020a17090a09e700b001ef6fd7b5f7mr11279329pjo.158.1656883725660; 
 Sun, 03 Jul 2022 14:28:45 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a170902bd0400b0016b81679c31sm13912883pls.213.2022.07.03.14.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 14:28:45 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 00/11] OpenRISC Virtual Machine
Date: Mon,  4 Jul 2022 06:28:12 +0900
Message-Id: <20220703212823.10067-1-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102e.google.com
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

Hello,

This is the OpenRISC Virtual Machine plaform which we are now using for OpenRISC
CI such as the wireguard testing that Jason has been working on.

The first few patches help get OpenRISC QEMU ready for the virtual machine.
There is one bug fix for GDB debugging there too.

Next we have the Virt patch followed by a separate patch to add PCI support
which is split out because it's a bit easier to review that way I thought.  The
next few patches are fixes to get the Multicore platform stable, such as adding
MTTCG support and fixing some interrupt and timer related bugs.

The platform is relatively stable now, but every few boots we get ~10 second soft
lockups.  My hunch is that this is another interrupt race condition where IPI's
end up getting lost.  However, overall the is much more stable than the SMP
support we had before.  So I want to submit this for review and maybe upstream
it before tracking down these last issues which might take significant more
time.

This is being tested with my or1k-virt kernel branch here:

  https://github.com/stffrdhrn/linux/commits/or1k-virt

  This tree has support for: OpenRISC PCI and virt_defconfig and an irqchip bug
  fix.

Changes since v1:
 - Dropped semihosting support
 - Added PCI support
 - Added OpenRISC documentation
 - Added OpenRISC support for MTTCG
 - Support Configurating Goldfish RTC endianness
 - Added a few bug fix patches

-Stafford

Jason A. Donenfeld (1):
  hw/openrisc: virt: pass random seed to fdt

Stafford Horne (10):
  hw/openrisc: Split re-usable boot time apis out to boot.c
  target/openrisc: Fix memory reading in debugger
  goldfish_rtc: Add endianness property
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
 docs/system/target-openrisc.rst          |  72 +++
 docs/system/targets.rst                  |   1 +
 hw/openrisc/Kconfig                      |  12 +
 hw/openrisc/boot.c                       | 117 +++++
 hw/openrisc/cputimer.c                   |  18 +
 hw/openrisc/meson.build                  |   2 +
 hw/openrisc/openrisc_sim.c               | 106 +----
 hw/openrisc/virt.c                       | 578 +++++++++++++++++++++++
 hw/rtc/goldfish_rtc.c                    |  46 +-
 include/hw/openrisc/boot.h               |  34 ++
 include/hw/rtc/goldfish_rtc.h            |   2 +
 target/openrisc/cpu.c                    |   1 -
 target/openrisc/cpu.h                    |   3 +
 target/openrisc/interrupt.c              |   4 +-
 target/openrisc/mmu.c                    |   8 +-
 target/openrisc/sys_helper.c             |  18 +-
 22 files changed, 1035 insertions(+), 114 deletions(-)
 create mode 100644 docs/system/openrisc/cpu-features.rst
 create mode 100644 docs/system/openrisc/emulation.rst
 create mode 100644 docs/system/openrisc/or1k-sim.rst
 create mode 100644 docs/system/openrisc/virt.rst
 create mode 100644 docs/system/target-openrisc.rst
 create mode 100644 hw/openrisc/boot.c
 create mode 100644 hw/openrisc/virt.c
 create mode 100644 include/hw/openrisc/boot.h

-- 
2.36.1


