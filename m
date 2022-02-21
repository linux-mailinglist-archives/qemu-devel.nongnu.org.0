Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095DF4BD8A2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:45:20 +0100 (CET)
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5Fp-0005iy-VS
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:45:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zK-0007wM-2I
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:10 -0500
Received: from [2a00:1450:4864:20::42b] (port=47054
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zH-0000zS-HU
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id x5so21037179wrg.13
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5AoCux+aFBEAi+jbJxkDJWzNaBcRwPJ7SGnCp4qZ8wQ=;
 b=n26BuIZk3bU2LcIxg10I6+DnqUknzZiTY7muhGmjCHz6UId0IupP+RhJ4Br1Qt+uji
 tNxzeWmLxc5as7Ef0NE/NVChEDbbX08qBahLMN4s39eV4SnMQoRuz7JA6RyQ6GxhcVp9
 g+gEp2qJTslRQwzDrQlE164DOSmMWbGvowV6B+sR+yvcb5zUt2GsZRAwPEnZOKcNSJvI
 78vIwc6wqCiXb2GPgV8u6Eaj2w2dqMfPreVoJvQkjjDDTZC/+pI4uyMzcYMpiad3ewEt
 SQQlD9y8R6LqBmRlw+jieuuk5IwIty2fsMTdm+Bnw/qyNkwSbHBTSn7noOen50tG+sMr
 6/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5AoCux+aFBEAi+jbJxkDJWzNaBcRwPJ7SGnCp4qZ8wQ=;
 b=20xKw7SmK8cdzBRWJ02D7G47zeio/cqp7aUbRl00Q+zWBnos3Dv355Fz1F54ekmSaq
 smnEKy+xSm2c/bGboDKUbno5+kzH3n2BEqWacMyiQjLqPWJzh7PH/gcaJ+VM121ArC5J
 OSDMhvSVsx8d7sjklmEZGP7sPCedBJW/TMaRUw2KD0BTXgpkzzyK/MxidqZ2B/OUe0wa
 x9ZbueDCO4qo+CponyHj5u17nJEv8fK1252hC9TUcufI1IhkCRksKOkCCpEHIjYKP2ed
 SXVWs1hkcvBVflSz0c47v5wpEodfAc12W6cXQRg7ZixJYY0WTxjfP2/9S/dWv4Eo3qy4
 +6fA==
X-Gm-Message-State: AOAM531XZw4G0yhCPiwT8i5zYo7xe3QkNSD1sfiiY0j+CihOE+pTnY4b
 bdk35lDpHts5b6U6/jrijbgDWfQqDkbx5Q==
X-Google-Smtp-Source: ABdhPJxLOL2wy2PWFyxBG/EG2XlhqS2Y6NUQ3faYOr9Njywjeog2x7axJ22yiV/bLJclAMUM57HFBQ==
X-Received: by 2002:a5d:558f:0:b0:1e6:337b:a9e1 with SMTP id
 i15-20020a5d558f000000b001e6337ba9e1mr14792559wrv.639.1645435685829; 
 Mon, 21 Feb 2022 01:28:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/26] hvf: arm: Handle unknown ID registers as RES0
Date: Mon, 21 Feb 2022 09:27:38 +0000
Message-Id: <20220221092800.404870-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
those reads trap into QEMU which handles them as faults.

However, AArch64 ID registers should always read as RES0. Let's
handle them accordingly.

This fixes booting Linux 5.17 guests.

Cc: qemu-stable@nongnu.org
Reported-by: Ivan Babrou <ivan@cloudflare.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-id: 20220209124135.69183-2-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/hvf/hvf.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 808c96da8cc..4d4ddab348a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -754,6 +754,15 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     return true;
 }
 
+static bool is_id_sysreg(uint32_t reg)
+{
+    return SYSREG_OP0(reg) == 3 &&
+           SYSREG_OP1(reg) == 0 &&
+           SYSREG_CRN(reg) == 0 &&
+           SYSREG_CRM(reg) >= 1 &&
+           SYSREG_CRM(reg) < 8;
+}
+
 static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -806,6 +815,11 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
         /* Dummy register */
         break;
     default:
+        if (is_id_sysreg(reg)) {
+            /* ID system registers read as RES0 */
+            val = 0;
+            break;
+        }
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_read(env->pc, reg,
                                         SYSREG_OP0(reg),
-- 
2.25.1


