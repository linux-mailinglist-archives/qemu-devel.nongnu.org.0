Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A25FEA3D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:13:35 +0200 (CEST)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFoz-0003HP-65
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFay-0002az-Tm
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:04 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFav-0001rt-59
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734341; x=1697270341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rOhQevXnxXw3KK0xPKCZm5Qke8QcGwzI8QdynlBzjck=;
 b=jCzQStMHMW39q0i9De/fHjpq9ZQdg/4KFsby+qvKcJ1h7mXRQIZJE0GZ
 DczpP5j3CuKR0u1H8o9Go6NTARgvD4OTK2XYliNmUD2bCHIdlGmEUmFPp
 4/BHE0YftL86IQiyCKID5Ti73QkK6wpzXmIX/Ljzul3rIjikIM8C36BLV
 b5Kp+tHQFnLaHQwg4y9nIbbNpAdpPKOQQQyD7x8pfCnDjWxw4vwcSBMya
 fDbDySu5Uu8/HCLD1PIrm8m649yH5A3mbeEKd9m6L4c+LIAyeeJgE0xAc
 dXoAXSuVeES+udGUm3ANp5R/Jn7lrrMHuyvzJSli5O2bJcviee0rY4gpT g==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="213790410"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:58:53 +0800
IronPort-SDR: 98WWkveHlwN0PLuwP2apBTy6qC4OAbGdk15DX0AVfC3AEEjCUPFD87C1WwKSPX/G4gQr+2Q8oG
 BZOgEDS14S6TsFjLMssXRf7LcmVrUjj/iyt/IjcKX/5qHKfH8OXotIZi/PGiDMr+hRh08pYa4J
 ee06D+QX8DZI36eW/GgdfzRcft6X2lAnMEkaBBnBohhjVYBDIXVzukU41LBl8Dby6yGzVOdKqA
 Hmt96WvgSfAU/ZqE77ibg2TUkqw3LJSBjkYwCHyM2P9d09Be+Grr6j4NHZJsP0I8Vmnuv6Od4c
 8rg0fjqfyuzze4Z2Cna2linL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:12:52 -0700
IronPort-SDR: tyhPkHyvSq1XbPkUbKP01hj2LI2tXZMsORd38JavzJ8ttsHGoEfngKag16xEmfMl0iyzDiWKi7
 42xBqceXXIWI7xhVgbsHpdd4V+9PfYnOlKhZDGEjKwc8f0zbr5dDk4w/F+/GR5PfG/rwa1AU6z
 C6oOb2MEzRTekxAaMKkD9TMB73vM9xpNipz7Z6lK4PF9/RLC6gdZSB/xocCc41ANUvJsfeXcHY
 XHGVn6hwmPoPnYTzk4rB9oopCtW+KhyvlA/OH9ZB3urtCjtCKhm4oyMLhj7TvYfGUtc9jH22uN
 wT4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:58:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf0Y1Gwfz1RwqL
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:58:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1665734332; x=1668326333; bh=rOhQevXnxXw3KK0xPKCZm5Qke8QcGwzI
 8QdynlBzjck=; b=t22GsAJegSAbXoQfwC2kYhBOQ1xgOPveWz6s2IUokLDy/NqW
 95/6+5w8sPi2Uc6EVR+pnbWX4MXbY6XaqBbnMgM5M1EA7F18DKxO4dwiswpAfisX
 rZFssByGpCIGt0blv0yoMsjaQxxcyFArt5aiq9acMkoMmtuybJxfnHV+nLfDOBBQ
 JS2mjVf4R9GilkQ56kFZLj2ZYWnOqqiK1gxwwvHLqE9r1wE7X04GqZ0x5kgIHGqE
 YOT3TIxDkOyoN8gaxU7tK+/OE9b1+kCUaVjeGb7VTqDtaQEvB2RbDjHFS/a6Ace5
 21DLYPHj3y0JhAB+XbCEzAc4xd4NGZIvys5gIg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qFjO5mQeyips for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:58:52 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf0T3Yh5z1RvLy;
 Fri, 14 Oct 2022 00:58:49 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/10] riscv-to-apply queue
Date: Fri, 14 Oct 2022 17:58:20 +1000
Message-Id: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 2ba341b3694cf3cff7b8a1df4cc765900d5c4f=
60:

  Merge tag 'kraxel-20221013-pull-request' of https://gitlab.com/kraxel/q=
emu into staging (2022-10-13 13:55:53 -0400)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2022101=
4

for you to fetch changes up to 47566421f029b0a489b63f8195b3ff944e017056:

  target/riscv: pmp: Fixup TLB size calculation (2022-10-14 14:36:19 +100=
0)

----------------------------------------------------------------
Third RISC-V PR for QEMU 7.2

* Update qtest comment
* Fix coverity issue with Ibex SPI
* Move load_image_to_fw_cfg() to common location
* Enable booting S-mode firmware from pflash on virt machine
* Add disas support for vector instructions
* Priority level fixes for PLIC
* Fixup TLB size calculation when using PMP

----------------------------------------------------------------
Alistair Francis (1):
      target/riscv: pmp: Fixup TLB size calculation

Bin Meng (1):
      hw/riscv: Update comment for qtest check in riscv_find_firmware()

Jim Shu (2):
      hw/intc: sifive_plic: fix hard-coded max priority level
      hw/intc: sifive_plic: change interrupt priority register to WARL fi=
eld

Sunil V L (3):
      hw/arm, loongarch: Move load_image_to_fw_cfg() to common location
      hw/riscv: virt: Move create_fw_cfg() prior to loading kernel
      hw/riscv: virt: Enable booting S-mode firmware from pflash

Wilfred Mallawa (2):
      hw/ssi: ibex_spi: fixup coverity issue
      hw/ssi: ibex_spi: fixup/add rw1c functionality

Yang Liu (1):
      disas/riscv.c: rvv: Add disas support for vector instructions

 include/hw/nvram/fw_cfg.h      |   21 +
 include/hw/riscv/boot.h        |    1 +
 include/hw/ssi/ibex_spi_host.h |    4 +-
 disas/riscv.c                  | 1432 ++++++++++++++++++++++++++++++++++=
+++++-
 hw/arm/boot.c                  |   49 --
 hw/intc/sifive_plic.c          |   25 +-
 hw/loongarch/virt.c            |   33 -
 hw/nvram/fw_cfg.c              |   32 +
 hw/riscv/boot.c                |   33 +-
 hw/riscv/virt.c                |   32 +-
 hw/ssi/ibex_spi_host.c         |  166 +++--
 target/riscv/pmp.c             |   12 +
 12 files changed, 1675 insertions(+), 165 deletions(-)

