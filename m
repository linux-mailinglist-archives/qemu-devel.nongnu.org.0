Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D031E437
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:08:25 +0100 (CET)
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYjw-0006Yu-IH
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbu-0006Ow-VB
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:06 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbt-0008KW-1E
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613605; x=1645149605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nHRAFa+/Y5Et+Q5A/bR1rjHMhjpRBXY31nLa+LZE0wM=;
 b=k+HJIbn0iZyqtI2Xj/OBcSUQ8s/jhhuHHciFWr+9xzDHpJp+5xGzqrBN
 kTjp76YyuFae3HPBc5VUfnjIF63rCTwtc57aLgTvtLuknSjseGijCmljD
 /iZsY3tDEhXavF6mSL7cxC3MNhIopwpdDfdcntBDlzv+xOS7UgwiVFytS
 SvAY9e0kIVmpIoi66idEVJMoSZZubLBHi6xX1a6CeoK1mMfQ/2JtxSYus
 E3oB2eeBuYQUcalQc/KROyTiZvzFHuR6LOQU8i8RCYzja95IV7sfsRcGA
 QzBXuBWgaxvBfYjXtoXLNjJZRSZne+Dv9/iijywwMKNca+mruGCAn+6zF Q==;
IronPort-SDR: pVB/z4u6AEBoC9Pbg/I187C3h9qk1D/YwbfN5VZPRfFn2fSbPUvubq+FtyqG23v91jPWflWNmi
 h4VYBlusL7eDs32YBXCiSPUWmoh+FrOZHPYhX5HfRZcBXV+a0KGHu7yXqf0RqjMLZEfTap8KuQ
 Em+vnBf67mquADJUE9qtam6QTjINtxWnOqklyNRKc5YVfnic3OrBeBX6gFCM6BtHQM/iFP/RD8
 ZKewcEN09oMGdwBMWCRG0demWUtt1PnMmIXHTubH6YjaYiiB07IbtQRpfT6IXr8gKFfWOSoOnM
 hEU=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392122"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 09:59:58 +0800
IronPort-SDR: 5q3GdnTAACcwm4PnQ+AQ2Nqz6btL3+3sosWl950ENt0iaiQRImJSLe01nccmyruthW2RYhhNdT
 Az/vGyY41kSARyZ5ieYcilfbAOEss/4dvfBPsfYUW6mRES27mjmLj2JRv9zS2G6p0kzOiXKuI6
 DqEwXjsNsCF6mB4jQL7VMdBw/6mgJq8KL4O5oKh71XBphtd8CIrpcg/VtTOpQsnz1UpPM4NIuE
 FiLVwhBmzIOYYDUSaGTgIyWEVGvSV5I162WlS+1+Z4KwcppgzuMxw5KD2/S5C0bWs8NRSUtmcs
 46zrIqX/+1kYjFyqTNJr3hYv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:28 -0800
IronPort-SDR: 7DjNuFCqlV0zNElpPS2BRSXUbjS/ad08Cq8HMLy8Uyyex0/7zHCGKG0mJGe/8FrIq6Ra2KGM6U
 CKKpOl71V1r9NPOaFStjomotNIrItJHG0XJmNWadXOUiRvupPOkeFhFwyjmnUwYLq5HUFgDHqe
 xMqYCpKuXDmOQupg4UpD55UXzEB12nngLx8PuCSKR0OTH0mWSCHGaCcX0O1yeG9j1IeoZDGta3
 YRKUhLHs5+cwzDZQsfVfocwFPwkzYu/5eMx8Uqx9jlq3VoI9Qsip1IlIYabmmSA7Om4J+1FOiP
 v5M=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:58 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 06/19] hw/block: m25p80: Add various ISSI flash information
Date: Wed, 17 Feb 2021 17:59:21 -0800
Message-Id: <20210218015934.1623959-7-alistair.francis@wdc.com>
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

This updates the flash information table to include various ISSI
flashes that are supported by upstream U-Boot and Linux kernel.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-3-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/block/m25p80.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index ad4456b74e..5f9471d83c 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -210,6 +210,19 @@ static const FlashPartInfo known_devices[] = {
     { INFO("640s33b",     0x898913,      0,  64 << 10, 128, 0) },
     { INFO("n25q064",     0x20ba17,      0,  64 << 10, 128, 0) },
 
+    /* ISSI */
+    { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
+    { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
+    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
+    { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
+    { INFO("is25lp256",   0x9d6019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
+    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
+
     /* Macronix */
     { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
     { INFO("mx25l4005a",  0xc22013,      0,  64 << 10,   8, ER_4K) },
-- 
2.30.0


