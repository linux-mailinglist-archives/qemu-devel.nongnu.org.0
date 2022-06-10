Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E129545B25
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 06:33:55 +0200 (CEST)
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzWLK-0005TU-6e
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 00:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWF5-0002uG-JN
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:27 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:23579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1538de18e=alistair.francis@opensource.wdc.com>)
 id 1nzWF2-00011H-IX
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 00:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654835244; x=1686371244;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lJO/1rav/e4AbN0GkrRJnTo6hVAomzXiidjCeNJGSIM=;
 b=pA5up1SWvPKbQhxvvgAiQ3nXljJ5AdxQzlSe3D4TMl1p2e7GdqcRkhF8
 OX9JKNY9FgSwAooJ8tnYU90Mhnek+zWoAlhpErfnM1x98iq85Lt38pqNX
 qcSgInpGXFWsP2G7VGOZ6SPWNHXP/a1o3AJbDLtgZoLyr6cCT8+0/DbD9
 UXp92EZ9FIrECSrfjNYLO7wHslgeVF4ujtC9XhB1mp1K3xH/l3LDtYL9p
 JFYHOX6rkDxuT9NJuLi/Lgw7V6w/E32a+bm1wWXgwh7c19V+f9uAwbpho
 E7HuvHS2Rmb0vAj8veh8/gKYUS7GU3f5LpaP9x3TyWGm/NemWTpJl0yeD A==;
X-IronPort-AV: E=Sophos;i="5.91,288,1647273600"; d="scan'208";a="307046417"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Jun 2022 12:27:19 +0800
IronPort-SDR: jk3k/4iQpRCnVEcXtHJmT3jIOFovrynGe0xauG/jLrAFUPg9PDYFaGKniEmLuqGWmQyK7Q14wL
 3uSwfhSCEra8AgXjGGQOtB3eitFIDn43BBYyC2u7XcdyDvm7hWebY2XosEm7SMz1Isqt8oIOzm
 /TU75Is4D+r+LVfkgqI6ACuJ7iUQt1ChpAulWGfO+k9woTkjrJen0av3f7dX29z12SEs9A5cMH
 NvqHsPEerFLMF86Es/CNIXgPVqOkSduLdhJ5nBPvUUmaHdGdSOa1KYny7Jr23SxhBTcxKWa2Az
 5BNXimAMx8rEl4T5Rk7EkhCs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 20:50:27 -0700
IronPort-SDR: uknjnGfLGfgXKNUoyFpsXzsyH37o5PcSo01PA3Bos9F6YxJLsi3VOBY2N5AqLBcG5VYmJ2/pk0
 i/2S+KN05fpBYtXw212QAXD9Vs9tnoHHtPC9R+rQjmkfd0zaP+hilyyzTGKeKvTQFJmOgc84hw
 2d8GVecNDZgXV/Z+O9KQZaS/GRdLKV5PiPRO8tvksLTEHMzxJVgvf5Jtb99GnLKt2VytrZnlm1
 yr5ptKObi2pe3XtdF0asnLvimSV00MNOcio4mHr8drSZnzjOn5dmN48qu72BQRlau3b9/Rxa1l
 WVs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 21:27:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LK7GZ0ps0z1Rwrw
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 21:27:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1654835237; x=1657427238; bh=lJO/1rav/e4AbN0GkrRJnTo6hVAomzXi
 idjCeNJGSIM=; b=BYXdlJJhr3gSjBfDzXm7FFevKx+v/7b+Lf3iohzw4AsPnKVl
 Zv3xQD8rVN6uo/ptXlxcFTaBXD1WDx8yVGThP1wJK8BbgulMvOq7eQVe2k13VeVi
 +CKP3eLyMDllhkZWUBPNo/vyqUvtJCtYKaAu6uyqiOjNDgxGyCAXTRvGbz7DsN3+
 SqJsSRZlKkWM6YVl6CFIKKCSti38+Mv8blujygK8Ooc8B4SnYOs9uwVvqimgejw5
 rsJOIltG2D69+wPPhwEcn66Z+s//0zG6WMqLzTx8Ywx6p1xUy/eLh5TxJtTkCX28
 4Art0YSnMuxi7PYtK00VTDenYIQSXfTHyTdrxw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id csm596GvNULk for <qemu-devel@nongnu.org>;
 Thu,  9 Jun 2022 21:27:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.12])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LK7GV5tLHz1Rvlc;
 Thu,  9 Jun 2022 21:27:14 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/25] riscv-to-apply queue
