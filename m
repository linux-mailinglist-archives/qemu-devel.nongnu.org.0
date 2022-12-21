Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08207653920
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:55:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nr-0002pb-OY; Wed, 21 Dec 2022 17:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87ni-0002nh-H4
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nW-0000bQ-Ru
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662570; x=1703198570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=390eeG4V0e1ilBaF3agJQhKFOgqHLzF2xG/939DvkZw=;
 b=mXe2MTTxX36TkcuYR7ku7bttjWMycqV/6J0+I8QVD81+wErBeUOIB0aj
 K/3uHQrKiCBYsvuIjWS7o3MsNsVE2IasGj2ZZRTB0Ym9OXq04+pjVPJnp
 eLxnauotZIBLmlHoR5H5tqIezg93tUql3w2aZpJfU7VKwd/goZGWALqmo
 rwkEIGt1jjtQroGV6ka64dy/uFz22gFCaZhKDdq4NUCTSKgDzPU3FA3dL
 TYy5FEdHZDB1OR4ivV05DxHerl5KYMjX3jNgVlS3r51qyofCFFf1f094Y
 Ro2xu8VFJneeUSiLv/hkEQ7b6Z3xMVWqUPCHba3qACcm1Q35e0KMOuk/4 g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561436"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:44 +0800
IronPort-SDR: IPlRRm/8qvOCJy5LSpK8L0A8pQLhkpGzOVyDuV1jaPcfnoFZd/JJtyAFw16F7xcM1pA5vUWZVA
 742ZuMm9Zp+OCU3S2mtRBPR5U6hl5EB0hDrmvs4szEl33VeoTrKgBWerW45x/uy1WyZnKG4LSu
 0k6pIHi2hagbduaRjlpE/5rrEwKmWHlluNT3kOZ3iywJ0byx4T/kxKRpqw4e4ggaYTbDcEJdWd
 jEEPzZ+drWu9qXdTiSTsMDnw8/w9jUpWwb/oMljQW6iVJr72NxXD9rRAa7qLTz4UunDw35V+A5
 W14=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:13 -0800
IronPort-SDR: QaQkEObCQOrl4AuwRdaGzFT08PNwzVorCQJeGpfxiKvHYG+6Fvz5Xa3nREgkBlKR2P4YHi1L49
 ibagSj1sc3IG4xAoGQPaYwJiHhbDgGcHW147Li5zqghT2BJvsKKN13qG/Dijh0Twawxj9YvY99
 IXCVmvlSQiPTCuzDoscGUsBdjtuNSHkMlnQlNLHhbML9kkyg+bwsaogICaHsjEectTMJCKJ7ik
 zD5SE3VGcKQ9ida13mEsKFhRaAT0eYzVU1wpb1kmw85qo0Mnk+Skpd0XzMwMjsgPYCaM//oXUv
 ugA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMr12krz1RvTp
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662503; x=1674254504; bh=390eeG4V0e1ilBaF3a
 gJQhKFOgqHLzF2xG/939DvkZw=; b=WtiDRZr4Up1ZdEnUYOQk4XtpznEqJfTsb3
 ChvWoj1EzQZ/knKAbQxd6nqV4mPCir0UGva7BY0Vv8DHlG9uglIVJVAKtAa00PaA
 0Xw1MxgzXYQrrtksuOuU/kHajYGrzviTxInGQpUYmjFwWZ8Cb8LrwHOxCHtOzDSK
 DsgkIHX8zPSR/dm27LuUh/i99kA5vEHJDh59w/+BReXGSYx1Hvk0JjjxYo/DpN0z
 4/fr9LBg0dNR0XVIR+Dw7I4wj3GAstl3jynBu55WXlhtKsCv9LM3Puh6BfgVS9t1
 SO1GKOUowo99nrjfmI9KguoXtBD+jHHQx1VUEABucH0VwwRHq/oA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YjKGtGLERa_I for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:43 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMp0crfz1Rwrq;
 Wed, 21 Dec 2022 14:41:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 35/45] hw/intc: sifive_plic: Drop PLICMode_H
Date: Thu, 22 Dec 2022 08:40:12 +1000
Message-Id: <20221221224022.425831-36-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

H-mode has been removed since priv spec 1.10. Drop it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-6-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/intc/sifive_plic.h | 1 -
 hw/intc/sifive_plic.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.=
h
index 134cf39a96..d3f45ec248 100644
--- a/include/hw/intc/sifive_plic.h
+++ b/include/hw/intc/sifive_plic.h
@@ -33,7 +33,6 @@ DECLARE_INSTANCE_CHECKER(SiFivePLICState, SIFIVE_PLIC,
 typedef enum PLICMode {
     PLICMode_U,
     PLICMode_S,
-    PLICMode_H,
     PLICMode_M
 } PLICMode;
=20
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 0c7696520d..936dcf74bc 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -42,7 +42,6 @@ static PLICMode char_to_mode(char c)
     switch (c) {
     case 'U': return PLICMode_U;
     case 'S': return PLICMode_S;
-    case 'H': return PLICMode_H;
     case 'M': return PLICMode_M;
     default:
         error_report("plic: invalid mode '%c'", c);
--=20
2.38.1


