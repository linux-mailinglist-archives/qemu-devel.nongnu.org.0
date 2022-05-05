Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8651CA2B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 22:09:13 +0200 (CEST)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhmh-0003vU-S7
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 16:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZk-0003zr-QL; Thu, 05 May 2022 14:51:50 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZh-0004ui-1T; Thu, 05 May 2022 14:51:43 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so875016ooj.2; 
 Thu, 05 May 2022 11:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cFeoFWTrJ9wx6FTqB2K/qNMYU/hG68Y6j1e/MT6eR6c=;
 b=AbfRIIKyOWV2LxKQqPdq6XojD5+pqbhsFCBpBw6tHWAeDZl4TEDalJh5E7RPO2KNTT
 FnY8YP608UQjdu5RFeArq9m1+5at4TI3nyOvOAefM4iVjPoZux4yGljFz9vW89P4N8Ft
 t507o065UXnwuLtB+O5OhEz8cFljLvCqSLdKJJX6ef5FNXR1Ft5hnsGlqJ/jD/F/5Na8
 2fK95g47JhLBUz7SZB0TQMr97boZ0tOfiGIo+EDRwNIkei9mafd1Stn+DU2wMhQw9dhT
 dFBT+UiDbI0rHc036kFhkW2hMeUxUfuRZL1Q42wssPElh4CjnaXFrmkYnz7OqEhtz0MO
 DY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cFeoFWTrJ9wx6FTqB2K/qNMYU/hG68Y6j1e/MT6eR6c=;
 b=0QmSjvTqJaZaOOQG6Q79lo7SoqMTskbryWvSJOFjgWwonzHds1HiIK546jCwgiFh7p
 AaBMnYY8C0Yg6ZU4cFu5d7WeFg5cQPNm5JeHSyqE/gTkbO2e8m6KjSy6jwiN8PiYc+jZ
 IMbGx3eKUULc6FxoqSBL1SgKRcAyKYqZ/vdEToCCcPZuNJuF28eeDUV1bYegCRlM2kIf
 JfYXRBO7qqapiZQesEfSzJC+kwmx7AtypLBq3vcfxp5f4SBnuFuEnDDNspoFSeaFN4wc
 zDu9X7aUl47P/m6yTn+UWqwe9i3nJEj3pYBKjlnf/DnRN9FTeKrYhkDyP1LVnaH8A1ZO
 yAmQ==
X-Gm-Message-State: AOAM533wZix1b6EnVAoAfOHqmgH0kTDSOgLQfN0VixpsFGIQKdllxUmq
 U0QHo4rEUq6oUSygzwOGKsXmMfahpGw=
X-Google-Smtp-Source: ABdhPJz4jBPvdKyLVT0UOaOiI9MTKqfS8QqpebFHjtOgTzDR4xTJrLJbpHunFuSI6UQ+wyVni9aGCA==
X-Received: by 2002:a4a:ad0a:0:b0:35e:79da:30c7 with SMTP id
 r10-20020a4aad0a000000b0035e79da30c7mr9833228oon.53.1651776699380; 
 Thu, 05 May 2022 11:51:39 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 30/30] target/ppc: Change MSR_* to follow POWER ISA numbering
 convention
Date: Thu,  5 May 2022 15:49:38 -0300
Message-Id: <20220505184938.351866-31-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
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

Today we have the issue where MSR_* values are the 'inverted order'
bit numbers from what the ISA specifies. e.g. MSR_LE is bit 63 but
is defined as 0 in QEMU.

Add a macro to be used to convert from QEMU order to ISA order.

This solution requires less changes than to use the already defined
PPC_BIT macro, which would turn MSR_* in masks instead of the numbers
itself.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-23-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h | 87 ++++++++++++++++++++++++------------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 4577cfcc23..48596cfb25 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -38,6 +38,7 @@
 #define PPC_ELF_MACHINE     EM_PPC
 #endif
 
