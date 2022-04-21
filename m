Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3D5098EB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:20:58 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhR7Z-00060l-1k
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRx-0005Zb-F0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:57 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRv-0007yk-2A
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523074; x=1682059074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YWQm8OJGwY9DyLYO16rmNKLkbJlmv5Jq1hk2A+TppXg=;
 b=Kvd9JmsDdgj47s/uUc8MIGvddUgew16KLm0UnrandUitUO8Wd5RlxgxV
 XjlQzLhHLeVDSyxDgUDB2SWKCvp4MljLFbezuaRPevc2h2ulA0+1PvrL7
 LRQdZtEgDxBscYrSYdOLJ9dNmWRHI9Mnw/6ntVUDNpo4OxzghkAhAiN9a
 dURKdN6XNnGoF5hygJR86TyJqy1ztkZFrF1IMMwjVFp1l1y3h7THdYgQx
 fBxuQ+eSjYBys4HxTurLhJIpoplyJ+vGM64A9GXDwqPNQEt+p9iCiAMCA
 qc9jOXou7gp3KAorYXH+ZXwCkHAVKbgARRXJJhmusLxTC7mUjwY6Yy5iO A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639996"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:39 +0800
IronPort-SDR: CTuYuSa0/3iO17CroMjhRgknGQNf5jNB0NgiwYKTd+VXlyjhIY3Mnrc5hHzFYbJfOh/9gv402K
 rPMwn7cdp8xs87ODCiOoNYdLFXfJsGDIM1QVsaj/opMGBTK+ayItsvApVf+YjrbfoyX4eHkyPO
 eFJYHgECqcGrQnzcDkwHfZ7t9hCFKoGm3o2MuGEsvRNR2PSDPHqX3jpQ37cBfTcBYWZ4BLnbar
 z6OUlDHWi4Pf80BZnnejGiuzwhB4XORZXDaVKm/Gl7oqY+mKe7yx8zKXNHpUnI4hQE8uYzEju/
 JsigAWLfjEQcH491KxBTQpuR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:41 -0700
IronPort-SDR: bxeNAOGKqPY19fWEBsCuuIVm4MAgfGNqRue+ksDBrhR7e4i45ktwiRvr9TYD8fqlNOETfJyQ0U
 89gobvfjtX3gMnwwVrhwF5tieRmgvC9IkMULFX/IEOtgP8fTOR10yzv8NvXcd+peImcrWjYkEE
 XpqmReuvCIH9V/7sWKtJE+UvUfZclfsZJ0crJmE7OcLPZdJQFJJ5wSXlWTtV10CR859yK1XSUO
 j9Y4fTC+ZjT1pIP//ZMlsQ5oxkpvLmXmJp3uYxZk/ilIOelrzhoYDpnri7hVQSAMJdiMTQVhgJ
 Wy4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSX30bRzz1Rwrw
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523058; x=1653115059; bh=YWQm8OJGwY9DyLYO16
 rmNKLkbJlmv5Jq1hk2A+TppXg=; b=VA4h/Y1PlMly8bIDXZxIERKppLN6DTMr+s
 W0NteRJuk9meTKZvsQexxnjCVOBGQf6q6C8XZjZoZuC/AUSK4bmp8PTInG2Pxhy3
 F5+Eutr/m1CJHktYQ8dci493x0rI0NRgMMhhnaB0AL0Uahw7EgAp1ZZs4EzKOvdt
 OlHf/YwG43hWEItwzjORdgz5+xOU3cp0fdV9YTVDQ85asVmz1pGUCtq1q1b7WVX9
 jAuOxOH/82rcsxv9YajA0zAP+sMpBlXYRIYKdBsghJsYy/SqXdrkWw2RbBFR3Srb
 fCGj6V76A7nILRK3RRdh41mZEY6Gshax1TGvlvU2PUR9qBDb9uNA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LmKVzNjwPfRj for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:38 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSX061yCz1Rvlx;
 Wed, 20 Apr 2022 23:37:36 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/31] target/riscv: Use cpu_loop_exit_restore directly from
 mmu faults
Date: Thu, 21 Apr 2022 16:36:16 +1000
Message-Id: <20220421063630.1033608-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

The riscv_raise_exception function stores its argument into
exception_index and then exits to the main loop.  When we
have already set exception_index, we can just exit directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220401125948.79292-2-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1c60fb2e80..126251d5da 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1150,7 +1150,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, =
hwaddr physaddr,
     env->badaddr =3D addr;
     env->two_stage_lookup =3D riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
-    riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
+    cpu_loop_exit_restore(cs, retaddr);
 }
=20
 void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
@@ -1175,7 +1175,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, va=
ddr addr,
     env->badaddr =3D addr;
     env->two_stage_lookup =3D riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
-    riscv_raise_exception(env, cs->exception_index, retaddr);
+    cpu_loop_exit_restore(cs, retaddr);
 }
=20
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
@@ -1311,7 +1311,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
                             first_stage_error,
                             riscv_cpu_virt_enabled(env) ||
                                 riscv_cpu_two_stage_lookup(mmu_idx));
-        riscv_raise_exception(env, cs->exception_index, retaddr);
+        cpu_loop_exit_restore(cs, retaddr);
     }
=20
     return true;
--=20
2.35.1


