Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD0309B72
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:06:28 +0100 (CET)
Received: from localhost ([::1]:44272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6AYk-0003Cf-Vk
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AS7-0006t1-Sa; Sun, 31 Jan 2021 05:59:36 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AS6-0000IW-Hw; Sun, 31 Jan 2021 05:59:35 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m2so10188410wmm.1;
 Sun, 31 Jan 2021 02:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtbqU34AXRgK7JucvFyMPpEvpdP/cEkbkCwJzoZsw+I=;
 b=vFB1SLLOVA8z1esZfr+efHXGjtpbRDRKqxEr0+XiTMYueGRRO8M/pprq+Ef4/KsxHa
 joocEje6xS3Gk3xC6E30gOMRzrg25mC0cajUE3Oi70BtKoSyMyAgZXUDlF7GBVlNCTq9
 61Jna5sD+OuCCDAhBOrVn2jnnPRl3UW7giw3RR2JTeKFdDmda3b6dX+IBp/iCXfmzyrh
 qIaHGIih4ZZWSZ6qR98Bt+TagXa1f8hhSldfEor7JpNqQXRrgu+ys/aeMbrXyl9T5AYD
 md2NxvIiSejyxUSLM4Ub1722iSSAsNgCwb7WnJ9kgpk8ed/CM436mCELPCr7/Y9JcS+5
 HzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jtbqU34AXRgK7JucvFyMPpEvpdP/cEkbkCwJzoZsw+I=;
 b=Ca37G05hRpK3QJotXzcvu/+WSvrHZDDt3O7pvdpBP7ItgZJbaX3x9gt5NKz2T384XK
 3TY4oWBonS+fOibt2r/eV1bbAfb4Wr4ZHv7SomU3FxW9akv2JaWZhOULSEexeeJiRWLj
 T2kEWNqSjZAOESzoVolUZFmzdZwKNcNg8YtSOaNrWvrnJeylUombvnSH0wk8wRbvdLNs
 vM1YuUcx8ThS6q1ISiLo6Vqc0GQ6hMALxmpYFwXHfQsJgnKBI4waSdyl70M5aa4Iwzs3
 ZML3KCoiWlIf1bqT++TWJ3RPES+QPP9e9buQRFAkAkVjcff7FyVRNkC0wi7NUeonMHI/
 6J7A==
X-Gm-Message-State: AOAM530O/7FoC3Zgc+XRusY2/dc1fV1fpBZ2E4vQ5gV+heHy2pkesikD
 lLc678xPUeTDs2cR5QHIoUuKhSOfdcU=
X-Google-Smtp-Source: ABdhPJz3rL6GTv4/ZBU2bl7Dm4ct0pyORHXhWH4J37W9yNXtege8fVkTHrzGefx6WHdJKlLLjnHC0g==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr10683440wme.112.1612090772413; 
 Sun, 31 Jan 2021 02:59:32 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id c18sm27417714wmk.0.2021.01.31.02.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] hw/arm/exynos4210: Add missing dependency on OR_IRQ
Date: Sun, 31 Jan 2021 11:59:13 +0100
Message-Id: <20210131105918.228787-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Exynos4210 SoC uses an OR gate on the PL330 IRQ lines.

Fixes: dab15fbe2ab ("hw/arm/exynos4210: Fix DMA initialization")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
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
2.26.2


