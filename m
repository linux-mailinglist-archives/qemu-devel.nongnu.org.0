Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A18374BE4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:28:27 +0200 (CEST)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQwM-0006dt-Az
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsB-0007d0-Py
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:07 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQs9-0000Xa-MG
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257045; x=1651793045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WcLRZejkj3O7sPHwpm1SnnH9ePTMEq/b8rLcZ9KrMfA=;
 b=Iqyw+PwWv7RbqTBXwzG0WrXHuj1+pAu0nFqNMPgOxEJI1//CziyMsiS3
 FyxTGeUrNFL8YuLtbI1ISruRvYQ20hoNSJxmebjUQLc97s+XlZ0/M1RT9
 NL0HMjjucYn+vYwnWzgyNGgMZ5SST9Ii5hjr36Bl8/8BDdiUP2hgwLUxA
 vMfjCN+DVcGWJKOSdhjCdOLGi6epdJt9TMpxGg+YaeFhMx7AETT5zuFoA
 QtVcelp4AdMkLeDvh7d9xlkYjkXip214EnM7tENK+I51nI1e9Dr+fVClY
 1TeklzM1ia+BDof1olMgnC7guX+Ey/LbW3nLhmF3jFjf62BfvplYfI6A6 g==;
IronPort-SDR: ybzhm9KrsGQ4tAXKK5W05RoJqpQIPlPguCQ5tDqL+a04te+wHsNjnaqjFga5ymtBAgbhUhh9nK
 Q/kMJwLx2PoEgnYq+ZVmCeickySmVSgKLVSVDaSKJswye1dgw738w23oVZjEynazWpWJMIHNUD
 P0aJIHY0nvyh+SaMKG54SpkIXTUIxox9Tc/buu1BlhHo54ow2PPAhF66R+7R4kfY0TydPCqdGP
 +Lm8Fp6UeUrL4P1W8XbE1tOmltlzIHJvKnSgl+xm3F2WUoQbbGr5ZAqkunajWfU94m1Us/mq2p
 yeE=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585903"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:04 +0800
IronPort-SDR: TpgPn9pjqvcNLnntM6fQYFK7ZeMUSJl8rY8rwhWfQk6DRpeOXhNiyhdo1stNyg84SKr24hYPAC
 mkknkJ1OoqvhNWEHyvQhyW+SEK/Vozr46nl42K5FeD95Tkdir0tJAWpOZjFuUEixTD+SWv5HOX
 pSKhRM9PXyA2I3dFBplbRvn6jnfl4IzJnD9GB3nFm99Dswxd3BylzPAHIL2jryxbCL9Iq6+3Kg
 GGcLY+Z/Ex6Zq06ZEXpHfmmiwmXmntMv0/rfITEU1sIL2Xt6dIrOMJENeLZvehebjSgNpr0rxb
 E2Ff0Fj146NVyoHkVBtZwUS4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:44 -0700
IronPort-SDR: ewRemvij037nUXGJXG/vMAnQUQ8x4kDo2cav5S4dh9UPzllcetg9Vie3+h0lwp84cf1oarxYdU
 capNCNnKroNYXVt2K1gBcUlPap4Nxc30uudXEnsm/B55YBIezcOt/cgwvMumqbFn/zMxjGTalA
 LVDv7WTcpg24pZw3uGznyMCoxS2g6ie7le9kk5rQLQthEZZK619s3YnGVuYkaRKp6IA3TnRpL/
 ljDZcd1gAjsXy+BpiCFdEs23f0Di0iVYwXJllMoGykFFQHdyg43SAv5WBRErUnh6xe0SqoiVoI
 87o=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 14/42] MAINTAINERS: Update the RISC-V CPU Maintainers
Date: Thu,  6 May 2021 09:22:44 +1000
Message-Id: <20210505232312.4175486-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the RISC-V maintainers by removing Sagar and Bastian who haven't
been involved recently.

Also add Bin who has been helping with reviews.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 446c776a7f..0a2d89ccaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,9 +295,8 @@ F: tests/acceptance/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
-M: Alistair Francis <Alistair.Francis@wdc.com>
-M: Sagar Karandikar <sagark@eecs.berkeley.edu>
-M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
+M: Alistair Francis <alistair.francis@wdc.com>
+M: Bin Meng <bin.meng@windriver.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/
-- 
2.31.1


