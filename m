Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8329D4ED0EF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:34:56 +0200 (CEST)
Received: from localhost ([::1]:56986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZim7-0002UX-8e
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:34:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiGB-0005Vz-Re
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:57 -0400
Received: from [2607:f8b0:4864:20::436] (port=46967
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiGA-0005YR-3Z
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:55 -0400
Received: by mail-pf1-x436.google.com with SMTP id s11so20317846pfu.13
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 17:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3RccSWzYe+oeJuHOhQL3vYAlw4d+bJOj3lWbD1P+1jU=;
 b=57Rmb2w890uXU0e1W0WSFGcMI1TQerZD1l6IGbufLVKPP9fZaRMrMIdbb7IGEx10Lh
 iKmtkRZGgJ3amYJNR0wtvw+zKVys2C2eQVn5/1Ls3A4tvDv2AkCKT/eodiI9jUKAY9E3
 xdCRlioOch8Em2RKBH2ka3NTcTd9bTYujok/2iKDkLHldE681deYu8SU4336fFjXWWbq
 T/Jcw2n3SIBMASQ++SdcvwFGLPbFkAQZvepYSrXppN/3mBXbf4PkDYf2YK0/WApBB1rH
 ypbvjJ5+FA7mpOtgFEEBG/sLPEzru10tLjMkBnetorM6kEbdIc/R0v9E2xE7EUdeahGV
 xW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3RccSWzYe+oeJuHOhQL3vYAlw4d+bJOj3lWbD1P+1jU=;
 b=rMSebQmChd34HDjnUr6czWJF3JUsdGpl4S07ptlvoUP0NWKj7SYkym83GXU89wmDoA
 8n4p4cikgv83UKs5RxJ23A1blM5pOjjxKWuxLULYuudN6n8MG/aEbWpw4KjSAmxmHKRA
 SqzdsIyet4jMkUb9G5IIEz3SIkTFJVIMWTGVG7O43VEHfeOtH/ya8Ot5nydQdOItmSA3
 kvZo32t7+0N2kGS1GdAtLIZRpQpv9lUL833NFL2H0ue6r/1K3t/gNQIvhU8pypXhqm11
 v94Yf76/DPcMuRDf2qsu+me6il0fAWoJwe4gYFvVJ96zFELwJtdWYeTOI+eNGjqyYMCg
 QPIg==
X-Gm-Message-State: AOAM5306f5+xITsJ6CCYZ5I6ruqMj9qtaTFDjGKb1ZO1AN3VM2R0K7xA
 iQbV8EfUIN+Kp+E39RBP/SweBu1auKdImg==
X-Google-Smtp-Source: ABdhPJymcWSdYnX+Si4qU0x1WCmq0uUcaFahWYIYDoKvnIDVwG07YmeamcBfEzv6xtr4zXx4CtIWew==
X-Received: by 2002:a63:e811:0:b0:380:f449:2c94 with SMTP id
 s17-20020a63e811000000b00380f4492c94mr8292258pgh.52.1648684912476; 
 Wed, 30 Mar 2022 17:01:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:52 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/12] target/riscv: Update the privilege field for
 sscofpmf CSRs
Date: Wed, 30 Mar 2022 17:01:26 -0700
Message-Id: <20220331000127.2107823-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sscofpmf extension was ratified as a part of priv spec v1.12.
Mark the csr_ops accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 90 ++++++++++++++++++++++++++++++----------------
 1 file changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 20bdae7fe354..b2221b6beeeb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3873,63 +3873,92 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmevent },
 
     [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                          write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
-                                                       write_mhpmeventh},
+                                                           write_mhpmeventh,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
@@ -4019,7 +4048,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmcounterh },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                                                        write_mhpmcounterh },
-    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.25.1


