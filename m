Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B9D674E4D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:43:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm01-0007h3-9c; Fri, 20 Jan 2023 02:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzp-0007bY-3f
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:34 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzl-0004mQ-Dm
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200369; x=1705736369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xuGtbpwhmQfaUKXn9gE/+CYSkiywFSRT72RtLUcQP6s=;
 b=AHXk0avYu6OQS74BoHq3Yo7l1IHWA5+8d5A9wOYsUJ4adHda3hYYDXSN
 hiHq1fgBAOc/YKBExtzJV1Qn17F9IYT4UG+cyjW8TiGq2LZ5zkF2MoFuh
 jsMHS2Oyhe9SLJ9J8c18etm5PpmOqKR2rcNlZT1qzdLBjHrr1tQeaSHR3
 H5gSOwpjxoLgk96IamhwumKhlQFM/oq6kxyFHXFTVSGZVp3y8OflSrsfK
 G9y+7ZmDbypFazwCrLX5wiKHIez9Co07KqcplL3lXart/39MRf/hihXR1
 6HJJGwxPI1JSGiaonl5yWAfodHGdrVme3P2g5cjLWHnmleaSmFd4GVqKf w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176666"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:23 +0800
IronPort-SDR: 3sVvAYjf9l1dFbdTQ28sLP+tVmmQcsxorPGoA/am1yhU3nA+tbL16ty7b4euQVe4/4CFmzY/ob
 9Qs5JAjUiQ/zlvMXGE3VIeMrs4nJlOQwDPuseD+lHx54YIHrZxgwX4IAv1pM2TFpMJNL9vs5ZZ
 7IUuDIojH70coOr51PbZp/TQ7FdC0vDhOZDc0OWEgZWIBH7a+kOI2PydJAUxidwqW28Ho5rK/D
 YJPUTyoxTDcr6lNn6ki/itA9E4T+UAkfuTDgzKTavX+AyItDFlgWw4AgzUYUw1232PPpIVj08c
 q0g=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:01 -0800
IronPort-SDR: 95VX9QL6usiaHaVeabDjmCAWaf2TqIDu1txW118VZ6Wv2+eo90pRj5bx+E2vV8mSflpSg92WYA
 62rtgBJRU9XGeu7EI+ww11FL0hkXiOz3vMehQ4S/x0eSXSJnapyrsoqwtzqoDzBQ+oJVzCm3zB
 wXxDUqzARdxMy5yOsEL+EgLrcCxfaxYCZwi5UTNT4lldZLYs/aHWC+KANKsJLRyCOH5SzIRIcY
 8YmKIQtHouIOfc1ICSODMMOifJvQl39k7nAIicnllVjJIB4k+m0/TZHC/HcLoBKylPntcJeOg4
 6cc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrwq0Xnpz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1674200362; x=1676792363; bh=xuGtbpwhmQfaUKXn9gE/+CYSkiywFSRT
 72RtLUcQP6s=; b=itbrhhWUqNlxrlxL/lU+Y/JFgB/SN+r2m8w7rh5swuncG78H
 UeTNv+tCBQTM6JpX6lcqVjEnYmbLXBjg1MID6m/Ac1PW2YZlNatQUjodzsGGrY6q
 wKbeUsz28rjlgXKHdl/clEB/+1/5Y5YaDcmMB54DrlURCmlb72XQWY5LppYTckGJ
 bgFmwrWtruVzAb1/6bn1skDPvnvdMrZlQH9X4PsxNlNav70yiH+99HHfdYlClnlQ
 xck6q/smc0IBrmQ8LLHLCPoSVYrF8GbwR3PYinGHYNbpgFdBS5c4PiPy/fWTl8Ac
 +5rgQL2il+YXXNuxQ/xE4ER+62KL975ldiGAgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0I0Gk6eVs4-e for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:22 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrwn272Nz1RvLy;
 Thu, 19 Jan 2023 23:39:21 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/37] riscv-to-apply queue
Date: Fri, 20 Jan 2023 17:38:36 +1000
Message-Id: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 239b8b0699a222fd21da1c5fdeba0a2456085a=
47:

  Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/l=
aurent_vivier/qemu into staging (2023-01-19 15:05:29 +0000)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2023012=
0

for you to fetch changes up to b748352c555b42d497fe8ee00ee2e44eb8627660:

  hw/riscv/virt.c: move create_fw_cfg() back to virt_machine_init() (2023=
-01-20 10:14:14 +1000)

----------------------------------------------------------------
Second RISC-V PR for QEMU 8.0