Date: Fri, 10 Jun 2022 14:26:30 +1000
Message-Id: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1538de18e=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

The following changes since commit 9cc1bf1ebca550f8d90f967ccd2b6d2e00e813=
87:

  Merge tag 'pull-xen-20220609' of https://xenbits.xen.org/git-http/peopl=
e/aperard/qemu-dm into staging (2022-06-09 08:25:17 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220610

for you to fetch changes up to 07314158f6aa4d2589520c194a7531b9364a8d54:

  target/riscv: trans_rvv: Avoid assert for RV32 and e64 (2022-06-10 09:4=
2:12 +1000)

----------------------------------------------------------------
Fourth RISC-V PR for QEMU 7.1

* Update MAINTAINERS
* Add support for Zmmul extension
* Fixup FDT errors when supplying device tree from the command line for v=
irt machine
* Avoid overflowing the addr_config buffer in the SiFive PLIC
* Support -device loader addresses above 2GB
* Correctly wake from WFI on VS-level external interrupts
* Fixes for RV128 support
* Support Vector extension tail agnostic setting elements' bits to all 1s
* Don't expose the CPU properties on named CPUs
* Fix vector extension assert for RV32

----------------------------------------------------------------
Alistair Francis (4):
      MAINTAINERS: Cover hw/core/uboot_image.h within Generic Loader sect=
ion
      hw/intc: sifive_plic: Avoid overflowing the addr_config buffer
      target/riscv: Don't expose the CPU properties on names CPUs
      target/riscv: trans_rvv: Avoid assert for RV32 and e64

Andrew Bresticker (1):
      target/riscv: Wake on VS-level external interrupts

Atish Patra (1):
      hw/riscv: virt: Generate fw_cfg DT node correctly

Fr=C3=A9d=C3=A9ric P=C3=A9trot (1):
      target/riscv/debug.c: keep experimental rv128 support working

Jamie Iles (1):
      hw/core/loader: return image sizes as ssize_t

Weiwei Li (1):
      target/riscv: add support for zmmul extension v0.1

eopXD (16):
      target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
      target/riscv: rvv: Prune redundant access_type parameter passed
      target/riscv: rvv: Rename ambiguous esz
      target/riscv: rvv: Early exit when vstart >=3D vl
      target/riscv: rvv: Add tail agnostic for vv instructions
      target/riscv: rvv: Add tail agnostic for vector load / store instru=
ctions
      target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instructions
      target/riscv: rvv: Add tail agnostic for vector integer shift instr=
uctions
      target/riscv: rvv: Add tail agnostic for vector integer comparison =
instructions
      target/riscv: rvv: Add tail agnostic for vector integer merge and m=
ove instructions
      target/riscv: rvv: Add tail agnostic for vector fix-point arithmeti=
c instructions
      target/riscv: rvv: Add tail agnostic for vector floating-point inst=
ructions
      target/riscv: rvv: Add tail agnostic for vector reduction instructi=
ons
      target/riscv: rvv: Add tail agnostic for vector mask instructions
      target/riscv: rvv: Add tail agnostic for vector permutation instruc=
tions
      target/riscv: rvv: Add option 'rvv_ta_all_1s' to enable optional ta=
il agnostic behavior

 include/hw/loader.h                     |   55 +-
 target/riscv/cpu.h                      |    4 +
 target/riscv/internals.h                |    6 +-
 hw/arm/armv7m.c                         |    2 +-
 hw/arm/boot.c                           |    8 +-
 hw/core/generic-loader.c                |    2 +-
 hw/core/loader.c                        |   81 +-
 hw/i386/x86.c                           |    2 +-
 hw/intc/sifive_plic.c                   |   19 +-
 hw/riscv/boot.c                         |    5 +-
 hw/riscv/virt.c                         |   28 +-
 target/riscv/cpu.c                      |   68 +-
 target/riscv/cpu_helper.c               |    4 +-
 target/riscv/debug.c                    |    2 +
 target/riscv/translate.c                |    4 +
 target/riscv/vector_helper.c            | 1588 +++++++++++++++++++------=
------
 target/riscv/insn_trans/trans_rvm.c.inc |   18 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  106 ++-
 MAINTAINERS                             |    1 +
 19 files changed, 1244 insertions(+), 759 deletions(-)

