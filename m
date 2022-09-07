Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EAD5B00CB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:44:30 +0200 (CEST)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrbh-0007RI-HO
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq5Y-0004zL-7M
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:07:15 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq5U-0004Ol-RP
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662538027; x=1694074027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPFRw6A/EleGzXgaO/+fOoLtnz9lD+T/Mmyz1InOcLY=;
 b=kwP9FM4DjfQn7zMX1c7LZ4CD6KSF5E2FHCjNqXr8lmLLYauL0epIZAvg
 C0twrjC0OHuQ0PrSsPy9WA5OolHtbjXoI3n0C/PyBkoHSg+2TrV6YxbUR
 YbAWGD2DuH1Q8AFPH2s1WQ7VZlL3hj+xuB8fIvhCfQZFri8CM6wcJZPw6
 EZT8TX5aCPCMHHLG6OU3+C25Peoq3uIDD6yb/YhbldhejMT/l8Qz+CBwn
 UDyM96AdvobtTmw1kzwSCOf8GyZiYFtgyYDI979WvH1PeH17aeapLZn9o
 8fsM3b+jy21+x4hipZns7DVdfAgKzLvUcMGvChPFDrHMOxtbepaYRDtVo Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715155"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:37 +0800
IronPort-SDR: pwlF14hjK5cIat958wj7B/pDuGX8K5BkCGRsYfimaB8Qi+mkQeL32pZVMBpvRlcH3w+Eh5z0ET
 vANxQXOcyNCoDRhMamgf1p2vKtkaHkDZatDUW+gjuzn3RxsyZQoOz7Qopijtedho5Gw+leOPNT
 UJGBNFMnvHdlJ5rTEA0had3EFvJ6HosWRCB00cCbw8emqX3EL4ndKANJWjpY3ppW0gy22CV6HC
 AeNkkmvqCa+oMXbbLJsuHGjTJpXBm6LXX9FYfi1CnA4N9aqRkeqUusklUlZwKnJqw0BB66fukT
 WEiaPmHXSyDUkJvmAuMLX0nu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:35 -0700
IronPort-SDR: Y0CgPmFu+NybHgbqPZdHWPkqEIa4bHXfbiJ8B/YJrFbHnTUD1Yhdce/y2p8lc26elzGWaLZbNc
 UaT6n+yunooUen9efj7ptASDhOVz3lxCoOUPI5o5Qi2NlB6q5Ds7tL8TdRyGb0ZDtU0hvfxPs7
 V+DuN10qmON6E7CHTneREJvAzOjeri/E4aLoOg5HlGQNSIXX0PVILtPfGPj1Mq1u+ltkxy+KSu
 02RypVka+JecEpZQhzrID//k8KZzqHGjOQZaf0R+qqMLEFKtJzQw/WkOk0YjWGESW55pwoNjY/
 c9E=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:37 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 44/44] target/riscv: Update the privilege field for sscofpmf
 CSRs
Date: Wed,  7 Sep 2022 10:03:53 +0200
Message-Id: <20220907080353.111926-45-alistair.francis@wdc.com>
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

From: Atish Patra <atishp@rivosinc.com>

The sscofpmf extension was ratified as a part of priv spec v1.12.
Mark the csr_ops accordingly.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220824221701.41932-6-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2151e280a8..b96db1b62b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -4067,63 +4067,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mhpmevent                           },
 
     [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
-                              write_mhpmeventh                          },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
     [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
-                             write_mhpmeventh                           },
+                             write_mhpmeventh,
+                             .min_priv_ver = PRIV_VERSION_1_12_0        },
 
     [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
@@ -4213,7 +4242,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mhpmcounterh                         },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                              write_mhpmcounterh                         },
-    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
+                             .min_priv_ver = PRIV_VERSION_1_12_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.37.2


