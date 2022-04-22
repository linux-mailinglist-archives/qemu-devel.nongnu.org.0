Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB58450B5EB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:11:08 +0200 (CEST)
Received: from localhost ([::1]:45556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrBr-0000z2-Lf
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAK-0005aM-Fu
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAI-0002wU-TZ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:28 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 ay36-20020a05600c1e2400b0038ebc885115so4692467wmb.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1C1mIsbiB+RmAWojouCaP2qiHomdsW424z2/fuwD7jI=;
 b=WLndpUSY3PrjvdvGp2hz0Uu4lK9/Z28LDPmYshVRNoPFu9vagmNiCcxFjEZn2I1CqX
 e2qBVps8euCbVt3TF3vMktFW6hyzs2vkdNTxuQ9s4eRc6RBUSWA46ylTB8AuSZcTq0GC
 4Hjl+pCdQDpSQ9hFLmjFIQHZ7rA+KzPdBptJU+cW+Uj8YGi0im8tpTBs4w1ad7vr5zj8
 3Roh/yLQ34cN78NRliji3XRAIqchgT1LAodo5OOGyU1H4yjfUve/Om+P3jJ6xMysPs8M
 ikRKV30TQ2dy7ZJc5mXG7e/eb2dM5jlgS+5ufQ9S0/t9vLqeTniD1pkpOnrGmxlUizds
 zNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1C1mIsbiB+RmAWojouCaP2qiHomdsW424z2/fuwD7jI=;
 b=rY1pEZS6F8chwQVnOOsZhaJOTfoBIp6WeDinU28BbEzS1eorMj7TkxFcqhajbqNnDe
 YflCpYsVqdlGk4j/BaAUnVLLHdx2HuoJnQMRDnjtcJK3qK28F14GhcVxxYNOhoooeaCo
 bfeK/H+gZriuhDDImsL+a5PpJVjjLgio6P1TZyasEzLKZBUTp1EBAgqr9lcw6iWA02sm
 l5ZI2LfbQiQrqyzsdOL/RK/j3Opr+HRZRU5mg4XZB/2I0EcruUCaED6LkRfcejKyA7F6
 aWyE9GCXvguAVZTOIOHQsiWOn8Ap6P2FomEDEzbJnzkCpQvrDBW6oxX9EYW9YRrdL28/
 z9aA==
X-Gm-Message-State: AOAM53246y31Q7iLNtOLQI6KaXRPLwT9+azw0dI4UuOa01B2WQ9xXDPT
 l28oh9hnFQkky+hn5Re7NZwSS/szKsxKXg==
X-Google-Smtp-Source: ABdhPJzBhd0Ezv6n5q18XIZoFH9R+StSUvmEWXLWEoEJMDC0IjtBXYVHy1lfDjPszHU2h3zaSgTbqQ==
X-Received: by 2002:a1c:c912:0:b0:37b:e074:dfcb with SMTP id
 f18-20020a1cc912000000b0037be074dfcbmr12363110wmb.161.1650621925491; 
 Fri, 22 Apr 2022 03:05:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/61] target/arm: Simplify gen_sar
Date: Fri, 22 Apr 2022 11:04:25 +0100
Message-Id: <20220422100432.2288247-55-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use tcg_gen_umin_i32 instead of tcg_gen_movcond_i32.
Use tcg_constant_i32 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0c9d50d48df..086dc0d3b15 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -568,12 +568,10 @@ GEN_SHIFT(shr)
 
 static void gen_sar(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
 {
-    TCGv_i32 tmp1, tmp2;
-    tmp1 = tcg_temp_new_i32();
+    TCGv_i32 tmp1 = tcg_temp_new_i32();
+
     tcg_gen_andi_i32(tmp1, t1, 0xff);
-    tmp2 = tcg_const_i32(0x1f);
-    tcg_gen_movcond_i32(TCG_COND_GTU, tmp1, tmp1, tmp2, tmp2, tmp1);
-    tcg_temp_free_i32(tmp2);
+    tcg_gen_umin_i32(tmp1, tmp1, tcg_constant_i32(31));
     tcg_gen_sar_i32(dest, t0, tmp1);
     tcg_temp_free_i32(tmp1);
 }
-- 
2.25.1


