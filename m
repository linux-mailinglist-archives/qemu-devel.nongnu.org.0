Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B607444444
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:07:13 +0100 (CET)
Received: from localhost ([::1]:46770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHr6-0006TW-7S
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHop-0003C4-Ab
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHom-0000Nm-PS
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id b71so2227297wmd.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f0EFEaW5qPKvQQgxtPkCRNO/htu6mBkNZ8+lyytBtEw=;
 b=pOddMxbElDDQj1BHXJMUYqkYLkBgChe66/DItU4pl8qTPqkbXnOAN8UeozrJhUvBLc
 +YcmaLWYkg8YH+KEhTZOszMhtVKB3dxK9QRMhWUCqt/VuJelGc9Ex4PGbTSP6fTRIpWO
 GFgZMe5ECRUcABhWT+UpRBIpdKrjpGvLLWSo4L5KU3TdKMi61S4iVPHRVY20kIG/YBMF
 JSnl/R+PqfiaaHaV7tEIIkseKr55+WvV4Zqbfv4AqnNNwGSoO2kspjcN9hj2YBLXR3u3
 q7MD/ilg3mBuLL5i8lk5dFhawZN38WmKBjdM27B8A35jvQn+En5zRTbkNwbcj4DAZG6V
 iq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=f0EFEaW5qPKvQQgxtPkCRNO/htu6mBkNZ8+lyytBtEw=;
 b=voAn5Srz++UIZAfOzjFUDkDz1SLbMa+Bb4wJ6qOFkCj51iqWCX/eLf2Uwjjz1UkpR3
 idtUSKrZ+DMh/hiSW0McP+N+ny2h1IW6zrXAB2XJejjok4UdXY85fvGfQ8KKUCHtV+bp
 C1KKebNzOjD5y47Ckp9znxKMvn6T5VtIjuMyJvcuz/BmZVR4/L89JABbEj301FWC7hW9
 Bgotb7iP3ScbvI98oGGJOoNvmbDtHyZ32WH2rLusUQbszAsYz5flqUw9tt8Spx+KTnNS
 eG4H+75PRC0tBaf8mOpJDDYDmGNhy/GEQXXcfA1qlb4+sVjm7uMTRZD2uGVEFp5U7uuV
 Z86A==
X-Gm-Message-State: AOAM5329Bv62JmBGWJqfbmSDBtIUTfOxFRwDJOsMYiabD9U6gu9IYuRG
 g/LdtdiDf4UweiCrseTG0V56vGxkpvI=
X-Google-Smtp-Source: ABdhPJzCsGi/qctHs3Knju+jLxsLyb1DeZL4S9Lrvtd3dWa3KTEKj8jd6bEExaoFJOdqYbxAdu8Pgg==
X-Received: by 2002:a1c:790d:: with SMTP id l13mr13223664wme.101.1635951885319; 
 Wed, 03 Nov 2021 08:04:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/27] Misc patches for QEMU 6.2 soft freeze
Date: Wed,  3 Nov 2021 16:04:15 +0100
Message-Id: <20211103150442.387121-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit f79bb385c0fb9756393bde2a13ebbc70ae6c8043:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20211101' into staging (2021-11-02 08:46:23 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 16bfbc70f39e420b6b6cfe39ed8571606482b94a:

  configure: fix --audio-drv-list help message (2021-11-02 15:57:28 +0100)

----------------------------------------------------------------
* Build system fixes and cleanups
* DMA support in the multiboot option ROM
* Rename default-bus-bypass-iommu
* Deprecate -watchdog and cleanup -watchdog-action
* HVF fix for <PAGE_SIZE regions
* Support TSC scaling for AMD nested virtualization
* Fix for ESP fuzzing bug

----------------------------------------------------------------
Alex Bennée (1):
      MAINTAINERS: update location of microvm docs

Alexander Graf (1):
      hvf: Avoid mapping regions < PAGE_SIZE as ram

Eugenio Pérez (1):
      util: Make some iova_tree parameters const

Helge Konetzka (1):
      configure/optionrom: Fix MSYS2 multiboot.bin issue

Jean-Philippe Brucker (1):
      hw/i386: Rename default_bus_bypass_iommu

Jessica Clarke (1):
      Partially revert "build: -no-pie is no functional linker flag"

