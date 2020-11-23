Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502F22C04D5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:47:38 +0100 (CET)
Received: from localhost ([::1]:55870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAJj-00014S-4P
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFr-0004eH-IM
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:35 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFp-0002jb-Iz
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:35 -0500
Received: by mail-wr1-x434.google.com with SMTP id p8so18283583wrx.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jCY2WneGtz62Q9z4HIuwwcNpgg3rYixy5vw3LZRT+dY=;
 b=HyEleF97j8edasiKlDFqCofMwuYWJN3XbpxTh1QhKbnoCPPINcYtnYOnyh9p/VpBkU
 k5a+fhH4tUXI88WXyFNYLipmRpm/IdKWCEW3zJkmYirPhspo8P771OPA3PIC0m5Ns7Wc
 CTRzPWwjd5czBG1HNR6ELfiHaEC+pJdCe1QxbM8brLRW61bqCC2oYdcxBlKjIHQvZVkV
 mJyjJnDM0vcZyhgNGp4jX0c3vdz1h5Ari+X/9TsOYx7M9VUxXq8GSEHvrFlKC7CwUJXu
 HVuHWxS6nIhZBV6aUzzPwXoTPjJ83P7LLFIh3Zvzzi9L6jhiZczXKo3zFNpQas53P5De
 KQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jCY2WneGtz62Q9z4HIuwwcNpgg3rYixy5vw3LZRT+dY=;
 b=EzMIFCJV5tM1EadX8VGKqHvHpdiEcsB7qu7cvXmtd3e1BjIQ6oQzH2ICUjPl4txjEE
 lIB1614EIn0Vw6EaVAgHwM1WBa5O58X3vriQb9KDVfiNTU0LCfB4l4tif3FViff5aeue
 NDCAPqRUXoAZ1u6LkB5t63fN9oaCCX+jV39bMq3ayVZw7gTzu5FFPAaaDBxrO6UeDGtP
 hHGqWK71CGN3/PIjw7/Bi3+tk+BL5LiSBsPsMB5RPg1cK+St5MR0J7S+6WaAx5gYvbgA
 voSr5Yw2wRWxbksHOqEbkD+nRg6fppw4YH6xkWp9HyqgxtpTO3sk/LBT2BDIHB0zlstL
 4vtA==
X-Gm-Message-State: AOAM5335xy3GJN2uR6iX7z9OjV/o1KPAfneLwwDpvKU49m9ClAl3tH91
 7Aq4TdPCs+1m2UEGGUxLkh8x58Ct9Js98A==
X-Google-Smtp-Source: ABdhPJy10Q0sVqO16My1sj3yNuR0dPAMci6aqlPBY4CYAJro2DWj3xCuOpSE9VeqHyIpRYCgiTCwBg==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr32701291wru.175.1606131811880; 
 Mon, 23 Nov 2020 03:43:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/24] docs/system/arm: Document the Sharp Zaurus SL-6000
Date: Mon, 23 Nov 2020 11:43:04 +0000
Message-Id: <20201123114315.13372-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

List the 'tosa' machine with the XScale-based PDAs models.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201120173953.2539469-5-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/xscale.rst | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/xscale.rst b/docs/system/arm/xscale.rst
index 89ec93e904e..d2d5949e102 100644
--- a/docs/system/arm/xscale.rst
+++ b/docs/system/arm/xscale.rst
@@ -1,16 +1,22 @@
-Sharp XScale-based PDA models (``akita``, ``borzoi``, ``spitz``, ``terrier``)
-=============================================================================
+Sharp XScale-based PDA models (``akita``, ``borzoi``, ``spitz``, ``terrier``, ``tosa``)
+=======================================================================================
 
-The XScale-based clamshell PDA models (\"Spitz\", \"Akita\", \"Borzoi\"
-and \"Terrier\") emulation includes the following peripherals:
+The Sharp Zaurus are PDAs based on XScale, able to run Linux ('SL series').
 
--  Intel PXA270 System-on-chip (ARMv5TE core)
+The SL-6000 (\"Tosa\"), released in 2005, uses a PXA255 System-on-chip.
 
--  NAND Flash memory
+The SL-C3000 (\"Spitz\"), SL-C1000 (\"Akita\"), SL-C3100 (\"Borzoi\") and
+SL-C3200 (\"Terrier\") use a PXA270.
+
+The clamshell PDA models emulation includes the following peripherals:
+
+-  Intel PXA255/PXA270 System-on-chip (ARMv5TE core)
+
+-  NAND Flash memory - not in \"Tosa\"
 
 -  IBM/Hitachi DSCM microdrive in a PXA PCMCIA slot - not in \"Akita\"
 
--  On-chip OHCI USB controller
+-  On-chip OHCI USB controller - not in \"Tosa\"
 
 -  On-chip LCD controller
 
-- 
2.20.1


