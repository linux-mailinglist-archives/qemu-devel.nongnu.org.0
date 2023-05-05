Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6CA6F7A6E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujux-0000Fl-Km; Thu, 04 May 2023 21:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujui-0008LW-7q
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujuf-0007tq-E3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:11 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1aaf21bb42bso8127985ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248828; x=1685840828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+n36tMTZvWq86F1D3ut0hsueUyzrn9pMgnXvfb62RmU=;
 b=l6u5jAnXFs8NSj//FeueGg4UIy/ZMAwCyR3npYXBSsK0VsxjL4TgRAXGzZ5c+bzQqM
 rcEAxbHE/JpSEzTPaQ/aT5H+zZo9C2YefO7U+vjCLQrP08mZdomFrpuLs0o3z/Ycda/I
 tvUecpnoSal4RNrL+7Tz1FEmDrbyoBJL91MblEOdW1LxIJsOAgHsqLQzA+WmdjhMYVfj
 DTySJQykJgGUVcM7yvzDKeZB7jXo1Q36nO4TlsY1kBfoFXPP4hFypCr7Sb8fycRN1W2G
 mW/iYBLR8bFfKmwwG1qVe/XnOL7Phkm5cOV7t2wXaHR1FZfp66iek3MDUKuDEt0kGkf/
 /Qxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248828; x=1685840828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+n36tMTZvWq86F1D3ut0hsueUyzrn9pMgnXvfb62RmU=;
 b=QG87HGY/rWIOtQ3tu+q6BaPihCb3hDxM5DUSEoTYAX7+7N+9wt6m5/EnT/BdPUXb8j
 l9AUFnO6sXvrWEtXekiI3x6HoWLM5+2QAp8SHPSysBeU+CkuwleYcWAWomLlaGNd4dis
 PqhO4x1GT4t/L/hO+JJ9eKt5ekMSzTF0DD21zma+jCsOlxThD9uPrFbpkawZXSSxrgTz
 CuJrqYUuefw8jLHuiGpAin1A9WO+JGK78r7c38N7/SkzT499WAyPf7imYeSc/BVz/rcB
 GXBiVrKUsHjOaaJeZCLzgwjO3JWvd332e/T6V1YNoTDEF1vX/Dk5xOoLgVTq18/qUnDK
 2Quw==
X-Gm-Message-State: AC+VfDz6BvzHwnpUcAw2pQJ0233myFaWFZdUg7vU9Hep2+zE82iZxd3F
 nIKWi+SJ/7SmE3TzQJ96h/Vrql1GQSfcWw==
X-Google-Smtp-Source: ACHHUZ5Lc2uWmKl7KCCIBMVTrhNlE7duH3wN7nmDbxUCK/ippT/C/Bc60OYyX2T7ArU5E6z/oFEi0Q==
X-Received: by 2002:a17:902:d4d1:b0:1ab:2a77:6f4b with SMTP id
 o17-20020a170902d4d100b001ab2a776f4bmr6024437plg.26.1683248828444; 
 Thu, 04 May 2023 18:07:08 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:07 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 67/89] target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
Date: Fri,  5 May 2023 11:02:19 +1000
Message-Id: <20230505010241.21812-68-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x632.google.com
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

We will enable more uses of this bit in the future.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-12-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-12-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/internals.h  | 6 ++++--
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/op_helper.c  | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b55152a7dc..7b63c0f1b6 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -27,13 +27,15 @@
  *  - S                 0b001
  *  - S+SUM             0b010
  *  - M                 0b011
- *  - HLV/HLVX/HSV adds 0b100
+ *  - U+2STAGE          0b100
+ *  - S+2STAGE          0b101
+ *  - S+SUM+2STAGE      0b110
  */
 #define MMUIdx_U            0
 #define MMUIdx_S            1
 #define MMUIdx_S_SUM        2
 #define MMUIdx_M            3
-#define MMU_HYP_ACCESS_BIT  (1 << 2)
+#define MMU_2STAGE_BIT      (1 << 2)
 
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index abf275d2c6..291a1acbf7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -593,7 +593,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
 {
-    return mmu_idx & MMU_HYP_ACCESS_BIT;
+    return mmu_idx & MMU_2STAGE_BIT;
 }
 
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 7f83395370..6122f5fbe5 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -437,7 +437,7 @@ static int check_access_hlsv(CPURISCVState *env, bool x, uintptr_t ra)
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
     }
 
-    return cpu_mmu_index(env, x) | MMU_HYP_ACCESS_BIT;
+    return cpu_mmu_index(env, x) | MMU_2STAGE_BIT;
 }
 
 target_ulong helper_hyp_hlv_bu(CPURISCVState *env, target_ulong addr)
-- 
2.40.0


