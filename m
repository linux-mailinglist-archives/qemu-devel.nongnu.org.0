Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480F5A8670
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:08:54 +0200 (CEST)
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTT4y-0007Vm-6t
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSno-0001sO-Kn; Wed, 31 Aug 2022 14:51:04 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSnn-0007yY-1O; Wed, 31 Aug 2022 14:51:04 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso19831947fac.1; 
 Wed, 31 Aug 2022 11:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=keRmCV4x+h1kcxkk8ZQ1BtS05ePUa0EmosGaaVfQTbw=;
 b=RkZ0jMeoVp8Qq1MZh2p/C2BxNdiRcV6m8uH6JvUPJ7w/F1oosnCkbAlSi4DDmiNsik
 B0G9oDKUWrrXSfmB5urKKa2E4W+CYobCgKNUKYYBnm9tz9q4SLRegxggnFQCo4jb6wdw
 R5jw7KPJTL2uocNqjWQoEh0ymd0msYzVflQcYx00cjaKwVSJArnB+l/dr922tvxjJkzZ
 YYXQ32UnoIMTrgwC31iZlVhimyyFYe/EgNNwIKwbyoWnVgGF5jgQsYwL78KvlpuEZKEl
 jeoWai3lVARYwI8/F/KoPXBvHIp2zZ4pdrr3VNMszhirWvVMNH4EBSIxoxo8/UFvDDFk
 P3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=keRmCV4x+h1kcxkk8ZQ1BtS05ePUa0EmosGaaVfQTbw=;
 b=qKJrocfd0r8bKgs/5I6xNhLNyB2qPVbHJ6jRBHxnSJbOm95p8ORAF/5Q0N6O42JJqw
 5SYBGcY/geK4OMekkfPoAq2cBus7SBfn/1RGInoWUJ8E2HiSHW8qHjnMERzXR7s3qqfF
 6eaiQ0LLZT9IPqIhPtbihPGgRhGXMGRK0eFLBfEGWrS/YWQ3Jg711EL6/JdZ4gtqxYfg
 79iXlWiESPg1W7kkV51pmAe1+yHZEK9nJ9QacIU3nxaQbiRtTuQh/o3XBIOhbNqzt+3l
 yS0Gs0Wu9tZ0ofreRG2aKns+S6CRG3Q3EvFzBw2EVVn4HZZ2rrod/IwHS/lHDH/B5EKK
 1YPQ==
X-Gm-Message-State: ACgBeo1hJ+T8+5useOCGxTpWuxppSJjitq6fj1ukIwgsUZC7IeCncoDr
 T58+GMqej2mkOcEOLWzMv0i58lfue7s=
X-Google-Smtp-Source: AA6agR7eh/nYZrA0XUVMKkRMtQpxfQgEy77Z4xkw4tuMHU1nXNie9FYqn6BlWbdBrhIRZDyKWkwqXQ==
X-Received: by 2002:aca:3ac3:0:b0:344:821:525f with SMTP id
 h186-20020aca3ac3000000b003440821525fmr1724215oia.63.1661971861755; 
 Wed, 31 Aug 2022 11:51:01 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 05/60] target/ppc: Bugfix FP when OE/UE are set
Date: Wed, 31 Aug 2022 15:49:39 -0300
Message-Id: <20220831185034.23240-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

When an overflow exception occurs and OE is set the intermediate result
should be adjusted (by subtracting from the exponent) to avoid rounding
to inf. The same applies to an underflow exceptionion and UE (but adding
to the exponent). To do this set the fp_status.rebias_overflow when OE
is set and fp_status.rebias_underflow when UE is set as the FPU will
recalculate in case of a overflow/underflow if the according rebias* is
set.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220805141522.412864-3-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.c        | 2 ++
 target/ppc/fpu_helper.c | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 401b6f9e63..0ebac04bc4 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -120,6 +120,8 @@ void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
         val |= FP_FEX;
     }
     env->fpscr = val;
+    env->fp_status.rebias_overflow  = (FP_OE & env->fpscr) ? true : false;
+    env->fp_status.rebias_underflow = (FP_UE & env->fpscr) ? true : false;
     if (tcg_enabled()) {
         fpscr_set_rounding_mode(env);
     }
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7ab6beadad..0f045b70f8 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -348,7 +348,6 @@ static inline int float_overflow_excp(CPUPPCState *env)
 
     bool overflow_enabled = !!(env->fpscr & FP_OE);
     if (overflow_enabled) {
-        /* XXX: should adjust the result */
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
@@ -367,7 +366,6 @@ static inline void float_underflow_excp(CPUPPCState *env)
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
     if (env->fpscr & FP_UE) {
-        /* XXX: should adjust the result */
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
-- 
2.37.2


