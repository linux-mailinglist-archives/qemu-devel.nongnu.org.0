Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE605E6A6D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:10:00 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQe7-0004Sa-Fk
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAr-00029k-Jr
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAp-0005Np-NW
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id ay36so7182184wmb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=9Njgraj4VBcDyOzgGJGUHR6N9+WMzQGG+diq2O9Q9Rk=;
 b=kOk5zMa5JlDSpY/HrI1h43SNMVFzCLh0gZ3Df6I6jYXt/kf1FC+zH6mHSWOBbFChiq
 N7r90DToWmSV9oKIlNYsuG0yMfsCPd6Nch4+QDXeXCBK0PFyUpvxf/ZH5j6/Nu9XSynN
 VUqK/n3Nwu1KmWgVBeO5ALxXYjPohrK3nmYnnpuGddqM+HuWiL16Y4JTxmpfgSxo6aCx
 4+w+ylCpSIDGcZUkdqm6QL7RvMCk4vPZMij7brpZYP8P72MU93h+WrQIuSUyf/kqRU3D
 9kg8yJ5JY8YrL8WlbSvHrnxiExJ6wU+b98KWX149LTcuXanA5n2ZRueOkM2LEErzmaP8
 oWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=9Njgraj4VBcDyOzgGJGUHR6N9+WMzQGG+diq2O9Q9Rk=;
 b=tv7P8yW6IfgZ1pI9Tgrmr0Hod/+OBTr+DXvYhXV2XLt/YAn8RxMSab3hhZ2SNM7tMn
 bI7TF3TvwQuqWug5bReLvQyOCRLwCg2kHvf9idBZT4MDfcxwTENCG6TGQvgsqGAm86dO
 g+TDExzXevxL2Xe6hjJtKAzlhtLBmJK4SwZIJbUFjThg6RSieXw8PIfF4WZNXa3z8vW0
 T/ZTSA0UHmwS7YPWdDsEVfr9Sxu3u7BJwBjQxAu8yd3xSHWZphY7HGZFPvAtwjPnMLej
 dE9eIwIW5nZ/GprBjCjGUi2sATWfW99e5R5pkzwW+g8avfA9IHhJ23uSeAcCJVSGQdgs
 swiA==
X-Gm-Message-State: ACrzQf2rTDsSlL0xzB0oigCfEpM2SGA/O2WYPg6VB8djyMeYR8XNPhFW
 m8AW9qQF1nj5Nre1BpB5i10Q5r8ZZZgpQg==
X-Google-Smtp-Source: AMsMyM6qMBHKb+Ega6PU0ep0SQyWbQSty4S/9fggbsVKE1YQL33kty9s6FSEybfQuecxdjLNPP8bcg==
X-Received: by 2002:a05:600c:4e16:b0:3b4:9a80:915c with SMTP id
 b22-20020a05600c4e1600b003b49a80915cmr9936074wmq.126.1663864538180; 
 Thu, 22 Sep 2022 09:35:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/39] target-arm queue
Date: Thu, 22 Sep 2022 17:34:57 +0100
Message-Id: <20220922163536.1096175-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi; this pullreq contains mainly a chunk of RTH's refactoring
of the Arm pagetable walk code, plus a series from me fixing
configure checkpatch warnings, and some old patches to various
files all over the tree getting rid of dynamic stack allocation.

thanks
-- PMM

The following changes since commit 6338c30111d596d955e6bc933a82184a0b910c43:

  Merge tag 'm68k-for-7.2-pull-request' of https://github.com/vivier/qemu-m68k into staging (2022-09-21 13:12:36 -0400)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220922

