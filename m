Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D6A3C7240
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:33:31 +0200 (CEST)
Received: from localhost ([::1]:49712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JTW-00038l-UK
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIz-0001hL-Dx
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:22:40 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIu-0001er-FU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:22:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id j34so13763871wms.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2SdpSDEP5iF6kitd9bg3QMHVJgptr67Uu5d9CUR6lI=;
 b=USvL12VbRuEdh/d5jaoQ545e4B1QfkKpoGPYl+VV2jq1ID8VPQZZmrOuOELNPtRPyO
 iFlr3Oni+6YFUqGd2PElOkrlCKHJXVUcstPsrCd1DdErcemQkRUw3o93gDIp5AlC+ti7
 BevrDpw8R7R9k9weqHsXAKz9DNwPb0XHzQ8bvOGBAkpcESz7+ZQ82q3SRjFPxR8GLl8c
 GUwP1Cx0IzgQSyK0tHaOoCdYm3ikdlxtl74AM1OzLc9llcFgCO/gOHOqyukXyQm6YjrF
 GM3w0rkEU3j6GBdHN0GRY3J8PBommKqDV57l/g9V7/rJ0fNpyr0hyqjoPRHR0932CU6j
 E1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2SdpSDEP5iF6kitd9bg3QMHVJgptr67Uu5d9CUR6lI=;
 b=gzOctbj5hHgpmeOWdzBby/WIrnle0YwYBmwdf1SEqa5YPBX4bj9DRn24BDlEak4jEY
 oqgAos4/7O9teEA5bj3opeWoY8jfh3NOIdTkEx0Xjt7XKXwZJfHoHXtP4aIwpYA06M1M
 IfMK3xntsPDFJrdsd1ZRH74A0ZNCwFiM/wWQBHDNbmDLFLeB4MiLYc8ugafY0G2i2meY
 dAgssdxeM1lYZ92ztWszsqvJZUm1nk3s39kh4Km0ALN8sl0zLybIlOdsR4EcSFhvbamC
 OB1OAKD8XRAc3FlCe2RGgTQkAXHZ7JFomauMn48f2PsJn59Bb6if8+AmLSHdmfRaCckA
 9rwg==
X-Gm-Message-State: AOAM5316r2g0emjTCZzfHM8bgLIpIZ2TbzsORxHswnDe1dCrkhnsvhjY
 GqGH0H4ukt9hU5G/gQ26J/SRcg==
X-Google-Smtp-Source: ABdhPJwtDcOkM68pDAnnQIWCzNyupTIV6lBC6zJnURSNZmlScKyxKxxHUlM9G+BAnt3GGMz5UhdHGg==
X-Received: by 2002:a1c:ed08:: with SMTP id l8mr5279959wmh.38.1626186150437;
 Tue, 13 Jul 2021 07:22:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l15sm7916469wrv.87.2021.07.13.07.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:22:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] docs: Add skeletal documentation of the emcraft-sf2
Date: Tue, 13 Jul 2021 15:22:25 +0100
Message-Id: <20210713142226.19155-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713142226.19155-1-peter.maydell@linaro.org>
References: <20210713142226.19155-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add skeletal documentation of the emcraft-sf2 machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emcraft-sf2.rst | 15 +++++++++++++++
 docs/system/target-arm.rst      |  1 +
 MAINTAINERS                     |  1 +
 3 files changed, 17 insertions(+)
 create mode 100644 docs/system/arm/emcraft-sf2.rst

diff --git a/docs/system/arm/emcraft-sf2.rst b/docs/system/arm/emcraft-sf2.rst
new file mode 100644
index 00000000000..377e2487206
--- /dev/null
+++ b/docs/system/arm/emcraft-sf2.rst
@@ -0,0 +1,15 @@
+Emcraft SmartFusion2 SOM kit (``emcraft-sf2``)
+==============================================
+
+The ``emcraft-sf2`` board emulates the SmartFusion2 SOM kit from
+Emcraft (M2S010). This is a System-on-Module from EmCraft systems,
+based on the SmartFusion2 SoC FPGA from Microsemi Corporation.
+The SoC is based on a Cortex-M4 processor.
+
+Emulated devices:
+
+- System timer
+- System registers
+- SPI controller
+- UART
+- EMAC
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index e2fcb64872d..c52902acdad 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
    arm/sabrelite
    arm/digic
    arm/cubieboard
+   arm/emcraft-sf2
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index 93b9f900034..f23cf874c66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1023,6 +1023,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-som.c
+F: docs/system/arm/emcraft-sf2.rst
 
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
-- 
2.20.1


