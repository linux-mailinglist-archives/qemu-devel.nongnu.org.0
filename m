Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6866F7A9F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:19:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujvR-0000s8-7j; Thu, 04 May 2023 21:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvF-0000gv-Nw
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:45 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujv9-00083m-L6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:40 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1aaea43def7so7996285ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248857; x=1685840857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQOvu3VF8tFauxUlZuL69IHK6L45Rg+xcZox/q0Oz7g=;
 b=AMUerAx9ObDkmsrQRElHEFamW4cbLnfdZNeC2FeFsTZ9cQ0XL2QI3Gm53MmeVZrlM1
 GsPQ5fUAzjN7wSbKTPvvuGzEyhWRGwd4eDvaf71EgmVhKm9R5+AjjfNcAfIrDLjpcjCV
 bZ1h8BKOwPUaitF/QDZv5p+5Y2ywTXEFZ3AsxKVSY9/0zUKKn5i9dgTrbM1J5P9a+iZr
 RLwRV+xfwuvVSB5tamSAy6UPt48uZTe/zRK2VBrJBfE1yAQd4NsVTB2mJ169AxrAiDDn
 QmjIuB8uWihOwbxV1sIRx4mYSSlYVSpuG3pMIf4FRrC+0l4edG4KutDx7leQOur1wypb
 DSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248857; x=1685840857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kQOvu3VF8tFauxUlZuL69IHK6L45Rg+xcZox/q0Oz7g=;
 b=hgFVa7emtJYEOJGOvYCzzhh0SfmeeYL+KxlNuK0eQOoEjUwuPJG8JZaNZPOAd9FosN
 D3glhl5mMUQiifEhrcnAe0nlSeaqYPkxQDtjYWW++kM+jdmVta0Gee7gbiidlOsPti0d
 nMeAtEu5ORp9PQG5BMnPI7WaHBCeYOt+UGFz1TG+JM6ZYQbfz7+uvSHwl8g7+5O6fHik
 dMIURBLfjTs3MXZsJF9RD0kWrVa26elriEC/B0lD9+Hl3hmzX+NlFMj8MtLJfIWF6jg/
 4J2d3MTVP1V5hQ3aM8m0jl/tmReGEsWkHe2us9JSpvVoNFbDJq/wCJHr/T0er7zJ1NUD
 llSw==
X-Gm-Message-State: AC+VfDyVJ9SKKJ0iox22od+9EzQtIevOFO80azDAbvXTMat5pZqJ7gPR
 1+HKEeScyYd4XDgsJUtP9bPmbKo/qNtZoQ==
X-Google-Smtp-Source: ACHHUZ54fLbMHgbw0G8ehBTppnl5V/wE5p+9WeyKmH3nwmUg/omRfJMs/fp/8raKAcNmMdJOl0rUig==
X-Received: by 2002:a17:902:bd86:b0:1ab:ef3:73e5 with SMTP id
 q6-20020a170902bd8600b001ab0ef373e5mr5279724pls.61.1683248857262; 
 Thu, 04 May 2023 18:07:37 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:36 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 75/89] target/riscv: Hoist pbmte and hade out of the level loop
Date: Fri,  5 May 2023 11:02:27 +1000
Message-Id: <20230505010241.21812-76-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62e.google.com
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

These values are constant for every level of pte lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-20-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-20-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5753e4e612..7c9f89d4d3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -856,6 +856,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         return TRANSLATE_FAIL;
     }
 
+    bool pbmte = env->menvcfg & MENVCFG_PBMTE;
+    bool hade = env->menvcfg & MENVCFG_HADE;
+
+    if (first_stage && two_stage && env->virt_enabled) {
+        pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
+        hade = hade && (env->henvcfg & HENVCFG_HADE);
+    }
+
     int ptshift = (levels - 1) * ptidxbits;
     int i;
 
@@ -916,14 +924,6 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        bool pbmte = env->menvcfg & MENVCFG_PBMTE;
-        bool hade = env->menvcfg & MENVCFG_HADE;
-
-        if (first_stage && two_stage && env->virt_enabled) {
-            pbmte = pbmte && (env->henvcfg & HENVCFG_PBMTE);
-            hade = hade && (env->henvcfg & HENVCFG_HADE);
-        }
-
         if (riscv_cpu_sxl(env) == MXL_RV32) {
             ppn = pte >> PTE_PPN_SHIFT;
         } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
-- 
2.40.0


