Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6493BE8AF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:21:02 +0200 (CEST)
Received: from localhost ([::1]:37528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17U6-00087o-13
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R5-0002PP-Aj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:55 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R1-0001eq-IH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4216452wmh.4
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=87FH3+J3sysnxE3Y0lsl6FVX40vk+1Ak8mWR0V88d64=;
 b=fnMplQoYfd5CVyeMV2N8L5D649mhW7/bhotJT2fDikkgrEIgLf0O2P//o992Dqozyr
 a6N6xal1tF7F18EJFvWzx/n6hCaEc9tb+a9e2mI2/hWJFkEr+b0CvoT5atSePVuvMXlp
 5Zv7GqNJpNtU7lm0Ua7AGgqAdQJThjMVkQMU9PdQW4swgrIWF4Qlm0bAU/mbSgJiO8uD
 50vGmgQMKMsCELq3LLzxScXFql9GsmE/1CVZ9KCGm/BAasVtwp8uDWSh3L/r1UmkuaUD
 B3Wdh12OCWkHeQZAsRAbOPf+xLd2gg2fQOePTwYokeSNoJMAKH5W58wmtLaSFdz2mWoy
 icHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87FH3+J3sysnxE3Y0lsl6FVX40vk+1Ak8mWR0V88d64=;
 b=JfmSaIvK/njxMvhKp/gTpX5G7l5C6aTdV4LyR/t4WL3YdNoroxsT6xsyIZvbQ62wfb
 OXqOiB0XjxOp3K9eqYcSDbZ4njzSPQigAC4ilU08E22wcAgkmliivGBA72PUf8gYcwbG
 EhOvqkTTvVBAr1JBFSpeckNo7QhtMH6EfMS3oTx2M5/jNcK+PBn/7QTycnz4xSmUzytj
 hAXbXswZIn85XO+58N+LUhaIQWpMx3u79dCcvejOQrtAjHqYhOXpqt69itDKB/DrjbHB
 esIrEZYKwa5De9l/0gZGRCMaO6DIJLFA84dQG68sQiu71sBi06zQSNU87bRK3adqft85
 6fRg==
X-Gm-Message-State: AOAM533R2m8aDwzBUJMbQyKwXJ+0wN2fBaMSmwdLcwQ6V1q307FeNBbU
 ucMWeiWEEo+sOixHNeXOPVJMvQ==
X-Google-Smtp-Source: ABdhPJw4vT7LKNTsYc5oonxq+QV+FN+FZL0PsY/Wh6UzcLYxUAHHsmX2KgtUEIk2Pt3Ig9lsGEIA1Q==
X-Received: by 2002:a7b:cb1a:: with SMTP id u26mr6846119wmj.125.1625663870204; 
 Wed, 07 Jul 2021 06:17:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm18679352wmm.17.2021.07.07.06.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 06:17:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A92FC1FF8C;
 Wed,  7 Jul 2021 14:17:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH  v2 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
Date: Wed,  7 Jul 2021 14:17:41 +0100
Message-Id: <20210707131744.26027-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210707131744.26027-1-alex.bennee@linaro.org>
References: <20210707131744.26027-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need this functionality due to:

    /* XRAM IRQs get ORed into a single line.  */
    object_initialize_child(OBJECT(s), "xram-irq-orgate",
                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);

Fixes: a55b441b2ca ("hw/arm: versal: Add support for the XRAMs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210621152120.4465-3-alex.bennee@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 647b5c8b43..528f71bb9d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -368,6 +368,7 @@ config XLNX_VERSAL
     select UNIMP
     select XLNX_ZDMA
     select XLNX_ZYNQMP
+    select OR_IRQ
 
 config NPCM7XX
     bool
-- 
2.20.1


