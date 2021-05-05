Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2B374C06
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:38:45 +0200 (CEST)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR6K-0003Zw-6N
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsb-00006T-Tj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:33 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsZ-0000cg-V5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257071; x=1651793071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NHvDFXBaWN2j3izad2FF3XGWNvtRcgbhcimmn8MDmLE=;
 b=q7V7ef7TSnRR560ArHKeyfkeBnIHlBc7heWX5de46A2L8CdTveYi5VWQ
 CjKXUObi4u7Eq/cuYfW+GsBHm8bSZSPk7BPCWsagvNL2Vh4a9WW29lFDJ
 o27hPWsL48JdN2QoQLCIXDP/n5iwD74u484t5YC3oFGdKrcRdL+j83Nyk
 PNmgvBudifAPIPhLl6B4qK5RlmEcDP7U0W/3/GzhPKkRDmjm91V38NYZw
 e5TCZAdBhcuodpn30ZEJ3Hvuwree74kG4hAHLpvbMYlFJl25VK+h7rSaV
 85j5GCQOXlyeH1EyqLny1xEjXkqvUMSxZLS3nx/Zhp/O8YCBt5EShtO0l A==;
IronPort-SDR: 0342+Ql0viGBf1Vmyxs8KifivaEbdZ9p6+X352G3FVL9ue94iycyUm1ApTpcs+BCbq1VjyvZ0s
 yrGZPaYCQwWd5HKO0/YWwy1nwjVCf7rN7GD3hjQxQkwXJWIHPxF3iGDYQOUFMtCG5PC51vqmRc
 FtL0yJq5xL3VKzCpEStwZaLkZGRHp53jZjCqucAuGipmkOfD3OAFcU/B+5rbW5IRaNyRpQKIuf
 xdHG4+jW3MgT5PMlh7B1ipY0n37RXRZuG9iW+wbMMyKUprw0urrvULk+ILgdo7vC+cxy2Is3LS
 fJI=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585947"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:31 +0800
IronPort-SDR: m1HH+fbSyxzgws8y5f3QZHJknAG71nvNsjVX6biw2eorJNE6/Ir31ezfceHTGoiZQ7AXVopT21
 Q99rowVAnbsihmPgbuosyFky+M0P0K6njwmyYQJlOoTxkmdH7WZQfGyUxiihgv5rRnPjZKO86W
 pTLwQubPEDUpWMW1c+yPlXH8150UT1uzt6ypR2xKxQVpLeMfN9eC3nX8NAUdaHxQYHLrVGPWyM
 m1XcbpTNl8jwApPj5672J7mM4Sr3mvGI2B1ggp32Lgs0t9L2vFASSViRn1pZNdTJwJLk1ahmyU
 3b54rqg/UhOKDTEDojhHLrZ7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:12 -0700
IronPort-SDR: YitEQNkWOTV7q0f+yo+F9wybsghWDIvjnrQ1To+MmvkeCET/lZ1gfBnoWPKWfPNJwo6S12l08z
 f2Cw8gKeQDKd1glRttMIUtE9jsVsuPH+0IHBhtvY8oX6mhqLzqzkHQFUZVW/47fSPsRp0ZJTf0
 pizrs92sCUBVoWl+wmJdlw/BeQ9pb6LvTw6FB+L4FPj1W03o3DkRTdZ6wQKjqJVcIFAlKWipMf
 QukTGRJh2rN8v0da8lFBxjCCczt3oz4MLhbc2z9VvUEjcTTwkTEBX5i/J6aK/QQ7r9YpTttsF/
 FZQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:29 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 22/42] target/riscv: Add the ePMP feature
Date: Thu,  6 May 2021 09:22:52 +1000
Message-Id: <20210505232312.4175486-23-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
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


