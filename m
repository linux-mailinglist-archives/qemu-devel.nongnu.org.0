Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E637088A
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 20:53:40 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcukF-0000Jg-RO
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 14:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaU-000890-51
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:34 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaS-0008U3-1u
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:33 -0400
Received: by mail-pl1-x62a.google.com with SMTP id t21so681676plo.2
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lhfa+4fc39/8zQCjA36z3jMbuqMJRs1LoYZWUgZZB5w=;
 b=An1wHr0sbkBK31bh1Tx3Q2cbVjxoSgyX8AHoUpb1ZBOEYAiHHTasEH61LU2Mrg64TD
 DaeMXkcsA7EB5PHzgTLKkfG6/EKtpMM75UngMp6iiD5JX1/5SmZifAMy1ahiOGa6mLo4
 jiHukH5iq80l6xLLzW0r5qdVEHsgZk6X18pJ7v9kO7NddnbWaGig6HkT/demXFFoWEuE
 DerWzgrgIwKbjiVpXEI3dMPcOntY86AOnx6ObXwQBt3NXRP6N7NeF8FE7fA2PqyH91k6
 o/X8phIlh/jWMWatgywvcqvZxklWczFe8LNh0625gLmYPwH4A/ml/WwxBIUDcyFow71g
 Bi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lhfa+4fc39/8zQCjA36z3jMbuqMJRs1LoYZWUgZZB5w=;
 b=UMgkrW+8F7t3vMj1jp91lpPm3Q564ZaKqxIgIo5DzItdwGghNLiFFLuEonpdOXipqF
 zQ2Pey8jw1Z8/QepaVF/nOv7/VYLk2YL7OmdCYQc9aG165cd3QpZcJ6qYx4OEToRNsjL
 gz9DlJeyEGbtal4SXVrlY1Uys5d8+Br1vanzANTCbu9Bg+7tAZE42gOGkq3PKaR0IG3o
 jIwmGmyQaHEyBM8qcR5mwaA5WCpDwW8/z+w0gDGRBZl3YMh4RP2OVVl0ms1O62/7LTRw
 1acQUokC3byInfB0BAkC38NhfRex6zt7gIC7+Sp/KtRyowyEKUs4KI6LpawHH3x+V8Ax
 a+Fg==
X-Gm-Message-State: AOAM5322SB0jRiiZmvQxrmM4F47TR3IyV5lwjDl0eRXRQjRSHE3wih57
 tfHrFYZ68C+SQQvQvXCR7jfpJK39x7hA4A==
X-Google-Smtp-Source: ABdhPJyvUdp9MtsWYWhSlP2Ps/NGbkddsomBg1rA7ic0JtwKsl3Ckkersa8BeAcuJ8Nb7QH+Ry+YOQ==
X-Received: by 2002:a17:90b:2390:: with SMTP id
 mr16mr5200622pjb.133.1619894607939; 
 Sat, 01 May 2021 11:43:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/31] target/hexagon: fix typo in comment
Date: Sat,  1 May 2021 11:42:57 -0700
Message-Id: <20210501184324.1338186-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 2c6d718579..d6b5c47500 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -298,7 +298,7 @@ int32_t HELPER(fcircadd)(int32_t RxV, int32_t offset, int32_t M, int32_t CS)
 }
 
 /*
- * Hexagon FP operations return ~0 insteat of NaN
+ * Hexagon FP operations return ~0 instead of NaN
  * The hex_check_sfnan/hex_check_dfnan functions perform this check
  */
 static float32 hex_check_sfnan(float32 x)
-- 
2.25.1


