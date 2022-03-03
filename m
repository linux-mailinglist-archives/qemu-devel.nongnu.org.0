Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DB74CB66A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:31:30 +0100 (CET)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPe3l-0004Kq-Hh
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:31:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe0s-0001TM-AX
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:30 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:29269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe0n-0000FJ-1l
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285305; x=1677821305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wQE3jYb5KCs2uFhl7tfLgE39Q26UXkF6H1Sf0uWHJMA=;
 b=a/QgZCGgDX20mT63HdnxQEIUkJWuqHzyOprh6jnC9auQqfNNIOAxuvV1
 GbYkZrZQz3Wk4jij9CK9fG3hp3piUOf0mh9VfguiD8PUrsCxA95WMECA6
 nBc9AtT2hXv2EbMvYbK6E1uYYviOuDFPXmwDYSdVmNprA4MZCvPGCdENt
 zbBS/7aMlPo6oT7rTkUCR1tEmBp7yzoMxI4LbIqBm5qzdrRi+zQLgR6fp
 YUUFUSHjMLDSLjUsSkePk9fPxbLUsIomOwpTIFygjTW+gFlVB7enZUUXv
 20KuFdpFxwHR1b3WC0a4mSew0bhi66BWZ7srthnz7gx+gel2sSRpwRr1C A==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="195320518"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:28:22 +0800
IronPort-SDR: jsFZCiGd5p5ph2RDe7ryHyZeKSdofqnDA0gf3yR++nPe+HRExHc/0eAWyokXcMzMg6fzv9BoHT
 pBqWu1XzJ7nQcbPLhRCpNylUYt9k16nejLrli/8Tjvqscw8G0vS5CoJV2CDglPd/U7I3Shhzcb
 9WsNp/eZt/v+lXYXdvjmMjIDeqkKAl1V0VnOXX6gvfHJWRDROJqA9Bjz3TjdQdRQ6nHetNzLRT
 Fj7vDowp7GtfiQUj0rSmF5ePsnqaAyyrtq8iiZjdqZ5YnevieF4k+A8JnEplbDO1QWachztfJt
 QAj76s/efDD3LrPDYC6F8qwb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:47 -0800
IronPort-SDR: CjyOzRWdqHaxbHkH8SvOa5DbU+IfPi8nt/P+RdlC/uA++sg6qtY6yQzXLrhdF5S0465ayjlxst
 ak+6FGnnL+w2GYL/P8goxJKiCh2sqyifnklMvVNN8JF+g4NLNSINnTp6DyXrP42QfTR1SbaYqh
 nS04oXjf4Q0X7aUIw8GSHZyw0o8ZvUttpJEau7BoaWi65NL5qSCDWdz+fQFIyfPjILmbCGYPnz
 K9uSCovtVTc//d6Dj3QOvEdXvWbAB8JEi3ds/gdA2EjiRCxjdfaNrUnkDIgwicJZEWQOtCkzmx
 UL4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:28:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KJj5YWYz1SHwl
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:28:21 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1646285301;
 x=1648877302; bh=wQE3jYb5KCs2uFhl7tfLgE39Q26UXkF6H1Sf0uWHJMA=; b=
 bjtIItKH5sdF8D+ZxNYx3S90rE89NFs8pLzVAqwG/GiFtyLftP3g9pEby9Z1Mt3E
 +WfghDvR4XPM3ymerhlWNl9InEQ90DuvMH9T46XvUf5mZOcPxZJO468oOA0dS9sh
 wrScYJk6Zr6ydmBQptO1xT0JnKCqdOp+KhIU0xIwFHvw8dwtFy542y4ISLMk4vQ6
 1qMN1184aFqm9l2GXTfWUccgijtKL2gH6ZS23ikqHDn8DjU8aqqFN2hNFALqL27W
 nvUX85XSXx8S2DXNuECJs+Lo0UTgOfsiRAa9/vwbjHAIKrr8Ri06Etk2mWxiDIaZ
 7+p5dmjitpURwwidIjKSLQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0i7OptUl0rTD for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:28:21 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KJf2hjSz1Rvlx;
 Wed,  2 Mar 2022 21:28:17 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 00/13] riscv-to-apply queue
Date: Thu,  3 Mar 2022 15:27:51 +1000
Message-Id: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

The following changes since commit 64ada298b98a51eb2512607f6e6180cb330c47=
b1:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220302' =
into staging (2022-03-02 12:38:46 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220303

for you to fetch changes up to 6b1accefd4876ea5475d55454c7d5b52c02cb73c:

  target/riscv: expose zfinx, zdinx, zhinx{min} properties (2022-03-03 13=
:14:50 +1000)

----------------------------------------------------------------
Fifth RISC-V PR for QEMU 7.0

 * Fixup checks for ext_zb[abcs]
 * Add AIA support for virt machine
 * Increase maximum number of CPUs in virt machine
 * Fixup OpenTitan SPI address
 * Add support for zfinx, zdinx and zhinx{min} extensions

----------------------------------------------------------------
Anup Patel (5):
      hw/riscv: virt: Add optional AIA APLIC support to virt machine
      hw/intc: Add RISC-V AIA IMSIC device emulation
      hw/riscv: virt: Add optional AIA IMSIC support to virt machine
      docs/system: riscv: Document AIA options for virt machine
      hw/riscv: virt: Increase maximum number of allowed CPUs

Philipp Tomsich (1):
      target/riscv: fix inverted checks for ext_zb[abcs]

Weiwei Li (6):
      target/riscv: add cfg properties for zfinx, zdinx and zhinx{min}
      target/riscv: hardwire mstatus.FS to zero when enable zfinx
      target/riscv: add support for zfinx
      target/riscv: add support for zdinx
      target/riscv: add support for zhinx/zhinxmin
      target/riscv: expose zfinx, zdinx, zhinx{min} properties

Wilfred Mallawa (1):
      hw: riscv: opentitan: fixup SPI addresses

 docs/system/riscv/virt.rst                |  16 +
 include/hw/intc/riscv_imsic.h             |  68 +++
 include/hw/riscv/opentitan.h              |   4 +-
 include/hw/riscv/virt.h                   |  41 +-
 target/riscv/cpu.h                        |   4 +
 target/riscv/helper.h                     |   4 +-
 target/riscv/internals.h                  |  32 +-
 hw/intc/riscv_imsic.c                     | 448 +++++++++++++++++++
 hw/riscv/opentitan.c                      |  12 +-
 hw/riscv/virt.c                           | 698 ++++++++++++++++++++++++=
+-----
 target/riscv/cpu.c                        |  17 +
 target/riscv/cpu_helper.c                 |   6 +-
 target/riscv/csr.c                        |  25 +-
 target/riscv/fpu_helper.c                 | 178 ++++----
 target/riscv/translate.c                  | 149 ++++++-
 target/riscv/insn_trans/trans_rvb.c.inc   |   8 +-
 target/riscv/insn_trans/trans_rvd.c.inc   | 285 ++++++++----
 target/riscv/insn_trans/trans_rvf.c.inc   | 314 ++++++++++----
 target/riscv/insn_trans/trans_rvzfh.c.inc | 332 ++++++++++----
 hw/intc/Kconfig                           |   3 +
 hw/intc/meson.build                       |   1 +
 hw/riscv/Kconfig                          |   2 +
 22 files changed, 2146 insertions(+), 501 deletions(-)
 create mode 100644 include/hw/intc/riscv_imsic.h
 create mode 100644 hw/intc/riscv_imsic.c

