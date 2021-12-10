Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D296546FAA8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 07:33:26 +0100 (CET)
Received: from localhost ([::1]:37282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvZTB-0008CF-TB
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 01:33:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZN0-0005UA-L4
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:27:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:64247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9719c98f0=alistair.francis@opensource.wdc.com>)
 id 1mvZMx-0006FQ-RV
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639117619; x=1670653619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mQ2cfmmWBb0w1+UGiKq5pAvPGgH1QD67RwSn7Kb7js0=;
 b=rfnDb7dpORzBcs+c4U/rRiE5PzgwcfWIfGUUyPi+5HDiRy3QOKIRGzWP
 205xVcqUB061pZksUEB4bIjszLL5gLa/HFVOGmJ6sT7ae0I6h6DpmRat1
 9mQVrQhWeMg1gyITqExtEz9xzpMbr8U0nsJBgOf109UKinp3asUXitzcv
 ONPLxY7T48aqk/tR1AbtgtGA6l2Sw9UC+sAzvlMSDkV0y1VtMi6q5VAbV
 gspkrvEIlMo1FbU04etEsMBOjjOYkVVR+5N5JcxCZBLrnjr6tTmkXlKlD
 Rny2CbK8IxGm3N6Bx8JacAH+m5cNC8X1Lw9a6vQC8aZ1oqw+Brqbt3pkt A==;
X-IronPort-AV: E=Sophos;i="5.88,194,1635177600"; d="scan'208";a="291899828"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2021 14:26:56 +0800
IronPort-SDR: orXj8EE7MM1kHnKQgNfqubJ0Pvo9/iERna9po3CegZd7ZvCsq4OQ9m1WTVSCSjs59qdSBW/eHu
 alde1WD1rDnsujdQ5EB8FkMiuXVpP8IcuhIdskFMIAwOF4Epfc/Q9PYgNmQUfM47vhM1OxOFeK
 Li5eiXl5fIFzY7cP8+/EdKn8E7yjaHn/8NljtHeSBtV1rioBoWv/i0cAHjJmVPNpVHgv20nu4k
 31t3uZajhwIs8eGaQoALAK4IoUP2Vf11KyH89xphVkLP3Rq+f6NU/wgGAj0nbxchSXVSttTHGU
 q2J5Ej075lgmmHUOfpnNETQr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 21:59:58 -0800
IronPort-SDR: sSDQH1A7HH+f6m21PwSQqw/5PULp3xoqfgtAxrVoGybEHtu/FffV/bUV72M8zTFAYmvt7TAoe6
 QFupFDTZPSvzfPjzJsNRKWtJInT3TUhKXPGzYhGbPJqRgMb5S5r4Had91QiVb2i4cumI8aQ2sL
 bucnOfnFOSA2bKcMpWVjAwFkcmoXSQe1TT19GsD/VWkLrite+gQO9xOL2F8XqvP4Upcg+o+5Gi
 qt48Oyx2ApEroVqphef+X/crD6uk+4jIK0M4CRK3PuYM4dABQUnUvd/ku3WZFjYr1fjkQsk6uz
 NUk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:26:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J9LXc25KTz1RwFN
 for <qemu-devel@nongnu.org>; Thu,  9 Dec 2021 22:26:56 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1639117615; x=1641709616; bh=mQ2cfmmWBb0w1+UGiKq5pAvPGgH1QD67
 RwSn7Kb7js0=; b=p7NR2NHWP5q8WRquWGiaR/PkGzzTUrlvNwh6oJW1ltDnx/A3
 fpi9ZWVlbPE8aGZSPPoakWEm+HxyfxPYKWS0oc8h3EY7/FtA6fqOqExVVnVrd5UT
 MDJreWo+TqQV3Vo2Gw2QgBTTJJIErcZro3PVCnpjPTcuPLReLiy/Nq3QDuSfhFGv
 oRb1Cp0veAjLNwRlRtU6h+lJ1vIwXfRSDGFws5oih74u5cd8jHsmRYmKd6V728lG
 knk73gZkteFxRIMiNcz2k4L0JKZ+oLamYVT0g4pouZe7L3c7f4tn30+RNRGVU2KI
 8A6t6ErvPkBP6k6Ux+IEruqPufn4tTs7Da7mXA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hdwFF4vUcF6A for <qemu-devel@nongnu.org>;
 Thu,  9 Dec 2021 22:26:55 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.65])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J9LXW48m8z1RtVG;
 Thu,  9 Dec 2021 22:26:51 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
Subject: [PATCH 0/2] RISC-V: Populate mtval and stval
Date: Fri, 10 Dec 2021 16:26:36 +1000
Message-Id: <20211210062638.824672-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9719c98f0=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

Populate mtval and stval when taking an illegal instruction exception.=0D
=0D
The RISC-V spec states that "The stval register can optionally also be=0D
used to return the faulting instruction bits on an illegal instruction=0D
exception...". In this case we are always writing the value on an=0D
illegal instruction.=0D
=0D
This doesn't match all CPUs (some CPUs won't write the data), but in=0D
QEMU let's just populate the value on illegal instructions. This won't=0D
break any guest software, but will provide more information to guests.=0D
=0D
*** BLURB HERE ***=0D
=0D
Alistair Francis (2):=0D
  target/riscv: Set the opcode in DisasContext=0D
  target/riscv: Implement the stval/mtval illegal instruction=0D
=0D
 target/riscv/cpu.h        |  2 ++=0D
 target/riscv/cpu_helper.c | 25 +++++++++++--------------=0D
 target/riscv/translate.c  |  5 +++++=0D
 3 files changed, 18 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

