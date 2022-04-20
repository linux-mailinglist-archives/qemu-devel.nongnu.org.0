Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FB5080E3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:14:45 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh3bw-0005ig-7Q
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3H1-0007p8-VM
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:08 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3Gz-0004RI-Fq
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650433985; x=1681969985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QSuHYOyhblpSDxm5ZLChlvRzUEPskl7wWcJ5MQSvdiM=;
 b=GeZYha6aVQdz430d7IE8ey7WIsvFlI+Kfr/K9DjmoacAWUtt4yMVtFoq
 PpAii22HOBlH6JZhoP63SESUUA5EZvCM8R3acvKFe1DzWBp70dNIV1NWs
 FiZpiYr2SjD4BGY1tJsjo25G4ctsMObXHtgHV5UqDm4UUSJzPNuUgRCoJ
 OHV4zDJAt0jjUDBGKw9waRgusLmsgZQR5is119XwFFiwcZW2z0eIMrO8c
 +BpB/xmuZ/Q9tc94ymUN+eNg+2vvDgocQIOVjdsGfCPhYN+CtOsnm9gsU
 MixZds38wnN6Q+kDEaZ/WUV+e+kBAeStc4N+zfEnL8NMFLE2oCHMEJHyo Q==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="310304316"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:52:58 +0800
IronPort-SDR: 4i9i1dRC9nSj6AFjHQIppoEjXOhh9OvYfLIqirJSDlP6LL9z2B+z4txS4VQ2hJ5lJrf43Dsjz9
 ZyD/YzE5AK6u8TeXOQBDmtqyxb9BBnbQpJebMBilLtfkmErkbfgmVymFFWQ1CFUW02S0q+gn4n
 QxM+5ng6jDIHbddmHsQeu6VENy/kTgUASEa1V195/0HtIFDMYGZSx/naJldW5BcGvmk7zqZF0f
 BXX41JQ5ZGwrE+0W/uqwVDUwvuh3CW9wAG6TvrlE84Koh1I1egoeXNzumB/7U9L56Mpjtlv6cm
 QvmNjte8sMQZH/NDK+NF/jpN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:23:17 -0700
IronPort-SDR: nJM4ZVCt1efY7EyU6jlp/CE2RU8X6z9WhlhcPCKExoa96XArrOftvUmdSP8vo0Iq8AcjpTfRC6
 R4awhKlVvPJRs6wAPr2Jp3g2UgD69SLx4e773CGMxaI8dRgkZxvOtVR216xHG//ZyITVX2DtY/
 gqjm2pwjNbCJsIL5P4nyt195E81yOxuO336D0JmNe79Jbi+IoFVPIRt7VYOuYPV/w+exO2t9X6
 UMZN1SMjVQyug3m3u4nBtExmOe9eKO3wWwq+QjljOqMX48s5VGR4TFCVXt4BOaXdpyEimkgLIA
 JCk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:52:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjqZy15c3z1SHwl
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 22:52:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1650433977; x=1653025978; bh=QSuHYOyhblpSDxm5ZLChlvRzUEPskl7w
 WcJ5MQSvdiM=; b=VT9CyLNDtlpH7sgVfx6r0wh10ZqLGIOvRgIzdpQINV9YE5bd
 ow3tDO4RQs1LNPMpvImu6neqf1nyKSY96ShNBxOOT7SU3lGQz3hZZc3HLF4IEl41
 KvFCo17RYzkBbyVOE9MqjuI2UrQ/Uq6PE/p+ilkX6mpfal1gkKRWUqTi/g4wX8a0
 mMzIpNNTovnSjwjuSKsmHTCkDxhCdtQjOt6HXm436uYTtmhcXLoKgs8wF+J6ol6K
 OzJ8uCC3d3HKzc1tcsSUz6L5As8u2jnegsuc1CQnRKvbGNVvoVE8LdVTEtd7fBoz
 CMFYi2VzPVJo64aWyycX/BNNVKrnN359ICi50Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OvEH6xYEfWJ8 for <qemu-devel@nongnu.org>;
 Tue, 19 Apr 2022 22:52:57 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjqZr5Qn4z1Rvlx;
 Tue, 19 Apr 2022 22:52:52 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 0/6] hw/riscv: Add TPM support to the virt board
Date: Wed, 20 Apr 2022 15:52:42 +1000
Message-Id: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>=0D

This series adds support for connecting TPM devices to the RISC-V virt=0D
board. This is similar to how it works for the ARM virt board.=0D
=0D
This was tested by first creating an emulated TPM device:=0D
=0D
    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \=0D
        --ctrl type=3Dunixio,path=3Dswtpm-sock=0D
=0D
Then launching QEMU with:=0D
=0D
    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \=0D
    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \=0D
    -device tpm-tis-device,tpmdev=3Dtpm0=0D
=0D
The TPM device can be seen in the memory tree and the generated device=0D
tree.=0D
=0D
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942=0D
=0D
Alistair Francis (6):=0D
  hw/riscv: virt: Add a machine done notifier=0D
  hw/core: Move the ARM sysbus-fdt to core=0D
  hw/riscv: virt: Create a platform bus=0D
  hw/riscv: virt: Add support for generating platform FDT entries=0D
  hw/riscv: virt: Add device plug support=0D
  hw/riscv: Enable TPM backends=0D
=0D
 include/hw/{arm =3D> core}/sysbus-fdt.h |   0=0D
 include/hw/riscv/virt.h               |   8 +-=0D
 hw/arm/virt.c                         |   2 +-=0D
 hw/arm/xlnx-versal-virt.c             |   1 -=0D
 hw/{arm =3D> core}/sysbus-fdt.c         |   2 +-=0D
 hw/riscv/virt.c                       | 312 +++++++++++++++++---------=0D
 hw/arm/meson.build                    |   1 -=0D
 hw/core/meson.build                   |   1 +=0D
 hw/riscv/Kconfig                      |   2 +=0D
 9 files changed, 221 insertions(+), 108 deletions(-)=0D
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)=0D
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)=0D
=0D
-- =0D
2.35.1=0D
=0D

