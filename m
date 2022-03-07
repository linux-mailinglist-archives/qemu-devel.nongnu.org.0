Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8694CFC60
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:11:38 +0100 (CET)
Received: from localhost ([::1]:35758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBH7-0006pV-8j
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:11:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALc-0002i8-4L
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:12 -0500
Received: from [2a00:1450:4864:20::32e] (port=44584
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALa-0004HC-KS
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so8940771wmb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZZT+kIObjw3NyncUyfon3VlVvVoaWpfKUsK0QKjLhs=;
 b=gl4bpAjyVwx+aGDli8pjWhgtFvMOyfh8P6Y3EOCAPK/HCA4MK9mRQibuGcOuR4q0px
 /hcQ6myNlrh6MB2YB3wmPAdLff9eiMJHaDbAS7f/pu5jlN+7DSsn7RojS5oud5PswvC1
 31cldL10e11m0tuSxQkyfBCnElCnuVqR7seevcajy0UP80qjyfMv6Ar33dAsNu0kWVbH
 LKcbDtdoHWiakeniOBf4hdPtuYj8v3LNIsUPn8BHkp1mh8w/5gRrUB84StduNpKtQeNc
 geKkoAtIdAedgozO78uEdjYZJBxjU3FPQZvtzk/Gb3J100zrB3xS0QE7ITaVBqLXDy9F
 O8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZZT+kIObjw3NyncUyfon3VlVvVoaWpfKUsK0QKjLhs=;
 b=HpbLXAteLfOb19sUKkEPL/HMSL+uYGbEN0aDz1Dx12SodP9wlX6s39EAykdE+HwMwB
 skjrE0EGyp2nVM3cKVj4kIZH7ZZeSbbEcHWM0hdQ7QQ3qUfYXP2hLb2wq5Y8fjcRbtd3
 e7k4qBhXPfxu1oYDFwJ4xq1gyk8IZdm1fupgt+ZP0mBUF+oWP2q9QnTWRLb7KuniyWiE
 8fuHo3tAzhd81HIfn3leXA3X6s7l8xxOVrEQSDwOfhC8vYqbTa6qDkSJAU0K7UntP9dC
 rfWIuFPy6uQN6WtsR7ZsnOiNs3SoC/cCbdC7I0PA/F4+2nHvVHnRs4aO/1lw0FyULabb
 iy2g==
X-Gm-Message-State: AOAM531rCjImeXVl/B0NpDKxZFK8AOJpGnormwt44ODKQBFskD9p0SoW
 G5ZDHsv7jGEAvBzsZTA4cRnrcsCQ994=
X-Google-Smtp-Source: ABdhPJyZiJSnhjVabvn23VEOG5t4Wrh6eirEI5SL8oagAVdvkRHDOxOo7DpYZVoUYsmZ42uqY1zTiA==
X-Received: by 2002:a05:600c:2d4c:b0:389:7be9:2885 with SMTP id
 a12-20020a05600c2d4c00b003897be92885mr12637216wmg.188.1646647928872; 
 Mon, 07 Mar 2022 02:12:08 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q125-20020a1c4383000000b003899720641dsm6431259wma.30.2022.03.07.02.12.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] MIPS patches for 2022-03-07
Date: Mon,  7 Mar 2022 11:11:51 +0100
Message-Id: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20220307

for you to fetch changes up to 9be5a9f464c1fc106a4aaf941f7792404c43556d:

  tests/avocado/linux_ssh_mips_malta.py: add missing accel (tcg) tag (2022-03-07 01:35:07 +0100)

----------------------------------------------------------------
MIPS patches queue

- Fix CP0 cycle counter timing
- Fix VMState of gt64120 IRQs
- Long due PIIX4 QOM cleanups
- ISA IRQ QOM'ification / cleanups

----------------------------------------------------------------

Bernhard Beschow (13):
  hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved during
    migration
  malta: Move PCI interrupt handling from gt64xxx_pci to piix4
  hw/isa/piix4: Resolve redundant i8259[] attribute
  hw/isa/piix4: Pass PIIX4State as opaque parameter for piix4_set_irq()
  hw/isa/piix4: Resolve global instance variable
  hw/isa/piix4: Replace some magic IRQ constants
  hw/mips/gt64xxx_pci: Resolve gt64120_register()
  hw/rtc/mc146818rtc: QOM'ify IRQ number
  hw/rtc/m48t59-isa: QOM'ify IRQ number
  hw/input/pckbd: QOM'ify IRQ numbers
  hw/isa/isa-bus: Remove isabus_dev_print()
  isa: Drop unused attributes from ISADevice
  isa: Inline and remove one-line isa_init_irq()

Cleber Rosa (1):
  tests/avocado/linux_ssh_mips_malta.py: add missing accel (tcg) tag

Philippe Mathieu-Daudé (1):
  target/mips: Remove duplicated MIPSCPU::cp0_count_rate

Simon Burge (1):
  target/mips: Fix cycle counter timing calculations

 hw/input/pckbd.c                      | 26 +++++++--
 hw/isa/isa-bus.c                      | 29 ----------
 hw/isa/piix4.c                        | 56 +++++++++++++++++--
 hw/mips/gt64xxx_pci.c                 | 80 +++------------------------
 hw/mips/malta.c                       |  7 +--
 hw/rtc/m48t59-isa.c                   |  9 ++-
 hw/rtc/mc146818rtc.c                  | 13 ++++-
 include/hw/isa/isa.h                  |  2 -
 include/hw/mips/mips.h                |  3 -
 include/hw/rtc/mc146818rtc.h          |  1 +
 include/hw/southbridge/piix.h         |  2 -
 target/mips/cpu.c                     | 11 +---
 target/mips/cpu.h                     |  9 ---
 target/mips/internal.h                |  9 +++
 tests/avocado/linux_ssh_mips_malta.py |  3 +
 tests/qemu-iotests/172.out            | 26 ---------
 16 files changed, 115 insertions(+), 171 deletions(-)

-- 
2.34.1


