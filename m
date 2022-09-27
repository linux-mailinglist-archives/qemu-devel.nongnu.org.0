Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7BF5EBB03
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:54:11 +0200 (CEST)
Received: from localhost ([::1]:42592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4Tq-0005pp-CZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47j-0004zv-EA
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47f-0001Ek-Vs
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260275; x=1695796275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a/xRXD4XiJI+GpkABGALj2w42Lk5lp9j9hO/t/EBkvk=;
 b=W1mReSHUGRFGHj9y0xTvq8XLHQcITOtWee3mjqm5rg07RWOvKLUnSsSN
 Qm2uqizjpJ13fh6SAroP98Oc+HM1tDnbGJPr9ASVVDWfa82IoolAjXqUu
 CWXoLQ9KT7LfbrAweI3MYllVBMTc6mg29jml5MA1BAZo16jLF/mOBG0na
 U4yCH4uBz4Xu/YOocO5eE4VeO3xe7OHpDm24CjIj6+KdZKWio+HNP7C4Q
 /1ysgd2VSIKu64Uzl2urPsfla3+PeNhN5vf0rYmS5tt19PzkPsbzkQ8Gw
 PZzzXKoD71OvOuKyf23rrsTZ2BucYzo4cnp8OcQSc2AR/TH9roTorjhWT A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530797"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:09 +0800
IronPort-SDR: XLJB9TK9f+C4gUuoROn3CiyItoDWa05RA54M4mjwIxr2OGMWvLb5pZ+ldvB/ayTBf+WgLVl6kB
 J7GjBjwZH0oD+gR3wBpyGufA1gltG1cgOYfOUMoDelzppKkSIHEZFXrm377xbfhSUIAfuZ0PYB
 TOtDIP8/m1iuwa6L0MGKjno3D/fAkg9+FBLG/wiGqTqHB6Dl65ljI63LVJHmM09iCpWUz6b0gG
 HqxhRGvQpExGZS6hLKl4/jTGq7FepetNRxuLLOzWiv7ydM5w591b5hw9X4oUOupzfQLNxSj0OI
 SloqbdhyEMPKyn3mbs+nRe5c
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:06 -0700
IronPort-SDR: U0KhHMsvPPRl73IrF0fCgfpS6X5WW/Zxa+MOg8bkgufJhJVKyV0FA0lpBlXncV/++vmv39RoGo
 b9OD6Y4r96Z4RU0UxitkB/ev89mmXh4xJrXu8mF/LZJh8dBz0BYmq+NqIt1dvVBkieX2UMl3yc
 rMj3gkUYThauorMZ8xVw+XoVsKjMQ3VULlBG7h28DQ9yQYg9HRI2hV78QGARL60hiK1DOfXlKo
 iqvQZ8XvY3pT7Qpr+8GHxa7xpgYOOYlIYXenTuWauRH/wALrWKAIrD6r16iuNSTc/UNcpiKceo
 7Ms=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8s91MZVz1RvTr
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1664260268; x=1666852269; bh=a/xRXD4XiJI+GpkABGALj2w42Lk5lp9j
 9hO/t/EBkvk=; b=DBp906C0AmDw+jRPdfmZIXyo6quKl1lBNcwB7gB3xRSNu/Uy
 xVZS5ZSK40/lQ1Ac66aXnSsU+18qvHgCqkKfPV79RFrJIKQyIC10qJFm8szaaO5b
 iOkBfxhyWkulGkfho9voKvIxilYWoIiBn9fcGWjKW9DtQqA/kMNKTr/vgPEpIWJr
 R1GT6XMBRWG80hX9Q+jTutBonAj40vEqlsLz/eDSdS+SHT45aNN8NP1g7Sgm2pFt
 DsDtG2h/Ay8Oei8BFOxOISSajvVIqVWo0OQWSqdNMO0nFClsL5l4doLq9BOpPmIr
 92AGLdvYmrnfGl94koVFqGIhuU83TqBG6YNIuA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3OXsnHQw7Lb4 for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:08 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8s74Mqtz1RvLy;
 Mon, 26 Sep 2022 23:31:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 00/22] riscv-to-apply queue
Date: Tue, 27 Sep 2022 16:30:42 +1000
Message-Id: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

