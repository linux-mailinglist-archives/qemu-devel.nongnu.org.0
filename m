Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7C151C959
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:40:04 +0200 (CEST)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhKV-0003RY-RK
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYr-0003Jm-Mx; Thu, 05 May 2022 14:50:52 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:33573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYq-0004KL-5n; Thu, 05 May 2022 14:50:49 -0400
Received: by mail-oi1-x22f.google.com with SMTP id l203so5284655oif.0;
 Thu, 05 May 2022 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MhbrV+sPh98Wjah4fShxYwAeYTq1APxwR/puaCj88KY=;
 b=BAhCtRjRzSw1BnkzRuc5IpEIIcHtc4JZuY7cPi861owdt3C/pyZx5555o+ebXpiEsZ
 DkYxJCYKAMsV65j7aSVaaGUxtM69h09RZmw9dLY0sdm+Db47I0YCYRr0JUCF5oDf5Dyp
 e2yVbcW9o8j+qC2uCL8TdynQw0ci7Bkhx9gG72pEtFt6hhSPctZBqOcxjSvykiMZICxI
 1FcYV7NbDbqcCF4ng0d60duQmtj8qXxXchnBdvk0/aplV6D738tSm42gEZ1N92jtK0Xq
 Y6UmujPHquxe6kgdCXjtaXKsCjAdCiisoqkv9jcsa2q+CSQ3S6d8jLZjLJt395MFpcVb
 OJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MhbrV+sPh98Wjah4fShxYwAeYTq1APxwR/puaCj88KY=;
 b=6xRPVlOrwcyYuye4pYXXfsKPWWc+oC4VBBcXLBpa8CwTSjLZmlGV25xyGjuVLeyQh5
 J0v4d8SV0mlCePObE2BduREzW9c3DO4ymfgsQeM9Is5AftzrbqiVIrFEFnxI2jpas8cY
 m1r6Q+0splPaU8eRdJ51PfuqoO0hI3FS6vYmyba8JLudxC0C6vzDHPPxridqp6G0KTK1
 Gq5dn6ZpOfN4idZuRlnKrIk/Lnt+E5PsRJum75lRCyi6OY23sadOxPsQ20bBSISrebP8
 yxUFzjZqWCL0rBYLVT5Urq99VslQqFrZbu5IgE6zRC2gYd+uTDZyIQb4Fdtf7X0LMn0d
 WTxQ==
X-Gm-Message-State: AOAM531vs20yxy8wr7RswU84Q4MD16OCEz0BfgzU1z5QR9aKcFlMAC1p
 ehO5FdVuK0QlkzWXQqu+LhySAxbERXQ=
X-Google-Smtp-Source: ABdhPJxayXzKt7gnPyClusBIPSjf7jypjf/RO49Hoq2xaPD86neIW9nhsTW1oXa6QQeucy74OZQJnQ==
X-Received: by 2002:a05:6808:ec3:b0:2ef:3f6a:5a1e with SMTP id
 q3-20020a0568080ec300b002ef3f6a5a1emr3383140oiv.296.1651776647006; 
 Thu, 05 May 2022 11:50:47 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 13/30] target/ppc: Remove msr_ds macro
Date: Thu,  5 May 2022 15:49:21 -0300
Message-Id: <20220505184938.351866-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_ds macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-6-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        | 2 +-
 target/ppc/mmu_common.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c561d664de..5abc612fe0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -355,6 +355,7 @@ typedef enum {
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
 FIELD(MSR, PR, MSR_PR, 1)
+FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
 /* PMU bits */
@@ -486,7 +487,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
 #define msr_ir   ((env->msr >> MSR_IR)   & 1)
 #define msr_dr   ((env->msr >> MSR_DR)   & 1)
-#define msr_ds   ((env->msr >> MSR_DS)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 6ef8b1c00d..7e77b9b84a 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -768,7 +768,7 @@ static bool mmubooke206_get_as(CPUPPCState *env,
         *pr_out = !!(epidr & EPID_EPR);
         return true;
     } else {
-        *as_out = msr_ds;
+        *as_out = FIELD_EX64(env->msr, MSR, DS);
         *pr_out = FIELD_EX64(env->msr, MSR, PR);
         return false;
     }
-- 
2.32.0


