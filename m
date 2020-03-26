Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E17194819
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 20:59:26 +0100 (CET)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHYez-0003fr-G6
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 15:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1jHYKd-0007AB-18
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1jHYKc-0001lo-2s
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:22 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:38192)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1jHYKb-0001jv-UA
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:21 -0400
Received: by mail-qk1-x72d.google.com with SMTP id h14so8189738qke.5
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LFX1h0KEjL3WKeiAHU4bRyv9sZCfiCnhx/ANt9ydhrU=;
 b=KI+AxFJ0NJIcOPCrkXLc57VmlOSZqkk5zyA459NNWUzfgQSgIKa2ja8jTRvMMDxuzw
 Wv9sLvxvtJPg9WdujjsvMV3cPZccJYHG1WCOjIumH/CgXpUwXOOpqyBCocCt0mKtZBbP
 RzDixYCvUiUMRHTP8XdCIJAe1VUExIn0KNM/DAugMHKrPsDWxDVFHyONgVMpuCvrklSJ
 MW3gTjX/Yu81z9Nf0VjYrIsos1Q91IMWtFlKSLC7+B/D5B/1d1KviT+Ask3qzxpqA5mV
 9ZAj+H9uuYHEui0GxaDOPO1Y7JiKs5lV9W1m2PmKqJ0VWeiHXl7ZQvRaj21lW8IIlXp5
 KWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LFX1h0KEjL3WKeiAHU4bRyv9sZCfiCnhx/ANt9ydhrU=;
 b=GUbgnyZVZCvTqvwBVcZ3ozwcUNig0/DpfR1HQFPLHJcPbi9RZrJCYFJ2PXfrG3rtUC
 usmfxQg0xYcyY/6gnIgiKDmlk03325VEkmrenEoJLQk7bjW5dJT4+0ByOPC2dUtuCcwi
 54VI/xH8F4Ln8GiOKJhimOdlMGYmYC6jBxMQRoHUFEEj2eW2zNHJqBGzTKVfcfI9K6Td
 +6cjn/YEIv96kzX+AefNOyokXJlXRv/Mq56JfKDPvhKdnWvW5251Dave7Q6H2Ca2tdUU
 QE7w+cS3/35A91P4kfZb3Xquja6bPL59TIIatxAKFRv+j5+po4n5ZWYkNIToeMann44g
 25lQ==
X-Gm-Message-State: ANhLgQ3o2py5IGtpHAARuOlPiCwC1xGkzWnXGq5A6VrKA+uzP9xCI/G7
 t6VLLGxce6H1UpBZ2LjQVBUyDYHRZBdHEA==
X-Google-Smtp-Source: ADFU+vuknIOMlWuoVtRzdZgtb/eultx6LQAoN8Rcgcvt17CR5VJVfscxzXQswCe55UuoRgFGcv5F2A==
X-Received: by 2002:a37:844:: with SMTP id 65mr9456141qki.15.1585251500398;
 Thu, 26 Mar 2020 12:38:20 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fd55:4e67:1038:8302])
 by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:38:19 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 34/74] ppc: use cpu_reset_interrupt
Date: Thu, 26 Mar 2020 15:31:16 -0400
Message-Id: <20200326193156.4322-35-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::72d
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
 "Emilio G . Cota" <cota@braap.org>, qemu-ppc@nongnu.org,
 peter.puhov@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 alex.bennee@linaro.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-ppc@nongnu.org
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e686eda0f4..ce283a664f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1001,7 +1001,7 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_HARD) {
         ppc_hw_interrupt(env);
         if (env->pending_interrupts == 0) {
-            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
         }
         return true;
     }
-- 
2.17.1


