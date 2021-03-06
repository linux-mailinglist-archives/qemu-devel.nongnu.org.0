Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5F32FB75
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:44:20 +0100 (CET)
Received: from localhost ([::1]:36788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ6J-00021X-RD
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzE-0000UA-Jg
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:01 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzC-0008Er-Gx
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:59 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so1138338wml.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=93CdE1qEoQc24GPwns1AaSpfGRHJt1bcg0Oz5NlaQ5I=;
 b=EjfgE2Bh8wlIuL3eIWF1GUeIz5eAGPWmSbvn5eq1pYYAbUQCb43yBnRGnBLnyb2nhx
 G462d/O80IWPvJpjGdCGKK6OhEKvHhnETP1SoEWrvswZrzqtyCYfn4qhBwxbWBOaIpAJ
 ofZk+OBiEOgJ3eL9rqdkRS3g0JjG8VtMk88SdP/pcgvvzxEwyW2Fhq67kO5xqPgDcDso
 hXJY3sO3IgYzwAEI9bInlCAlwsLmt5xIfcY54Z44kaDD4/XSKPfUuF/U18Fh2uZUBr4d
 QTJZ/GUI6i5sHdfsSq94kBr2dySe5Vbn7m/D4G9rTMP9CxE1hXbSNx5jTIt42zierzgU
 lWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=93CdE1qEoQc24GPwns1AaSpfGRHJt1bcg0Oz5NlaQ5I=;
 b=uBtXivlM5FNnp3heT5LYk3CsnY/io2g2JL2a5ZM8H1s1F989Ri/dWGZWI9C+nvGh6l
 Wt1PJfWPyQXcgYQZcFk+wubKKJyZTT1E32r2y+C7ximXYNjYl72N6Ym2agMj9F3UN4Fj
 p3pu6ONH4rij2jtlCpZ775cdmQiggIqOIADl+HtgulDfGSlSUdHqJr6GPNG/+Xo/k8R/
 4t1Vdk8O1YgFq4uINW+sCAHGDLadykLhMHNuxK0urbT+VSxS/oSIcyu05siS6zXdeDKa
 7rUbIaaioGCzwIU5qAafYXA9Hxt3sfA7aONAZJ5b2zdYztZG/GXM0BajtJJ7V2YVCHVK
 ZsVg==
X-Gm-Message-State: AOAM533BGnQfrw6YXCQB2NqNGGi7CcSv2CmTnvmJVBPKrh1nU1X1oiWf
 90/sda62M+WX8xhNQRg/hIrCUiGbcr4=
X-Google-Smtp-Source: ABdhPJwO82eqJA3sm7+JvuwjRNkx50maDglStjbvTRWQVdS21S3GsWkBMenaobRudCOUalV+qvZBqw==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr13872297wmb.135.1615045017083; 
 Sat, 06 Mar 2021 07:36:57 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z3sm9040816wrw.96.2021.03.06.07.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:36:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/14] hw/sh4: Add missing Kconfig dependency on SH7750 for the
 R2D board
Date: Sat,  6 Mar 2021 16:36:14 +0100
Message-Id: <20210306153621.2393879-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

r2d_init() calls sh7750_init() so depends on SH7750.Harmless
at the moment because nothing actually uses CONFIG_SH7750
(hw/sh4/meson.build always compiles sh7750.c and sh7750_regnames.c
unconditionally).

Fixes: 7ab58d4c841 ("sh4-softmmu.mak: express dependencies with Kconfig")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222141514.2646278-3-f4bug@amsat.org>
---
 hw/sh4/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 4cbce3a0ed5..0452b4624ae 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -10,6 +10,7 @@ config R2D
     select PCI
     select SM501
     select SH4
+    select SH7750
 
 config SHIX
     bool
-- 
2.26.2


