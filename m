Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E315F035B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 05:35:32 +0200 (CEST)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe6oE-0005lh-Os
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 23:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=265e2c498=wilfred.mallawa@opensource.wdc.com>)
 id 1oe6mR-0003yw-Vq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 23:33:40 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:4371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=265e2c498=wilfred.mallawa@opensource.wdc.com>)
 id 1oe6mP-0001aB-8T
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 23:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664508817; x=1696044817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2DcQu+pC91BO5Pmhw/ct7ghDnUuC5IVKwmg5u4/jxyA=;
 b=Ieyx3BYa36hcFj5iNxk/F/9dW5J1w03miaTiclyO0tgJetUkhYRPXVnI
 OYb7hrORsGecPuhZzW2fXYHClcYEpqRBeGulZctunnAAhQKwzEZM9mCFj
 vFJQJ+2fEXYlNX4GnTPg2Gn+5730aSeRNoC/da0oazBmwywh4T8H1QUcv
 xii76PwMHSSqUUNCFGLqgvl+1H/b1/cZFAUll+uj+fKY3KTItynByPuz2
 20Dx4qjYLCiEWs7m1tLOLBGJBHsCcnxoHlpWSiqIvSGcyrJ6s7KGzf+/a
 vfRu9PFwFbsvjVlmEoEb4eA0/ZFNKTu2tszSOsVr5NaxgZYHuajLfJaWv g==;
X-IronPort-AV: E=Sophos;i="5.93,357,1654531200"; d="scan'208";a="210991980"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Sep 2022 11:33:28 +0800
IronPort-SDR: edU36cgCk/kTYWQw/B48L9X9CvR3eYD99N9p5fGmicj9acSAo3lQt/2lLRegfjG6ic7l/Lte1U
 DclhGqTwNuW2eNyep65GnL7JqQB2NCyEtEGvT/dav5D4c6lKQE1kEXhAL9m0je/WAd4v++HsUj
 eathahFsWOkZ/bl8GoohmeokUjuRNiKtxP50e/Es2Yt48VQfQvftAroYhBqzvK08FpNFkAByZ4
 7ReQU/KbB0V135ONI7bQARumGQHQ/XbQFN706lX+yrkRhC4jWKbeA79WIiamL1in/Z35LmU6Bo
 57r1Uw8V+BRyLfAmcFmjRsV2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 19:47:49 -0700
IronPort-SDR: VQym6E7GM9ShDCyNjLcsPM23sbYqY0G/0RYwpOQQ7m0xY0Q8Y7CV2L0AIU7TakczspTWjTL6T9
 /qZURKaXkAbHNDbN6VCrogu3qU+4rnYbNfo0Cp8m38LVxsWHZQ4QXTCD1vN8NQxIi+7Z9MIlrn
 60JGxDleny5BaPaMFGxQTUnMq7tNHO7ENp0fj4NW58mjCESBXRjPeXSrcgqAM/8zmUp9l2waCP
 lt/ajCyuxTnp3DwoKho4VGyxQ2Sk+Kc70PDxgkXahBm8FAvInFshFXrwZQ2iQQTKigRzlcoXhp
 L4c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 20:33:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mdwml6skHz1RvTr
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 20:33:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1664508807;
 x=1667100808; bh=2DcQu+pC91BO5Pmhw/ct7ghDnUuC5IVKwmg5u4/jxyA=; b=
 lhjjLlFgqK1+Sp5O6HTY4CSIXrsuXuxB2HBPjkFfMNB4rnlSzPjsPiWi+1YXZKPF
 pjgYldCQ3wZuGMPpxpGPY9mruqGcyIRHFc0316I2eN0MExDTrhnoYG5fDdPaFRuW
 kR8A+Jmc+UG7qto+/HxFiFeXIZAPsS5yoTs9JF5IJl365WYxq8FKNw6YOw4w/7V+
 YVyieVxM6XK9Gb2ibqw+FMpAvkRiRekgMmTG4CvHWhJ+uhT9wYWEATo22OG8X3BZ
 bdeeAoFV/vld6Gz3JY1kGPaxc19VWToFlpj66cgCHnI9skOOOSuIUx40AhNbjWRd
 z5F+AXXQoBuM3/696wd6Bg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NWHb9NmaaUsb for <qemu-devel@nongnu.org>;
 Thu, 29 Sep 2022 20:33:27 -0700 (PDT)
Received: from fedora.wdc.com (unknown [10.225.165.55])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mdwmj3Jz5z1RvLy;
 Thu, 29 Sep 2022 20:33:25 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v5 0/2] hw/ssi/ibex_spi: bug fixes
Date: Fri, 30 Sep 2022 13:32:40 +1000
Message-Id: <20220930033241.206581-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=265e2c498=wilfred.mallawa@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

The remaining patches in this series address:
	- Coverity issues for `ibex_spi`
	- Adds rw1c functionality

Changes since V4:
	- Fixup compiler warning for unused variable `data` in [1/2]

Wilfred Mallawa (2):
  hw/ssi: ibex_spi: fixup coverity issue
  hw/ssi: ibex_spi: fixup/add rw1c functionality

 hw/ssi/ibex_spi_host.c         | 166 ++++++++++++++++++++-------------
 include/hw/ssi/ibex_spi_host.h |   4 +-
 2 files changed, 102 insertions(+), 68 deletions(-)

--=20
2.37.3


