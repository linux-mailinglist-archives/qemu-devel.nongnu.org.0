Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F97C1947F7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 20:54:02 +0100 (CET)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHYZl-0001hZ-I2
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 15:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58779)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1jHYKW-00077z-Pp
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1jHYKV-0001gi-AU
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:16 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:33743)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1jHYKT-0001fq-10
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:14 -0400
Received: by mail-qk1-x743.google.com with SMTP id v7so8218769qkc.0
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q7qiUjPB4OVFC6Nc1RwuXN27rGhJZIJuTp+ATKDGV+A=;
 b=r8UvewThY0KQJHHMG6Q7j92v+zicuYppLY6AJheeJhCqo9c+W2CB0QS9ybHrzM8n/A
 M/3btWDf3nXluunlcbB9oIhjPtR3hqKCvf/aGDIao9zisD6KI14Wg0qFf+8OYN+OSYwr
 2PMoAdU9VAfhrAeQBya8GfSU7z91iZEyZnJRgu/dM/zOJcL/+uJ0AQQ71IJ0HxaYQMZi
 xzFJzIt2NRniwrHTOJlbBqIcXfl33V83fY/iKwzrBvhoX7d/Yq67cKz96uGsOn5Pf+cU
 JogpFpLfCtheBYO3Q8MEIyxuqz+jlyg6wigPV7HekD2phWw1AIagqbJ0hfa7G/GdBuDL
 /Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q7qiUjPB4OVFC6Nc1RwuXN27rGhJZIJuTp+ATKDGV+A=;
 b=cE7ru/8cM+dQ/UFkkIfIArL4O+Rs3FEfzHiZz37wv73i4unU6aUxo1cLYMrNceFItw
 Dfat2BZVvdBq1O+u1i2d788pU8TaUz6hDbQIYZ0kOasioBDqu0z31skZ6y8MK8GTdfqy
 PDr01SD+htQCz4lQmj5FRDWv44En4Z15VEXjEnELg5ty/lwcSFkEPXPZBWmO6vbk30zz
 HCgN3P5THgmikNzk1NrHpSQvm6Gy23ow1NQ/NGRc4plPWKJbMpi95m336XfxYTPnwKUP
 C2qtOJL5WMCKXzEeJ3x8knhUnZ8ixostEMxUnnSIHlclZigJBBRTK+2bTXOwaOvvWE7Y
 ulwQ==
X-Gm-Message-State: ANhLgQ1rJHBVGL7YJkuNlPdxSKvgogr5na0zpT/4kbp1qB3yJGshxPxW
 gdfRUodlI588e2d7et90/DsDgxW2tW7G3A==
X-Google-Smtp-Source: ADFU+vtcbVmarImQu+maMhlL/8hMQrugcPO0M9hKiZQ39JVY3xVRwLtrg1klOtZ9MhAT1iwUpQARlg==
X-Received: by 2002:a37:b986:: with SMTP id
 j128mr10011053qkf.109.1585251492121; 
 Thu, 26 Mar 2020 12:38:12 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fd55:4e67:1038:8302])
 by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:38:11 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 28/74] xtensa: convert to cpu_halted
Date: Thu, 26 Mar 2020 15:31:10 -0400
Message-Id: <20200326193156.4322-29-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: robert.foley@linaro.org, richard.henderson@linaro.org,
 Max Filippov <jcmvbkbc@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
 peter.puhov@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/xtensa/cpu.c        | 2 +-
 target/xtensa/exc_helper.c | 2 +-
 target/xtensa/helper.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 82c2ee0679..fda4a73722 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -102,7 +102,7 @@ static void xtensa_cpu_reset(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
     reset_mmu(env);
-    s->halted = env->runstall;
+    cpu_halted_set(s, env->runstall);
 #endif
 }
 
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 601341d13a..01d1e56feb 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -115,7 +115,7 @@ void HELPER(waiti)(CPUXtensaState *env, uint32_t pc, uint32_t intlevel)
         return;
     }
 
-    cpu->halted = 1;
+    cpu_halted_set(cpu, 1);
     HELPER(exception)(env, EXCP_HLT);
 }
 
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 376a61f339..d5d5ad5899 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -327,7 +327,7 @@ void xtensa_runstall(CPUXtensaState *env, bool runstall)
     CPUState *cpu = env_cpu(env);
 
     env->runstall = runstall;
-    cpu->halted = runstall;
+    cpu_halted_set(cpu, runstall);
     if (runstall) {
         cpu_interrupt(cpu, CPU_INTERRUPT_HALT);
     } else {
-- 
2.17.1


