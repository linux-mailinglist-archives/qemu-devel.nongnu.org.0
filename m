Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B26F7A9B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujut-0008Qc-Av; Thu, 04 May 2023 21:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujul-0008NJ-Pg
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:17 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuk-0007xo-6e
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:15 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-517bfdf55c3so565171a12.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248832; x=1685840832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hnAT6rPeWHhnyQGQh4TsIFOiMxMNe6JrOBOWyeNI6yQ=;
 b=WBSIhKitK//PtL8Phzk+EE/bAf93oTHQPuBwkZRwmr8E4oLTuPN+iIEXHFP3qaIQLF
 kwXdAnccbuDRalyQyBSnCivqMc+me+rClhUEH4WSslN7EPcVcVDmGCV3FzbTgZquOA8+
 GLpZVMHoTqJJFwVP9xSZrtGeeqHAk9WMVE0ixf22Cm9AES3ZYLEHYXMUxvLWl2ldv7gb
 SKq1gRiv0Fv5BE0rjuTTcofv+S+R6d01keHSbEP6kZPDqPieTJGYyO3n0NOfwgDVwDfj
 TWD+hzqFik+EQFt6vtb8h3th7xiq/UVkoW4ifr5GVXkEf6faJuOzTmPdDX5iI+WSPMHS
 ZPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248832; x=1685840832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hnAT6rPeWHhnyQGQh4TsIFOiMxMNe6JrOBOWyeNI6yQ=;
 b=H0Ymyrr505E+oz16SmNJ4TlAaymmpO3FOJrB3yasiTJy9a4Jn2oHVtYejiyyCY+NLj
 GT0tdwmQ31RbSUWvH2ZgphNdAxCW2pEuvTlnFGxN3OqEyupYcg4ZElZ5CG5U4b3UgeyT
 PxcOswLW/NKtiMDWqNZ2VP374Xp8qKGYiSzafokFGzdh/22kLLh0SRpgaSOoq6plW98l
 gCpLvFIrTzK70B0XOFT10yEgu75xTQT7rMLyRfrGU/4CTppevRZUusQlCAAoQZWuPmst
 4rcKzNLlFbxCGGeGkwVNL14gxHkXvxsHrcOjp19vzGHkDaiCloSFiVXSC/nW4aTbymGP
 MZNw==
X-Gm-Message-State: AC+VfDybuuFk/YVimIFA7iPjsk3n9u2jHUuS18RrR8AF3lyeHpFp/K0P
 qEVac8bSzBZcOnvl5UOfwAYiK2cjgATUkA==
X-Google-Smtp-Source: ACHHUZ7oxTyGh7YUgkscT6cTAksdBxXH7llO8sg9GUbHXAQnl7ESWf4OuKejuB9DDqFvdZUb70VoVg==
X-Received: by 2002:a17:90b:4a8c:b0:23d:a2a:3ae4 with SMTP id
 lp12-20020a17090b4a8c00b0023d0a2a3ae4mr3901952pjb.44.1683248831972; 
 Thu, 04 May 2023 18:07:11 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:11 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 68/89] target/riscv: Introduce mmuidx_sum
Date: Fri,  5 May 2023 11:02:20 +1000
Message-Id: <20230505010241.21812-69-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

In get_physical_address, we should use the setting passed
via mmu_idx rather than checking env->mstatus directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-13-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-13-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/internals.h  | 5 +++++
 target/riscv/cpu_helper.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 7b63c0f1b6..0b61f337dd 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -37,6 +37,11 @@
 #define MMUIdx_M            3
 #define MMU_2STAGE_BIT      (1 << 2)
 
+static inline bool mmuidx_sum(int mmu_idx)
+{
+    return (mmu_idx & 3) == MMUIdx_S_SUM;
+}
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 291a1acbf7..29ee9b1b42 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -842,7 +842,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
-    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
+    sum = mmuidx_sum(mmu_idx) || use_background || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.40.0