for you to fetch changes up to b3b5472db0ab7a53499441c1fe1dedec05b1e285:

  configure: Avoid use of 'local' as it is non-POSIX (2022-09-22 16:38:29 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/net/can: fix Xilinx ZynqMP CAN RX FIFO logic
 * Fix alignment for Neon VLD4.32
 * Refactoring of page-table-walk code
 * hw/acpi: Add ospm_status hook implementation for acpi-ged
 * hw/net/lan9118: Signal TSFL_INT flag when TX FIFO reaches specified level
 * chardev/baum: avoid variable-length arrays
 * io/channel-websock: avoid variable-length arrays
 * hw/net/e1000e_core: Use definition to avoid dynamic stack allocation
 * hw/ppc/pnv: Avoid dynamic stack allocation
 * hw/intc/xics: Avoid dynamic stack allocation
 * hw/i386/multiboot: Avoid dynamic stack allocation
 * hw/usb/hcd-ohci: Use definition to avoid dynamic stack allocation
 * ui/curses: Avoid dynamic stack allocation
 * tests/unit/test-vmstate: Avoid dynamic stack allocation
 * configure: fix various shellcheck-spotted issues and nits

----------------------------------------------------------------
Anton Kochkov (1):
      hw/net/can: fix Xilinx ZynqMP CAN RX FIFO logic

Clément Chigot (1):
      target/arm: Fix alignment for VLD4.32

Keqian Zhu (1):
      hw/acpi: Add ospm_status hook implementation for acpi-ged

Lucas Dietrich (1):
      hw/net/lan9118: Signal TSFL_INT flag when TX FIFO reaches specified level

Peter Maydell (7):
      configure: Remove unused python_version variable
      configure: Remove unused meson_args variable
      configure: Add missing quoting for some easy cases
      configure: Add './' on front of glob of */config-devices.mak.d
      configure: Remove use of backtick `...` syntax
      configure: Check mkdir result directly, not via $?
      configure: Avoid use of 'local' as it is non-POSIX

Philippe Mathieu-Daudé (11):
      chardev/baum: Replace magic values by X_MAX / Y_MAX definitions
      chardev/baum: Use definitions to avoid dynamic stack allocation
      chardev/baum: Avoid dynamic stack allocation
      io/channel-websock: Replace strlen(const_str) by sizeof(const_str) - 1
      hw/net/e1000e_core: Use definition to avoid dynamic stack allocation
      hw/ppc/pnv: Avoid dynamic stack allocation
      hw/intc/xics: Avoid dynamic stack allocation
      hw/i386/multiboot: Avoid dynamic stack allocation
      hw/usb/hcd-ohci: Use definition to avoid dynamic stack allocation
      ui/curses: Avoid dynamic stack allocation
      tests/unit/test-vmstate: Avoid dynamic stack allocation

Richard Henderson (17):
      target/arm: Create GetPhysAddrResult
      target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
      target/arm: Use GetPhysAddrResult in get_phys_addr_v6
      target/arm: Use GetPhysAddrResult in get_phys_addr_v5
      target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav5
      target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav7
      target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav8
      target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
      target/arm: Remove is_subpage argument to pmsav8_mpu_lookup
      target/arm: Add is_secure parameter to v8m_security_lookup
      target/arm: Add secure parameter to pmsav8_mpu_lookup
      target/arm: Add is_secure parameter to get_phys_addr_v5
      target/arm: Add is_secure parameter to get_phys_addr_v6
      target/arm: Add secure parameter to get_phys_addr_pmsav8
      target/arm: Add is_secure parameter to pmsav7_use_background_region
      target/arm: Add secure parameter to get_phys_addr_pmsav7
      target/arm: Add is_secure parameter to get_phys_addr_pmsav5

 configure                      |  82 +++++-----
 target/arm/internals.h         |  26 +--
 chardev/baum.c                 |  22 ++-
 hw/acpi/generic_event_device.c |   8 +
 hw/i386/multiboot.c            |   5 +-
 hw/intc/xics.c                 |   2 +-
 hw/net/can/xlnx-zynqmp-can.c   |  32 ++--
 hw/net/e1000e_core.c           |   7 +-
 hw/net/lan9118.c               |   8 +
 hw/ppc/pnv.c                   |   4 +-
 hw/ppc/spapr.c                 |   8 +-
 hw/ppc/spapr_pci_nvlink2.c     |   2 +-
 hw/usb/hcd-ohci.c              |   7 +-
 io/channel-websock.c           |   2 +-
 target/arm/helper.c            |  27 ++-
 target/arm/m_helper.c          |  78 ++++-----
 target/arm/ptw.c               | 364 +++++++++++++++++++----------------------
 target/arm/tlb_helper.c        |  22 +--
 target/arm/translate-neon.c    |   6 +-
 tests/unit/test-vmstate.c      |   7 +-
 ui/curses.c                    |   2 +-
 21 files changed, 347 insertions(+), 374 deletions(-)

