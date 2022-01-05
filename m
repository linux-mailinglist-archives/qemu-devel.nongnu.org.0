Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743B485B30
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:58:28 +0100 (CET)
Received: from localhost ([::1]:40148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EId-00047I-9S
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:58:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EEC-0000QI-BT
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:53:53 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EE8-0000wm-2x
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 16:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641419623; x=1672955623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hpS6JbyQ1xHELnVALzbFLxiaYKY0nysl4jpPNmO03mk=;
 b=eH5dKO0U28mFhlJ1MMwO/PmbjKrK2y2u0ym18fpjOmnTEfq5uKkdsEGy
 whQmn1/Pf1DH49hrm8O8cE6i/5vwyqTtxTPjx5n9bC2/YPtv4NULOrDbT
 x1EkKVwu15wNow71JZZJTfPgxaYJ/ynserYVrSeeU+CdDR7CxbUM/ath+
 AVw8fuKtKXboAcldvNQ7wdt2y5iC7zoAb3eycCW6RPyIZFiVQRxPWI0QW
 VGMKS8naMqRg3k/YehD10pCcwJnPJnHwOXYXFdstL100oeRuNDJcZHdUv
 aFkyDmkVKvsG9RodpJ11ViBWCLzZ9HwKadauH3D44TaOsLb4HXtUhDlvp A==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="194583047"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:39:49 +0800
IronPort-SDR: jtoQW7ZSh8qu04lvfN/ujnK12Hcxn/8ZU8/nbl8FNYUCHhTmlHfRVHYU+nu32gW8JFVkMZvluk
 YKXHW+u3l/SCjl0CuAXlXd56V4tx+1f8iMZKrjPiT5r/8oi5szzgAQIe5SL/9DKXeKs2WiXYDz
 mn933Ywq+gLH/RJZo4GfBPhUBknCOgmDIj3poLNETzFewWWOJpVQTioQBTz6O7Vw0Rjss8X5Ti
 64JY8cHEm+9f5F944c7mgWuJXopG9X5dL1lDU8tcZ/lyWPucn96zVDdocEvjFtGMH6nr9PPh1H
 L+LH6tnDnaZIS65LmoBhDcYi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:12:19 -0800
IronPort-SDR: P9fOsbJ7Dt/DGbAOCDwA1pTM+H94jfu3LyY1YUD8/oc/Bea8cSAkMWDWbX2S9GNhQTD7U0HFaL
 a1YwDqjTIDnqy4JDkqrsvy6IC5AAFt3NacU1nigRyTqp4/b8nd7WCQgWEDIdTYb0vSy/p00Z00
 GI+rRWyF8a6jOkLTcWetkHXMDsQViOaBgz4HHN/bd+dSFALr+MUNchxH4ocjMZ/fXHQQ0812kG
 jOQqeAUkDxhEojOMqeZNcC8c5uH5/iOgjlgBmUVZXmNoQ6fdeEY9Te8H2iju4Uct+oR5CZ6VTx
 Rt4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:39:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjYx45Kwz1VprM
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 13:39:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1641418789; x=1644010790; bh=hpS6JbyQ1xHELnVALzbFLxiaYKY0nysl
 4jpPNmO03mk=; b=rqHY/zp5jJFSZaT0epU+L8G8XkHR1C4ylGB3SljC8w2i0Yom
 HrXrTSubIEvpdKLRSV37JcpZPpzhVNkxUBAFTcZpWAe3zuBboRTtl+3FzEm9+hRE
 Sr2EHlp9nUMt+4v5Gza6wzPGK9IIYHSUztfkB7r+B9A7VHsnX7JU400yzK/T9CiK
 0wj3YX8PpExqCx8VNhqmRCd7iW8wVBvM4ftbG5QT+RpEuIeuxigWWjcHv8c9NWgf
 RnDTfm63IRs5uq/ZLoOY/ZUANqKQc92/JpZaWXIhw2Gvvr5b38e+XcLGv6tyvm3N
 MtWFID/TUE9xdnVEBMn+QTJwwLX68EJ/2vwN5g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pa98jkF_l34S for <qemu-devel@nongnu.org>;
 Wed,  5 Jan 2022 13:39:49 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjYr0VkPz1VSkV;
 Wed,  5 Jan 2022 13:39:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 0/8] A collection of RISC-V cleanups and improvements
Date: Thu,  6 Jan 2022 07:39:29 +1000
Message-Id: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>=0D

This is a few patches to cleanup some RISC-V hardware and mark the=0D
Hyperisor extension as non experimental.=0D
=0D
v4:=0D
 - Resend=0D
v3:=0D
 - Drop some patches=0D
 - Few small fixes from reviews=0D
v2:=0D
 - Add some more fixes=0D
 - Address review comments=0D
=0D
Alistair Francis (8):=0D
  hw/intc: sifive_plic: Add a reset function=0D
  hw/intc: sifive_plic: Cleanup the write function=0D
  hw/intc: sifive_plic: Cleanup the read function=0D
  hw/intc: sifive_plic: Cleanup remaining functions=0D
  target/riscv: Mark the Hypervisor extension as non experimental=0D
  target/riscv: Enable the Hypervisor extension by default=0D
  hw/riscv: Use error_fatal for SoC realisation=0D
  hw/riscv: virt: Allow support for 32 cores=0D
=0D
 include/hw/riscv/virt.h    |   2 +-=0D
 hw/intc/sifive_plic.c      | 254 +++++++++++--------------------------=0D
 hw/riscv/microchip_pfsoc.c |   2 +-=0D
 hw/riscv/opentitan.c       |   2 +-=0D
 hw/riscv/sifive_e.c        |   2 +-=0D
 hw/riscv/sifive_u.c        |   2 +-=0D
 target/riscv/cpu.c         |   2 +-=0D
 7 files changed, 82 insertions(+), 184 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

