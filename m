Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23275884D9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 01:44:37 +0200 (CEST)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ1Yy-0008Vp-VQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 19:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O7-0003HN-50
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 19:33:23 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:43522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ1O4-0007mP-ES
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 19:33:22 -0400
Received: by mail-pl1-x631.google.com with SMTP id y15so14825465plp.10
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 16:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=UfCPXPhBUozzmtQLviZdZA/N/eO9+P3n0uby5aNgZ28=;
 b=J1nPN6mmJ+Ve13DOav4947y35BA5lPJQgBWoHdOuUAJHheqEgofiIZCRHeaMQNSMuZ
 IorKv7r/JL4hQMQ5+jOkBpsV3e6P/GIkgr3JjpQyfkU49Bj1AKMt0l86cZrEjbYgXAYT
 l8Uj9aS15LMzYML8nAGRk6yrTCigp0csKgpFsgJaBMA9cZG6dbvEfGF0zJe1olnA6FI4
 lwyOIALRDtFFIeHBloVZLVcsfROQhon1B2hgr9yA3/apm+uiS/ePTn3hTAnIdwCjrYYV
 KzQmClWnGz+Y4CRTC5r2bzEE0W0oLU6oi8lCsTazDr5pKULwEmYOMZEgbg0zrdwWwyPL
 6HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=UfCPXPhBUozzmtQLviZdZA/N/eO9+P3n0uby5aNgZ28=;
 b=fy4lm1dv0ycl136zWwlh6hQB0EVAkGHcZNTx2yK8z70YLilvB2JbqdQ52vkbopm1ca
 4EVzBmf9IEFc8RgF75VoBC75bNDJlFGE/MJAkS6eQ9pBt5o6HbCisRx/NH/iz/z4PjYx
 glyHsI9akQs7U4iXWclShG2wNB0VRAzrQszXL0IuDPnmr5oR7YXl/pZJHsS9JFc14z3p
 VYv+PF5j4Q4c8E65Qf6AAhHG02fV4eVM0NMcQ71kH1/2P+XaKhUNGy/sLwf4Gcj6TTco
 1P11/gya8IG4PNPl8HAEuzY8W7Y6/d+jLedtDFBTl8iDnmCAMGZjxNbMWdSUNdNPCACs
 O59Q==
X-Gm-Message-State: ACgBeo0Yepg0Qx1MIvONGaRFaY7BO9mnPK3oQWETfg9vhuc3abpnGWFs
 Xo2rT5NF8LNsOD+O+Cvukqcy4YdhkGtZdA==
X-Google-Smtp-Source: AA6agR60RhdtlDcZiKd2tf02T0DUtujBNeUPHraxNeUJbQcfrLmwzWMuJV8l1T/SHRV60Fks3rewsw==
X-Received: by 2002:a17:902:ecc1:b0:16d:d1c9:9162 with SMTP id
 a1-20020a170902ecc100b0016dd1c99162mr23449729plh.122.1659483198998; 
 Tue, 02 Aug 2022 16:33:18 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170902a50a00b001636d95fe59sm250543plq.172.2022.08.02.16.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 16:33:18 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v12 5/6] target/riscv: Update the privilege field for sscofpmf
 CSRs
Date: Tue,  2 Aug 2022 16:33:06 -0700
Message-Id: <20220802233307.2106839-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802233307.2106839-1-atishp@rivosinc.com>
References: <20220802233307.2106839-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The sscofpmf extension was ratified as a part of priv spec v1.12.
Mark the csr_ops accordingly.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6690b72ea0e7..8753280e95b2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3889,63 +3889,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -4035,7 +4064,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mhpmcounterh                         },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                              write_mhpmcounterh                         },
-    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
+                             .min_priv_ver = PRIV_VERSION_1_12_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


