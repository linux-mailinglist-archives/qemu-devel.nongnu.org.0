Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E8F4F71D9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 04:07:33 +0200 (CEST)
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncHYZ-0007ME-VS
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 22:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHW0-0004XN-WE
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:04:53 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:21842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHVy-00078r-Ci
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297090; x=1680833090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oYMGMo7iSqDxWE6BrjILNoIiUBwtZZhnoBsmDHXyqT4=;
 b=Watw7OKPtkaZp0YTs8/HcIauDfPU/0TaDZn4pwK7cqO0vnKaVhZStvDi
 JNfKoRXPvki3kefnuEI31AqAIVRfJnrtYv58WeZ3HgvuXvjhvGObBSQqX
 qDcgvdtvedCOWI5uSedJuZrzdvdjk5jw1m1g6Xc+ZhPC9b5UfWyyeGw3l
 XVVMFzdWIHvmGKr7ppw7N3cYO/R8RiDE47mquiuEJEOlfsFc7CIC/qfuj
 WqZFqoeLyUk9xmbKcpyulTs5HRiFn6GLxvJcqPC4gjJqe/Esd3bvoLDuw
 APQIRANaP8CiSleeASh96qzz6JlWbd3o4vPFxH/7XoPvGgCCq4fofgc/x A==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="196170915"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:04:43 +0800
IronPort-SDR: wBKrHcAqIPWV6x//JgeOAsi21NVJEXXN2OxQdiuE/Zun1kBOYZ/kuFZ8CQZgcstyifjKBaOAB0
 TOnJm4BdEukWiBmilxfO3XL1+uFs/q4fq9JAcmtPUj0oKC1EiOpmLhCMycRsXLMc++7nL+JzEn
 mcM6L5Tt+TG10jeKco8FVYUQAgfuLYh9ukmmzN7UkqZr+UBnsGO33OePmeOxSyNyX9EHB//NIg
 VNYHRv6TOgzyBpNqWCIpx5KMMnf3pkVIpp9zviK7caAgeLV7cYz67E2CMhepwsd4Fn43AcD+KO
 oqmv0Kfys7pz40McJ4zRCXO6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:36:13 -0700
IronPort-SDR: eJOeiVovMYdc3B8XPOsrXS1opCXQjVVW1+6580kRpJrKMbWkOnYyIp0M/svhHgank1jKGIDNJP
 XE3tVZCz3WGOHQP2gHLAyvi6O/fug5H+wO6Lmxag+aOFECCP+gfabPcjMQZp4+AInA84kvwvZg
 i0zb3IZhOr9WvnVfmZPvUMSg7OwexuTVb9QvwTlAmYHq3/vQ7ORk9DKXkfUCwOk3/USr5oMK69
 C/sQOi6dtFJ8ZqdNFpMoMEKTLGsVSkwDuBPSBDz9d5YAeSL3F6AX1REOjbO0ikaoBC3w/tbYBS
 2RU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:04:44 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl7Z6YNTz1SVp8
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 19:04:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1649297082; x=1651889083; bh=oYMGMo7iSqDxWE6BrjILNoIiUBwtZZhn
 oBsmDHXyqT4=; b=AGZD4H9TsuMA4gnGO0ncZnzv+CtdMpymqp7fMtl70+qyC3f7
 lGZ61y6t3Vud+MRFCBVBa6F+mmr7G6L3kzH6Xvy3uNEwbA7o9Dd5SK5oxOYUyPaZ
 2s2BSXeqtLNlSvBzp00OvvBQjAApZhuwgjx6TEacAFqVhoYkMniZYutsXa0e5tnz
 9vHgRUD5mBR8dk3ugW6d/Tf4GoD82xUN9NyGm943aSpu4z7dV+wx2Dkl5mprMuPU
 njsoazlDR0f1VR5oFAmdhgyOU8yCiePSHHWSRuXdpVXeJGKi6sdRz19QiQ57abs4
 ZIdN8wEfParbiegeJj/w7mq6zEddGwE1SxwQ5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EniwiwkTGJox for <qemu-devel@nongnu.org>;
 Wed,  6 Apr 2022 19:04:42 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl7S5Vr0z1Rvlx;
 Wed,  6 Apr 2022 19:04:36 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 0/6] hw/riscv: Add TPM support to the virt board
Date: Thu,  7 Apr 2022 12:04:26 +1000
Message-Id: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
  hw/riscv: virt: Add support for generateing platform FDT entries=0D
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