The following changes since commit 99d6b11b5b44d7dd64f4cb1973184e40a4a174=
f8:

  Merge tag 'pull-target-arm-20220922' of https://git.linaro.org/people/p=
maydell/qemu-arm into staging (2022-09-26 13:38:26 -0400)

are available in the Git repository at:

  https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-2022092=
7

for you to fetch changes up to a3ab69f9f6c000481c439923d16416b8941d5b37:

  target/riscv: rvv-1.0: vf[w]redsum distinguish between ordered/unordere=
d (2022-09-27 11:23:57 +1000)

----------------------------------------------------------------
Second RISC-V PR for QEMU 7.2

* Fixup typos and register addresses for Ibex SPI
* Cleanup the RISC-V virt machine documentation
* Remove the sideleg and sedeleg CSR macros
* Fix the CSR check for cycle{h}, instret{h}, time{h}, hpmcounter3-31{h}
* Remove fixed numbering from GDB xml feature files
* Allow setting the resetvec for the OpenTitan machine
* Check the correct exception cause in vector GDB stub
* Fix inheritance of SiFiveEState
* Improvements to the RISC-V debugger spec
* Simplify some vector code

----------------------------------------------------------------
Alex Benn=C3=A9e (1):
      docs/system: clean up code escape for riscv virt platform

Alistair Francis (3):
      target/riscv: Set the CPU resetvec directly
      hw/riscv: opentitan: Fixup resetvec
      hw/riscv: opentitan: Expose the resetvec as a SoC property

Andrew Burgess (2):
      target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml
      target/riscv: remove fixed numbering from GDB xml feature files

Bernhard Beschow (1):
      hw/riscv/sifive_e: Fix inheritance of SiFiveEState

Frank Chang (9):
      target/riscv: Check the correct exception cause in vector GDB stub
      target/riscv: debug: Determine the trigger type from tdata1.type
      target/riscv: debug: Introduce build_tdata1() to build tdata1 regis=
ter content
      target/riscv: debug: Introduce tdata1, tdata2, and tdata3 CSRs
      target/riscv: debug: Restrict the range of tselect value can be wri=
tten
      target/riscv: debug: Introduce tinfo CSR
      target/riscv: debug: Create common trigger actions function
      target/riscv: debug: Check VU/VS modes for type 2 trigger
      target/riscv: debug: Add initial support of type 6 trigger

Rahul Pathak (1):
      target/riscv: Remove sideleg and sedeleg

Weiwei Li (1):
      target/riscv: fix csr check for cycle{h}, instret{h}, time{h}, hpmc=
ounter3-31{h}

Wilfred Mallawa (2):
      hw/ssi: ibex_spi: fixup typos in ibex_spi_host
      hw/ssi: ibex_spi: update reg addr

Yang Liu (2):
      target/riscv: rvv-1.0: Simplify vfwredsum code
      target/riscv: rvv-1.0: vf[w]redsum distinguish between ordered/unor=
dered

 docs/system/riscv/virt.rst              |  13 +-
 include/hw/riscv/opentitan.h            |   2 +
 include/hw/riscv/sifive_e.h             |   3 +-
 target/riscv/cpu.h                      |   9 +-
 target/riscv/cpu_bits.h                 |   3 +-
 target/riscv/debug.h                    |  55 ++--
 target/riscv/helper.h                   |  15 +-
 target/riscv/insn32.decode              |   6 +-
 disas/riscv.c                           |   2 -
 hw/riscv/opentitan.c                    |   8 +-
 hw/ssi/ibex_spi_host.c                  |   8 +-
 target/riscv/cpu.c                      |  13 +-
 target/riscv/csr.c                      |  23 +-
 target/riscv/debug.c                    | 484 +++++++++++++++++++++++++-=
------
 target/riscv/gdbstub.c                  |  36 +--
 target/riscv/machine.c                  |  26 +-
 target/riscv/vector_helper.c            |  69 ++---
 target/riscv/insn_trans/trans_rvv.c.inc |   6 +-
 gdb-xml/riscv-32bit-cpu.xml             |   6 +-
 gdb-xml/riscv-32bit-fpu.xml             |  10 +-
 gdb-xml/riscv-64bit-cpu.xml             |   6 +-
 gdb-xml/riscv-64bit-fpu.xml             |  10 +-
 22 files changed, 531 insertions(+), 282 deletions(-)

