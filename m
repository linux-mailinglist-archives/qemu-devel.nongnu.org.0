Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EC4D9503
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:09:55 +0100 (CET)
Received: from localhost ([::1]:40216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1Ja-0005Ft-FE
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:09:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=066bbe4b2=alistair.francis@opensource.wdc.com>)
 id 1nU0r7-0004Lz-HI
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:40:30 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:5723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=066bbe4b2=alistair.francis@opensource.wdc.com>)
 id 1nU0r3-0008Er-Oe
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647326424; x=1678862424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AY6Y5IAQG6HgqMU3xT6EvPgFb8SK8Rcvx8vGlqrllxg=;
 b=QtCKwNSJ/nGryeCPYCDtFeLlDv+XhgAeURBVrpc92asyur3lXWFcNfNa
 OaQ0TlJCDSC3BGfklXgL161mvHb9XajxWIDyULLS1Y5upSoAKCRWwIBGa
 XRN8sj2zIXQpsl3C1SbATDW0nfNhHnUMzq7iYndIyqhlCP2eOTUqJV1nk
 YMw6lIQmIHdZFY2U0C+b7AwaxhFz/fEDbSPtN/G9CujvT8yRWVcEBGiTf
 UiM+gTdM7tWBfQtomyIjwGiz6BHZaaFWJQdLAKydLtonX5P+1zjokYlu5
 OIllTXR55ZOKhhB4qjmKIgOkm8FVGoAph/+qMkvAu/SpyDi3u0PBX+mrK A==;
X-IronPort-AV: E=Sophos;i="5.90,182,1643644800"; d="scan'208";a="200224263"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2022 14:40:13 +0800
IronPort-SDR: hktIYLJZw/A9RM0i1RWwasN/Q2MOcucW0iNbcrmFKlJkSaaxbihQjNyDvxskGwWcwUFR8/WxLf
 kNsl3dLl6LhV4UNGtBtk2GS2FRf073XCHQuXlIo+JacYIjtkIoUhZXCoe2ZzyWGfgXG4kH0eKM
 DHxXvvIVg8ah75txbe91V337babODzYndxD858v8f3N+d+dV7AfBPd4O0z510ngfq6CbjT3MZJ
 /bPkwb1UJQR287yVf1nKo/f9k29KJ+5NKIGOMfJKZYMV+9pyMkOZUY3LNI2+xPXXy9GbadSIde
 KMmOzGecpZ6kbEX+LUVzFhGJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 23:12:21 -0700
IronPort-SDR: j0BUCdWNViVmOds0s5S92v6hI7E6OxDPT9w4BDxBHwcPWiCDxZ/9a0C7FhGKLw22+mfCxbCphJ
 PqtL7waQjfax1f4unYmGgUBcSnozmof6asY49KqVurgPMSWYODmfuuKMMTxGK9yaHhsrCCMv8A
 T4gZVkb3ZPwDCeJfeKV/OFjL+oSMXe7pShmI+vSj+GAcgibSJQhcYad1MiwB7dfWkqPvuI3vLJ
 vDmtH8k7uBWzEmNdlRBYWmUdYBYaxA55Om8ZI2f8y54WQTRuqLpnW5+3KTeQI+OvuRRkl7seZf
 1cA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 23:40:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KHkL64V0Bz1SVp2
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 23:40:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1647326414; x=1649918415; bh=AY6Y5IAQG6HgqMU3xT6EvPgFb8SK8Rcv
 x8vGlqrllxg=; b=ry/YF1qh4Ncnms45ZE7tWvZCUwqe/p8yBy+5vtNA+GgOFJWY
 K9JQqUBybL0J7lG9xL89s4uVtnxFdw+h5HUnvLtHT43BHaKYPBoxgDKYm3YOIcUR
 jcVtiI3dRFrFnskh7ESy39a0i4sp1/Mqd726nij6ZJI56Yz+QCP2cr8QqXwkJUr5
 LUUEqvrLbgBB5wh7o9ugMKDNUZbRiCyLcyyZj+EJW/yjMFddu1JUIvhSl5FTuCmh
 L6mL/QslYcHSTKcpqAoaqek5k5q5PPi1EseRy41gT5MPoT34jQ1n6KdyC6ti/Vvf
 g91txkQ5qOfJbVO415/HslXa8IsgaE/6+pgn9g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Yugi2-oKc8i3 for <qemu-devel@nongnu.org>;
 Mon, 14 Mar 2022 23:40:14 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KHkL25s1Wz1Rvlx;
 Mon, 14 Mar 2022 23:40:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 0/2] target/riscv: Allow software access to MIP SEIP
Date: Tue, 15 Mar 2022 16:40:05 +1000
Message-Id: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=066bbe4b2=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

The RISC-V specification states that:=0D
  "Supervisor-level external interrupts are made pending based on the=0D
  logical-OR of the software-writable SEIP bit and the signal from the=0D
  external interrupt controller."=0D
=0D
We currently only allow either the interrupt controller or software to=0D
set the bit, which is incorrect.=0D
=0D
This patch removes the miclaim mask when writing MIP to allow M-mode=0D
software to inject interrupts, even with an interrupt controller.=0D
=0D
We then also need to keep track of which source is setting MIP_SEIP. The=0D
final value is a OR of both, so we add two bools and use that to keep=0D
track of the current state. This way either source can change without=0D
loosing the correct value.=0D
=0D
This fixes: https://gitlab.com/qemu-project/qemu/-/issues/904=0D
=0D
Alistair Francis (2):=0D
  target/riscv: cpu: Fixup indentation=0D
  target/riscv: Allow software access to MIP SEIP=0D
=0D
 target/riscv/cpu.h |  8 ++++++++=0D
 target/riscv/cpu.c | 16 ++++++++++++----=0D
 target/riscv/csr.c |  8 ++++++--=0D
 3 files changed, 26 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

