Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48243F7B4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:13:39 +0200 (CEST)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgM54-0002Bj-6B
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM1n-0008QX-Q7
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:10:16 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM1g-0004go-Ff
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491407; x=1667027407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T4bIDBKQSlPUF7LJFcMdCSbTmZqoxTkl3wNCxcFF7Oc=;
 b=hc/68gepWSn+XObq3t5DFbreYoNXbTh5T3xDYXY9DsZNfx1mq2vpHDu8
 lSobSBErBx3+pMLdXz3CPrfMQkLc4Cz+qrQtK9yzxieiPmJ3Bl78u61BS
 M5fVR4tuAZ0NiZWJWX1VTp4zlqzQCmAqdr/E1meTbnIkExYBjEhnnpp/w
 G2VQp1nJQ6eDAk1U7pcWxRsN5jLDCKFGFIiHB9BaXTjrf1huhJRS8bqEc
 yxQjzcPgHUT8cBsNUjpw1uWgP1/js7aZIOsWzUKYTPA1mEJQrpgAWTpk2
 ypAdAkqrGDbdmPbERic1fcCj0krnDkMvWIUhXjOLn0szite/L+2TLgmNO A==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="188933886"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:10:03 +0800
IronPort-SDR: /UzX9C/1BhmRl0aMPRZ0ljwedvNftbW50fYFWLwQ9wQhmRugCC0I+mpAoa5pDvw0m65Qm7K4M+
 d8iPql+e/4AX2LrsU55vVQzTeYZ0OuyJ1RoMaBYrBEPTY8gnACGHwqUjWk6cd6WSkKrlSGhecE
 nEXvdzaKOLhhE42wpodKNImmQIq5MqkFXJX2uWwR+g/cFEcdLqsHJsv6w2Gr7ikkqy3GhXROIo
 Ba8gReHo05q8tfeG+4fHcH2U/zeaY7o2b8mfIW5kzaiBxYJrfR/SDY6n/CAjy7M1Lf+GCz+7Nx
 tobyPvq+ang8FAwJN8toZeqR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:43:58 -0700
IronPort-SDR: gWfHi7FAvg4JiG79b80w80QPQV9eZSbqVj2vlMWQcsxl2SvLwN6kGPwfDOaJiEzXGYRUGuQ+B8
 7osJ/RUMLxp16pFZy9/BbeDz6jWRV8PoYwxS14n16q9ZKDXFAKuDSO2VEaUzoeD2OPUJmMdSN0
 AWk6E5eKj/PK9fMFqtmMP1GMckbyQ9IRT2P7NdOMpJrJQ8ngurzbRJxI60oMTR5HNh+ZHuu+uw
 /V/RDDPMbO+GFs/ZQYpqd2Fld9YG/Pvge/O0OErcBMVcdyOi8grehkl6mbQwbEbJDJsJitAov5
 gMw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:10:05 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYTm2pyMz1RtVp
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:10:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1635491400; x=1638083401; bh=T4bIDBKQSlPUF7LJFcMdCSbTmZqoxTkl
 3wNCxcFF7Oc=; b=Ov+vRJ3OQXI7Qy6rBCqvKWkaQC5daGbAUuq4noVwwq/fYHBF
 ixzNsHVYfoT5IevasNXT+4bXkOFycX0KJKzAl80PUdLDM4/zEetFFu5+Tfva3J/G
 hDrtJ/EsTW5LRH73NsOs9yOW7iv7d8eUoq0nSdELcIsPddgrZVBKtNU7eEpth5De
 BsvlrSFcxT02e/JljFwPLBVW2m8RbITk2+bBsiUtMF1lncTAvud4Sp46Wu+/9MCv
 +1XMJgWUiaEYowH+xFHv4PLZ6ILplN3nsSwvnlGorhCLwjvGI4pzDNqYZvSmoKZU
 0IyxM100mxrTEqLMbGz8M+g7igYp9KoxdtA52w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6hER3jcHrxhN for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:10:00 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYTJ5rpPz1RtVl;
 Fri, 29 Oct 2021 00:08:59 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 00/18] riscv-to-apply queue
Date: Fri, 29 Oct 2021 17:07:59 +1000
Message-Id: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c3016=
1d:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-2021102=
7' into staging (2021-10-27 11:45:18 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211029-1

for you to fetch changes up to 15161e425ee1bb1180f9cec574cda44fb10c0931:

  target/riscv: change the api for RVF/RVD fmin/fmax (2021-10-29 16:56:12=
 +1000)

----------------------------------------------------------------
Fifth RISC-V PR for QEMU 6.2

 - Use a shared PLIC config helper function
 - Fixup the OpenTitan PLIC configuration
 - Add support for the experimental J extension
 - Update the fmin/fmax handling
 - Fixup VS interrupt forwarding

----------------------------------------------------------------
Alexey Baturo (7):
      target/riscv: Add J-extension into RISC-V
      target/riscv: Add CSR defines for RISC-V PM extension
      target/riscv: Support CSRs required for RISC-V PM extension except =
for the h-mode
      target/riscv: Add J extension state description
      target/riscv: Print new PM CSRs in QEMU logs
      target/riscv: Support pointer masking for RISC-V for i/c/f/d/a type=
s of instructions
      target/riscv: Allow experimental J-ext to be turned on

Alistair Francis (6):
      hw/riscv: virt: Don't use a macro for the PLIC configuration
      hw/riscv: boot: Add a PLIC config string function
      hw/riscv: sifive_u: Use the PLIC config helper function
      hw/riscv: microchip_pfsoc: Use the PLIC config helper function
      hw/riscv: virt: Use the PLIC config helper function
      hw/riscv: opentitan: Fixup the PLIC context addresses

Anatoly Parshintsev (1):
      target/riscv: Implement address masking functions required for RISC=
-V Pointer Masking extension

Chih-Min Chao (2):
      softfloat: add APIs to handle alternative sNaN propagation for fmax=
/fmin
      target/riscv: change the api for RVF/RVD fmin/fmax

Jose Martins (2):
      target/riscv: fix VS interrupts forwarding to HS
      target/riscv: remove force HS exception

 include/fpu/softfloat.h                 |  10 ++
 include/hw/riscv/boot.h                 |   2 +
 include/hw/riscv/microchip_pfsoc.h      |   1 -
 include/hw/riscv/sifive_u.h             |   1 -
 include/hw/riscv/virt.h                 |   1 -
 target/riscv/cpu.h                      |  17 +-
 target/riscv/cpu_bits.h                 | 102 +++++++++++-
 fpu/softfloat.c                         |  19 ++-
 hw/riscv/boot.c                         |  25 +++
 hw/riscv/microchip_pfsoc.c              |  14 +-
 hw/riscv/opentitan.c                    |   4 +-
 hw/riscv/sifive_u.c                     |  14 +-
 hw/riscv/virt.c                         |  20 +--
 target/riscv/cpu.c                      |  13 ++
 target/riscv/cpu_helper.c               |  72 +++-----
 target/riscv/csr.c                      | 285 ++++++++++++++++++++++++++=
++++++
 target/riscv/fpu_helper.c               |  16 +-
 target/riscv/machine.c                  |  27 +++
 target/riscv/translate.c                |  43 +++++
 fpu/softfloat-parts.c.inc               |  25 ++-
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 24 files changed, 605 insertions(+), 115 deletions(-)

