Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEBA30C93D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:15:45 +0100 (CET)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70DI-0001Yu-28
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zu0-0005YD-I9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:48 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztq-0002HD-9a
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:48 -0500
Received: by mail-wr1-x432.google.com with SMTP id b3so3301864wrj.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vhfnsqRF66KA3IZdcOFpf4wzU6AyLQ1ui2Fh2VXBMo0=;
 b=iyw6moOsM37ES1gxul4hEcFWeUeoLiQdPIMzJED9b/Cso3JdaBjo3iwYHMCk8uCDI2
 GfHRkrn9Un0nIj2/ZhzPK7MZ4j+xZiEHfv/GRRljWcpgBdJrydRHxkgRZlhgrGlao+we
 6VRhiHlDvBgHIwVUXD4P8d0RFdC8Rl6uoW0iD1XiUjsNWEyg9erXGBJ2exPglhGtZTtP
 xwuhMK4g/yayY6FqB4OtZWu0/e208v4JYkFTPLbu7Xox+SlXz5qudekbtDws80rjr6HT
 o2lebNUrobotqI8+dOur4xhwZe8UubfByHibwJA3YvOiclR1SiXbvyu0rICmjBlOrSpV
 wGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vhfnsqRF66KA3IZdcOFpf4wzU6AyLQ1ui2Fh2VXBMo0=;
 b=EdAux0tVxB6pIQ0KSKId0GFLWq/5zlKhuswT/D/LP1A9dciN6gMKhuW5k2BaJ9sA6L
 16ElbvSZ7hVTxNdJZshbLnQh0QxqYj6A/wZsKOE1cN0+IFDrDkEtKiKs0d2g8bzz5NLR
 2mOgHISSuJ740EccmYb1IBpNFxwwFEsyslBg3HkkivfVG1nSMLOWUpo2aKQ2PmRNyaIS
 mwYsrgHnnQalrYCs+H84AwnmGRJ6UUuBv0gGe03KNH5HfCjoNwNPrgWfRGCAhhPbqby2
 4ogxtvg3NV6IRWYho4BIg0wwSzClyWBcYVRW7HkDZ1ZcWAdiryHLiaEpZoS2On/ONM8d
 Escg==
X-Gm-Message-State: AOAM532WbBmOGojUHdyK+asGn/gTRsT9w9RHyVDJwIgJ1gvUCRMsCQ1q
 ISk0jCzYZWFWHVmBnHXQ1JM85KIvV+20CA==
X-Google-Smtp-Source: ABdhPJzaUHDDXYT3gOYG7xvqVDjF2d/zVpK/8B96RvPBUbGuNBhAJxyktleVug/BtV+hxBoZtLTW6Q==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr24717599wrw.150.1612288535808; 
 Tue, 02 Feb 2021 09:55:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] hw/arm/exynos4210: Add missing dependency on OR_IRQ
Date: Tue,  2 Feb 2021 17:55:13 +0000
Message-Id: <20210202175517.28729-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

The Exynos4210 SoC uses an OR gate on the PL330 IRQ lines.

Fixes: dab15fbe2ab ("hw/arm/exynos4210: Fix DMA initialization")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210131184449.382425-3-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a320a124855..223016bb4e8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -52,6 +52,7 @@ config EXYNOS4
     select PTIMER
     select SDHCI
     select USB_EHCI_SYSBUS
+    select OR_IRQ
 
 config HIGHBANK
     bool
-- 
2.20.1


