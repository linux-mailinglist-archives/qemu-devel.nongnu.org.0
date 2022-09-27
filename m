Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C475EBB0D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:01:54 +0200 (CEST)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4bJ-0003dA-0u
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47n-00052V-2P
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:23 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47j-0001Ek-Lj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260279; x=1695796279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+KWxvID8/ZnnAhqL8VNp6KtA1Zxp1j2XC5T17FxQj4c=;
 b=E8jpo+kxFGsKTAFOsB6I1ePrXhRQ8uvR2lerxNeif2PCNKIJbO32ts6a
 jGmfJIEvluEvVDcLATV/frf/6E3t1ivD6dtu+Z0cjKglaP+lPklqoDtRS
 cuRDnNAQXp1yCtoVmfBBRw7Ke65sFnDbAodJZtQvNCvqpDAJtF350t9yR
 NOIZLWQVTPE4jZcrzNscSA9ISIuccL+0NJgsuKgIKXTNc1L3qQK5F7oec
 VTHEpdZwNVHb5fEXcDtd3HBuFtXIZzepx6TS/UigSYaRdSkmrSgUQeyEP
 mIg0yYpjxfFa4wyOcRzLI4tEwEEFci6zPU3EXyLl5u+HFchgrIGSnEGDL A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530814"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:16 +0800
IronPort-SDR: F6edjd++eBluELswIE/vxlrxjcrUxGyP5JI3AY08/8hvSIgzWcYad+AYp52J/utOhOPFq+ORdR
 PS+TTFN2lTi3RohLnu9jgxNxXPaFGpWeSCbcopCFPkk3yaEetQGLgGVMZtMEPnq0/Ny3p5hRFW
 YtuXAT88nxlZ8LqsgOXJdDrCSWSl39pb7L66amQNA5N7B/NDT1ftNQZuEX77zYogARwz3nZWEG
 Vv2nvVa6WcIquPJSHRGxcKgOyprIJnVb1TyerQr4BjRTdTFCc2zrAFTpZywAr6DhzfebFb3gbG
 pLXqbLjR2TgeIwIZi9CXuJRS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:13 -0700
IronPort-SDR: IH3LmMMIZBjOIgILSlMnOg1j1tVakV+uo5MDn4hv0HIbtXAkx4QZgKbUiHT1pZYG+Mr+Siam3N
 0Jq1W1M7QGw7RaHj87U+I6ecjgG0qjurrWhWgm2UsF3JZFqSsbwBZOjz9Q4MwRH81ci/rpVBBL
 4M6f045NC5mpdNwqr3f4adPGncUEvy5R96aQMK3A3thTbbQ0Jh0XhXHwjeecxzinjpa6p0iGCH
 Hbor1LAHbia6I/FhvZH32n/9zsTXGQd4xV71fyJrUszJQlU4tUhJXdoMIHZPzoOyDOgtqnOnz1
 07M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sJ1B3jz1RwqL
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260275; x=1666852276; bh=+KWxvID8/ZnnAhqL8V
 Np6KtA1Zxp1j2XC5T17FxQj4c=; b=Vxrt7uBZJl4VlhzleO2HYtEt6kHDxPGjLe
 IOD81G+w19aOUWtJUQIdfeD4GsskFPwTB5X5yzOLfwvCVTAavtYbMZL5S1iv0LfI
 oPS75iHSkBUnfobwA4mCxBo7SSfXnjzSMOc9o0TS1ETCFD1cxkpRZCCvboOtYExT
 RwXWZE+n9YOvQzEcI6Oc/09jmwr1lLVO2jYPjMZZ1xBU02ow5EWggPXmYGdxjw4N
 4CTE4eRd6wRcIrEYBs5+eStSdSXljnz02jsDrl4cuRkeWR7m6OCn9J/BG0tlZrxh
 mGuHR3B96EKRjJJKf4pPGIMVahmOh2Vvfg0J7UJnJbLo9z4cy0pA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fZwtog9HuYU4 for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:15 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sG0st0z1RvTp;
 Mon, 26 Sep 2022 23:31:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Rahul Pathak <rpathak@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 04/22] target/riscv: Remove sideleg and sedeleg
Date: Tue, 27 Sep 2022 16:30:46 +1000
Message-Id: <20220927063104.2846825-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rahul Pathak <rpathak@ventanamicro.com>

sideleg and sedeleg csrs are not part of riscv isa spec
anymore, these csrs were part of N extension which
is removed from the riscv isa specification.

These commits removed all traces of these csrs from
riscv spec (https://github.com/riscv/riscv-isa-manual) -

commit f8d27f805b65 ("Remove or downgrade more references to N extension =
(#674)")
commit b6cade07034d ("Remove N extension chapter for now")

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220824145255.400040-1-rpathak@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 2 --
 disas/riscv.c           | 2 --
 2 files changed, 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7be12cac2e..b762807e4e 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -190,8 +190,6 @@
=20
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
-#define CSR_SEDELEG         0x102
-#define CSR_SIDELEG         0x103
 #define CSR_SIE             0x104
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
diff --git a/disas/riscv.c b/disas/riscv.c
index 489c2ae5e8..f107d94c4c 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1304,8 +1304,6 @@ static const char *csr_name(int csrno)
     case 0x0043: return "utval";
     case 0x0044: return "uip";
     case 0x0100: return "sstatus";
-    case 0x0102: return "sedeleg";
-    case 0x0103: return "sideleg";
     case 0x0104: return "sie";
     case 0x0105: return "stvec";
     case 0x0106: return "scounteren";
--=20
2.37.3


