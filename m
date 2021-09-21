Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF2E412EE2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:58:09 +0200 (CEST)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZjE-00023g-5f
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZfo-0007Zp-PS
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:37 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:32908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZfl-0003Yx-GM
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207274; x=1663743274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PgTTt6J6HKA1KPNJM09XhkMnxvKqRZr161jbIPUQqnU=;
 b=assbzYTVa3VoXTdvcr83ncn6VUBmfHixQp0GvKMYoCQmL3D53etyvBjv
 LWqBEQq/63dPnCXm7wfPd+XL2GSHoEEERt4iQdSPVpERyP93UY+feH3qW
 pKdpW6JCayZp/ZntzV5nIeWHoJ55Ju12YjYxOJ5XFGijoGKqrUmmvQ3Qy
 s36SCfc0qfApoB9Ge0d1rCI5iGwwUSuBvgu++cI37O6JXey1xbYhed5oK
 JgVRr/UvNqpsrzxV1aT0xSv/xVgGhvmR88BkNt/2sMa/lDVGNBBfmz5GO
 xz29ZAKTmgIIMCFk26sYp51fWl4/QYppySocKP1O8nW8JwX6TH8+SkXQJ w==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="181039162"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:54:27 +0800
IronPort-SDR: mhWGV5wwn/j/saSyM3QiyVPHnXpV75ih8ZHUkSKKLHE2a2mztlg2RNNQOqZ3L0TsP+tlkdqGQ2
 AXSImEHs1iMVh+dex47/90APRU7ksIQeYJak4H6aPIXK0Skg8ZZEM4vys8k+xQz3yE6Ifb7WY6
 rBMqRjglZP5Oyp6hjAd8PT3Bb+LC4ndcF0NgIfX/UWCddl8nCSD8sUug4XHDjDsj+z+JZBQhtD
 /96WCsFFXmOqHzdyv7pymk0zhwbIn6lJYTcfLZA8jcfnFF9KVYAK+HhyS9uhCYPm5j04a473mX
 EiQ5VS9bjuysTC2KIiQNSjC+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:30:41 -0700
IronPort-SDR: iUhsqzrJiKrEpK8eKljU/PkvzewgkdOyWf9EhCyNAvbo8fuazeVl/LIom9zq2geSkItXkq92YB
 RLg9NpNefObDPksUXortPpWkkuKwIrL+Gb0/f+ltbMU8/+J1Ghhtnq8x7BVIHduV7JglWSm7UL
 1CJrwR88cj/AgBaxfVs/uhb6u9W1GOfHR6DEkf9PIomNIqKXh+y1u06XILiHMiB0Bwn/H01uu6
 JUk1R0gICemTi4DQ9Wm2k9nTRD4KqGUp87xVumjY13KKIw1EMLX36WT1aWnjPsiEGKBDKILRqh
 j4c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:54:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBxG3Jz3z1Rws4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:54:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1632207264; x=1634799265; bh=PgTTt6J6HKA1KPNJM09XhkMnxvKqRZr1
 61jbIPUQqnU=; b=cqnO0uE5tjBDYi8Qh5iM8LyyYpuTvxpIWfA0MHTERWEvIfEn
 HkildRN5L6jWBL9S92AeHnYou5IAtecVJ2hQMh9JxNvtrOYHiU7pA8jBt4tEMD+l
 WpKJe9YQ3MMXxK6YQ9WxFlkxNcLoJZWR6a5ACuEasT4yGSXmppEldvFc7C0NkIWL
 DIMNcVq4Xwd3MfezWkbu+Y6H6NLDKAQR6GLuluBjR32F1q/ZXslD//rcVaYKKKCR
 wNdXTSLzycb+TKD7SqSDaCLhiD1ifd1IFzDk0GlAisdqGqfep8eJiU4CAV2dcUFu
 TuyQSqNafZ9qQYbinIKnZ1eSfyKowkkGvjBkkw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VlWReJnzKceH for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:54:24 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBx90pKfz1RvlH;
 Mon, 20 Sep 2021 23:54:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 00/21] riscv-to-apply queue
