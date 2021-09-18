Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C21141084A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:09:37 +0200 (CEST)
Received: from localhost ([::1]:42402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfiS-0005HH-A4
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLQ-00057s-NE
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLN-0006og-0K
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:47 -0400
Received: by mail-pj1-x102d.google.com with SMTP id dw14so9179761pjb.1
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vyWXP6Fx9Nim2ldoxF0eSsJbEhC7OEjuYcEJUYRKoA=;
 b=lSzfsfsCZSvKw/DRgMkbB3UFuKC3OC9O/n9STdBep8+NCfDHpq2SG4lRQTixcVHBaL
 gOrchSfrhmozVAylVdlcrRrS/VxcM54OTX2LCrTB35XOXWqk0dTmhqn8ShHO57A1t3YK
 Krxc21pdtuIMBfoutvTVLRUQzr2/aQR7equgmW4gLpEH3vYDCqW7NKCCnUDIRsIGg88T
 9ut//V63ESvrPhTljEq48zSnRxsA4iF+IY8t9lB/3KL9kkLFqZV8JjuO/ELGc6a+oeUJ
 mR2R1ZXKe8MKeCzGswFi0QT2SLC9QP7svABPJPNQqwaa59vP++tbRPCmNptFH+hAnvOf
 kYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+vyWXP6Fx9Nim2ldoxF0eSsJbEhC7OEjuYcEJUYRKoA=;
 b=q9wvsHfcK4M21vjoeM0aZ814He/lJ5iXQj43nCSt7Akec/ETyqqpTdS4hw9lFv79qc
 t2XF566OyEbcgR6jyJSjxG7V/WnDk29yAh7wB8cylXtsmsrHoDZB24r3abpBPwpCEJDC
 jRZtQLUIvc8xs7dGNDqnjEGDbZ0AhB1gPxxnj8wnalX3YLZqlSIrGXBfLwXLMeJU4uFg
 jFlCGOL9Sni133ITx1oca5r+sNwVuOv6S2nUToUSnquvq5OK6xPZvfbsOOhPHMeE7j3n
 aNnf1GRFZ/974SHayzOZdXIp/IRdUC88rAwuD3kNlA/tpWMHj4GqotPmN/bLLlfwUfyU
 doag==
X-Gm-Message-State: AOAM530tj3Uj1Po99Jgw6tksuExCdEGMoH4YFxeZqdZTZJqNU1osAr1T
 /7+yyss7JQTfdm+AIw9Gn/ZwyXlYS1tfTQ==
X-Google-Smtp-Source: ABdhPJz7GivWfYSqhStFuoEZvGSQ+GsSlvtMgl/vxn7nTYFhhK0AnmF8SWPT3BYOlFhB6k226N7/qg==
X-Received: by 2002:a17:90a:428e:: with SMTP id
 p14mr28718674pjg.92.1631990742570; 
 Sat, 18 Sep 2021 11:45:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/41] target/arm: Fixup comment re handle_cpu_signal
Date: Sat, 18 Sep 2021 11:45:02 -0700
Message-Id: <20210918184527.408540-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The named function no longer exists.
Refer to host_signal_handler instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dab5f1d1cd..07be55b7e1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)
  * linux-user/ in its get_user/put_user macros.
  *
  * TODO: Construct some helpers, written in assembly, that interact with
- * handle_cpu_signal to produce memory ops which can properly report errors
+ * host_signal_handler to produce memory ops which can properly report errors
  * without racing.
  */
 
-- 
2.25.1


