Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936131E442
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:16:46 +0100 (CET)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYs1-0004cc-Da
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcG-0006eY-Vy
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:30 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcA-0008Kh-Pt
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613623; x=1645149623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SGHCQo7Z5JaZpYTAO99ArClzyLM+uE7juTXLMNllOu0=;
 b=PWAs4ootlGIFd3iat3MLZDhhwPkjeBsRoaTtL9eFoadupNE+y/Ny0HNF
 phUv4X+TB/Y2kACc/0WPgbS0kOD4MFdmprUSvzMqVpfSRC31kLaIAnJPE
 pHXYmu/pKdMIiFYl0jFRfr8Dzq8e0ffFEhdXC8+BuZE3H9m0hEr41AzAO
 RNSOrkELN2ejVOla/K2KTOCTryxGJC75nvhQgldEfbTtjE4kpEneYTvhr
 UxkPOFKMwLiSZ3krAi9ILds/eUmxDGTT8IKrsaCeXy5YMWV/zQKUYhQMA
 F5GKJc0ge67buTeeDo9fK3GPo1z24smoxQ99UmGqnO5aEy4RrqHblLnmv g==;
IronPort-SDR: EoVjKh7YA312/0aGmPl8cuKQ7HWLhwvXpYjiw5gXLxupimuv2tT5g1SkZj0NCh1fY0hCHyBHy0
 OCDi9E2unMoSg6/WNim5WnbLQSenD5ZCm3K21CA8fkZJuZ71CkzINbeO+QOBXFyoqdio7PCYcM
 6z+u+j8nJ96EO0agjitJpyg9iP4SwyWyPt0bt3Dag94UGGUq3xcvgbxEopiSgJtC5xAI1iPikj
 xomVh+VTUcHr1Zx9qOBh4uQME0X5RmvzRRgl6ar9pgM1VktIQ4sm5aG1MgTQrL0l05eiOe2Bkn
 c2I=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392135"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 10:00:00 +0800
IronPort-SDR: 2v2XNbj79ZYI1nVzxhsWK7Y0EprCScCi3XiXIBzdVksOtikrKNuBxWolquo5eEC03/mivIXYj7
 jiTbdCtKk9CmGlC89uZq3jECb8kpih2wnF85Mj9iZzCdsGUJv/5vcA4MR4pmGz7FJhaX6HGy8H
 ZWksVmsuPeEV56yVx3lx0npNPx33FkK8eT+wbgDpA5k7hh7ID6T52WhUtH1s0qYeCqCoWNdsUx
 GkbmRzZFQdo1CG10PnUTvZ8k2v9WPw3SyAtrwAJn4nADrX3X3sA1/Kjf1UmLo0+GaqC/a8G2Ei
 9fVqgRl9s5yLznuEJx18d5t6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:29 -0800
IronPort-SDR: Xo2SLeikcG0A18qXyhiqJvyI/5lcp1e9ekZswJGGJl9eHCvHtaiQJoTWEgahKS5+EgV+jyadF0
 aQBFUPE5qewhwYxwYrf77A1Pr7lzWENrw7ljM8k0H12Zz3B2JZykw756Sji8YLlH8Xbr1tuajJ
 4Ch1q1mgIgjg5Vjnr024utWpnxkmtTxtZoVe/DKrpKI7VYNQ4nVpWq36cSbJPFLLp1iu2S07J3
 t+hMMDt/1zcYSwNGEccmZhrOxC49omZhY/8m1f3oKYEgPnqXIlcyZIbcEVuRBLsp+8I3w7OYqT
 u9I=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 11/19] docs/system: Sort targets in alphabetical order
Date: Wed, 17 Feb 2021 17:59:26 -0800
Message-Id: <20210218015934.1623959-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-8-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/targets.rst | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index 560783644d..564cea9a9b 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -7,16 +7,21 @@ various targets are mentioned in the following sections.
 
 Contents:
 
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
+
 .. toctree::
 
-   target-i386
+   target-arm
+   target-avr
+   target-m68k
+   target-mips
    target-ppc
+   target-rx
+   target-s390x
    target-sparc
    target-sparc64
-   target-mips
-   target-arm
-   target-m68k
+   target-i386
    target-xtensa
-   target-s390x
-   target-rx
-   target-avr
-- 
2.30.0


