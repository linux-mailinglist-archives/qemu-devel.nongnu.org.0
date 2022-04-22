Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1595250ACDD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:39:54 +0200 (CEST)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhKy-00005Z-UM
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIP-00060J-0W
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:13 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:55685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhIL-0005F4-QH
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587830; x=1682123830;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v9XEUy2UqydQvkB08qTzjRZX4Md4dLheFlYZnAIIrIk=;
 b=pvcTG+NVG1X8NZuMPzqF5ewehtbTk0yJKG4/RavO9OOzHWNu9Rhe8a9x
 gmAXsjcrPyRvzHtIjJSP31QlyQG1Krpr0hKse5KSevBTrYpPU/mDrr6z4
 yYY0FOvk5JkU2zSum0nN5xHk8GiHY5xHgztkC7PSW3/5V0T8Ou0ajfHFD
 M/VwnpivscOrjpxc08ruM6dgWXko9gdcCfXpXUrAzAx7bhQr7wV4TMUQ2
 ccTpMZ4XwcSh7HboNt4TIm46/3apzsC4wGGo3a9k3jmVP9kVeGJFc6lTb
 6cU/4acRopV15PaYp9ATUOOT/n8yLv9uSyn/s9HPQmHJiVUbiwlHcvJTO A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="199409752"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:07 +0800
IronPort-SDR: Ujf5UgME12Obgd2VmoqoOqtSz3k+aj94AbdW03EnOss4X5ViPD+VK3FdFJWIQKnKjZlPtCGgpb
 IZy+gmwzmKiCkKOhAu46WwHOo1ZJ+z9jzoRrn2dNOH/P/pB0n1WO3UXUWmkuL6iyyZpNhPIUY9
 FTkBFGATmH2UdTT/zdf2kivn88vuWoP9IMBiIiZU50Ob88hS1Mho5llKAX5EG+dWES+LGxmlRs
 NNGrgIxa7PUBemwYAcLY48Qza3sgF/hz0nzZIOzKDJPfhi5mKLR9M+DKMd035MiFzwKBcfi6ON
 q7Qee1PbDPSttgKlZgsV0za6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:07:23 -0700
IronPort-SDR: C5Q+kaKj3zpHQC1vAc5m7I2CMo1jyM6EK/zAK1n0ilzRjEEpcn5UyQBuwxrWK0T4/mk0f+0Nq4
 z/pwhEzWcEJoPONVrGp3tE82RHwoLC0+JkHRSBffuzjQg/nukB15zqK2W4geK+mMwkbhXKNG2a
 qjNZa1t/yj8KIEjGIJGhTJAO4Pwui26XGV7hrSQ5GNsBTsI2rsolt8unA/+nV//oFPGwqMx6ru
 bjwaEpgyHaprd5ulKtQUN4WcKqV+84RAY0eXn3l/Nt2oNgy9EX36sHnoD59eZtquHiA0F3FWZJ
 I14=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwTZ35kjz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1650587825; x=1653179826; bh=v9XEUy2UqydQvkB08qTzjRZX4Md4dLhe
 FlYZnAIIrIk=; b=AQYo37iTC+W4JnZqNezrzv+YjJTBpCGzbCQc8OC8aBrtzZWT
 sl1AYRFP9nqX7fvIYMCNYHuzS0S5L3l81tgm+WoluCFzklKZGffeiu27KrlgKCrq
 koC/+NH9j1oYCKZm0zTe/8+XCBsuEYlA2ncHrH5Q4p+R+Y0m+QlIQuEnjowjw1GK
 Q09pZWTVd/YlIgUWvvf8hsXosHOSgf4Jd1jOxDui4gcuVa+bEZk8b8TAY9Wb+bxw
 bxJ+zbjqL5cXR6YJrhaqoNIboOe4D+PYw3AOIzVUGR8UQzOVHjpdfTasUW7h0Zly
 O3+3LnIuOPdtPLWJLybbfsGkVdhUrNLTMitiug==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FZuF8Tl7sWnK for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:05 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwTX08GLz1Rvlx;
 Thu, 21 Apr 2022 17:37:03 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 00/31] riscv-to-apply queue
Date: Fri, 22 Apr 2022 10:36:25 +1000
Message-Id: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit da5006445a92bb7801f54a93452fac63ca2f63=
4c:

  Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into s=
