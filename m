Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B014C194862
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 21:08:36 +0100 (CET)
Received: from localhost ([::1]:59490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHYnr-0002Zp-Ps
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 16:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1jHYKu-0007OP-85
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1jHYKs-0001xX-MA
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:39 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:43163)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1jHYKs-0001wt-Ag
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:38 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id c28so3680806qvb.10
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJAv+EbsefdW66yr8LjRtj+7g6Sr3jeK6hHxTVUkhJA=;
 b=yYK+mkIAI8gfUQUJf6GA8HLwESGtdMYI+FQJ4IMa56GU8IUy/8seB/tgP0dDv0LGyS
 ++2a+lrsHX0zZhlhlW5M3Rrc82iw/1UIoItCagjyV/38AsynD537sZglK+kvmf1y55xG
 j2Bxq06TB9+Sm34cE77Tv/O0wDz8QMuYiD+cp5/Y80aedE4+40KcWbzScBxdcdG5GCZd
 +duiC2IBB5VdkQgwGfnE6YjOJlx0xUgI+CjSy/SX0mvH/TQLmABbtpgLa3G6D97ccsmP
 C4Itj/bzHII1scJXwcsoI3FWxjg7aL9xF3UNwrtCAl0kZgFT/MCvV8cZL+KCL1KrGL0T
 y3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJAv+EbsefdW66yr8LjRtj+7g6Sr3jeK6hHxTVUkhJA=;
 b=qAbW+M33HDZ5xnthbIi/wuo55ql339HowGDuq+pLe6vQmBKl8/QwEmU3/LU5BebYnJ
 cgC2Vj5WFPi4wTyYZLzmeC7+2B/ICqXBZIUcUrOiR5fEpmkXq0RGUWzYlEakUcgZOhay
 wyc7M+PnE3T5htJ2bfLyFuYVJcNFGGzQ8cXP2y2QeuWgNlwrZpEz1EWf/q7LDkPceGg4
 xR89FECKgQmEu77OSbWdEZqazpuurLnA+EFT0TIfSjdRxrGaGS3NAga/sJWKynzxxiAZ
 VE8zGJKDLoeTaoOTzXW5Wz15a5gT5wqkjbafBD2XYrxt+ns6dIvo+eSUGrcaIs/e/kvl
 vwzA==
X-Gm-Message-State: ANhLgQ1Dodpcd4eZyySxp8jTY25swNlxVHJkkv7fPplRXvv/Ekgzx4of
 xPsAFbM0XJoJnmsOZgVW1gBvIDZlfbF63g==
X-Google-Smtp-Source: ADFU+vvZkr+dNR4XJtvZjLvHceloy0yQQNuBwcPnnTbzvTGxGbFv6jnvICFJ+fYQZ5XRxuS+MFEF4A==
X-Received: by 2002:ad4:53a2:: with SMTP id j2mr10102341qvv.145.1585251517048; 
 Thu, 26 Mar 2020 12:38:37 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fd55:4e67:1038:8302])
 by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:38:36 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 46/74] sh4: convert to cpu_interrupt_request
Date: Thu, 26 Mar 2020 15:31:28 -0400
Message-Id: <20200326193156.4322-47-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f2c
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
 "Emilio G. Cota" <cota@braap.org>, peter.puhov@linaro.org,
 alex.bennee@linaro.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/sh4/cpu.c    | 2 +-
 target/sh4/helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 3c68021c56..18f3448183 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -44,7 +44,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
 
 static bool superh_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+    return cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD;
 }
 
 static void superh_cpu_reset(DeviceState *dev)
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 408478ce5d..1e32365c75 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -62,7 +62,7 @@ void superh_cpu_do_interrupt(CPUState *cs)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
     CPUSH4State *env = &cpu->env;
-    int do_irq = cs->interrupt_request & CPU_INTERRUPT_HARD;
+    int do_irq = cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD;
     int do_exp, irq_vector = cs->exception_index;
 
     /* prioritize exceptions over interrupts */
-- 
2.17.1


