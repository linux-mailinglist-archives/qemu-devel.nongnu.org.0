Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF0546A5D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:29:43 +0200 (CEST)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhW3-00018C-23
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhBN-0008Ux-Q5
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB6-0007IF-28
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso2230672wml.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pXh1kgWRuZgm5DYxtunGuJhsz5Yd/FxYKF1GsS/GYOE=;
 b=k6/5+V6KdPS0r9i3GjfMmZFGawyjoewjDJtBaWo/eGm9nYyL2jcBwLL6LvZ1+m+Pgm
 HcR2EdYfAjF0CTIlQAfB8YuTqeRTpbYf5qlSLV5CK6V8dS+szByP0QyR4jgOwBsQihQT
 V7rXlcHIrxyBJnzCv08lCOiowQ5KH1IcHP/6oeyn0iwOt60p5RSWLtoe8snLZvMVtrIQ
 bVpZOM4n4N0PGqPwNYW30INWbvXTH1620+lqSYp8tEgCMmhf07BoaEtyGXkYQZpHp9Kr
 JwxnkAduFqjp7nj8f1q4D6t+9Su9Z2NkKSsn53ldlpLOejHoS3i02OaaLQF7jitSGTUo
 aguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXh1kgWRuZgm5DYxtunGuJhsz5Yd/FxYKF1GsS/GYOE=;
 b=iphVhTACSCbvwK/vPoBgvJIhHZw0KVxyEOu2WvrQ64C6Kr6wk7Y7pgyfjtxvSOyF8j
 CgnL1DUnCAdMu72UZs9890q+ucd+9r/E6R+tr2fK2rUHVk3knp4Z9k32q4YIzbo/J3Jx
 tNhL7j8FiL350QUr4GuVa4OBbGiYeIbKVFUDMORF2v+AWQDLiVMyHtFKftDiTX3Xbobg
 DcJKuz2EEVQTnXppuYZvoSx7db1GZ6xXwT6q9wI591vwytG2oVJZd30YSw0Ohd7uDn2Q
 SKvoeQd/ur7dH5vnso5oEPKJmcg8q7x9UbGzzPjnYAo+jxM3wVoguOZAIiQyWrpzapCL
 dgWw==
X-Gm-Message-State: AOAM532C1yE8ikDoSOvwVZlcKfE9h/TekT0drufCT0ejun56dkoP/595
 vRZhkQJiCx6tI47xzPC6T8JWQ2AUsaWJzA==
X-Google-Smtp-Source: ABdhPJyl5XqoKpV7yVHJ6OBlhHi3VFJIU0OErfOMsg824l/JLQi9zpBltllVKv/VTpnOdTBJmFt5BQ==
X-Received: by 2002:a05:600c:4fcb:b0:39c:64cd:cc89 with SMTP id
 o11-20020a05600c4fcb00b0039c64cdcc89mr439532wmq.197.1654877281523; 
 Fri, 10 Jun 2022 09:08:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.08.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:08:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/28] tests/qtest: Reduce npcm7xx_sdhci test image size
Date: Fri, 10 Jun 2022 17:07:34 +0100
Message-Id: <20220610160738.2230762-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Hao Wu <wuhaotsh@google.com>

Creating 1GB image for a simple qtest is unnecessary
and could lead to failures. We reduce the image size
to 1MB to reduce the test overhead.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20220609214125.4192212-1-wuhaotsh@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_sdhci-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
index aa35a77e8d3..5d68540e520 100644
--- a/tests/qtest/npcm7xx_sdhci-test.c
+++ b/tests/qtest/npcm7xx_sdhci-test.c
@@ -24,7 +24,7 @@
 #define NPCM7XX_REG_SIZE 0x100
 #define NPCM7XX_MMC_BA 0xF0842000
 #define NPCM7XX_BLK_SIZE 512
-#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
+#define NPCM7XX_TEST_IMAGE_SIZE (1 << 20)
 
 char *sd_path;
 
-- 
2.25.1


