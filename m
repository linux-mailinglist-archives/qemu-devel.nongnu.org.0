Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE492B2BB2
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 06:57:55 +0100 (CET)
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdoZO-00061H-PL
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 00:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=58086a3e2=alistair.francis@wdc.com>)
 id 1kdoYV-0005BR-LI
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 00:56:59 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:27199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=58086a3e2=alistair.francis@wdc.com>)
 id 1kdoYU-0004LV-1a
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 00:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605333417; x=1636869417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PDGjOCrPcBr55qeG23BqMw3++1CZi6hyle/slqh0rVI=;
 b=pAzdD9R2DCOj75nO3ZeuCXyUAKwOt2SxhqpsvBpJlEMMk0wqadN0ds+C
 LetFBDY1gL6YDIdXLij1NjwXDwd1+q1KShAH7jJQvKM8F0Tncd1hF+ob6
 bVqyusJkRfiZ7Uo4K2KJWP7Pq9MT4RCoz9rGRmLrKjwwjt2lTndwZlJjL
 /bwUbClN0bzZrzj8LfqBp4XhlgZYTeOBI4KBtz2tgcDSDJ9u6NQsMmimd
 Ss+L1a1vXXpxfB7DaBHUrLHbB3WrpYF8+mW/8romUjIC9qMsBqAOuVWPl
 aKPy7vinsFKyR4bABdB9LG/EwEmHYyNDlxCaPMO/yV88BNurhXSrEOJ6m Q==;
IronPort-SDR: +KU2XQxgx/tPxJMjHgV4bIvkP3VLjoOHWkl/V8Np9jTePbka7dnzLXmueTgaovMbyVfuMDumfy
 DnAt+0zxzKqmTjSR/QCgnBs7x+nM2SyvOpQVU60Gr8SUpzFxPzMgmMFODRGvkTmPDoNe8ixEHh
 NY7FTxaNxgwvUG/YAGxYvueGZBRRGaw3J2GpPhUoaOzQWvTDwnqiB8jWQ6UWEGsH3mPXZKKI3p
 hSFQZPL5FsTvGxwC7gIBdsqiZqPU28q/zSErx4plx5i7vrFHzOUjKgar2ah7H2wgauGlLjxWgw
 o3o=
X-IronPort-AV: E=Sophos;i="5.77,477,1596470400"; d="scan'208";a="152517556"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2020 13:56:52 +0800
IronPort-SDR: rSOJG38a+T54aMzsp0SXWo7IYcKPFXQO5TpW5SkJq3Zsavv39TE81PbkDRB7WoEXiqnL9YNMpK
 OQuFbAqR5rk4anPukJX9lT1TCItOdQL67X5UHD7Xb+g2bT5ZWa+nlD+24mfaFItKx0d03JCQ81
 OHX96pPDibfl6lYgyohKL+Z8DvRm97nmoU+44t1coATL/UnC2qJceOwT7wobAmoEHWBykwSmcs
 /p2YncTqAJp8Vx8B0hnRM5EUSPSj4xlVvwARPkGmTfl23FYingq33waP18cWFYG19D4CcBBbn4
 eeq9SAMX0uf0HL7uxsjmDBUz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 21:41:32 -0800
IronPort-SDR: Qr0EUvK33lzjoN5y/8iK6Zzz8S3mGgY1PaW8PCHLorxx9WMxUHlpGZfsmk8SGu2ZCLkr7NkLes
 7cstHwd+9zBlpSuXiLxZ1bcHqyNcxpeuFWm4d9neVFm37l3mc99+ybMNHcpvAEa3IM5mvA/YjS
 9WYuwcFgFbmliwbUb9O69aW7uTcSNKtCtGu3a6wojIURJlQtUQ3RYeJG3UDKJtp79ROUPPyK0c
 gK+6g6NfkjlQKHcSkEGcVhNfc/jaUHe7Nc3yOMMrp0NorZSRmY3F5HyahqWK4i6LWowuEKyfGN
 sPU=
WDCIronportException: Internal
Received: from cne130336.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.81])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Nov 2020 21:56:52 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/2] intc/ibex_plic: Fix some typos in the comments
Date: Fri, 13 Nov 2020 21:45:08 -0800
Message-Id: <20201114054509.180352-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114054509.180352-1-alistair.francis@wdc.com>
References: <20201114054509.180352-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=58086a3e2=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 00:56:52
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 22d2fb0d7af5ca316c67ac909926368d1bcb7cf5.1605136387.git.alistair.francis@wdc.com
---
 hw/intc/ibex_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index 235e6b88ff..db9e0aa25f 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -45,7 +45,7 @@ static void ibex_plic_irqs_set_pending(IbexPlicState *s, int irq, bool level)
 
     if (s->claimed[pending_num] & 1 << (irq % 32)) {
         /*
-         * The interrupt has been claimed, but not compelted.
+         * The interrupt has been claimed, but not completed.
          * The pending bit can't be set.
          */
         return;
@@ -133,7 +133,7 @@ static uint64_t ibex_plic_read(void *opaque, hwaddr addr,
         int pending_num = s->claim / 32;
         s->pending[pending_num] &= ~(1 << (s->claim % 32));
 
-        /* Set the interrupt as claimed, but not compelted */
+        /* Set the interrupt as claimed, but not completed */
         s->claimed[pending_num] |= 1 << (s->claim % 32);
 
         /* Return the current claimed interrupt */
-- 
2.29.2