Marcus Hähnel (1):
      optionrom: add a DMA-enabled multiboot ROM

Mark Cave-Ayland (2):
      esp: ensure in-flight SCSI requests are always cancelled
      qtest/am53c974-test: add test for cancelling in-flight requests

Maxim Levitsky (1):
      KVM: SVM: add migration support for nested TSC scaling

Paolo Bonzini (11):
      target/i386: move linuxboot_dma_enabled to X86MachineState
      target/i386: use DMA-enabled multiboot ROM for new-enough QEMU machine types
      configure: remove useless NPTL probe
      configure: do not duplicate CPU_CFLAGS into QEMU_LDFLAGS
      watchdog: add information from -watchdog help to -device help
      vl: deprecate -watchdog
      watchdog: remove select_watchdog_action
      meson: bump submodule to 0.59.3
      meson: remove pointless warnings
      meson: remove unnecessary coreaudio test program
      configure: fix --audio-drv-list help message

Pavel Dovgalyuk (1):
      hw/i386: fix vmmouse registration

Peter Xu (2):
      Makefile: Fix gtags generation
      Makefile: Fix cscope issues on MacOS and soft links

Thomas Huth (3):
      meson.build: Allow to disable OSS again
      Move the l2tpv3 test from configure to meson.build
      configure: Remove the check for the __thread keyword

 MAINTAINERS                       |   2 +-
 Makefile                          |   5 +-
 accel/hvf/hvf-accel-ops.c         |   7 +++
 configure                         | 113 ++++++++------------------------------
 docs/about/deprecated.rst         |   5 ++
 hw/i386/intel_iommu.c             |   2 +-
 hw/i386/microvm.c                 |   5 +-
 hw/i386/multiboot.c               |  10 +++-
 hw/i386/multiboot.h               |   4 +-
 hw/i386/pc.c                      |  10 ++--
 hw/i386/pc_piix.c                 |   3 +-
 hw/i386/pc_q35.c                  |   3 +-
 hw/i386/vmmouse.c                 |   1 +
 hw/i386/x86.c                     |   7 ++-
 hw/scsi/esp.c                     |  10 ++--
 hw/watchdog/sbsa_gwdt.c           |   3 +-
 hw/watchdog/watchdog.c            |  14 -----
 hw/watchdog/wdt_aspeed.c          |   3 +-
 hw/watchdog/wdt_diag288.c         |   3 +-
 hw/watchdog/wdt_i6300esb.c        |   3 +-
 hw/watchdog/wdt_ib700.c           |   3 +-
 hw/watchdog/wdt_imx2.c            |   4 +-
 include/hw/i386/pc.h              |   3 -
 include/hw/i386/x86.h             |   5 +-
 include/hw/qdev-core.h            |   1 +
 include/qemu/iova-tree.h          |   8 +--
 include/sysemu/watchdog.h         |   1 -
 meson                             |   2 +-
 meson.build                       |  30 +++-------
 meson_options.txt                 |   2 +
 monitor/misc.c                    |  15 ++++-
 net/meson.build                   |   4 +-
 pc-bios/meson.build               |   1 +
 pc-bios/multiboot_dma.bin         | Bin 0 -> 1024 bytes
 pc-bios/optionrom/Makefile        |   9 +--
 pc-bios/optionrom/multiboot.S     |   4 +-
 pc-bios/optionrom/multiboot_dma.S |   2 +
 pc-bios/optionrom/optionrom.h     |  66 ++++++++++++++++++++++
 scripts/meson-buildoptions.py     |  16 ------
 scripts/meson-buildoptions.sh     |   3 +
 softmmu/qdev-monitor.c            |   1 +
 softmmu/vl.c                      |  11 ++--
 target/i386/cpu.c                 |   5 ++
 target/i386/cpu.h                 |   4 ++
 target/i386/kvm/kvm.c             |  15 +++++
 target/i386/machine.c             |  22 ++++++++
 tests/qtest/am53c974-test.c       |  36 ++++++++++++
 util/iova-tree.c                  |  12 ++--
 48 files changed, 294 insertions(+), 204 deletions(-)
 create mode 100644 pc-bios/multiboot_dma.bin
 create mode 100644 pc-bios/optionrom/multiboot_dma.S
-- 
2.31.1


