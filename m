Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77AD50ACFE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:57:27 +0200 (CEST)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhby-0004ZM-Ok
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJK-0007R1-Gi
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:10 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJI-0005V8-S2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587888; x=1682123888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YWQm8OJGwY9DyLYO16rmNKLkbJlmv5Jq1hk2A+TppXg=;
 b=S++zSWq90lAqY6cz1nMS1ls0KjsPq4Sud0aKekqC+Kkrar3h3LtzQT+b
 jee19GKk7V7+qu5rlnjH1wSp9rEmG7g9a58fEaEpq6kLVvSp7G5MKP7RS
 ytD89NLyYo6rNqDypPJM7qn+1h9UW9pBv+e0iSRNM2vJOUUIEdyFryDKW
 I1EkhJ4CFERyTSpl7U1qpdAYLRy6UXXOz1dd3qIfmHXMM75P9nU+JWcE0
 3zE28DS+vn0KetxFC+ie2w65ZbLmjGLuK5XQOtYbPDxkjyfGde1AS1TV3
 RLg9SqP+3w3DhaPUvq3EEhA8BOU2mz/Z1PRo72SZJZxMKSEsY8ZcQ9u/9 w==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483402"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:07 +0800
IronPort-SDR: RxKCMm1UwMutYN4kGHHD2peNrCueiUoeEVTq6qXYea7cp4Vs+ucbH0MsM4l06CdD7c1tighuOL
 Y7+Z1d85YTyxgWofWCodG+ErFvcFkhwnuP0ofO5JKhjnOz1IBQgtAQEm5QgMhYU63qQUyn2/8O
 +lC+1N5CT2LVLX9iOLEpEx9hubWkJs6uuRweTyIVD8s8IH5PM8zBO0tDrokVO5B41woaZfj4Q7
 XRYm/dczrXkedckxH3s/n6vEKBsWQ+XMPITQ4xcX6ZaDVf20aoTy3iwRSDs1SHMHT+O1Ye7YhE
 6qPSdXPyGThbkHmV22dANYqh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:24 -0700
IronPort-SDR: +BTY4un2DNylliEZ6INeicMP2fSzDMzgjUCaaCEbieVskJlyY0WAq5bNvZsk3p0A1DRtRe2+zk
 1rkHtISxzsi6ygUrQFU0u/I0VMEQXPkLfsqc5R/2u0tegycukpJI1xyc1U2jYj3TL544ahS3zn
 3D5YijkxFx0E552/IekXHxaDFF0z5e+X4xMzs1b6UZHzrr4D07DYvBYzIDmquuOGFqRlE4mZb5
 Wxa+dAMxtUof8K3dJPfc0rPBJ+Jnq+06jnHEURo9xhbpJfrMbWdy5kvAITIvJMPgIK26zmGizB
 t4o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVl16Fxz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587886; x=1653179887; bh=YWQm8OJGwY9DyLYO16
 rmNKLkbJlmv5Jq1hk2A+TppXg=; b=WSvrNyJ39iPui6AqtOhDjw4DD+2Ka/16dQ
 a2k51XjmXEsPw5WCH46+lxlVJ20x2aCbvW/yUC1umAU3IJm2zUPw3SICvM0ChjDi
 dazTn7F40S8t0X5sKOmGipAz9Tc/oa8bwFpoGKcBpjIgfvNWplDI7wpEPnz0O5ez
 IweS0XPiQkQ3cxNog621vo3ZD9XdM/Oka0LTAsJB6ZHn3FxqKKg//k6kufagL0ym
 wSX8s+2sxdiCFWJRVVUDolgXfm1pEBab/5MS1BAk3U92QS/mvbeAc6gRS5gGrrO5
 80Ic5ysqhowtL5DihYQVo5gmd+eWk/SpHW/wN01SQr0IjYnbF/ug==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hSqBptfItorE for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:06 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVh5Xm8z1Rvlx;
 Thu, 21 Apr 2022 17:38:04 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 17/31] target/riscv: Use cpu_loop_exit_restore directly from
 mmu faults
Date: Fri, 22 Apr 2022 10:36:42 +1000
Message-Id: <20220422003656.1648121-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


