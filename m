Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD524372307
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:34:38 +0200 (CEST)
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh9B-0007UD-UO
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqZ-0005sT-7k
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:23 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqQ-0000Fd-N9
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080114; x=1651616114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NHvDFXBaWN2j3izad2FF3XGWNvtRcgbhcimmn8MDmLE=;
 b=g12gp04SMmTI4uUgCFqAL1v/apKhBpuLw1WuaZvmfZ7qBnQZ7I/SXdF8
 Bxi9GYziJidfhoP66J4VaBVixYKw6WsCpw/ShmvhsFOGE+m5MSM8kp3nM
 szB00iB081n/bpVC2FNPve/dQ15o9gXjcWMeYeYGXVPviZNzZY6/efYG3
 226+4kmgkJfLeuiFYITR3GfWlGei2pov97SvAnxnoXbKg8FXafQymuwOw
 GFz+b3cNQopQtoOS9pVItQIo6/CbrKRfpGEg93vEm9vYnyJy4khCT5Hh3
 viseOtA54JIdLLu22aoW04GxxspnlJ+N0UxA+PNi8siSU34zPQV2+XVMk Q==;
IronPort-SDR: z1vI5YoxzAzA+1xNXbV5otXgiiPhRuV9HZ/5v3DhPiZcma+EYz/ZW47/OQsT+eht+AShhnNu+Z
 770ODfk92WZzM39/1bga43CC25tBJ1B1wolqghN5Bx4bm+sjfkfGpREuOcdkZMlE8WSwu0W/LE
 5xF9hOTOLDFJoXeCOdwvgm/4mza5fFTBMnxrzgrglITzf1um+pPzdxo36bbk9KjxFIcZk/IU5Z
 y8kFN4d9wgvBcUNpfOdKeEcWLpfNVgiyIe5TZGlWhWPhKa3T3H+Mjy5b3OYN32U9ghxjLOJnFQ
 uZ8=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114673"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:52 +0800
IronPort-SDR: gpMQS/MWIvnEqyd/Zqb8A7n/Fd8Nu0qf9cpcHsZxTCbHAWYYNAYv975GUC6Fm7WNNg/mcEZqNt
 usUjvUhlWp3PdrbSgLusn/UyZLHstgvT68u+YRKp+xJ0cqzRHZ/IAvRlySqpYi7hGUkwaiK0pD
 lBCtmtI3w1AFWDG8KxTcReVrGcG/3iUmVGuuy3fDfbmXWy3xzKeTrLxAOxXV2IZ614OQj22qxX
 inM4dfh3cjoYjo027AsLJZ68o2jGh34oEDk5bqnMFIHhDnq+2aGRNTLqA93nlGoyPzmW0LJjIQ
 7EwHPf+tNqkrB9QXqWplf2bX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:03 -0700
IronPort-SDR: uiSX9FoXaAol1gkf9R71Y+UJ+R064FWNZczHr2tn8qcOOfC+lYbmyuuU7YeQTBEV0t5UIyMJ/b
 h6N7HAQ99asYNaDN+UFNL4BkXYHxAsZoGCagsAIeUZxo8nwBHO9gACbs7MbLohX/Lua8dc0LjS
 ePtkCbMpkww/oRNG0lofchl7PeNJP5qfy+mUawXUkw4ix2BYVF4kG0Dp+kZv/OXgkEaURnpAOu
 VEuiwv5SbuasMnvjhcOmCing3zwonYuSb9ZyF6HcENIv6txfw7o0hX4JhNq9GWUp2HowMyxWBI
 GIw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:50 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 22/42] target/riscv: Add the ePMP feature
Date: Tue,  4 May 2021 08:13:07 +1000
Message-Id: <20210503221327.3068768-23-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spec is avaliable at:
https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 28c8855c80b0388a08c3ae009f5467e2b3960ce0.1618812899.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 842d3ab810..13a08b86f6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
+    RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA
 };
 
-- 
2.31.1