Date: Tue, 21 Sep 2021 16:53:51 +1000
Message-Id: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 326ff8dd09556fc2e257196c49f35009700794=
ac:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' i=
nto staging (2021-09-20 16:17:05 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210921

for you to fetch changes up to ed481d9837250aa682f5156528bc923e1b214f76:

  hw/riscv: opentitan: Correct the USB Dev address (2021-09-21 12:10:47 +=
1000)

----------------------------------------------------------------
Second RISC-V PR for QEMU 6.2

 - ePMP CSR address updates
 - Convert internal interrupts to use QEMU GPIO lines
 - SiFive PWM support
 - Support for RISC-V ACLINT
 - SiFive PDMA fixes
 - Update to u-boot instructions for sifive_u
 - mstatus.SD bug fix for hypervisor extensions
 - OpenTitan fix for USB dev address

----------------------------------------------------------------
Alistair Francis (9):
      target/riscv: Update the ePMP CSR address
      target/riscv: Expose interrupt pending bits as GPIO lines
      hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
      hw/intc: ibex_plic: Convert the PLIC to use RISC-V CPU GPIO lines
      hw/intc: sifive_plic: Convert the PLIC to use RISC-V CPU GPIO lines
      hw/intc: ibex_timer: Convert the timer to use RISC-V CPU GPIO lines
      hw/timer: Add SiFive PWM support
      sifive_u: Connect the SiFive PWM device
      hw/riscv: opentitan: Correct the USB Dev address

Anup Patel (4):
      hw/intc: Rename sifive_clint sources to riscv_aclint sources
      hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
      hw/riscv: virt: Re-factor FDT generation
      hw/riscv: virt: Add optional ACLINT support to virt machine

Bin Meng (2):
      docs/system/riscv: sifive_u: Update U-Boot instructions
      target/riscv: csr: Rename HCOUNTEREN_CY and friends

Frank Chang (4):
      hw/dma: sifive_pdma: reset Next* registers when Control.claim is se=
t
      hw/dma: sifive_pdma: claim bit must be set before DMA transactions
      hw/dma: sifive_pdma: don't set Control.error if 0 bytes to transfer
      target/riscv: Backup/restore mstatus.SD bit when virtual register s=
wapped

Green Wan (1):
      hw/dma: sifive_pdma: allow non-multiple transaction size transactio=
ns

LIU Zhiwei (1):
      target/riscv: Fix satp write

 docs/system/riscv/sifive_u.rst |  50 ++--
 docs/system/riscv/virt.rst     |  10 +
 include/hw/intc/ibex_plic.h    |   2 +
 include/hw/intc/riscv_aclint.h |  80 +++++
 include/hw/intc/sifive_clint.h |  60 ----
 include/hw/intc/sifive_plic.h  |   4 +
 include/hw/riscv/sifive_u.h    |  14 +-
 include/hw/riscv/virt.h        |   2 +
 include/hw/timer/ibex_timer.h  |   2 +
 include/hw/timer/sifive_pwm.h  |  62 ++++
 target/riscv/cpu_bits.h        |  12 +-
 hw/dma/sifive_pdma.c           |  54 +++-
 hw/intc/ibex_plic.c            |  17 +-
 hw/intc/riscv_aclint.c         | 460 +++++++++++++++++++++++++++++
 hw/intc/sifive_clint.c         | 287 ------------------
 hw/intc/sifive_plic.c          |  30 +-
 hw/riscv/microchip_pfsoc.c     |  13 +-
 hw/riscv/opentitan.c           |  13 +-
 hw/riscv/shakti_c.c            |  16 +-
 hw/riscv/sifive_e.c            |  15 +-
 hw/riscv/sifive_u.c            |  68 ++++-
 hw/riscv/spike.c               |  16 +-
 hw/riscv/virt.c                | 654 ++++++++++++++++++++++++++++-------=
------
 hw/timer/ibex_timer.c          |  17 +-
 hw/timer/sifive_pwm.c          | 468 +++++++++++++++++++++++++++++
 target/riscv/cpu.c             |  31 ++
 target/riscv/cpu_helper.c      |   3 +-
 target/riscv/csr.c             |  26 +-
 hw/intc/Kconfig                |   2 +-
 hw/intc/meson.build            |   2 +-
 hw/riscv/Kconfig               |  13 +-
 hw/timer/Kconfig               |   3 +
 hw/timer/meson.build           |   1 +
 hw/timer/trace-events          |   6 +
 34 files changed, 1844 insertions(+), 669 deletions(-)
 create mode 100644 include/hw/intc/riscv_aclint.h
 delete mode 100644 include/hw/intc/sifive_clint.h
 create mode 100644 include/hw/timer/sifive_pwm.h
 create mode 100644 hw/intc/riscv_aclint.c
 delete mode 100644 hw/intc/sifive_clint.c
 create mode 100644 hw/timer/sifive_pwm.c

