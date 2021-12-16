Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B85476948
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 05:56:45 +0100 (CET)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxiou-0005Ce-8t
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 23:56:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxin0-0002Jq-Rn
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:54:46 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:45669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mximy-0003oJ-Un
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630485; x=1671166485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a5GlfVVoy9AEKVLH8CrZSSzqoUOWy1GWj6EYcgPFIq4=;
 b=Kltem4wZ+qDxzZ6QHu6rN7ikUyVb/CqcKjBH7kFhvkY9LRQhuvJFS91f
 p7EpwyRyj8Mc/DRK/+16iTHjQKuXqciNZ3pF6vwga1FrBnXIIWdv/siXa
 /J0LVeiO/yNkmiKUGe1Q0AWPbZg3RntUgVNONowygpHeySUPbM7MiOcxh
 YQLM/0/p4Im0rLD+jiNlT5WmaEfXV865Ba00aHp8C02qGeI6cE5ghVGsa
 71UmjynmBT5i59KMbk91CYK9VQvKyaJubhe9hb8hvXNm0M2sHiCOUfwUe
 Wq0Jrr7LV4XG1MXXXXXut223LmZfirwsUN5tZ0qltDRWS4QxEbsjj160l w==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="189397523"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:54:39 +0800
IronPort-SDR: FnV4fhOdsT+3NkTgH7F+phEU+y64NtfUKDrvOZnkxSeypYrvCqpMCsaDGf5CEXNqz6lC6uu1jB
 wfpZiMXXpjr2gzdtifZDVUZlsKx5EZF1j8wLbKTeQQI+XySpLmaTS777Cg/pHluhQokNwl5I/A
 aDlIE7sVmYSzdE7W994YNnL8oELzCpJfRyizibpPcMdPI/rihY8Yfnt9AhKy4rvT+FUcRAquOT
 d5pJsd6rNUhDrmxkSk0sOM24LbOxrbBSrAsVaxtOTLeVGe/IqAeYR3AtW+3LGGlMuWXbWZCHLa
 2HDbRzS0nL/V4EUkwCpziFdM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:27:33 -0800
IronPort-SDR: EZr5JPyO1zsn4KjknSKwch+mWCByaZMDdqafAg1NV9VtZCWcF0gAqsLnGOsPV7UjhYYBpHhxLR
 +L60jhmdhQ/C8Z2/h/rO1V6yOs5i/YJW+PE4hDP8G+5WuJDp3vkJkxK8XZ6cuuWYJz85cDjlR3
 H5YzxD5Q/6iL9yrLg729+bPXwHwxrkUAecAuNm0t8yQyYg74bMs2iCD6ZYGzFDX/u2Oc9c5PII
 pjR74TkUlLSCVexHRkVDtpnfyZXWhUg5Ihf8AfHTbc0AFhucx1Lr3gIBL2F0Ol1/zOeu16oCm3
 2bA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:54:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0CL3mdQz1Rwnx
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:54:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1639630478; x=1642222479; bh=a5GlfVVoy9AEKVLH8CrZSSzqoUOWy1GW
 j6EYcgPFIq4=; b=jwJ9NXxdmiJAlAT7sR0eqRUeFdAemgG6mYkcljSOFB+3T/LR
 xrwV7rWH1Tcd0fraoHkcHIZsogPCarvHAFReAIl/va6kvJ8gqSh60mcfzg2PNx0j
 LwKO9d+msMu516Wuonf2g8zlFcPjssaHJQ28mk2aLVOHgE72LAlOgbegZrlVOb/0
 K8XkzC1LlSLa43bdj+FeoqXNdC0EbsQvG9rFxIHFf0p3AJu1IyKG3WXNVruAzLJs
 inDkiis/gGpJnmpaTRK8yNxMB9Hu/okD+DezwMgslxCHytWHhH0hnWqN6lwGRQB9
 IexfRF0Y1UmbbMDqWi48SAKJXXEK3B2DR7Sf2g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Gtd5BA-Rx_De for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:54:38 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0CF3Ssyz1RtVG;
 Wed, 15 Dec 2021 20:54:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 0/9] A collection of RISC-V cleanups and improvements
Date: Thu, 16 Dec 2021 14:54:18 +1000
Message-Id: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is a few patches to cleanup some RISC-V hardware and mark the=0D
Hyperisor extension as non experimental.=0D
=0D
v2:=0D
 - Add some more fixes=0D
 - Address review comments=0D
=0D
Alistair Francis (9):=0D
  hw/intc: sifive_plic: Add a reset function=0D
  hw/intc: sifive_plic: Cleanup the write function=0D
  hw/intc: sifive_plic: Cleanup the read function=0D
  hw/intc: sifive_plic: Cleanup remaining functions=0D
  target/riscv: Mark the Hypervisor extension as non experimental=0D
  target/riscv: Enable the Hypervisor extension by default=0D
  hw/riscv: Use error_fatal for SoC realisation=0D
  hw/riscv: virt: Allow support for 32 cores=0D
  hw/riscv: virt: Set the clock-frequency=0D
=0D
 include/hw/riscv/virt.h    |   2 +-=0D
 hw/intc/sifive_plic.c      | 254 +++++++++++--------------------------=0D
 hw/riscv/microchip_pfsoc.c |   2 +-=0D
 hw/riscv/opentitan.c       |   2 +-=0D
 hw/riscv/sifive_e.c        |   2 +-=0D
 hw/riscv/sifive_u.c        |   2 +-=0D
 hw/riscv/virt.c            |   1 +=0D
 target/riscv/cpu.c         |   2 +-=0D
 8 files changed, 83 insertions(+), 184 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

