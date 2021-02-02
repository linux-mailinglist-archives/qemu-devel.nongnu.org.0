Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7428530C958
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:18:36 +0100 (CET)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70G3-0004cr-GW
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu0-0005Ws-0M
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:48 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztq-0002H9-8H
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:47 -0500
Received: by mail-wr1-x431.google.com with SMTP id l12so21439984wry.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/ui3mPYh//6P4ROb9feP98zESvjv3VvYW7WCODFKeEk=;
 b=l1biYz8WR2CQbSRQKMWthUQMMG3RsM+CipSi14dGqjUA7Mq+pAKCYrYY+xISlI3d5B
 D/bu6tcKA/vwEAngybv4NMg6cV0mD2we+ptTLRa+0eFE8ouU8oSV0En8FvaPmysYfcu6
 KRuPIG7GcszJHoNOjXofISC8v8lm3pfwb9SQsd+1UOla9k/wxdSKceZosESZ9Soqr79D
 ZsRHFc9ZkRdhBGqhwspY48DxWStvStuDvtjf+5m+e18i7o2lyKyIFBo1wu8sW6sHcdZ9
 Es5zApFknEoJSwLQ/gWb3vPsRwZEzLUqQhI+GAbd2RPiD0eSHMC2u6R0XNeKM5rIVBNp
 vk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ui3mPYh//6P4ROb9feP98zESvjv3VvYW7WCODFKeEk=;
 b=Pny1HHFH/TdKzQW575rTmh43t66hQRN08MCcccr4RZUwcTrJb8V0J7+pxvwNeNXdzB
 DGwhUir9gci7CtiCw8UgwcBWs0HVpxpw2Wyv6r0TxvncUZN+XSXqm6UqCh410+c2xyDF
 u4SZSCySfO85pgdNfDfYlrmPMjm9PD/0uxDYaRPQaHZn0cQHbuPD7cg1TQcndq5+gvlW
 UN7ryf3IuIVHiw10sa3Bgeq3s2Q9kWkDWcHwAkVpFzaLhqjjErsZPuvDE2Hp7Q+/XT/W
 CuewOSaF5s5HF955Rx6/7YRTy0iD7+GqZuVHn29OINjn5YqWEkJL6xux1TWEUPm4UtWJ
 T1og==
X-Gm-Message-State: AOAM533fRr3IL2Uhdg02fqfP6y7TGGXfKR7Ve9YozqHwU4OlcNblKqsj
 YbNdu7xPs21zPXcCnd5yDM0BDofaYlcJMw==
X-Google-Smtp-Source: ABdhPJyaflDjxYFtwN9XJwkdENxPRSHJG3wSQ1Iz0zN5aRKCCiDLKhYgIr/1Nutcs8nGeTMnP28fEg==
X-Received: by 2002:adf:ed02:: with SMTP id a2mr13729480wro.197.1612288535051; 
 Tue, 02 Feb 2021 09:55:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ
Date: Tue,  2 Feb 2021 17:55:12 +0000
Message-Id: <20210202175517.28729-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The STM32F405 SoC uses an OR gate on its ADC IRQs.

Fixes: 529fc5fd3e1 ("hw/arm: Add the STM32F4xx SoC")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210131184449.382425-2-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 13cc42dcc84..a320a124855 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -336,6 +336,7 @@ config STM32F205_SOC
 config STM32F405_SOC
     bool
     select ARM_V7M
+    select OR_IRQ
     select STM32F4XX_SYSCFG
     select STM32F4XX_EXTI
 
-- 
2.20.1


