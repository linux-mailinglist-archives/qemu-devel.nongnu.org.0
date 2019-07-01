Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DBC5C6DD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 03:59:46 +0200 (CEST)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi85B-0004ir-Oc
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 21:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi4GO-00084x-MY
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi4GN-0006Mp-HX
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:55:04 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:52596)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi4GN-0006Ld-9n
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:55:03 -0400
Received: by mail-wm1-f52.google.com with SMTP id s3so951591wms.2
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 14:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hD++A+b60c+NWWs//dc/hO0mhFB2lXMUgW0Rk7HhCUs=;
 b=ThIts78IEayGhVVTq3zLoFOLx0+Cor7bh+IkeOmhrKfVqUJtsAE5VUlL8+sNUK3+mV
 /Xl07I7yPiKE9Us6zgB8M3d4tSKUMKNqqqwFrLAASgkvMAJuOVYLAhMcAdoU782m+stJ
 CMG16B7V6gmL0Q6RktSpuzAoVuf6W2n1UJEshE71tfn/HmNJVRgc1cknOzZFK/43pr08
 Dy4Xiu6nhxcZSNpb3a7gL+D9kB0sOtJfnJxSvSERxYM8qay8fsLdSqeKwwyqh35y54Uv
 2Zkm0+ZHRi+9EzYtyTBpRK/o9MDnt8ge6mNpDtL89oCwvyU2ZqrpaQP8M3z+DTQ1jct8
 qbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hD++A+b60c+NWWs//dc/hO0mhFB2lXMUgW0Rk7HhCUs=;
 b=ixFL69ma4f0OkQbuWe3UYuVIpYqMn5c/bhMLEHZPRFx5uYF5htqHMq85pYxbohd2JV
 2h2gb/PAOoWati86o7Pb+W6Gjf0fqHDdpmPRsGAR/nJB7NKpppe2KShwQIQ9cQObR1cU
 YGjB3VHSpgLVOB2vKcIwngv5BmCG2g7jJ59uMdvo6vWXBFw23AiWIwdsP9Mrj/flAwya
 hlrpEeJrMz4d0WwcoZNrmjgLvYjL3Squuk+QKiZ1v3uosEuRrlIGxyE9mQb8lmCmT8aq
 ZASZQC4dJAfgW0kPPFEDnVh8Iix+4+Fwg6Lc74CeGMPub+1cvVxldMLwlm0JtMNW5xvy
 snHA==
X-Gm-Message-State: APjAAAUCkcs+arSd47Bp4T+t1fzS0VNYFlAT1tkOLdFJHqbOiaTnPC43
 30mhH7g+bTbOi+7wuya8iv5lPLUcie69wA==
X-Google-Smtp-Source: APXvYqyVY+8sHA+iP8Dd2z8NDXsIhjO48baZz3w3DKfBgJUz7lNvyAoQcwJHxukdp2W6oCnPL++qZg==
X-Received: by 2002:a1c:c545:: with SMTP id v66mr122796wmf.51.1561999189206;
 Mon, 01 Jul 2019 09:39:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o6sm26573508wra.27.2019.07.01.09.39.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:39:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 17:39:01 +0100
Message-Id: <20190701163943.22313-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701163943.22313-1-peter.maydell@linaro.org>
References: <20190701163943.22313-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.52
Subject: [Qemu-devel] [PULL 04/46] i.mx7d: Add no-op/unimplemented APBH DMA
 module
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

From: Andrey Smirnov <andrew.smirnov@gmail.com>

Instantiate no-op APBH DMA module. Needed to boot latest Linux kernel.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/fsl-imx7.h | 3 +++
 hw/arm/fsl-imx7.c         | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 4101f80251e..dcd73603c33 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -179,6 +179,9 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_PCIE_REG_SIZE        = 16 * 1024,
 
     FSL_IMX7_GPR_ADDR             = 0x30340000,
+
+    FSL_IMX7_DMA_APBH_ADDR        = 0x33000000,
+    FSL_IMX7_DMA_APBH_SIZE        = 0x2000,
 };
 
 enum FslIMX7IRQs {
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index b7e3526b4f3..803fe94c034 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -526,6 +526,12 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
      */
     create_unimplemented_device("lcdif", FSL_IMX7_LCDIF_ADDR,
                                 FSL_IMX7_LCDIF_SIZE);
+
+    /*
+     * DMA APBH
+     */
+    create_unimplemented_device("dma-apbh", FSL_IMX7_DMA_APBH_ADDR,
+                                FSL_IMX7_DMA_APBH_SIZE);
 }
 
 static void fsl_imx7_class_init(ObjectClass *oc, void *data)
-- 
2.20.1


