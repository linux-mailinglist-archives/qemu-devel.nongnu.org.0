Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7A7C20B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 14:46:01 +0200 (CEST)
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsnzU-0003DN-KS
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 08:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hsnyf-0002eg-OB
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 08:45:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hsnye-0008Jr-TS
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 08:45:09 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37066)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hsnye-0008Jf-NZ; Wed, 31 Jul 2019 08:45:08 -0400
Received: by mail-pg1-x543.google.com with SMTP id i70so21209601pgd.4;
 Wed, 31 Jul 2019 05:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=HAeOaFFL9b+Ha+smaOrqj2eR+CVvy1nn1X53scmUeIo=;
 b=oFz76iEe3ycU62zpRoATFJZgQ6sTKU4nISDkz3NBQhMckLhbI6g0Tu23EXyV09c07a
 EuZ1/kEw9SoLFGkT8viamF7lJ2C7JK6b28dDISZDUQU0Qxed5NWXdwrbZOHqR1vEEQmW
 PeZ85JkeQDX8v1uvGbkZgPr2CRbq9XHyDC/lw/rQeDUoC6rLj2LtxRiHJxKPpB75MO+K
 gWqgz97gllcjz3UjJsLRu3EArbnVx0kjpR7ksQkZpnm2XVtw7JuiStXnCWO6YKIpFO0R
 aZQLIqNQMqMXogh4k4eLzv7YrFgZESnYCs+ZqwqplmbietkwoFLs8jfAOv2PK8VTBOf9
 1bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=HAeOaFFL9b+Ha+smaOrqj2eR+CVvy1nn1X53scmUeIo=;
 b=nYVlReyZZvUM8eG2cHgvQz1NnVr0dU7T8H/9kXLMiFJtlaAgfqz5bHbT+kaA8o/w27
 mXpPfkxinZnapKxjtrhhzO5XSUTmJNO1DhYlMAf7gwpeX8/Xcmhzy7HclWEzkL+CUN5Q
 RAbm+T4js0gtPTcqBPC21+11aox4eU4b2Z1yaEnZ0rW+2tTc8SaWLwQeC53j5WRJtw0M
 piIYgoF9h2FR5FwvjceClZjRyuA13q4t5g/ghi3gG3be1AmbK6uX90Usjf7ZfmmvxJ57
 qPiBvHJzh3Ztz8eCsMqwc/T2Q51sZWk6rXylooy9jhN4jeVsNs5ZwLDVT2qaVzPLZYnU
 jOrQ==
X-Gm-Message-State: APjAAAXcJCGzUs1ETDfSdzLCouIOQS62bIVojqZmSBB8nsxZM2iB8ygt
 gLDCsluPvOB3Rjz5TFy0nKI=
X-Google-Smtp-Source: APXvYqxxrknhMfq6PWbtCz5Amh5ezY0IbBRAAv0wvFIdd4Ol9WrnsFIvxSKAqWa0YwGQjT77X5SNPg==
X-Received: by 2002:aa7:8e18:: with SMTP id c24mr47516887pfr.24.1564577107829; 
 Wed, 31 Jul 2019 05:45:07 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id cx22sm1785544pjb.25.2019.07.31.05.45.06
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 31 Jul 2019 05:45:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU devel <qemu-devel@nongnu.org>, QEMU riscv <qemu-riscv@nongnu.org>
Date: Wed, 31 Jul 2019 05:45:01 -0700
Message-Id: <1564577101-29020-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH] riscv: rv32: Root page table address can be
 larger than 32-bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For RV32, the root page table's PPN has 22 bits hence its address
bits could be larger than the maximum bits that target_ulong is
able to represent. Use hwaddr instead.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 target/riscv/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e32b612..3150a6a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -176,7 +176,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     *prot = 0;
 
-    target_ulong base;
+    hwaddr base;
     int levels, ptidxbits, ptesize, vm, sum;
     int mxr = get_field(env->mstatus, MSTATUS_MXR);
 
@@ -239,7 +239,7 @@ restart:
                            ((1 << ptidxbits) - 1);
 
         /* check that physical address of PTE is legal */
-        target_ulong pte_addr = base + idx * ptesize;
+        hwaddr pte_addr = base + idx * ptesize;
 
         if (riscv_feature(env, RISCV_FEATURE_PMP) &&
             !pmp_hart_has_privs(env, pte_addr, sizeof(target_ulong),
-- 
2.7.4


