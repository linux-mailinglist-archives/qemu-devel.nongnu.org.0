Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D0C6F8235
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 13:42:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1putpT-0005r6-N8; Fri, 05 May 2023 07:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putor-0005hO-Os
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:41:51 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1putoq-00023a-9R
 for qemu-devel@nongnu.org; Fri, 05 May 2023 07:41:49 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64389a44895so1443605b3a.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 04:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1683286906; x=1685878906;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dfZLHLenIMrmO0jB1mDUgnBqGDCRWU9RcEAKqrqYqAE=;
 b=LlxWXzRxPsu/Zf887gNeofPH/AQsExSMDhntWJFtLJMfDxhCpTrCWJFmfXd1kJRip+
 2ojyE7WYLcUgWc1D3oF/fHM3otfc0ts20eDeRT6G4MQHCnDaa/AWCHpi7EsGKLCQRlyh
 2jEkRlAAtPktcmTM8X804GxTr8Dpw6BVW8xJfGs1jW61N1jEmkn6cs+kA3ZPKLGSWGMz
 +kLekCM0mTYXvsTjC4kz1sDipU0jh5LmXqZ8G4NIlVmuOejORWJzoRDJAIi1uuoFnxOL
 rOSgrp6IgQXdGpsjhE4nGfKPFwHzn17oeJ62XiApnCN1Nhok2IdDXacwf2kJ/V1AwJ+a
 2RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683286906; x=1685878906;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dfZLHLenIMrmO0jB1mDUgnBqGDCRWU9RcEAKqrqYqAE=;
 b=Hc3oD5MBU2/OKOR7CbxtbmPzGkFwGfEdF/HAdVUaV1eVIeJ7voFuO80h4JJmo71fha
 2IcUMizCMtqserwh6MJ1qwIsPHIpwGTO59UwcT9EcdU0x+qM8VfDkDzSE2/sz+TMTw9f
 wz2DxAIWm8j0xDriJ9U1G7q9s4ke1mn5wkBCxUz9BXOAWEsXeJF/JvKH7kJJCrnYr3H6
 i0ZkSmLb8jWP6D0SCKPmfx0myrt4pGfMkRqHJ7bjMZf7NeKWEfAw3c95KSM0mv7G1lo5
 K8lOqpIDMRcr+XzwG/8W1mmRniq0JawnLKv+yyN5DK31l9XunZF0pfhkO+v4ZwNAwOhM
 WK2A==
X-Gm-Message-State: AC+VfDy3J7NghweX7q/shYwF6yPXe8O1YAU0B8drWdI1dZgPc0A50/Rm
 JECGxMOYwG+KKQhe1Xe8iWbSdKGWSaRl1m92PPyz/UuG2OUALF8VxF7giHTcpu/KP1Pro5mpChg
 2L/1t++TpnZ9TRUVvaOwj+aT4cNTfwyd/kVOSmcqrPxRXUZjN/qTemn1FR+1yHYk3nevAKDFxd9
 cH6OjD
X-Google-Smtp-Source: ACHHUZ60oAWwoYwGWJq8xhJ6z0TRojE2bzwtt5KpXa4gHSrvPQJkDYPcivV2Mvy23oM6Xg9pdCtZxg==
X-Received: by 2002:a05:6a00:1409:b0:643:8d7:7bda with SMTP id
 l9-20020a056a00140900b0064308d77bdamr1997578pfu.21.1683286905902; 
 Fri, 05 May 2023 04:41:45 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 y17-20020aa78051000000b0062d859a33d1sm1448171pfm.84.2023.05.05.04.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 04:41:45 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, jim.shu@sifive.com,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: [PTACH v2 3/6] target/riscv: check the in-kernel irqchip support
Date: Fri,  5 May 2023 11:39:38 +0000
Message-Id: <20230505113946.23433-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230505113946.23433-1-yongxuan.wang@sifive.com>
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We check the in-kernel irqchip support when using KVM acceleration.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/kvm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 0f932a5b96..eb469e8ca5 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -433,7 +433,18 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
 int kvm_arch_irqchip_create(KVMState *s)
 {
-    return 0;
+    if (kvm_kernel_irqchip_split()) {
+        error_report("-machine kernel_irqchip=split is not supported "
+                     "on RISC-V.");
+        exit(1);
+    }
+
+    /*
+     * If we can create the VAIA using the newer device control API, we
+     * let the device do this when it initializes itself, otherwise we
+     * fall back to the old API
+     */
+    return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
 int kvm_arch_process_async_events(CPUState *cs)
-- 
2.17.1