* riscv_htif: Support console output via proxy syscall
* Cleanup firmware and device tree loading
* Fix elen check when using vector extensions
* add RISC-V OpenSBI boot test
* Ensure we always follow MISA parsing
* Fix up masking of vsip/vsie accesses
* Trap on writes to stimecmp from VS when hvictl.VTI=3D1
* Introduce helper_set_rounding_mode_chkfrm

----------------------------------------------------------------
Andrew Bresticker (2):
      target/riscv: Fix up masking of vsip/vsie accesses
      target/riscv: Trap on writes to stimecmp from VS when hvictl.VTI=3D=
1

Bin Meng (11):
      hw/char: riscv_htif: Avoid using magic numbers
      hw/char: riscv_htif: Drop {to, from}host_size in HTIFState
      hw/char: riscv_htif: Drop useless assignment of memory region
      hw/char: riscv_htif: Use conventional 's' for HTIFState
      hw/char: riscv_htif: Move registers from CPUArchState to HTIFState
      hw/char: riscv_htif: Remove forward declarations for non-existent v=
ariables
      hw/char: riscv_htif: Support console output via proxy syscall
      hw/riscv: spike: Remove the out-of-date comments
      hw/riscv/boot.c: Introduce riscv_find_firmware()
      hw/riscv: spike: Decouple create_fdt() dependency to ELF loading
      target/riscv: Use TARGET_FMT_lx for env->mhartid

Daniel Henrique Barboza (20):
      hw/riscv/boot.c: make riscv_find_firmware() static
      hw/riscv/boot.c: introduce riscv_default_firmware_name()
      tests/avocado: add RISC-V OpenSBI boot test
      hw/riscv/spike: use 'fdt' from MachineState
      hw/riscv/sifive_u: use 'fdt' from MachineState
      hw/riscv/boot.c: exit early if filename is NULL in load functions
      hw/riscv/spike.c: load initrd right after riscv_load_kernel()
      hw/riscv: write initrd 'chosen' FDT inside riscv_load_initrd()
      hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()
      hw/riscv/boot.c: use MachineState in riscv_load_initrd()
      hw/riscv/boot.c: use MachineState in riscv_load_kernel()
      target/riscv/cpu: set cpu->cfg in register_cpu_props()
      target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()
      hw/riscv/spike.c: simplify create_fdt()
      hw/riscv/virt.c: simplify create_fdt()
      hw/riscv/sifive_u.c: simplify create_fdt()
      hw/riscv/virt.c: remove 'is_32_bit' param from create_fdt_socket_cp=
us()
      hw/riscv: use MachineState::fdt in riscv_socket_fdt_write_id()
      hw/riscv: use ms->fdt in riscv_socket_fdt_write_distance_matrix()
      hw/riscv/virt.c: move create_fw_cfg() back to virt_machine_init()

Dongxue Zhang (1):
      target/riscv/cpu.c: Fix elen check

Richard Henderson (3):
      tcg/riscv: Use tcg_pcrel_diff in tcg_out_ldst
      target/riscv: Introduce helper_set_rounding_mode_chkfrm
      target/riscv: Remove helper_set_rod_rounding_mode

 include/hw/char/riscv_htif.h            |  19 +-
 include/hw/riscv/boot.h                 |   9 +-
 include/hw/riscv/numa.h                 |  10 +-
 include/hw/riscv/sifive_u.h             |   3 -
 include/hw/riscv/spike.h                |   2 -
 target/riscv/cpu.h                      |   8 +-
 target/riscv/helper.h                   |   2 +-
 hw/char/riscv_htif.c                    | 172 +++++++-----
 hw/riscv/boot.c                         | 105 +++++---
 hw/riscv/microchip_pfsoc.c              |  12 +-
 hw/riscv/numa.c                         |  14 +-
 hw/riscv/opentitan.c                    |   3 +-
 hw/riscv/sifive_e.c                     |   3 +-
 hw/riscv/sifive_u.c                     |  53 ++--
 hw/riscv/spike.c                        | 108 ++++----
 hw/riscv/virt.c                         |  86 +++---
 target/riscv/cpu.c                      | 445 ++++++++++++++++++--------=
------
 target/riscv/csr.c                      |  41 ++-
 target/riscv/fpu_helper.c               |  36 ++-
 target/riscv/machine.c                  |   6 +-
 target/riscv/translate.c                |  21 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  24 +-
 tcg/riscv/tcg-target.c.inc              |   2 +-
 tests/avocado/riscv_opensbi.py          |  65 +++++
 24 files changed, 713 insertions(+), 536 deletions(-)
 create mode 100644 tests/avocado/riscv_opensbi.py

