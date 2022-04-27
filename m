Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560255127B0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 01:47:08 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njrND-0007aT-59
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 19:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIJ-0004bI-Fb
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 19:42:03 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIH-0004Sj-7f
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 19:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102919; x=1682638919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ERXRsvrdRjR3/CWi/AquJTXcEHYzT5IY+YvOoS6ba6w=;
 b=PenA1lb9sQ22umndmU7HTXFm3bfnX4w6BvmJISviblIHaOY3zaqQHvyL
 T6e9e7kX1cQwmxypbGOsmhUfTvs0w9UEMmC/uBUNkUFRxRFuwkow2gnea
 u5tAR1ngSeDThhD1x9ROM/DpdGAfwB2fTFSEagwRE2EpuFETEHeBKe0kT
 kembwiiCcqnyC7Yya+CXzw9ZhXPVMrDxVFGuyN5c7NoInxr7pDA2e2LRf
 +AxJHbLzSHoyN++AcaAsHMXnneGCNjxXp6X0mldxVNjd96X+PoY1axzV9
 nzr6x1Anlu5OB+s3AUZZFfX5UcEaLKSFVWLf3dY/SZR4kJ4lpzw3PYXJh A==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="203873198"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:41:54 +0800
IronPort-SDR: yYpKgsPamf3Y/R1CnAWU9qe/1guGVqKTNjBEoxthPvo6MX0N4Wxi1CfG5evcKd9OqJcs3zd9gp
 +nnTC8BAc51E/WEcoV27IZud2Si8tKXYLnPOC7f3KSuDOKZ75tAMkhkLjupngEXakwNgH3V9By
 3O7ThU7A3Es8Z8MWYKesTz9IE1/UjQeDJ5FqNkWrOzKSN0taBvG769nHsT76jT3b9Y6CeG2yun
 v0Xkt46jU1hM4QFVwaBv74xPQWWRxIOOgb/1O/PUHIHz7BD6FjniztSt/0Oeu8t9mY0puS7VUR
 Ta0Euydz9KjiKn4Yh7WS8kaC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:05 -0700
IronPort-SDR: CeK52bIBlu8iovHqa5jGh5Ak1fNWeR8+taa/wdiwqgpRBMrXaHRkJhStnj2YX2ix4sNVw/m+EP
 M6vkETmkO3sR/VwXnXAMf/6Q0Rk71i22Mu0CiyhF7uvd5LScuYFOIboodPbcAVP/tULt/mkgvt
 YviXmvY+7O/RpAc3tuLOW6e6pW2w2vrFLvs5cYZF0iqx5j8MA5E9uwEPpMQFAgM/PNJdiCVHEV
 O8KVdRYuECa0dB3y4LGAq1chPABqOILXp+AA/NGiRO6mftY09yuT3PeXrDbO4IvwdAfJcO5rX+
 tOQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:41:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZz75WKXz1SVp2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 16:41:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1651102914; x=1653694915; bh=ERXRsvrdRjR3/CWi/AquJTXcEHYzT5IY
 +YvOoS6ba6w=; b=e1EYaUxIfMsLJBl6RiwPW3+wAnCLy+MU8lOWxjzSXIgg9g8i
 +jqG4ubZzgZk5b+PNRwGp7DdLtv2CjwKV2pDeLC3ErUb11StGwS/8WLD03eHQ/bs
 pQY6nNfx9qjKhLoUxUxHlvfCB1k52rnkLEk1bkDmjrYq674g/ThadZDVDaZFeL3G
 ldHUu9XtdWmIGCHN8vyo74yt0271DxnpmjkMT1YYuAFHn5GwPuRpRVXkQrCQUrUj
 UR9Y6n5F1c2NroQR1HN0XSpwRBaD8Ja8mxtMgMRUGEHnJCtlrE7QQb2etvFNkAaM
 F0F4VU3riEANATNzFy4qYncyko3cbim5yve4UA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7s4SYcEcOtzW for <qemu-devel@nongnu.org>;
 Wed, 27 Apr 2022 16:41:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZz254Pvz1Rvlc;
 Wed, 27 Apr 2022 16:41:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 0/6] hw/riscv: Add TPM support to the virt board
Date: Thu, 28 Apr 2022 09:41:40 +1000
Message-Id: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

This series adds support for connecting TPM devices to the RISC-V virt
board. This is similar to how it works for the ARM virt board.

This was tested by first creating an emulated TPM device:

    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
        --ctrl type=3Dunixio,path=3Dswtpm-sock

Then launching QEMU with:

    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
    -device tpm-tis-device,tpmdev=3Dtpm0

The TPM device can be seen in the memory tree and the generated device
tree.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942

Alistair Francis (6):
  hw/riscv: virt: Add a machine done notifier
  hw/core: Move the ARM sysbus-fdt to core
  hw/riscv: virt: Create a platform bus
  hw/riscv: virt: Add support for generating platform FDT entries
  hw/riscv: virt: Add device plug support
  hw/riscv: Enable TPM backends

 docs/system/riscv/virt.rst            |  20 ++
 include/hw/{arm =3D> core}/sysbus-fdt.h |   0
 include/hw/riscv/virt.h               |   8 +-
 hw/arm/virt.c                         |   2 +-
 hw/arm/xlnx-versal-virt.c             |   1 -
 hw/{arm =3D> core}/sysbus-fdt.c         |   2 +-
 hw/riscv/virt.c                       | 317 +++++++++++++++++---------
 hw/arm/meson.build                    |   1 -
 hw/core/meson.build                   |   1 +
 hw/riscv/Kconfig                      |   2 +
 10 files changed, 240 insertions(+), 114 deletions(-)
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)

--=20
2.35.1


