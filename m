Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58275AFEB1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:14:03 +0200 (CEST)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqCA-0001M8-Cm
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2t-0003cF-VA
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2r-0004Ot-BN
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537864; x=1694073864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMhq0K/hPx/aE8Wg/qzKvmF3DMKQRurvT9lKFjW1GcY=;
 b=VlyNNBvMe1odPMPi7FPaKusUJHNx7VXUyXxjArmrWvHNhGXvlW9sU26q
 RDsyWG9HxG6ez1B7MYkrCHe+OpOIRoppG1rUv+l2Gaq10YYyabLWgVpw7
 yAYtZmhjhaLWgk+a+SHZmq8LVdTnC+2dMu4NLHAauzJVE1z1NlvT5OKN+
 N6fiK1mLHb3uajA+J2BjsW3k54CMLR8v2IWfZZcNVAKzmTak34nZd1SQ+
 9ak61YOGyZbVQyUu9gybfhLYpLw7ljywy8nua4QE+qZOsGSst25cA9xMS
 7Fs8yjlkvc6pXGqtrtwgP3scqZYZFfmPqsCu7T8XqpkFo/Leyi3iIAML2 w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714944"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:19 +0800
IronPort-SDR: U8eKnUJlUswp5Kv7C636LUtMluSi2iMBD9IXtsCxgIxiI+61YBQF4TECmsgrU5e35nCSYR7i0Q
 bafUhuZ9rdYHgToypJppcELzF3+xsXHzz08SBcvduA56cT35RaPMnB/36meIGQ7dITsRwmVcBA
 kknci0C8TH9eCzGoxI5VLf7mnXq2goucMa0qPdfQBxUyVZJ/r9pX4M7ShyA3PJ6iETgPlPdtPV
 WuZhTtgnny8h5n5sqxlKHSRzKVJynneYFdJlGMU8hOJihesRPd5Xprhk4LHa3awozV5u+Wifso
 EnWlAnADm3YW+MBd77sy95wL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:16 -0700
IronPort-SDR: xNqrHLzWuZreawVaRTRjn/1QKRyndbHT6eOuYa+mK6VWLpfrBHJ7TXCJUkCo7q+HWEiUdJlrdH
 psS0ZQQ8ZVCVjQ8wa86PG+hNZ6DhzSFpUF5wActQ5hKG5Osvkt6nSJAe35nUEEQigjkKxMimnY
 UoeRWqg0xrmD5YHvH5VU7Nrlu/61FB8O4dgXgdrF6FULolZIikzFO7beqI+KwKob2azHf6UWh9
 Pm64V9CKsoYcTgar3NwS++d+TnAwJFx2nLLbwNxnfn8+gXdfBG+arpkKbe3Oa9IlrfR8KgdY+R
 o9g=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:18 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/44] target/riscv: move zmmul out of the experimental
 properties
Date: Wed,  7 Sep 2022 10:03:13 +0200
Message-Id: <20220907080353.111926-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Weiwei Li <liweiwei@iscas.ac.cn>

- Zmmul is ratified and is now version 1.0

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220710101546.3907-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cab74faaca..a3e4e2477f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1009,12 +1009,13 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
     DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
+    DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
+
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
-    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
-- 
2.37.2


