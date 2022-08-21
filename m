Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C359B6D5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:49:28 +0200 (CEST)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPuh4-0000sc-SR
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPuaf-00012e-8i
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:42:49 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:27682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPuaa-00034t-RB
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661125363; x=1692661363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rsGaFrNcWTjGlSxxEaBkSitBACK8HAoH4NGxPwI9aho=;
 b=hyZrm66JKTlSdYs+KuundRooDLIAgphUBe6ZR9Jeiz4OaeXEinkubB4N
 tIi+QKucwAyUSQiyaT9D9B61pDruwX3/kSJ4jtPiHXE0Fxlpr2T8gcV3K
 3GwAC09okB7W3dcM5m2Q2SBKPMTaI6cM5mENt/YpeWRsLiiO+3z+jIaoo
 OOTIrbXhXklRZ0bzDmK/MHsCKfEUGtsN/mEwmDkvhpmk8nnabk5ZaWtHT
 KcMxH/Ign/PkQRSdafddvhe5gah9Gcvsm93VE8jVI1lYHLU2xEcgUNLIX
 xMPePWlptr+rueW0IWhZ3lH8jwmtznRPG1WnQIF/5veh8dmvpxsDz4mLa A==;
X-IronPort-AV: E=Sophos;i="5.93,253,1654531200"; d="scan'208";a="214404823"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Aug 2022 07:42:39 +0800
IronPort-SDR: 9hYJg0CMcvc/+g+0BzB6alaAuNQfyzrdUJvyu1PXtZZYFu6wgSCzbTTN+TbD3vgzmhsOJk1U5Q
 mwSMxgTLf/rSqM5SwuzVbN+OzyeDTa1WwvelBuGoeacjKT9Cp4D70eoQUT/cnKQwEDg968NXE9
 nUWLy1YLQTSzkIshZGAH40bw6Bg1Me+lnTj6jfyhxZKNy39ThhFkC4C4CyiZFlYIf/KKYRPXaI
 Mfpx5XJKBSbaSARRtgo9t0l6oLlzNItKmQJYRSfKyqwe6qvJh93qZLhUan6Q9NiU5N2D5EtPxv
 2oMCtlNnDS46KH/LglQfRece
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 15:58:02 -0700
IronPort-SDR: mIuOvb1txlc0ICCBe/Yxsb+OYnSPNgfMOlltL3Rg1md+ozlf341yBdLXJiZvhG6j5Ttg/Xm/Hi
 6O4x6k7coeTXKZlEWQRnJHWJ9aoHYzy6UhHhxOkCyl2+OJ9hWG2Rx6myQVI1ozVvg7LkzK7J+1
 gQBy4VyGKQSt7MnzOPAgzNjZN8qKnaOjOkE75WZCRTCYuE8+u1e10oCrc5vhMv8Mkkj/QDhHMw
 lPM+NQc43QeGsSiSnSOMuHSWD2li7HcQyEfKM5hm5JA35mLuBXDqEPok83hg0Llcio1IzxEppB
 f3E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 16:42:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M9sVS18LNz1Rwnl
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:42:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1661125359;
 x=1663717360; bh=rsGaFrNcWTjGlSxxEaBkSitBACK8HAoH4NGxPwI9aho=; b=
 LgC0fymTij6fPluEtpk1G327C1C1RYZG/g22q0Q56+bMPexnYbevcj8ypWJmbON9
 uOVquY4oOMLulr5udaVzLvQPUodEAVZLa3OvzfteTe9CxC6Ii71tjoHx7wBUf9qu
 u9IOcJmm4u2hOS+rJTGtkXDot6Ssx4u6UWZ/c98cVIkcIoCRalSc3N04AB0VIdzl
 cmWfyYpEd5ZEbNx34+sug4wuLQ2deKzxQJ4IDolD2D7cD8MYBGHBD+bjEVNPKmqN
 SHCkRMK31cLs4y/P45ZVcXK5h5QhW6UQD4c2z4e6ejxsVjAeyhTs381+mdw+fv+Z
 a2ake6nUt2ourr5SIE9xmg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id K5qbh0UWXQNg for <qemu-devel@nongnu.org>;
 Sun, 21 Aug 2022 16:42:39 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M9sVP3p6Mz1RtVk;
 Sun, 21 Aug 2022 16:42:37 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 0/4] hw/ssi: ibex_spi: cleanup and fixup bugs
Date: Mon, 22 Aug 2022 09:41:57 +1000
Message-Id: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=225a36311=wilfred.mallawa@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch series cleans up the ibex_spi driver,
fixes the specified coverity issue,
implements register rw1c functionality and
updates an incorrect register offset.

Patch V3 fixes up:
    - Style errors (excess indentation on multi-line)
    - Remove patch note from commit message in [2/4]

Testing:
    - Tested with Opentitan unit tests for TockOS...[OK]

Wilfred Mallawa (4):
  hw/ssi: ibex_spi: fixup typos in ibex_spi_host
  hw/ssi: ibex_spi: fixup coverity issue
  hw/ssi: ibex_spi: fixup/add rw1c functionality
  hw/ssi: ibex_spi: update reg addr

 hw/ssi/ibex_spi_host.c         | 172 +++++++++++++++++++--------------
 include/hw/ssi/ibex_spi_host.h |   4 +-
 2 files changed, 104 insertions(+), 72 deletions(-)

--=20
2.37.2