taging (2022-04-21 15:16:52 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220422-1

for you to fetch changes up to faee5441a038898f64b335dbaecab102ba406552:

  hw/riscv: boot: Support 64bit fdt address. (2022-04-22 10:35:16 +1000)

----------------------------------------------------------------
First RISC-V PR for QEMU 7.1

 * Add support for Ibex SPI to OpenTitan
 * Add support for privileged spec version 1.12.0
 * Use privileged spec version 1.12.0 for virt machine by default
 * Allow software access to MIP SEIP
 * Add initial support for the Sdtrig extension
 * Optimisations for vector extensions
 * Improvements to the misa ISA string
 * Add isa extenstion strings to the device tree
 * Don't allow `-bios` options with KVM machines
 * Fix NAPOT range computation overflow
 * Fix DT property mmu-type when CPU mmu option is disabled
 * Make RISC-V ACLINT mtime MMIO register writable
 * Add and enable native debug feature
 * Support 64bit fdt address.

----------------------------------------------------------------
Alistair Francis (2):
      target/riscv: cpu: Fixup indentation
      target/riscv: Allow software access to MIP SEIP

Atish Patra (7):
      target/riscv: Define simpler privileged spec version numbering
      target/riscv: Add the privileged spec version 1.12.0
      target/riscv: Introduce privilege version field in the CSR ops.
      target/riscv: Add support for mconfigptr
      target/riscv: Add *envcfg* CSRs support
      target/riscv: Enable privileged spec version 1.12
      target/riscv: Add isa extenstion strings to the device tree

Bin Meng (7):
      target/riscv: Add initial support for the Sdtrig extension
      target/riscv: debug: Implement debug related TCGCPUOps
      target/riscv: cpu: Add a config option for native debug
      target/riscv: csr: Hook debug CSR read/write
      target/riscv: machine: Add debug state description
      target/riscv: cpu: Enable native debug feature
      hw/core: tcg-cpu-ops.h: Update comments of debug_check_watchpoint()

Dylan Jhong (1):
      hw/riscv: boot: Support 64bit fdt address.

Frank Chang (3):
      hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLI=
NT
      hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V AC=
LINT
      hw/intc: Make RISC-V ACLINT mtime MMIO register writable

Jim Shu (1):
      hw/intc: riscv_aclint: Add reset function of ACLINT devices

Nicolas Pitre (1):
      target/riscv/pmp: fix NAPOT range computation overflow

Niklas Cassel (1):
      hw/riscv: virt: fix DT property mmu-type when CPU mmu option is dis=
abled

Ralf Ramsauer (1):
      hw/riscv: virt: Exit if the user provided -bios in combination with=
 KVM

Richard Henderson (1):
      target/riscv: Use cpu_loop_exit_restore directly from mmu faults

Tsukasa OI (1):
      target/riscv: misa to ISA string conversion fix

Weiwei Li (3):
      target/riscv: optimize condition assign for scale < 0
      target/riscv: optimize helper for vmv<nr>r.v
      target/riscv: fix start byte for vmv<nf>r.v when vstart !=3D 0

Wilfred Mallawa (2):
      hw/ssi: Add Ibex SPI device model
      riscv: opentitan: Connect opentitan SPI Host

 include/hw/core/tcg-cpu-ops.h           |   1 +
 include/hw/intc/riscv_aclint.h          |   1 +
 include/hw/riscv/boot.h                 |   4 +-
 include/hw/riscv/opentitan.h            |  30 +-
 include/hw/ssi/ibex_spi_host.h          |  94 +++++
 target/riscv/cpu.h                      |  40 ++-
 target/riscv/cpu_bits.h                 |  40 +++
 target/riscv/debug.h                    | 114 ++++++
 target/riscv/helper.h                   |   5 +-
 hw/intc/riscv_aclint.c                  | 144 ++++++--
 hw/riscv/boot.c                         |  12 +-
 hw/riscv/opentitan.c                    |  36 +-
 hw/riscv/virt.c                         |  24 +-
 hw/ssi/ibex_spi_host.c                  | 612 ++++++++++++++++++++++++++=
++++++
 target/riscv/cpu.c                      | 120 ++++++-
 target/riscv/cpu_helper.c               |  10 +-
 target/riscv/csr.c                      | 282 +++++++++++++--
 target/riscv/debug.c                    | 441 +++++++++++++++++++++++
 target/riscv/machine.c                  |  55 +++
 target/riscv/pmp.c                      |  14 +-
 target/riscv/vector_helper.c            |  31 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  25 +-
 hw/ssi/meson.build                      |   1 +
 hw/ssi/trace-events                     |   7 +
 target/riscv/meson.build                |   1 +
 25 files changed, 1971 insertions(+), 173 deletions(-)
 create mode 100644 include/hw/ssi/ibex_spi_host.h
 create mode 100644 target/riscv/debug.h
 create mode 100644 hw/ssi/ibex_spi_host.c
 create mode 100644 target/riscv/debug.c