+#define PPC_BIT_NR(bit)         (63 - (bit))
 #define PPC_BIT(bit)            (0x8000000000000000ULL >> (bit))
 #define PPC_BIT32(bit)          (0x80000000 >> (bit))
 #define PPC_BIT8(bit)           (0x80 >> (bit))
@@ -310,49 +311,49 @@ typedef enum {
 
 /*****************************************************************************/
 /* Machine state register bits definition                                    */
-#define MSR_SF   63 /* Sixty-four-bit mode                            hflags */
-#define MSR_TAG  62 /* Tag-active mode (POWERx ?)                            */
-#define MSR_ISF  61 /* Sixty-four-bit interrupt mode on 630                  */
-#define MSR_HV   60 /* hypervisor state                               hflags */
-#define MSR_TS0  34 /* Transactional state, 2 bits (Book3s)                  */
-#define MSR_TS1  33
-#define MSR_TM   32 /* Transactional Memory Available (Book3s)               */
-#define MSR_CM   31 /* Computation mode for BookE                     hflags */
-#define MSR_ICM  30 /* Interrupt computation mode for BookE                  */
-#define MSR_GS   28 /* guest state for BookE                                 */
-#define MSR_UCLE 26 /* User-mode cache lock enable for BookE                 */
-#define MSR_VR   25 /* altivec available                            x hflags */
-#define MSR_SPE  25 /* SPE enable for BookE                         x hflags */
-#define MSR_VSX  23 /* Vector Scalar Extension (ISA 2.06 and later) x hflags */
-#define MSR_S    22 /* Secure state                                          */
-#define MSR_KEY  19 /* key bit on 603e                                       */
-#define MSR_POW  18 /* Power management                                      */
-#define MSR_WE   18 /* Wait State Enable on 405                              */
-#define MSR_TGPR 17 /* TGPR usage on 602/603                        x        */
-#define MSR_CE   17 /* Critical interrupt enable on embedded PowerPC x       */
-#define MSR_ILE  16 /* Interrupt little-endian mode                          */
-#define MSR_EE   15 /* External interrupt enable                             */
-#define MSR_PR   14 /* Problem state                                  hflags */
-#define MSR_FP   13 /* Floating point available                       hflags */
-#define MSR_ME   12 /* Machine check interrupt enable                        */
-#define MSR_FE0  11 /* Floating point exception mode 0                       */
-#define MSR_SE   10 /* Single-step trace enable                     x hflags */
-#define MSR_DWE  10 /* Debug wait enable on 405                     x        */
-#define MSR_UBLE 10 /* User BTB lock enable on e500                 x        */
-#define MSR_BE   9  /* Branch trace enable                          x hflags */
-#define MSR_DE   9  /* Debug interrupts enable on embedded PowerPC  x        */
-#define MSR_FE1  8  /* Floating point exception mode 1                       */
-#define MSR_AL   7  /* AL bit on POWER                                       */
-#define MSR_EP   6  /* Exception prefix on 601                               */
-#define MSR_IR   5  /* Instruction relocate                                  */
-#define MSR_DR   4  /* Data relocate                                         */
-#define MSR_IS   5  /* Instruction address space (BookE)                     */
-#define MSR_DS   4  /* Data address space (BookE)                            */
-#define MSR_PE   3  /* Protection enable on 403                              */
-#define MSR_PX   2  /* Protection exclusive on 403                  x        */
-#define MSR_PMM  2  /* Performance monitor mark on POWER            x        */
-#define MSR_RI   1  /* Recoverable interrupt                        1        */
-#define MSR_LE   0  /* Little-endian mode                           1 hflags */
+#define MSR_SF   PPC_BIT_NR(0)  /* Sixty-four-bit mode                hflags */
+#define MSR_TAG  PPC_BIT_NR(1)  /* Tag-active mode (POWERx ?)                */
+#define MSR_ISF  PPC_BIT_NR(2)  /* Sixty-four-bit interrupt mode on 630      */
+#define MSR_HV   PPC_BIT_NR(3)  /* hypervisor state                   hflags */
+#define MSR_TS0  PPC_BIT_NR(29) /* Transactional state, 2 bits (Book3s)      */
+#define MSR_TS1  PPC_BIT_NR(30)
+#define MSR_TM   PPC_BIT_NR(31) /* Transactional Memory Available (Book3s)   */
+#define MSR_CM   PPC_BIT_NR(32) /* Computation mode for BookE         hflags */
+#define MSR_ICM  PPC_BIT_NR(33) /* Interrupt computation mode for BookE      */
+#define MSR_GS   PPC_BIT_NR(35) /* guest state for BookE                     */
+#define MSR_UCLE PPC_BIT_NR(37) /* User-mode cache lock enable for BookE     */
+#define MSR_VR   PPC_BIT_NR(38) /* altivec available                x hflags */
+#define MSR_SPE  PPC_BIT_NR(38) /* SPE enable for BookE             x hflags */
+#define MSR_VSX  PPC_BIT_NR(40) /* Vector Scalar Extension (>= 2.06)x hflags */
+#define MSR_S    PPC_BIT_NR(41) /* Secure state                              */
+#define MSR_KEY  PPC_BIT_NR(44) /* key bit on 603e                           */
+#define MSR_POW  PPC_BIT_NR(45) /* Power management                          */
+#define MSR_WE   PPC_BIT_NR(45) /* Wait State Enable on 405                  */
+#define MSR_TGPR PPC_BIT_NR(46) /* TGPR usage on 602/603            x        */
+#define MSR_CE   PPC_BIT_NR(46) /* Critical int. enable on embedded PPC x    */
+#define MSR_ILE  PPC_BIT_NR(47) /* Interrupt little-endian mode              */
+#define MSR_EE   PPC_BIT_NR(48) /* External interrupt enable                 */
+#define MSR_PR   PPC_BIT_NR(49) /* Problem state                      hflags */
+#define MSR_FP   PPC_BIT_NR(50) /* Floating point available           hflags */
+#define MSR_ME   PPC_BIT_NR(51) /* Machine check interrupt enable            */
+#define MSR_FE0  PPC_BIT_NR(52) /* Floating point exception mode 0           */
+#define MSR_SE   PPC_BIT_NR(53) /* Single-step trace enable         x hflags */
+#define MSR_DWE  PPC_BIT_NR(53) /* Debug wait enable on 405         x        */
+#define MSR_UBLE PPC_BIT_NR(53) /* User BTB lock enable on e500     x        */
+#define MSR_BE   PPC_BIT_NR(54) /* Branch trace enable              x hflags */
+#define MSR_DE   PPC_BIT_NR(54) /* Debug int. enable on embedded PPC   x     */
+#define MSR_FE1  PPC_BIT_NR(55) /* Floating point exception mode 1           */
+#define MSR_AL   PPC_BIT_NR(56) /* AL bit on POWER                           */
+#define MSR_EP   PPC_BIT_NR(57) /* Exception prefix on 601                   */
+#define MSR_IR   PPC_BIT_NR(58) /* Instruction relocate                      */
+#define MSR_IS   PPC_BIT_NR(58) /* Instruction address space (BookE)         */
+#define MSR_DR   PPC_BIT_NR(59) /* Data relocate                             */
+#define MSR_DS   PPC_BIT_NR(59) /* Data address space (BookE)                */
+#define MSR_PE   PPC_BIT_NR(60) /* Protection enable on 403                  */
+#define MSR_PX   PPC_BIT_NR(61) /* Protection exclusive on 403        x      */
+#define MSR_PMM  PPC_BIT_NR(61) /* Performance monitor mark on POWER  x      */
+#define MSR_RI   PPC_BIT_NR(62) /* Recoverable interrupt            1        */
+#define MSR_LE   PPC_BIT_NR(63) /* Little-endian mode               1 hflags */
 
 FIELD(MSR, SF, MSR_SF, 1)
 FIELD(MSR, TAG, MSR_TAG, 1)
-- 
2.32.0


