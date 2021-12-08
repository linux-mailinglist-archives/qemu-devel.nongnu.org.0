Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24D46CDED
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 07:53:03 +0100 (CET)
Received: from localhost ([::1]:53296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muqp4-0005I9-5L
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 01:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfg-00029a-2x
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:16909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=96943765b=alistair.francis@opensource.wdc.com>)
 id 1muqfd-00067o-0l
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 01:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1638945797; x=1670481797;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PKWff+Pe2EtVOWjZkAtZdxWr4jpx7WP2Bh1904pcvvM=;
 b=JvNP8cVR8xaAILM1YwpCHhpkXk9QCmTHWmTlTLfMLpTZGespEAT2jtus
 Gtu/1TkjtOrE130VMmeaSHKASmoLeCM7zy7jwe6eYUheo0se5BnmaK3A+
 CrlzoOgyrunw1pDyPgnzbSlirbKr9YzOGFOun/TCsCSVpiQUMo5KY/p//
 LaQ9YrPc2dqZtn5kVMiVLfGEEPoA7qP50DHse8lTcvve7HT/tp9qGZFZi
 CmHrOxJSpZzwU+FFT7aHGFlON3s5k+IGjqB4VY61OxM39mmviayu5y67G
 lCCT02lhJ/ppd6ST/m/3TBr9lQ28rATylJvG9paxpdiAVFUsZpDvRoWxo Q==;
X-IronPort-AV: E=Sophos;i="5.87,296,1631548800"; d="scan'208";a="188732813"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2021 14:43:13 +0800
IronPort-SDR: Ys9gRYi9Ru2H8n2G1EGKF95p3LdqD+nAP5QKjys+M4KWILLGX/3H7xcCCxhC5gbsm7M+hwVpfh
 M5ymvI+BAfxfkdKrhUQdWjHxXAmJa7iblZ1LSdzalUEp79B6yJrZ/w1uHuS2xn0qvvQU8Oxk/C
 WZCrNZZW7j9qwdN+K+HZH0IyHn4bPsAjB3Z18IiO5oUlI9y3QVcXR897WUd1LkUC9sWd3Br3xv
 Nhm3z0+uuLEX77kg/fI016E4J6ALySBcLNcsZiiyBdUflTVualsp87shEDZLu4OY4oMpH/v9sY
 i7YmVCiUuixNNGsMnnlm6tfM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:17:48 -0800
IronPort-SDR: r3Ee2FXDx8amjL+AgXCms+N5n4Z5YRtv4oGAajB0g9yradToXFV/8cNdiVC8z3fAY1rUcy+7ur
 L2kVV1iPYGj73I2S53Cb4Ywa203HoBT/3DZTFD/zBXM31LgqosjKvk/a360uqa71EHWqGfSz8W
 jrheIkDbanIMeE3AZnoU9tX5kKTXmZDsyIx5sChbTTCFSd6t/ltTRdguF+rvVjr7OiJ8T4HiJl
 4aAkL+quNZ+Ya2SB8lakP8RXRn9J+sAyK5h5jc4vDrogUgNr7D5A7xlqgw/c5Jqu6fw+l7fogq
 ztY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:43:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J870J3nYVz1Rwvf
 for <qemu-devel@nongnu.org>; Tue,  7 Dec 2021 22:43:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1638945791; x=1641537792; bh=PKWff+Pe2EtVOWjZkAtZdxWr4jpx7WP2
 Bh1904pcvvM=; b=nWI8aubS7EKypA+ExHhnt0OtSCtrWFr4GvPWUjy+gHimUL23
 FOwDoA4oJJGo3RNPA9dU5FGUxZd3MT1DgEInbW3fCBIMMoKOfFSUQTennlXiyHYB
 KCOch6Yav1qGz9npBxwBum8xtphg+az6ixv8oiRfe1RHiu8FOfbGLnjKF5ikd6Zh
 V7CGNjmcHHW5ieTxetBcZIhUVNyqk0/LGCl3e4wgUbZH5LK3xPlCYnUeqnGWxOX1
 5urLtqtsYfa1vCWqLFgWyYjUU8jd+bweYRCXgeRfoqWvo+0Ja97DVgnYL0x9/JFT
 jvpQGN2Gt0EcREdBxe1wYyOLCtEanQoVzqqExg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UDoYVv175FGq for <qemu-devel@nongnu.org>;
 Tue,  7 Dec 2021 22:43:11 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J870B4DrWz1RtVG;
 Tue,  7 Dec 2021 22:43:06 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH 0/7] A collection of RISC-V cleanups and improvements
Date: Wed,  8 Dec 2021 16:42:45 +1000
Message-Id: <20211208064252.375360-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=96943765b=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
Alistair Francis (7):=0D
  hw/intc: sifive_plic: Add a reset function=0D
  hw/intc: sifive_plic: Cleanup the write function=0D
  hw/intc: sifive_plic: Cleanup the read function=0D
  hw/intc: sifive_plic: Cleanup remaining functions=0D
  target/riscv: Mark the Hypervisor extension as non experimental=0D
  target/riscv: Enable the Hypervisor extension by default=0D
  hw/riscv: Use error_fatal for SoC realisation=0D
=0D
 hw/intc/sifive_plic.c      | 254 +++++++++++--------------------------=0D
 hw/riscv/microchip_pfsoc.c |   2 +-=0D
 hw/riscv/opentitan.c       |   2 +-=0D
 hw/riscv/sifive_e.c        |   2 +-=0D
 hw/riscv/sifive_u.c        |   2 +-=0D
 target/riscv/cpu.c         |   2 +-=0D
 6 files changed, 81 insertions(+), 183 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

