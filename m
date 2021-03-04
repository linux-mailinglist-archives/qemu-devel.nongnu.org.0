Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92D832D5FA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:07:37 +0100 (CET)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpZg-00038G-PI
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHg-0002Sy-98
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:49:00 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHe-0007up-Ht
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869338; x=1646405338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IP2HN1eQBL39bp3vkwJRHZffXjaUEFOkfWY03vX1wLE=;
 b=gGKfrbSTljaH3lzulgsp+pZSshKw+DDCfm4GkuODDJlOXX9/RRsSucvi
 rbwpa80hqshuP/rMyt4sHnOh0AKOO4JRv1SD8CLxU7z+ey/qLvmphIiti
 OBjfiAWINouHPlU1pkSEKnxYk8j2rJaNrPQ42dbSJR0IpoY6ITg0IVI3E
 XugOT0PngngJhQxkVU890gNp8Be0B6DlbgQcuZsNnpNOSsELtETMKHi0o
 vVfvnM7Pmp0mRFD27pCrST6hOYaZ+xdhNuqaHqLz/nMOngwXGqOW0DqwS
 YDEqaozFwWuEwOZ3RUvaoSTyz+GSWa+0FTZdXiZRanEHBX1Nbvi5dOVgM w==;
IronPort-SDR: xNrB2GaY9TshXkWbC/uwKtPc0XqJlb1QjYg8S1dJT8XQ7thaXqhYfKce3OiD2dwGN+hyhALbZg
 02vMUmZfjP790S9OdaJqbauFWf2msSW2J5Fythb/rgYJC1bAq8qaYNbH3SRibtZUFVrHU3rvCm
 25hDBcDJasg56d73NlnJlonjPgXhqo+DumuEwJftRl7AcXufLZC2U60mXvjw8r1g8xj1ibjDLp
 qfN7I5+gGBiJDu7kxHix3qD2liv0E9c/fFOZTDAIqga4yLMYJwxAV/YiAWWuG+XggJrZN/Edm8
 TQE=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984434"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:27 +0800
IronPort-SDR: jTRuk3WEc935SAYBIHabaFYcQSbEHP2DDlrBPfNcexylOTmlnPfaZjrgjIwMvhRIwtBnQPDhV1
 0r/rUXOYPd6+ZYxpvQNbdkdEG6Zk5KrY4qA5fsvtfVGAGz0PIZCYfa9seHd6zAL8Pd3QRILuj6
 kESgVGxxmDo0PcZV/g9KHbhjjFilymJrri8roTdT5Kxv9YcQJcH7O2y5dz+6qNg/9U3FGdbfHU
 22NsNORI7WVA18AG5/y4X+TUXEeaeqVfTDSCWhLr2sFWvW87SWmuuZmjsWUNhhwZE+SS+XX/ra
 yqZqiR1eqbAZfYG/OWpedUeW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:41 -0800
IronPort-SDR: 71LL6ckqlHL5EpqfUTzEj/Akua2z/Baj4MKkvlMePbJhjoDd7FN93/G4j/O6VAAHRgoda0/sy7
 OiX6Sfo+o3489vkSc+vTAYRrBqqiRCU/bx4jHKw5WO8yDQEe8LlvqIVbAX5KG0ndQAJvRjFo+U
 jDDgvZE26V2Y5+SIIKlBvTXrKQADP6eNh3Uyk+yIkxto5AxUYP5YcMwuFfzgQ55tIcJYAzsdw8
 PmM4iOxjHk886gn83ssAvglifUnSwvU/dkGHkESx+Kl5Cw7wTLtMGynLu/PgagG7KR74gWXxcT
 6LQ=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:27 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 18/19] hw/riscv: virt: Limit RAM size in a 32-bit system
Date: Thu,  4 Mar 2021 09:46:50 -0500
Message-Id: <20210304144651.310037-19-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

RV32 supports 34-bit physical address hence the maximum RAM size
should be limited. Limit the RAM size to 10 GiB, which leaves
some room for PCIe high mmio space.

For 32-bit host, this is not needed as machine->ram_size cannot
represent a RAM size that big. Use a #if size test to only do
the size limitation for the 64-bit host.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210220144807.819-4-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1d05bb3ef9..c4b8f455f8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -590,6 +590,16 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    if (riscv_is_32bit(&s->soc[0])) {
+#if HOST_LONG_BITS == 64
+        /* limit RAM size in a 32-bit system */
+        if (machine->ram_size > 10 * GiB) {
+            machine->ram_size = 10 * GiB;
+            error_report("Limiting RAM size to 10 GiB");
+        }
+#endif
+    }
+
     /* register system main memory (actual RAM) */
     memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
                            machine->ram_size, &error_fatal);
-- 
2.30.1


