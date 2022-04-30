Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D87515FB1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:55:58 +0200 (CEST)
Received: from localhost ([::1]:37638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrK1-0007Hm-Vb
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHw-0004VI-SD
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:48 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHv-00080z-FF
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:48 -0400
Received: by mail-pg1-x534.google.com with SMTP id 7so4928508pga.12
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3NUt6cycfWH/ENZGNIvXT39oA5d9WYzXAuV4uBUZ0DU=;
 b=E7yw6I8zBmHHQES6s29ionq2PmreDRCs4vCqkgYYy2GV4RfJAqqRio2ndYkZCqt4Qg
 9Rrp5tURWHst8JQryp7buL2p+PCPwsS4RV3V7tXm8L8YO51kLZozjU7cJtic+w/MrV8P
 4lGBHoGI7ZV82IP1ohuJRAy2kJWFdRa6aq9C2YZgO4xEwrHEWoggaoFrfElMxy3juefH
 Kv7lqqO3LYFe5kArZSFhbjhBg0stVLbGh5xyCGeMyoMXQ/pzttEdOvgIv3GVHjcR8pe6
 Jr75Gn3ctNOEBuHSHQ9gBX72UhYKoQHitlXuaj9ra50jTPLNDHtajpYwrCwv2vJPOld1
 YkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3NUt6cycfWH/ENZGNIvXT39oA5d9WYzXAuV4uBUZ0DU=;
 b=PRv6tG3jve3fwvAgk4wNklcObLZYCZcm7k5/Hm+9tohUyalZBHEyLwZNfiq+JGTjjo
 bSln6Mm2P7UDCdbK6OL4WQtN2tnIT0Hz5DIC9mpeI4ilT6fY10pvCaytyQsbVwhehMwx
 YD25SQbn2W4NPBqy3Mj/eyDKu/wRR2L6Jn6bJEAIWbsSyE6uO76jFrQIG2POmNobpAgg
 j3E7Zhrg7jt5exeZ0uj+dYYGzHP0Eqb+/1pPyYMGY2++poUko4o4z9D26tkRGjq2cYlh
 haP3uf2WPYGiuuUCEiLzwos2d+VAweG0gd3EOxoarHWC6gvYDwq5v9JAbNq5rA7Hv8X6
 HXPw==
X-Gm-Message-State: AOAM533tdbHqGHpv8RFBFg7HYiWVwysvstAiiyKPgtLpTOOW/P23/JyA
 17QBQg6yoJmYkUXBxkQPCgg7yw2fLzOjbA==
X-Google-Smtp-Source: ABdhPJzSj4sv+RbuU18pkf3JfuuDjX4UuHRFzJuIY7cpUcA68j8voUppv6p2M3jBNT93E99PPC2bSA==
X-Received: by 2002:a05:6a00:1585:b0:50d:a8b9:d414 with SMTP id
 u5-20020a056a00158500b0050da8b9d414mr4516538pfk.56.1651341226090; 
 Sat, 30 Apr 2022 10:53:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/17] target/m68k: Fix coding style in m68k_interrupt_all
Date: Sat, 30 Apr 2022 10:53:28 -0700
Message-Id: <20220430175342.370628-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add parenthesis around & vs &&.

Remove assignment to sr in function call argument -- note that
sr is unused after the call, so the assignment was never needed,
only the result of the & expression.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 2b94a6ec84..0f41c2dce3 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -408,11 +408,11 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
-        if (is_hw && oldsr & SR_M) {
+        if (is_hw && (oldsr & SR_M)) {
             do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
             oldsr = sr;
             env->aregs[7] = sp;
-            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            cpu_m68k_set_sr(env, sr & ~SR_M);
             sp = env->aregs[7];
             if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
                 sp &= ~1;
-- 
2.34.1


