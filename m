Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1354D0C38
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:47:42 +0100 (CET)
Received: from localhost ([::1]:55410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRN4n-0005Y9-Eh
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:47:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRN3P-0003iO-E1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 18:46:15 -0500
Received: from [2607:f8b0:4864:20::62d] (port=46757
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRN3N-0006Ed-Ou
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 18:46:15 -0500
Received: by mail-pl1-x62d.google.com with SMTP id w4so5097320ply.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 15:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvgZZaJkZYucIdaoIODS5ho2iU5kH6olg2lnntdTbtA=;
 b=K23ISFUW5WXehWajYVkomyx7nSm3lcrU9+KFHnjrhtB1Ty93/gsMA8FPGVDgFD2+WR
 baJMjpJAV25rqWkUrACGLiLl4Lgth6SCCacbnqRk4L98559NoIXa6v9TDFedqz6YOsf0
 ynroCxoYuqu9nvw32Kzp4mJ1GlWakGMbxw+bXdIRXvcp7L9ZQiGvACoikZolp8C5awPj
 D5ShieaHCMtWMtX38CPkjKAKRb59ZF2m4TyNH/PVQP6z9EoflG2lyf1W8yGuUpBb/s9N
 JxnDU4ggeBlKAT3bhRHKTf/f4GsUtt/x6Ec4D4z5A4rJYPfAkAGXA3JFgTsa4G4HLGDs
 mlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvgZZaJkZYucIdaoIODS5ho2iU5kH6olg2lnntdTbtA=;
 b=7gtbp79JTr7BVwF7feNib6RrhLWty2hGX0eOxc/9lCFk35DfxYBY0AEtSu7zMuOS6Y
 cZXkUrc1Ihp3R3FaxEtdnz9N3cUB5C3LIcnM3biZ82svJAJXPMa5RbUHY2TZT0+wiAEd
 iikVluK784y0Bn6+QR7/a17FqANGOIB/g2mzDrAKy9FAo6Ig2w3gm0QrRAu2v8z125OM
 HuzpqGP4RPWFw8sJLdYxOyrEqPdohuZLdwFx50fLXDpzm4L8Le0rCaDJFCGf+OMJv7rd
 qZSlZY/H2fpUWwgM/nD+3JcjfFbhd8z5pdOl7nKQuoQYjz4le2J3HmA3RWB1H4UnTaaU
 cBig==
X-Gm-Message-State: AOAM531w+lzsPijT2IgI3/nf5/CWdhcu+UXTH/1OWI/oBOpVeoWWXgE/
 xlo10Oyyj6daReSxb/UN9gw6dpFB5VY=
X-Google-Smtp-Source: ABdhPJwcadNiZ6m318Y1by8w8A83oga4T0cH+mMyth5R2Cf4UOsKgL+X/tEVQ+tFvrVfEPtk7QbB8Q==
X-Received: by 2002:a17:90a:160f:b0:1b8:ab45:d287 with SMTP id
 n15-20020a17090a160f00b001b8ab45d287mr1539602pja.91.1646696772005; 
 Mon, 07 Mar 2022 15:46:12 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a510700b001bf5f79a770sm461168pjh.15.2022.03.07.15.46.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 15:46:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/16] MIPS patches for 2022-03-07
Date: Tue,  8 Mar 2022 00:45:56 +0100
Message-Id: <20220307234557.9081-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f33:

  Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-03-07' into staging (2022-03-07 17:14:09 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20220308

for you to fetch changes up to c35fef9a9c7fd5397bc624d5bba05cef514b5737:

  tests/avocado/linux_ssh_mips_malta.py: add missing accel (tcg) tag (2022-03-07 20:38:41 +0100)

Since v1:
- Corrected last patch (screwed during git-am conflict)

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
  hw/isa: Drop unused attributes from ISADevice
  hw/isa: Inline and remove one-line isa_init_irq()

Cleber Rosa (1):
  tests/avocado/linux_ssh_mips_malta.py: add missing accel (tcg) tag

Philippe Mathieu-Daudé (1):
  target/mips: Remove duplicated MIPSCPU::cp0_count_rate

Simon Burge (1):
  target/mips: Fix cycle counter timing calculations

 hw/audio/cs4231a.c                    |  2 +-
 hw/audio/gus.c                        |  2 +-
 hw/audio/sb16.c                       |  2 +-
 hw/block/fdc-isa.c                    |  2 +-
 hw/char/parallel.c                    |  2 +-
 hw/char/serial-isa.c                  |  2 +-
 hw/ide/isa.c                          |  2 +-
 hw/input/pckbd.c                      | 26 +++++++--
 hw/ipmi/isa_ipmi_bt.c                 |  2 +-
 hw/ipmi/isa_ipmi_kcs.c                |  2 +-
 hw/isa/isa-bus.c                      | 37 +------------
 hw/isa/piix4.c                        | 56 +++++++++++++++++--
 hw/mips/gt64xxx_pci.c                 | 80 +++------------------------
 hw/mips/malta.c                       |  7 +--
 hw/net/ne2000-isa.c                   |  2 +-
 hw/rtc/m48t59-isa.c                   |  9 ++-
 hw/rtc/mc146818rtc.c                  | 13 ++++-
 hw/tpm/tpm_tis_isa.c                  |  2 +-
 include/hw/isa/isa.h                  |  3 -
 include/hw/mips/mips.h                |  3 -
 include/hw/rtc/mc146818rtc.h          |  1 +
 include/hw/southbridge/piix.h         |  2 -
 target/mips/cpu.c                     | 11 +---
 target/mips/cpu.h                     |  9 ---
 target/mips/internal.h                |  9 +++
 tests/avocado/linux_ssh_mips_malta.py |  3 +
 tests/qemu-iotests/172.out            | 26 ---------
 27 files changed, 127 insertions(+), 190 deletions(-)

-- 
2.34.1


