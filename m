Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD671DA3BE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 23:41:27 +0200 (CEST)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb9zK-0006DB-NN
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 17:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=401675184=alistair.francis@wdc.com>)
 id 1jb9xu-0004G7-0W; Tue, 19 May 2020 17:39:58 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:10341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=401675184=alistair.francis@wdc.com>)
 id 1jb9xr-0008Nc-Uu; Tue, 19 May 2020 17:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1589924406; x=1621460406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kRmDsMMhV0fVwaEdl4KKVaIknD7Az9GuIlR+p2lr95o=;
 b=X13yGcrhQS6J1otcqgnf9oua4aL/8LwCMGSOI5O+iifQkn6aOZ0RcYwo
 R3Rt2sN4cY8osyC9ORdu99LsFCRSM1imnc1OEGFpEycsGpu3wYGCCCfL+
 Ud+NnKIhWb3bMWq38hXa+LADfI0w2Vi1zNxaLM+45mf7X9kr3Sh/sam99
 oc/WahAYn/gvI43JePwXTHZd02pTQ/9yDeSoW+M+aVStLam7Lic97azG+
 FGD35rCY+4fEbHiph5U1S3C06JNuEQPcFSfnFAlGq94nELZ+a0OvgRgos
 XoSAglk1M9DqD6MuvjIX6Y6Q0ywNm9mdPMNhyZwuHi9R+OVaS+UMe80tA Q==;
IronPort-SDR: cSDZkU9ZchHZnb8dNUqWfHZNlbUeDj2xGvV4iQqBTlsMhyhl1TUIP3ytNROKXbLlTB2waMN//c
 Xs48opB3RbO+CF2wanquXeReGb2IpaVP3G7ux/J/MRe3dWJXjvO+vyrioPMVQSPSRx4RMj3HS6
 zOqbLuodWMQtTjlN+htg9Pz0wD6mweNyjtXHFHt/Y3fCEgLoP/zTeYdkN1463TMOfG0ay9T7sE
 WkOy1bT6a1sXciXWNziN9pcxPzzWmTwWkfczq+t3lQTaKI+yNSULnwXKRbALSUvEgUB2ry6uBZ
 zag=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; d="scan'208";a="240814181"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 05:39:59 +0800
IronPort-SDR: RbpzJ5LEJ1STVkRM5X1YrUpA+2LVR8lJfVTYbQGkj9nAt/jddVfZAUMqSV7zgQMTQsVGJ9eeQ+
 u++RMN2FxT7f46hTKKjyXcVSLlPNGFy+I=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 14:29:22 -0700
IronPort-SDR: 0/6DQq1q9H0sLi2D+9kK/hJrW2JZQC5Wd3zQ6Jk38jTe5UqG32T9XVwKRXqovitPD+yVedZG+F
 aAkWN9aEYTvQ==
WDCIronportException: Internal
Received: from usa005149.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.14])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 May 2020 14:39:50 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 0/9]  RISC-V Add the OpenTitan Machine
Date: Tue, 19 May 2020 14:31:24 -0700
Message-Id: <cover.1589923785.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=401675184=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 17:39:51
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alistair.francis@wdc.com, philmd@redhat.com, bmeng.cn@gmail.com,
 palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OpenTitan is an open source silicon Root of Trust (RoT) project. This
series adds initial support for the OpenTitan machine to QEMU.

This series add the Ibex CPU to the QEMU RISC-V target. It then adds the
OpenTitan machine, the Ibex UART and the Ibex PLIC.

The UART has been tested sending and receiving data.

With this series QEMU can boot the OpenTitan ROM, Tock OS and a Tock
userspace app.

The Ibex PLIC is similar to the RISC-V PLIC (and is based on the QEMU
implementation) with some differences. The hope is that the Ibex PLIC
will converge to follow the RISC-V spec. As that happens I want to
update the QEMU Ibex PLIC and hopefully eventually replace the current
PLIC as the implementation is a little overlay complex.

For more details on OpenTitan, see here: https://docs.opentitan.org/

v3:
 - Don't set the reset vector in realise
 - Small fixes pointed out in review
v2:
 - Rebase on master
 - Get uart receive working



Alistair Francis (9):
  riscv/boot: Add a missing header include
  target/riscv: Don't overwrite the reset vector
  target/riscv: Add the lowRISC Ibex CPU
  riscv: Initial commit of OpenTitan machine
  hw/char: Initial commit of Ibex UART
  hw/intc: Initial commit of lowRISC Ibex PLIC
  riscv/opentitan: Connect the PLIC device
  riscv/opentitan: Connect the UART device
  target/riscv: Use a smaller guess size for no-MMU PMP

 default-configs/riscv32-softmmu.mak |   1 +
 default-configs/riscv64-softmmu.mak |  11 +-
 include/hw/char/ibex_uart.h         | 110 +++++++
 include/hw/intc/ibex_plic.h         |  63 ++++
 include/hw/riscv/boot.h             |   1 +
 include/hw/riscv/opentitan.h        |  79 +++++
 target/riscv/cpu.h                  |   1 +
 hw/char/ibex_uart.c                 | 492 ++++++++++++++++++++++++++++
 hw/intc/ibex_plic.c                 | 261 +++++++++++++++
 hw/riscv/opentitan.c                | 204 ++++++++++++
 target/riscv/cpu.c                  |  13 +-
 target/riscv/pmp.c                  |  14 +-
 MAINTAINERS                         |  13 +
 hw/char/Makefile.objs               |   1 +
 hw/intc/Makefile.objs               |   1 +
 hw/riscv/Kconfig                    |   9 +
 hw/riscv/Makefile.objs              |   1 +
 17 files changed, 1268 insertions(+), 7 deletions(-)
 create mode 100644 include/hw/char/ibex_uart.h
 create mode 100644 include/hw/intc/ibex_plic.h
 create mode 100644 include/hw/riscv/opentitan.h
 create mode 100644 hw/char/ibex_uart.c
 create mode 100644 hw/intc/ibex_plic.c
 create mode 100644 hw/riscv/opentitan.c

-- 
2.26.2


