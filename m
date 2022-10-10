Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73B5FA048
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:37:27 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtuI-0000Q5-AT
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkp-0005p1-5U
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkn-0005XQ-1t
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r13so17288311wrj.11
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SPGKioIMb/pLJ3nk36JFfL1iYwx+YE1iQzeuzMVhTD4=;
 b=liOLPdDz8dt4fXuPesosHu8ICaqstKBVP208nXbghsJJxnAkBjfjIIFvdLynsauF3w
 dbHaMW/I4r89NlAJFTId+Iggci0imZGjhjI+ihor2Ou/C0M5KikFq6AI/uVvyfT4UZtJ
 JQCpnxTum2SwVsFtWbMEil6hkCywCKCR207jm/YM0VrgMIvw0CHeReK/mtcFKeAvddJ+
 p5dogAy6Y6vrua1yqwHRwhtSC3HMXgd++CIiVY/3D5+0u4wjfNZUU99/NJAUwpdJ2HYA
 yAJcxQNSgAXx0Tj6gfGtgw6swGdSc0sqqp1Zs/OVrUZLiY9rQ6TYXLvedKtqbflF+ME+
 IToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPGKioIMb/pLJ3nk36JFfL1iYwx+YE1iQzeuzMVhTD4=;
 b=DblB++5gFrL/b+/hB0BvQMz8x1SIDLCpBEB5v4+1vEE/t8ZgRM3vHm1Uj1R/sDBpK2
 v3CYivgkzCcxFQ6hM88r8w2tO3UpUTAvoNGfv97uzKaS3ogkVOy+Nxleh+NPFtmoA3ys
 wOMZZ0HMFIgiCX/jS8A/WJAd3ei70DDmnyN89jOPneDUGVw5lPcx8adbyg5VsV2Fknga
 ZHzW2wI+Il/CycukSsXus52Oqi2Mdj1dOYuUhVfGqjHCj8hJIo0ZFtY5JkxUrfjLY6XQ
 +MIoCRgoR+ZgLMZ1bM7wmhHzGFvLl4Lf9HEgyMtgp5RIkgjCffN6mzS58ft+zss3WY2t
 qw0A==
X-Gm-Message-State: ACrzQf0KkQUY9qnJaFT7TImIkM36yj697rfGj/At98mvqfKd2UpWYzdX
 WcD/1m7dPnPaxL/rrpF+kpYaXu7xNFx7gQ==
X-Google-Smtp-Source: AMsMyM6TH8XarXV1kmPd6mX8f2osiXRgP2s390oZLKg3vZYP/ShVBCKmj/2o7+5xkYPJ5EYEpHrXBA==
X-Received: by 2002:a5d:648c:0:b0:22e:63be:be09 with SMTP id
 o12-20020a5d648c000000b0022e63bebe09mr11553549wri.159.1665412055437; 
 Mon, 10 Oct 2022 07:27:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/28] target/arm: allow setting SCR_EL3.EnTP2 when FEAT_SME is
 implemented
Date: Mon, 10 Oct 2022 15:27:04 +0100
Message-Id: <20221010142730.502083-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Jerome Forissier <jerome.forissier@linaro.org>

Updates write_scr() to allow setting SCR_EL3.EnTP2 when FEAT_SME is
implemented. SCR_EL3 being a 64-bit register, valid_mask is changed
to uint64_t and the SCR_* constants in target/arm/cpu.h are extended
to 64-bit so that masking and bitwise not (~) behave as expected.

This enables booting Linux with Trusted Firmware-A at EL3 with
"-M virt,secure=on -cpu max".

Cc: qemu-stable@nongnu.org
Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221004072354.27037-1-jerome.forissier@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 54 ++++++++++++++++++++++-----------------------
 target/arm/helper.c |  5 ++++-
 2 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 429ed42eece..68d99565ac4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1664,33 +1664,33 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 
 #define HPFAR_NS      (1ULL << 63)
 
-#define SCR_NS                (1U << 0)
-#define SCR_IRQ               (1U << 1)
-#define SCR_FIQ               (1U << 2)
-#define SCR_EA                (1U << 3)
-#define SCR_FW                (1U << 4)
-#define SCR_AW                (1U << 5)
-#define SCR_NET               (1U << 6)
-#define SCR_SMD               (1U << 7)
-#define SCR_HCE               (1U << 8)
-#define SCR_SIF               (1U << 9)
-#define SCR_RW                (1U << 10)
-#define SCR_ST                (1U << 11)
-#define SCR_TWI               (1U << 12)
-#define SCR_TWE               (1U << 13)
-#define SCR_TLOR              (1U << 14)
-#define SCR_TERR              (1U << 15)
-#define SCR_APK               (1U << 16)
-#define SCR_API               (1U << 17)
-#define SCR_EEL2              (1U << 18)
-#define SCR_EASE              (1U << 19)
-#define SCR_NMEA              (1U << 20)
-#define SCR_FIEN              (1U << 21)
-#define SCR_ENSCXT            (1U << 25)
-#define SCR_ATA               (1U << 26)
-#define SCR_FGTEN             (1U << 27)
-#define SCR_ECVEN             (1U << 28)
-#define SCR_TWEDEN            (1U << 29)
+#define SCR_NS                (1ULL << 0)
+#define SCR_IRQ               (1ULL << 1)
+#define SCR_FIQ               (1ULL << 2)
+#define SCR_EA                (1ULL << 3)
+#define SCR_FW                (1ULL << 4)
+#define SCR_AW                (1ULL << 5)
+#define SCR_NET               (1ULL << 6)
+#define SCR_SMD               (1ULL << 7)
+#define SCR_HCE               (1ULL << 8)
+#define SCR_SIF               (1ULL << 9)
+#define SCR_RW                (1ULL << 10)
+#define SCR_ST                (1ULL << 11)
+#define SCR_TWI               (1ULL << 12)
+#define SCR_TWE               (1ULL << 13)
+#define SCR_TLOR              (1ULL << 14)
+#define SCR_TERR              (1ULL << 15)
+#define SCR_APK               (1ULL << 16)
+#define SCR_API               (1ULL << 17)
+#define SCR_EEL2              (1ULL << 18)
+#define SCR_EASE              (1ULL << 19)
+#define SCR_NMEA              (1ULL << 20)
+#define SCR_FIEN              (1ULL << 21)
+#define SCR_ENSCXT            (1ULL << 25)
+#define SCR_ATA               (1ULL << 26)
+#define SCR_FGTEN             (1ULL << 27)
+#define SCR_ECVEN             (1ULL << 28)
+#define SCR_TWEDEN            (1ULL << 29)
 #define SCR_TWEDEL            MAKE_64BIT_MASK(30, 4)
 #define SCR_TME               (1ULL << 34)
 #define SCR_AMVOFFEN          (1ULL << 35)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index db3b1ea72da..c08a7b35a04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1752,7 +1752,7 @@ static void vbar_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     /* Begin with base v8.0 state.  */
-    uint32_t valid_mask = 0x3fff;
+    uint64_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
     /*
@@ -1789,6 +1789,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_doublefault, cpu)) {
             valid_mask |= SCR_EASE | SCR_NMEA;
         }
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            valid_mask |= SCR_ENTP2;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
-- 
2.25.1


