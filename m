Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DED3C668F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:56:32 +0200 (CEST)
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m34ql-0000yi-1o
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oH-00059B-Ed
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:57 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=820a0e1fd=alistair.francis@wdc.com>)
 id 1m34oE-0006qj-Ot
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 18:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626130435; x=1657666435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e2SamykycUDVip8iIDk8JN2JdGrIz/yhWcXZEHbf5yQ=;
 b=gYIo39qfH5/PUxYbjJL9eOTWzNLZI0lnEVx3xGIkuCqBFnIeDTZT1D88
 1eW/fNXaAtBS6PsgFtMSLNcPx/ujGNj9Qjjg0DT1aXR44t+SVBd1XJpSj
 NhQ2BdtEEI//c7Qeto+KJwBU/jqc8oUv+i4tTUt03/xH1P9ACaP/Cu4yW
 ouCoa6f2IiyFLLi64pJcl9xMZhqyI6ObDDms5ONPC2bLmzevNJPaxsi8J
 3slJ7Y6Yr/69f670MY9mkRO9PW9jh9z2hRo9NtAwaVrUKy3Tbhlvegcke
 Qi1AP9lsI8Q/2jBJSXN1jlLlkO+LdVCawgk4BMf8h8JKB25FlbhWL97aT w==;
IronPort-SDR: 5AKFSfCyPFhVV0SP7sifb54yzJI9tnDXz44778R3+8DYGd/kMYuKRpWb9jb3tcEzWMkD/Bptp4
 aMfUrNEao/bMj8q5hlzcGxidK3i+RM8GrdJzccJMtgRZgKLpV8ih/8jvafYpqsNrAXY/itMh2T
 HbKeAGYC5o2dHbdLZaSgf0tt6Yo9ShAYvkeZpqh1kkJCay0sUW15fYIhrtL8EtD8WwsOnt1aMf
 76HMWqR4I7RKTNT2gbZCWD+DNaXr7y7lFQqR97sp8ZZ0bae60Dn8+9/lurhsGDnuc+tRNyIzTQ
 eBc=
X-IronPort-AV: E=Sophos;i="5.84,235,1620662400"; d="scan'208";a="174973299"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2021 06:53:52 +0800
IronPort-SDR: zv/iAlq4106WT+EGG14GgmFREkOC0x83I5kZHXQc+KdvZ3AQ9iPQn0JKn5kCMh2T+vQyoKNVUS
 bai8cmLhdpvKC0qiJDiipRe7SaYyeTu0iisoCX8zFyIlEL4mNSYXkmkNxbVzxVGniFaN+DXYw8
 h5iFERChJn7Cnd8TO8DQjlsfItf92dz2seAusQ7XhcFTJh2MqZSRtvJtZ1z34sFAyglvD9x2Hk
 NQznrb3xKksqhMcpuxNOZFxS3y4v0IkeSdRvmN5zEMljvPH91k/Ca5rarFBrlIo6D6pngHTdVB
 yHuVo7QRlaP+bxgX6BtQ4esl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:31:57 -0700
IronPort-SDR: qTprDL3n372IjsPHWONkKro3Of7TX6lYjwO96WGDDXTgwBUHDHhMUFvdR4Y+Yo9/TOdohgWNsH
 4/EBWgWzgakkTseh+dgCZclqFbHRH1ukOawgU2y4sPiJ1ONwjoNjXk7TpTnHkHGCtdaV42syu+
 0DkZPHmr/faSj321gNcXRs5pYRDlRiSxkUmjesRKifMrfMGngR9EZZiIwlshN4gwcGyxGgtHdt
 Y1JJpsEKFjwvA3z7yjhFdKaA5DQ6mtWDDhtdJwGorHC0l4wOKbpW1oQzOOV3mu2D7TAVaoBP4j
 WJo=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Jul 2021 15:53:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/11] riscv-to-apply queue
Date: Mon, 12 Jul 2021 15:53:37 -0700
Message-Id: <20210712225348.213819-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=820a0e1fd=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c320:

  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708' into staging (2021-07-12 19:15:11 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210712

for you to fetch changes up to d6b87906f09f72a837dc68c33bfc3d913ef74b7d:

  hw/riscv: opentitan: Add the flash alias (2021-07-13 08:47:52 +1000)

----------------------------------------------------------------
Fourth RISC-V PR for 6.1 release

 - Code cleanups
 - Documentation improvements
 - Hypervisor extension improvements with hideleg and hedeleg
 - sifive_u fixes
 - OpenTitan register layout updates

----------------------------------------------------------------
Alistair Francis (3):
      char: ibex_uart: Update the register layout
      hw/riscv: opentitan: Add the unimplement rv_core_ibex_peri
      hw/riscv: opentitan: Add the flash alias

Bin Meng (7):
      target/riscv: pmp: Fix some typos
      target/riscv: csr: Remove redundant check in fp csr read/write routines
      docs/system: riscv: Fix CLINT name in the sifive_u doc
      docs/system: riscv: Add documentation for virt machine
      docs/system: riscv: Update Microchip Icicle Kit for direct kernel boot
      hw/riscv: sifive_u: Correct the CLINT timebase frequency
      hw/riscv: sifive_u: Make sure firmware info is 8-byte aligned

Jose Martins (1):
      target/riscv: hardwire bits in hideleg and hedeleg

 docs/system/riscv/microchip-icicle-kit.rst |  54 +++++++++--
 docs/system/riscv/sifive_u.rst             |   2 +-
 docs/system/riscv/virt.rst                 | 138 +++++++++++++++++++++++++++++
 docs/system/target-riscv.rst               |   1 +
 include/hw/riscv/opentitan.h               |   3 +
 hw/char/ibex_uart.c                        |  19 ++--
 hw/riscv/opentitan.c                       |   9 ++
 hw/riscv/sifive_u.c                        |  12 ++-
 target/riscv/csr.c                         |  37 +++-----
 target/riscv/pmp.c                         |  10 +--
 10 files changed, 233 insertions(+), 52 deletions(-)
 create mode 100644 docs/system/riscv/virt.rst

