Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D527160C0BF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 03:15:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on8TL-00035q-Lr; Mon, 24 Oct 2022 21:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1on8TH-00030A-Gq
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:11:11 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1on8TA-00013V-Fz
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666660264; x=1698196264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0s/ks0F2M8fn5m4+xFB4lCmYgbP5PpTyNuQG1wQctJ8=;
 b=FUGemMRsLp3dE0QRz4G+vmONUezVlAs1khFBgfMGfZaNTWUY4j50b0Ik
 IugELO/PGlLckv0X1MskoDiKatbREXlfB5ivDoLA4ImITvHAqQaeI85Va
 PxZeG6t+igZVbrqoC7uuUKWyqxJcrM7aNwZlgxuLWcAWTbaWLlQf11tx2
 3TC/Y2jaOQu2wgFaEWz3fbXy87Q8SAab5z+eFMnFiNwMMtoDb7fatcF5/
 NQeVOnuUl+NtaC4rgQMiw1u01UpUWtYlU+kuq06KI45JQYn0nzF6CRTcO
 xcGMvIN4FLCybUhvFeZhy9cc4PPsLKiQXoyYIydaKKJsGEXOFRdsLt0ek Q==;
X-IronPort-AV: E=Sophos;i="5.95,210,1661788800"; d="scan'208";a="215012531"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2022 09:10:56 +0800
IronPort-SDR: H69+b+ePlFPEyY1GNBzg7T5H8y6Z71NMWWGhK+TTWFPtqLkE4eyJ4RGgYuIbtTMDsMeOYk839Z
 6B0Vn86wfRfPxeOO2SdpYK/6pGRlgTsIg0sQ6D/tSwQ0uR334uZgl15qApAS7YJZ7kBVyPIuUK
 B45Kuhoya9mi8po/qf4+/2M19rIUFRoJBGQXt2pc3yPaO7uF+nCiH2T+y+5JoUWH1aDqT2ba14
 yheZDv+gvH/4rLn4VoANggHFgjyJs9q+WRG/Hsvhoq8AM288f14vLxV+TNvvzUwVqhENSqsLM2
 4HdrzSajYAnqY5Crf18mPe1X
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 17:24:38 -0700
IronPort-SDR: XmqOrCov3kF8bDerzYSfmi4ynE4F7hGBS0ztmWZgSnjQrNtjfPIe1xTU763fCXRvLJ5ihfgzll
 i6mFl+Mn1aEd6PMTNBS1ixtlxTXBrL9Z7FwM1GSM+xLADGv8g/paNg/eCC9W/H041hhLX6wgFt
 +WMwMJ4mfrFacQGMKPv2kiOcb9ymr6rNtAizPSJXpgUU79TvaYa1ZXw3aVyA9+NmLdjfiYGMq+
 qICxMyv25BWHVyorHOEXBIKAvAlQfBkRZ5DBeyHsD/DTLo6if1u2PYn1eDVjxi2TYzF0UR6yNU
 UEw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 18:10:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MxDQl5M1sz1RwqL
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 18:10:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1666660254;
 x=1669252255; bh=0s/ks0F2M8fn5m4+xFB4lCmYgbP5PpTyNuQG1wQctJ8=; b=
 Ym805DsJxDNuIIlxfSl4QpX7NeH3u6u63LA2GIMGZv3T50ljElGV7h7cFZjNBGre
 s0w+5KjgofgwBGEkulZcR8WbLcO6bPxx6Ia9Igo1W/oVwK03oXkBOSz+GKUoeuHS
 hNm0+Jiz8fEqxQRTauMgse//Gsqg8nQBsapJW02djJ0o8AlC1T/TKJHccJuXchmR
 6UAinttq2se8Fbwix1SQfZoKASpwvunJiowxADc35UiAZuMU0npFbG2JXPKKc3Hn
 yEjXTI5TXVl0R1X69EZ90T2AAvZAuH3Lo285fj2EJ92CxzGqv9Ru4wxmRsfo+uM1
 L2hsawxDlkirpDD3Ik6IQA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kKFCdqGLit7o for <qemu-devel@nongnu.org>;
 Mon, 24 Oct 2022 18:10:54 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.77])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MxDQg6rnRz1RvLy;
 Mon, 24 Oct 2022 18:10:51 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v0 0/2] hw/riscv/opentitan: bump opentitan version
Date: Tue, 25 Oct 2022 11:10:39 +1000
Message-Id: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch provides updates to the OpenTitan model to bump to RTL
version <d072ac505f82152678d6e04be95c72b728a347b8>.

A unique change here is the merger of hwip `padctrl` into `pinmux`, to
reflect this change, any references to `padctrl` are removed.
Additionally, an unimplemented device for `aon_timer` is added and IRQ
numbers are updated.=20

Patch was tested by running the latest master of
TockOS as of this patch.

Wilfred Mallawa (2):
  hw/riscv/opentitan: bump opentitan
  hw/riscv/opentitan: add aon_timer base unimpl

 hw/riscv/opentitan.c         | 16 ++++++++--------
 include/hw/riscv/opentitan.h | 10 +++++-----
 2 files changed, 13 insertions(+), 13 deletions(-)

--=20
2.37.3


