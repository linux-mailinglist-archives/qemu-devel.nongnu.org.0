Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B923551C9D9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 22:02:14 +0200 (CEST)
Received: from localhost ([::1]:59370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhfx-0008E2-Gz
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 16:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZV-0003w6-JB; Thu, 05 May 2022 14:51:29 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:39568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZT-0004oH-Sj; Thu, 05 May 2022 14:51:29 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 z15-20020a9d65cf000000b00605f064482cso3519111oth.6; 
 Thu, 05 May 2022 11:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IdCfcze6EGR9I8aqWW73Q8OAoWf7FWuqvqpGkA3rNHg=;
 b=fhqYWAFly7VinC7Aep10TmT1eYY3rYm1jGA+BSI5KoA0g+/HKoXd2x6dRYugbvwiPN
 BOhM+nK2d2R4Yh2Qh/98NrS064dwA/DqLF4/ehQC7JJuGnHRkYe3wO0yDcoQz1iw+uXz
 WVtkfHJicFymAOACEDOkO27/bN9aO3WSa/EnKmMWrpDTuu2CG5/u3g0+51EtvWduyeSj
 D6Q3oy2CXK6GwYl1gZSRFM/Je4AEZmvIjK/5scD2bT7OCc70tJTpUWywdoJHuBsCZHT6
 Zwz7LiUbvqv/v/w6yCrT4AVt6SL6XlsVphGTFU2YUu0CzYW4DDD4WhOG8RHgeUS6+z/V
 lKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IdCfcze6EGR9I8aqWW73Q8OAoWf7FWuqvqpGkA3rNHg=;
 b=BKQ0kWiQ2FMTTmnsQCexGWjMn9Inzl7/EQliybu5iFZKvToh3LRG7arPRo+KYVl3gf
 VyGUdcYNtL2ywmMZ/MgvY5Ee8t30mw9SRxAlwnE8Uyx12klg2NAkhFq9auBBla1S4rSM
 sxpr9GS/arnSifg/BDXd7rm98oFz05jRbunPyO3Lpa4SjZpq4BjafQ7xBDQgV4rCoj+/
 XKQcUsStI6ViqA2X3Q5YF5z7MZ4+1IuB8+pC/pC02dX3uDr0r+cqFVgN7WBff1f4Jj9m
 Dmj1w3WO8/sa0fvk0rLwtPbjkLgph+zt1t/kuyzOkMyoPKi5ai5dn9Ipkak5b4HyJYV8
 b4BA==
X-Gm-Message-State: AOAM531A/fxVW2FswaY9J+K16YR50QnMkFCAY4BXfCv7Cigmeq2X10Zn
 uep/mVDOtetNAqPCMkkoQtvUXs5Q7hE=
X-Google-Smtp-Source: ABdhPJwCTDZ2CupblSsHNySGbnQD3X+Hy8DcYDVLitEtxEnUfCeOPNZZQ03SzPeLTsNxJ85zRCEUGQ==
X-Received: by 2002:a05:6830:2375:b0:605:f3fb:79ab with SMTP id
 r21-20020a056830237500b00605f3fb79abmr10172685oth.261.1651776686803; 
 Thu, 05 May 2022 11:51:26 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 26/30] target/ppc: Remove msr_ts macro
Date: Thu,  5 May 2022 15:49:34 -0300
Message-Id: <20220505184938.351866-27-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
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

msr_ts macro hides the usage of env->msr, which is a bad
behavior. Substitute it with FIELD_EX64 calls that explicitly use
env->msr as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-19-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h     | 2 +-
 target/ppc/kvm.c     | 4 ++--
 target/ppc/machine.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 74a3c01f99..5ac7d7d68f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, TS, MSR_TS0, 2)
 FIELD(MSR, CM, MSR_CM, 1)
 FIELD(MSR, GS, MSR_GS, 1)
 FIELD(MSR, POW, MSR_POW, 1)
@@ -494,7 +495,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_hv   (0)
 #endif
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
-#define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
 #define DBCR0_BRT (1 << 26)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index db3a92869c..6eed466f80 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -974,7 +974,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
 
 #ifdef TARGET_PPC64
-        if (msr_ts) {
+        if (FIELD_EX64(env->msr, MSR, TS)) {
             for (i = 0; i < ARRAY_SIZE(env->tm_gpr); i++) {
                 kvm_set_one_reg(cs, KVM_REG_PPC_TM_GPR(i), &env->tm_gpr[i]);
             }
@@ -1282,7 +1282,7 @@ int kvm_arch_get_registers(CPUState *cs)
         }
 
 #ifdef TARGET_PPC64
-        if (msr_ts) {
+        if (FIELD_EX64(env->msr, MSR, TS)) {
             for (i = 0; i < ARRAY_SIZE(env->tm_gpr); i++) {
                 kvm_get_one_reg(cs, KVM_REG_PPC_TM_GPR(i), &env->tm_gpr[i]);
             }
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index e673944597..7104a5c67e 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -417,7 +417,7 @@ static bool tm_needed(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
-    return msr_ts;
+    return FIELD_EX64(env->msr, MSR, TS);
 }
 
 static const VMStateDescription vmstate_tm = {
-- 
2.32.0


