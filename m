Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6180309178
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 03:09:03 +0100 (CET)
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5fh7-0007Pz-TA
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 21:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fU2-0002mE-R5; Fri, 29 Jan 2021 20:55:33 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5fU1-0000sX-GF; Fri, 29 Jan 2021 20:55:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id j18so8146571wmi.3;
 Fri, 29 Jan 2021 17:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=BZTRcOn/HJkpWsRhLv0QpZri9dtTj9FhDkxOHuyJAqjGBTJaQzZVNL5WyOC21THEAS
 IzTqxmkDU5ePXyBLSWvji/9MjOkJBxOe8N5616ednCW1h+emp+Xw2NFIogFZS/wiD+Mm
 J8ASjop3aQ3wyVi6hF8VhLhaZG27DBg/t0azC5Dc2HQKG1n2YirYiVVvirb1owUWvJzr
 yscTazLhBVy+1p9ePd+ByVPUJZbAs1J8UTEukJQgoDffUqPvGp0nJF3ZTIE0Ep4E6dXn
 zuJaT3rnVLcWhaTV1kfk/MGweZJlBCPXlnbRZxlf9gq7ZI1sLdAdG4NEDPWLGXcHK797
 1zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=aL+teRMArEQ6fvV7QrvXr65h6FQ8X5ni7yeJrEyvHplm0WMOlEq9imBscwod72bw5c
 RlsprdFHEy5tlQiMiPUND7xeGN4IL/QtV+eEs+cyMGztIY86sk/OrNZ30KxO7XuPGlP9
 qPHEJLOefIABS+Tj1YYDtfc8XBbtJqAanyvQ4FC0qL16jU/seLfN3iqo1g42/gykzT+5
 W4Jkwz2VsZYFomXLugRmzOurtAoYCC+oyWDOgPQbjFhJa+W2pMzmdHCQy/MV01PQUMOf
 qovmPbeeDlX8dsrke7QX4e0JvwuSswxzlXfGoli2MnjupH0TWy0dcPe0/XGMeCQvUFI7
 n16Q==
X-Gm-Message-State: AOAM533cuTXJbedaMWjAzWh+YWzc8+IBrfjmSDlbu6oNy5+BGlnTDUCM
 dl1gOE9F76oGexLgwCL1CbLSttB/53o=
X-Google-Smtp-Source: ABdhPJzxzPBg4SeY+Z6XReaUVeRJ6xga5fOttyCGezTucRzWBU4vTP6FOuodsFF+cO3/geJk/sy++A==
X-Received: by 2002:a7b:c188:: with SMTP id y8mr5772912wmi.173.1611971727158; 
 Fri, 29 Jan 2021 17:55:27 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d2sm16883840wre.39.2021.01.29.17.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 17:55:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/arm/Kconfig: Add missing dependency STM32F405 -> OR_IRQ
Date: Sat, 30 Jan 2021 02:55:17 +0100
Message-Id: <20210130015519.4072469-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015519.4072469-1-f4bug@amsat.org>
References: <20210130015519.4072469-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The STM32F405 SoC uses an OR gate on its ADC IRQs.

Fixes: 529fc5fd3e1 ("hw/arm: Add the STM32F4xx SoC")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: alistair@alistair23.me
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
2.26.2


