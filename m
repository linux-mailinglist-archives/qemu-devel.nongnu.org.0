Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC03722E8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:17:42 +0200 (CEST)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgsn-0006Wc-3A
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpI-0004XF-Ss
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgp9-00006X-GR
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080035; x=1651616035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uxQXJBGZObVTrLTr50Z1TExpqNoN8OBXuU5KlnJOMXE=;
 b=nmjqpaTKkby3+9MnXlk9QBOO0pYHiTLHSg8ybPFTckkKMtEcwF+Gj79i
 gk4Fk5zVgxFivt4wmT2XfAbt0d8T/i7WuKvTg/H1GGKPY6FZtEVlHdS2E
 iOEtntQgKRb6hJTpSK+x+JoRAO9vIkWcnlbUL5nLDeJ1C0AU2RcP5pTuT
 XFA066A6AVTlUIQhtQE75HoQPgWlAyREn5LXLsfx/Ri0eRAUIPVCOKz0i
 siIPrEE1WUGNzOVnN1iMmAdxFC9+uo8J/k1PheNQnB6Vov9LhkqQ4c1UJ
 MESBfByBqxTqW+1pRqQ5/VzJoiOGF2dH7yQ4hBYEcweR/sF80Ao2i/R9D w==;
IronPort-SDR: HbA8mmdK4T2eIZ2fqzQpSlGy0aV5cgviXWbERYRn9UKfkGTfEjxHK96cesY3ISgMknKe88Hx/C
 evhz0ODLQFebmr0B9IcXDaiW7iwynKPoORWIocz3irI9boDoGsdvHhILHe9m+51P65BUIUswaI
 vgjLfZ2nRjZbE0RyPbmPpeubll8LeKvul0N6re80QPjU2WJt8v7VOyuzGe2/OxNgTjVp4C1U+x
 PdfvVoMDK/s+rqZBV8iMR0dapVq4kQWPnkJQJNwcbrHrTzHCbxxqEK7574/YEhYWNFAdi1UQhu
 ZaQ=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114596"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:13:53 +0800
IronPort-SDR: T8MAxAYR9dPoUakJm18Mk7NUngjoKwfHyj1vVmBmRkRPiB/8inDhbTz6d4FVc7YD00SkOauCcr
 j6g5d0epw6zg9RVM/QjD44sHhu1NJhx0E3PSsrOEqU+ad8JN9PMI1J12OAVLcKK/5Zeelmil7g
 GHY/22rqVe0JnB/5yEyzNMHfHxkAa2crWrVFVG8tfvjhUTOfqxOT+aXlA7nfiB5/2/loXlxPzJ
 BJdv9Pa+e3lwD8n5+x/+Z/9Y+UjXfAONQ4Wxf0MEV64tRTBAj082I9SshL7burKbDzpQN4kY0y
 F7p1ABO1PlpM27e+xtxTQPGA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:04 -0700
IronPort-SDR: gZvgxr+JUTOTcg1GBo2fcfH3ORshKDVNeRPwUBXk1c8IieMMM7tqDDdYRVr7enTIrxkQIj5Zud
 z4JkV10PNeCz4tpfMUtRjTqXeROi1GQK+VqALk6qOYIcyN6hQoQO8IEGlfvdwQ+kG9VUMvjoKC
 rqyh366nvMtDSXSyUhip0lVicFbA3iO1Au6dqlVuj5zAIz29AFzh80TbaInj6RY6QamuTQxtAM
 3BzRtGW1zk90akTai6SEcH2lssR1W2g/wU4RJ5Biml5TXWSKN47GQ9s3H7UJIC5SjqrzQWrqS3
 VuQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:13:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 04/42] hw/riscv: sifive_e: Add 'const' to sifive_e_memmap[]
Date: Tue,  4 May 2021 08:12:49 +1000
Message-Id: <20210503221327.3068768-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Emmanuel Blot <eblot.ml@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

This was accidentally dropped before. Add it back.

Fixes: 732612856a8 ("hw/riscv: Drop 'struct MemmapEntry'")
Reported-by: Emmanuel Blot <eblot.ml@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210331103612.654261-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index f939bcf9ea..82096b3e5a 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -50,7 +50,7 @@
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 
-static MemMapEntry sifive_e_memmap[] = {
+static const MemMapEntry sifive_e_memmap[] = {
     [SIFIVE_E_DEV_DEBUG] =    {        0x0,     0x1000 },
     [SIFIVE_E_DEV_MROM] =     {     0x1000,     0x2000 },
     [SIFIVE_E_DEV_OTP] =      {    0x20000,     0x2000 },
-- 
2.31.1


