Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBD537A4D9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:45:34 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPtM-0002yk-Ro
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWM-0001C0-Ur
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:46 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWJ-0006V6-OI
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728501; x=1652264501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8y3Un5Hxd2E2PcjnIHIP4w4G78fYCc51KoJUltBBqoo=;
 b=bL5vzlkCpUD/28lb+LTsBa6kgJfP/RXBis5AGy7TQtDSJOGpAYwkifli
 QyDEMpVIjnc8imVqsZGSYXDxdY/aPKo4tD28v5ZF/9a3UxBtQcz6G9STZ
 pTXevWARPTXnbfMkchpLtkRsU9MylJfSQ/2ssFVdAkrfT3Dwmhk83mk83
 TMHZvE6e1bYsFLg1yGkLNIz8SDPVSEJwy2D1Xo8GtpsbMHbfyolFRAfw3
 25+2K08Q8+E3K4cZVcU92zX3ZlgOkzIMsbKsWt72o0dQl+RniQW1CIuLa
 I1O7DkA7hGnQIabzVJuYWYtaErE9Ktave1Wr45PYqclP/aNu5TAIcHkGz g==;
IronPort-SDR: Cpb5avGWA8CL0ra/s0uYRaYYKba3dbhlrEb3+xYcMhb3uEK7kugEQKlSFl9e3V1EPvkFiY2wkF
 lDm8pYTwlEBUhhMWkSFSiA9oYVrUcB0C/odaxE9vVBruXZguCwEFFNXhOWZDcNSU6jefB34JGo
 XSwY+/Y/BwLsNUWCY9f00RgxktW+dnBe8J9XCTsT6o+3yLBYX/cb7U2lkbMec77nCFGWqiGCcG
 WzuudwG+hAQjDDBe3dp5qLIFzuPQAKMmkcmptamTAJfFmpMFsaL3YVdWg/sBQ5VI80zi8z7fM4
 XQo=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735420"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:09 +0800
IronPort-SDR: IP6txWdVLsjpLZUugHBBHeoJ2KqwdY9EL6Y7SeDKx92erPfiYQMk+ks740rsIcA1p2BmbM/xcl
 gR5qF26g5GAOjfi49jd2a578zGdTRqkRTkoCiJX50Pw86AALr2JwcKMoAptEjEMp7EyXvKsH2Q
 udoNatyW8zcj0RM4SlRWfGMFhm5SXMdJmpddN+pVEDQS+AoDKzM5wVfdSvj4gwnXgSQ0o2xj5o
 D1NzrtWfMD3vN0zhQOKkX98ta9mTd8h3mJ8dCbb+6h/9EeOaHKqhmzcvhakOzNU5fKcxHu9SJQ
 f0/YtxXTUh1s6Sl06u+WQtmi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:09 -0700
IronPort-SDR: OTXSz9DRtHP+OTrAhTweZ/FTzgTack0JDq2oln19/xPl77PR51vom7yzgvJApr2JzKT9HUXIAl
 Ol3NlqR7Z8Uc7SqepYF/FrIdJ6z6QwbA68+V6429LmI2kuKRvnnvCf8oxyp2hlG2rwtfpwC/Yh
 feOhs/OCexUz5P9Cui2c7F/hCm69r4oxHwvyzjuQ2DB0/XTSOCnnSE8mOsBpnoxLPxAarLZk2W
 hhQ2uIWzrCCX//STNA0DcAKR9TB8LaXkVWAAvEtu9YSE6VtaUDunfwCjTclTLmkWU0DG3mkLEy
 Th8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:07 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 21/42] target/riscv: Define ePMP mseccfg
Date: Tue, 11 May 2021 20:19:30 +1000
Message-Id: <20210511101951.165287-22-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Hou Weiying <weiying_hou@outlook.com>, qemu-devel@nongnu.org,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

Use address 0x390 and 0x391 for the ePMP CSRs.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 63245b559f477a9ce6d4f930136d2d7fd7f99c78.1618812899.git.alistair.francis@wdc.com
[ Changes by AF:
 - Tidy up commit message
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8549d77b4f..24d89939a0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -220,6 +220,9 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Enhanced Physical Memory Protection (ePMP) */
+#define CSR_MSECCFG         0x390
+#define CSR_MSECCFGH        0x391
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
-- 
2.31.1


